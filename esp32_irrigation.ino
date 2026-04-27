/*
 * ================================================================
 *  SoilIQ — Smart Irrigation Firmware
 *  Phase 4: Cloud-Connected (WiFi + Supabase)
 * ================================================================
 *  Hardware (your friend's setup):
 *    - SENSOR_PIN : GPIO 34 (Analog soil moisture sensor)
 *    - RELAY_PIN  : GPIO 26 (Relay → Water pump)
 *
 *  Architecture:
 *    ESP32 → WiFi → Supabase REST API (reads config, writes readings)
 *    UI    ← Supabase (reads live data)
 *
 *  Libraries needed (install via Arduino Library Manager):
 *    1. ArduinoJson  (by Benoit Blanchon) — version 6.x
 *    2. HTTPClient   (built-in with ESP32 board package)
 *    3. WiFi         (built-in with ESP32 board package)
 * ================================================================
 */

#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

/* ── 1. CHANGE THESE TO YOUR FRIEND'S WIFI ─────────────────── */
const char* WIFI_SSID     = "Your_WiFi_Name";
const char* WIFI_PASSWORD = "Your_WiFi_Password";

/* ── 2. SUPABASE CONFIG (DO NOT CHANGE) ─────────────────────── */
const char* SB_URL     = "https://mwfbxspdxzvfhchbngoj.supabase.co";
const char* SB_API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13ZmJ4c3BkeHp2ZmhjaGJuZ29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY5NjI4NTUsImV4cCI6MjA5MjUzODg1NX0.KV9NF4qAtxibpGfDfDLRZO4RM0WMKrF4sWMwcJWStzY";
const char* DEVICE_ID  = "ESP32-01";

/* ── 3. HARDWARE PINS (same as your friend's code) ──────────── */
#define SENSOR_PIN  34
#define RELAY_PIN   26

/* ── 4. CONSTANTS ───────────────────────────────────────────── */
#define AIR_VALUE        4000   // If reading >= this, sensor is in air → NEVER pump
#define READ_INTERVAL    10000  // Read and post every 10 seconds (ms)

/* ── 5. STATE ───────────────────────────────────────────────── */
int  moisture_min = 1500;   // Default — overwritten by Supabase config
int  moisture_max = 3000;   // Default — overwritten by Supabase config
bool auto_mode    = true;   // Default — overwritten by Supabase config
bool pump_state   = false;  // Current pump status
bool rain_expected = false; // Phase 6 — skip pump if rain is coming

unsigned long lastReadTime = 0;
unsigned long lastConfigTime = 0;
#define CONFIG_INTERVAL 30000  // Refresh config from Supabase every 30s

/* ════════════════════════════════════════════════════════════════
   SETUP
════════════════════════════════════════════════════════════════ */
void setup() {
  Serial.begin(115200);
  delay(500);

  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW);  // Pump OFF at start (safe default)
  pump_state = false;

  Serial.println("\n===== SoilIQ Smart Irrigation =====");
  Serial.println("Phase 4: Cloud-Connected Firmware");
  Serial.println("===================================");

  connectWiFi();

  // First config fetch before entering loop
  fetchDeviceConfig();
}

/* ════════════════════════════════════════════════════════════════
   LOOP
════════════════════════════════════════════════════════════════ */
void loop() {
  unsigned long now = millis();

  // Re-fetch config from Supabase every 30s
  // This allows UI changes (plant selection, mode) to take effect
  if (now - lastConfigTime >= CONFIG_INTERVAL) {
    fetchDeviceConfig();
    lastConfigTime = now;
  }

  // Read sensor + post to Supabase every 10s
  if (now - lastReadTime >= READ_INTERVAL) {
    int rawValue = readMoisture();
    postSensorData(rawValue);
    controlPump(rawValue);
    lastReadTime = now;
  }

  // Reconnect WiFi if dropped
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[WiFi] Disconnected. Reconnecting...");
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
    Serial.printf("[WiFi] IP Address: %s\n", WiFi.localIP().toString().c_str());
  } else {
    Serial.println("\n[WiFi] FAILED. Running without cloud (local logic only).");
  }
}

/* ════════════════════════════════════════════════════════════════
   FETCH CONFIG FROM SUPABASE
   Reads: device_config → plant moisture_min, moisture_max, auto_mode
════════════════════════════════════════════════════════════════ */
void fetchDeviceConfig() {
  if (WiFi.status() != WL_CONNECTED) return;

  HTTPClient http;
  String url = String(SB_URL)
    + "/rest/v1/device_config"
    + "?device_id=eq." + DEVICE_ID
    + "&select=auto_mode,pump_state,plants(moisture_min,moisture_max)";

  http.begin(url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");

  int code = http.GET();

  if (code == 200) {
    String body = http.getString();
    Serial.println("[Config] Response: " + body);

    StaticJsonDocument<512> doc;
    DeserializationError err = deserializeJson(doc, body);
    if (!err && doc.is<JsonArray>() && doc.size() > 0) {
      JsonObject cfg = doc[0];

      auto_mode  = cfg["auto_mode"] | true;
      pump_state = cfg["pump_state"] | false;
      rain_expected = cfg["rain_expected"] | false;

      if (!cfg["plants"].isNull()) {
        moisture_min = cfg["plants"]["moisture_min"] | 1500;
        moisture_max = cfg["plants"]["moisture_max"] | 3000;
      }

      Serial.printf("[Config] auto_mode=%s, min=%d, max=%d, rain=%s\n",
        auto_mode ? "AUTO" : "MANUAL", moisture_min, moisture_max,
        rain_expected ? "YES" : "NO");

      // In manual mode, respect the pump_state from UI
      if (!auto_mode) {
        setPump(pump_state, "MANUAL MODE — UI commanded");
      }
    }
  } else {
    Serial.printf("[Config] HTTP Error: %d\n", code);
  }

  http.end();
}

/* ════════════════════════════════════════════════════════════════
   READ SENSOR
════════════════════════════════════════════════════════════════ */
int readMoisture() {
  // Average 5 readings to reduce noise
  long sum = 0;
  for (int i = 0; i < 5; i++) {
    sum += analogRead(SENSOR_PIN);
    delay(10);
  }
  int value = sum / 5;

  Serial.println("\n────────────────────────");
  Serial.printf("[Sensor] Raw ADC Value: %d\n", value);

  if (value >= AIR_VALUE) {
    Serial.println("[Sensor] ⚠️  SENSOR IN AIR / DISCONNECTED — Skipping pump control");
  } else if (value > moisture_max) {
    Serial.printf("[Sensor] 🌵 DRY SOIL  (ADC %d > max %d)\n", value, moisture_max);
  } else if (value < moisture_min) {
    Serial.printf("[Sensor] 🌊 WET SOIL  (ADC %d < min %d)\n", value, moisture_min);
  } else {
    Serial.printf("[Sensor] ✅ OPTIMAL   (ADC %d, range %d–%d)\n", value, moisture_min, moisture_max);
  }

  return value;
}

/* ════════════════════════════════════════════════════════════════
   PUMP CONTROL LOGIC
   Golden Rule:
     value > moisture_max → DRY  → Pump ON
     value < moisture_min → WET  → Pump OFF
     value >= AIR_VALUE   → AIR  → NEVER pump (safety guard)
════════════════════════════════════════════════════════════════ */
void controlPump(int value) {
  // MANUAL mode — pump is controlled by UI, not sensor
  if (!auto_mode) {
    Serial.println("[Pump] Manual mode — skipping auto logic");
    return;
  }

  // SAFETY GUARD — sensor disconnected or in air
  if (value >= AIR_VALUE) {
    setPump(false, "AIR DETECTED — Safety OFF");
    return;
  }

  // PHASE 6: RAIN GUARD — don't water if rain is expected
  if (rain_expected) {
    if (pump_state) setPump(false, "RAIN EXPECTED — Conserving water");
    else Serial.println("[Pump] Rain expected — skipping auto logic");
    return;
  }

  // AUTO LOGIC
  if (value > moisture_max && !pump_state) {
    setPump(true, "DRY SOIL — Pump ON");
  } else if (value <= moisture_max && pump_state) {
    setPump(false, "OPTIMAL/WET — Pump OFF");
  }
}

/* ════════════════════════════════════════════════════════════════
   SET PUMP (hardware + Supabase sync)
════════════════════════════════════════════════════════════════ */
void setPump(bool on, const char* reason) {
  pump_state = on;
  digitalWrite(RELAY_PIN, on ? HIGH : LOW);
  Serial.printf("[Pump] %s → %s\n", on ? "ON " : "OFF", reason);

  // Sync pump_state back to Supabase so UI reflects it
  updatePumpState(on);
}

/* ════════════════════════════════════════════════════════════════
   POST SENSOR DATA TO SUPABASE
════════════════════════════════════════════════════════════════ */
void postSensorData(int value) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[Post] WiFi not connected — skipping upload");
    return;
  }

  HTTPClient http;
  String url = String(SB_URL) + "/rest/v1/sensor_data";

  // sensor_data table columns: device_id, moisture_value, timestamp (auto)
  String body = "{\"device_id\":\"" + String(DEVICE_ID)
              + "\",\"moisture_value\":" + String(value)
              + "}";

  http.begin(url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.POST(body);
  if (code == 201) {
    Serial.printf("[Post] ✅ Uploaded: ADC=%d pump=%s\n",
      value, pump_state ? "ON" : "OFF");
  } else {
    Serial.printf("[Post] ❌ Failed: HTTP %d\n", code);
  }

  http.end();
}

/* ════════════════════════════════════════════════════════════════
   UPDATE PUMP STATE IN SUPABASE (so UI sees it)
════════════════════════════════════════════════════════════════ */
void updatePumpState(bool on) {
  if (WiFi.status() != WL_CONNECTED) return;

  HTTPClient http;
  String url = String(SB_URL)
    + "/rest/v1/device_config"
    + "?device_id=eq." + DEVICE_ID;

  String body = "{\"pump_state\":" + String(on ? "true" : "false") + "}";

  http.begin(url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");
  http.addHeader("Prefer",        "return=minimal");

  int code = http.PATCH(body);
  Serial.printf("[Sync] pump_state → Supabase: HTTP %d\n", code);

  http.end();
}
