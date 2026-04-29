/*
 * ================================================================
 *  SoilIQ — Smart Irrigation Firmware
 *  Phase 5: Water Reservoir Tracking
 * ================================================================
 *  Hardware:
 *    - SENSOR_PIN : GPIO 34 (Analog soil moisture sensor)
 *    - RELAY_PIN  : GPIO 26 (Relay → Water pump)
 *
 *  Libraries needed:
 *    1. ArduinoJson  (by Benoit Blanchon) — version 6.x
 *    2. ESP32 board package: WiFi, WiFiClientSecure, HTTPClient, EEPROM
 * ================================================================
 */

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <EEPROM.h>

/* ── 1. CHANGE THESE TO YOUR ACTUAL WIFI ───────────────────── */
const char* WIFI_SSID     = "Your_WiFi_Name";      // <-- CHANGE THIS
const char* WIFI_PASSWORD = "Your_WiFi_Password";  // <-- CHANGE THIS

/* ── 2. SUPABASE CONFIG ─────────────────────────────────────── */
const char* SB_URL     = "https://mwfbxspdxzvfhchbngoj.supabase.co";
const char* SB_API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13ZmJ4c3BkeHp2ZmhjaGJuZ29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY5NjI4NTUsImV4cCI6MjA5MjUzODg1NX0.KV9NF4qAtxibpGfDfDLRZO4RM0WMKrF4sWMwcJWStzY";
const char* DEVICE_ID  = "ESP32-01";

/* ── 3. HARDWARE PINS ───────────────────────────────────────── */
#define SENSOR_PIN  34
#define RELAY_PIN   26

/* ── 4. TIMING CONSTANTS ────────────────────────────────────── */
#define AIR_VALUE        4000   // ADC >= this = sensor in air → NEVER pump
#define READ_INTERVAL    10000  // Sensor read + post every 10s
#define CONFIG_INTERVAL   5000  // Poll config every 5s (fast manual response)
#define WATER_SYNC_INT   10000  // Sync pump seconds to Supabase every 10s
#define HYSTERESIS       80     // ADC units — prevents relay chattering

/* ── 5. WATER RESERVOIR CONSTANTS (calibrated, do not change) ─ */
// Physically measured: 500ml exhausted in exactly 25 seconds = 20 ml/sec
// 10% safety buffer applied: 20 × 1.10 = 22.0 ml/sec
// Effect: pump cuts off a few seconds BEFORE fish reserve is actually reached.
// This protects fish from pump suction if timing is slightly off.
const float ML_PER_SEC   = 22.0f;
const float FISH_RESERVE = 200.0f; // Always reserved for fish — never touched

/* ── 6. EEPROM ──────────────────────────────────────────────── */
#define EEPROM_SIZE      8
#define EEPROM_ADDR_SEC  0   // Bytes 0–3: totalPumpSeconds (float)

/* ── 7. MOISTURE STATE ──────────────────────────────────────── */
int  moisture_min   = 1500;
int  moisture_max   = 3000;
bool auto_mode      = true;
bool pump_state     = false;
bool rain_expected  = false;

/* ── 8. WATER RESERVOIR STATE ───────────────────────────────── */
float bottleCapacityMl   = 500.0f; // Fetched from Supabase (user sets in PWA)
float totalPumpSeconds   = 0.0f;   // Persisted in EEPROM — survives reboots
bool  pumpBlockedByWater = false;  // TRUE = water low, pump stays OFF
bool  waterAlertFired    = false;  // Prevents duplicate alert inserts
unsigned long pumpOnMillis   = 0;  // millis() when pump last turned ON
unsigned long lastWaterSync  = 0;  // last time we pushed total_pump_seconds

/* ── 9. LOOP TIMING ─────────────────────────────────────────── */
unsigned long lastReadTime   = 0;
unsigned long lastConfigTime = 0;

/* ════════════════════════════════════════════════════════════════
   FORWARD DECLARATIONS
════════════════════════════════════════════════════════════════ */
void connectWiFi();
void fetchDeviceConfig();
int  readMoisture();
void controlPump(int value);
void setPump(bool on, const char* reason);
void postSensorData(int value);
void updatePumpState(bool on);
void saveWaterToEEPROM();
void syncWaterData();
void insertWaterAlert();
void clearResetFlag();
void checkWaterLevel();

/* ════════════════════════════════════════════════════════════════
   SETUP
════════════════════════════════════════════════════════════════ */
void setup() {
  Serial.begin(115200);
  delay(500);

  // Relay: pump OFF by default (safe)
  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW);
  pump_state = false;

  // Load totalPumpSeconds from EEPROM (survives reboot)
  EEPROM.begin(EEPROM_SIZE);
  EEPROM.get(EEPROM_ADDR_SEC, totalPumpSeconds);
  if (isnan(totalPumpSeconds) || totalPumpSeconds < 0 || totalPumpSeconds > 999999) {
    totalPumpSeconds = 0.0f; // Sanity check for corrupt EEPROM
    saveWaterToEEPROM();
  }
  Serial.printf("[Water] Restored from EEPROM: %.1f seconds pumped\n", totalPumpSeconds);

  Serial.println("\n===== SoilIQ Smart Irrigation =====");
  Serial.println("Phase 5: Water Reservoir Tracking");
  Serial.println("===================================");

  connectWiFi();
  fetchDeviceConfig();
}

/* ════════════════════════════════════════════════════════════════
   LOOP
════════════════════════════════════════════════════════════════ */
void loop() {
  unsigned long now = millis();

  // ── Water level check every loop (lightweight, no HTTP) ──
  checkWaterLevel();

  // ── Poll config every 5s (picks up manual commands fast) ──
  if (now - lastConfigTime >= CONFIG_INTERVAL) {
    fetchDeviceConfig();
    lastConfigTime = now;
  }

  // ── Sensor read + pump control every 10s ──
  if (now - lastReadTime >= READ_INTERVAL) {
    int raw = readMoisture();
    postSensorData(raw);
    controlPump(raw);
    lastReadTime = now;
  }

  // ── Sync pump seconds to Supabase every 10s ──
  if (now - lastWaterSync >= WATER_SYNC_INT) {
    syncWaterData();
    lastWaterSync = now;
  }

  // ── WiFi watchdog ──
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[WiFi] Disconnected — reconnecting...");
    WiFi.disconnect(true);
    delay(1000);
    connectWiFi();
  }
}

/* ════════════════════════════════════════════════════════════════
   WIFI
════════════════════════════════════════════════════════════════ */
void connectWiFi() {
  Serial.printf("[WiFi] Connecting to: %s\n", WIFI_SSID);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 20) {
    delay(500);
    Serial.print(".");
    attempts++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("\n[WiFi] Connected!");
    Serial.printf("[WiFi] IP: %s\n", WiFi.localIP().toString().c_str());
  } else {
    Serial.println("\n[WiFi] FAILED — running local logic only.");
  }
}

/* ════════════════════════════════════════════════════════════════
   FETCH CONFIG FROM SUPABASE
   Reads: auto_mode, pump_state, rain_expected, moisture thresholds,
          bottle_capacity_ml, water_reset_flag
════════════════════════════════════════════════════════════════ */
void fetchDeviceConfig() {
  if (WiFi.status() != WL_CONNECTED) return;

  String url = String(SB_URL)
    + "/rest/v1/device_config"
    + "?device_id=eq." + DEVICE_ID
    + "&select=auto_mode,pump_state,rain_expected,bottle_capacity_ml,"
    + "water_reset_flag,plants(moisture_min,moisture_max)";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");

  int code = http.GET();

  if (code == 200) {
    String body = http.getString();
    StaticJsonDocument<512> doc;

    if (!deserializeJson(doc, body) && doc.is<JsonArray>() && doc.size() > 0) {
      JsonObject cfg = doc[0];

      auto_mode     = cfg["auto_mode"]          | true;
      rain_expected = cfg["rain_expected"]       | false;
      bottleCapacityMl = cfg["bottle_capacity_ml"] | 500.0f;

      if (!cfg["plants"].isNull()) {
        moisture_min = cfg["plants"]["moisture_min"] | 1500;
        moisture_max = cfg["plants"]["moisture_max"] | 3000;
      }

      // ── MANUAL MODE: apply UI pump command directly ──
      if (!auto_mode) {
        bool uiState = cfg["pump_state"] | false;
        if (uiState != pump_state) {
          pump_state = uiState;
          // Only honour ON command if water is not critically low
          if (pump_state && pumpBlockedByWater) {
            Serial.println("[Pump] MANUAL ON blocked — water low");
          } else {
            digitalWrite(RELAY_PIN, pump_state ? HIGH : LOW);
            if (pump_state) pumpOnMillis = millis();
            else if (pumpOnMillis > 0) {
              totalPumpSeconds += (millis() - pumpOnMillis) / 1000.0f;
              pumpOnMillis = 0;
              saveWaterToEEPROM();
            }
            Serial.printf("[Pump] MANUAL %s (UI command)\n", pump_state ? "ON" : "OFF");
          }
        }
      } else {
        pump_state = cfg["pump_state"] | false;
      }

      // ── WATER RESET FLAG ──
      bool resetFlag = cfg["water_reset_flag"] | false;
      if (resetFlag) {
        Serial.println("[Water] Reset flag detected — resetting reservoir tracking");
        totalPumpSeconds   = 0.0f;
        waterAlertFired    = false;
        pumpBlockedByWater = false;
        pumpOnMillis       = 0;
        saveWaterToEEPROM();
        clearResetFlag(); // Write FALSE back to Supabase
      }

      float waterUsed  = totalPumpSeconds * ML_PER_SEC;
      float waterLeft  = bottleCapacityMl - waterUsed;
      Serial.printf("[Config] mode=%s rain=%s bottle=%.0fml used=%.0fml left=%.0fml\n",
        auto_mode ? "AUTO" : "MANUAL",
        rain_expected ? "YES" : "NO",
        bottleCapacityMl, waterUsed, waterLeft);
    }
  } else {
    Serial.printf("[Config] HTTP Error: %d\n", code);
  }

  http.end();
}

/* ════════════════════════════════════════════════════════════════
   CHECK WATER LEVEL  (runs every loop — no HTTP)
   Calculates estimated water remaining.
   Blocks pump and fires alert when fish reserve is reached.
════════════════════════════════════════════════════════════════ */
void checkWaterLevel() {
  // Add live pump runtime to stored total (pump may currently be ON)
  float liveSecs = totalPumpSeconds;
  if (pump_state && pumpOnMillis > 0) {
    liveSecs += (millis() - pumpOnMillis) / 1000.0f;
  }

  float waterUsed      = liveSecs * ML_PER_SEC;
  float waterRemaining = bottleCapacityMl - waterUsed;

  if (waterRemaining <= FISH_RESERVE && !waterAlertFired) {
    waterAlertFired    = true;
    pumpBlockedByWater = true;

    // Accumulate & save before forcing pump off
    if (pump_state && pumpOnMillis > 0) {
      totalPumpSeconds += (millis() - pumpOnMillis) / 1000.0f;
      pumpOnMillis = 0;
      saveWaterToEEPROM();
    }

    Serial.println("[Water] ⚠️  WATER LOW — Pump blocked. Fish reserve protected.");
    setPump(false, "WATER LOW — Fish reserve protection");
    insertWaterAlert();
  }
}

/* ════════════════════════════════════════════════════════════════
   READ SENSOR  (average of 5 samples)
════════════════════════════════════════════════════════════════ */
int readMoisture() {
  long sum = 0;
  for (int i = 0; i < 5; i++) {
    sum += analogRead(SENSOR_PIN);
    delay(10);
  }
  int value = sum / 5;

  Serial.println("\n────────────────────────");
  Serial.printf("[Sensor] ADC: %d\n", value);

  if (value >= AIR_VALUE)
    Serial.println("[Sensor] WARNING: Sensor in air / disconnected");
  else if (value > moisture_max)
    Serial.printf("[Sensor] DRY  (ADC %d > max %d)\n", value, moisture_max);
  else if (value < moisture_min)
    Serial.printf("[Sensor] WET  (ADC %d < min %d)\n", value, moisture_min);
  else
    Serial.printf("[Sensor] OK   (ADC %d, range %d-%d)\n", value, moisture_min, moisture_max);

  return value;
}

/* ════════════════════════════════════════════════════════════════
   PUMP CONTROL (auto mode)
════════════════════════════════════════════════════════════════ */
void controlPump(int value) {
  if (!auto_mode) {
    Serial.println("[Pump] Manual mode — skipping auto logic");
    return;
  }

  // Water guard — highest priority
  if (pumpBlockedByWater) {
    if (pump_state) setPump(false, "WATER LOW — blocked");
    return;
  }

  // Sensor air guard
  if (value >= AIR_VALUE) {
    setPump(false, "AIR DETECTED — Safety OFF");
    return;
  }

  // Rain guard
  if (rain_expected) {
    if (pump_state) setPump(false, "RAIN EXPECTED — Conserving water");
    else Serial.println("[Pump] Rain expected — holding OFF");
    return;
  }

  // Auto moisture logic with hysteresis
  if (value > moisture_max && !pump_state) {
    setPump(true, "DRY SOIL — Pump ON");
  } else if (value < (moisture_max - HYSTERESIS) && pump_state) {
    setPump(false, "OPTIMAL — Pump OFF");
  }
}

/* ════════════════════════════════════════════════════════════════
   SET PUMP  (hardware GPIO + Supabase sync + runtime tracking)
════════════════════════════════════════════════════════════════ */
void setPump(bool on, const char* reason) {
  // ── Track pump runtime ──
  if (on && !pump_state) {
    pumpOnMillis = millis(); // Pump turning ON — start timer
  } else if (!on && pump_state) {
    if (pumpOnMillis > 0) {
      totalPumpSeconds += (millis() - pumpOnMillis) / 1000.0f;
      pumpOnMillis = 0;
      saveWaterToEEPROM(); // Persist immediately on pump OFF
    }
  }

  pump_state = on;
  digitalWrite(RELAY_PIN, on ? HIGH : LOW);
  Serial.printf("[Pump] %s → %s\n", on ? "ON" : "OFF", reason);
  updatePumpState(on);
}

/* ════════════════════════════════════════════════════════════════
   SAVE WATER DATA TO EEPROM
════════════════════════════════════════════════════════════════ */
void saveWaterToEEPROM() {
  EEPROM.put(EEPROM_ADDR_SEC, totalPumpSeconds);
  EEPROM.commit();
  Serial.printf("[EEPROM] Saved totalPumpSeconds=%.1f\n", totalPumpSeconds);
}

/* ════════════════════════════════════════════════════════════════
   SYNC WATER DATA TO SUPABASE  (every 10s)
════════════════════════════════════════════════════════════════ */
void syncWaterData() {
  if (WiFi.status() != WL_CONNECTED) return;

  // Include live pump seconds if pump is currently ON
  float syncSecs = totalPumpSeconds;
  if (pump_state && pumpOnMillis > 0) {
    syncSecs += (millis() - pumpOnMillis) / 1000.0f;
  }

  String url  = String(SB_URL) + "/rest/v1/device_config?device_id=eq." + DEVICE_ID;
  String body = "{\"total_pump_seconds\":" + String(syncSecs, 1) + "}";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.PATCH(body);
  Serial.printf("[Water] Synced %.1f secs → HTTP %d\n", syncSecs, code);
  http.end();
}

/* ════════════════════════════════════════════════════════════════
   INSERT WATER LOW ALERT TO SUPABASE
════════════════════════════════════════════════════════════════ */
void insertWaterAlert() {
  if (WiFi.status() != WL_CONNECTED) return;

  String url  = String(SB_URL) + "/rest/v1/alerts";
  String body = "{\"device_id\":\"" + String(DEVICE_ID) + "\","
              + "\"alert_type\":\"water_low\","
              + "\"message\":\"Water low! Only 200ml fish reserve remaining. Please refill.\"}";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.POST(body);
  Serial.printf("[Alert] Water low alert inserted → HTTP %d\n", code);
  http.end();
}

/* ════════════════════════════════════════════════════════════════
   CLEAR RESET FLAG IN SUPABASE  (after processing reset)
════════════════════════════════════════════════════════════════ */
void clearResetFlag() {
  if (WiFi.status() != WL_CONNECTED) return;

  String url  = String(SB_URL) + "/rest/v1/device_config?device_id=eq." + DEVICE_ID;
  String body = "{\"water_reset_flag\":false,\"total_pump_seconds\":0.0}";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.PATCH(body);
  Serial.printf("[Reset] water_reset_flag cleared → HTTP %d\n", code);
  http.end();
}

/* ════════════════════════════════════════════════════════════════
   POST SENSOR DATA TO SUPABASE
════════════════════════════════════════════════════════════════ */
void postSensorData(int value) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[Post] No WiFi — skipping");
    return;
  }

  String url  = String(SB_URL) + "/rest/v1/sensor_data";
  String body = "{\"device_id\":\"" + String(DEVICE_ID)
              + "\",\"moisture_value\":" + String(value) + "}";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.POST(body);
  Serial.printf("[Post] ADC=%d → HTTP %d\n", value, code);
  http.end();
}

/* ════════════════════════════════════════════════════════════════
   UPDATE PUMP STATE IN SUPABASE  (auto mode decisions only)
════════════════════════════════════════════════════════════════ */
void updatePumpState(bool on) {
  if (WiFi.status() != WL_CONNECTED) return;

  String url  = String(SB_URL) + "/rest/v1/device_config?device_id=eq." + DEVICE_ID;
  String body = "{\"pump_state\":" + String(on ? "true" : "false") + "}";

  WiFiClientSecure client;
  client.setInsecure();

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.PATCH(body);
  Serial.printf("[Sync] pump_state=%s → HTTP %d\n", on ? "true" : "false", code);
  http.end();
}
