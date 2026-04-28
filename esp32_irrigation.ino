/*
 * ================================================================
 *  SoilIQ — Smart Irrigation Firmware
 *  Phase 4: Cloud-Connected (WiFi + Supabase)
 * ================================================================
 *  Hardware:
 *    - SENSOR_PIN : GPIO 34 (Analog soil moisture sensor)
 *    - RELAY_PIN  : GPIO 26 (Relay → Water pump)
 *
 *  Architecture:
 *    ESP32 → WiFi → Supabase REST API (reads config, writes readings)
 *    UI    ← Supabase (reads live data)
 *
 *  Libraries needed (install via Arduino Library Manager):
 *    1. ArduinoJson  (by Benoit Blanchon) — version 6.x
 *    2. ESP32 board package includes: WiFi, WiFiClientSecure, HTTPClient
 * ================================================================
 */

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

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

/* ── 4. CONSTANTS ───────────────────────────────────────────── */
#define AIR_VALUE        4000   // Reading >= this = sensor in air → NEVER pump
#define READ_INTERVAL    10000  // Read + post every 10 seconds (ms)
#define CONFIG_INTERVAL  30000  // Refresh config from Supabase every 30s
#define HYSTERESIS       80     // ADC units — prevents relay chattering at boundary

/* ── 5. STATE ───────────────────────────────────────────────── */
int  moisture_min  = 1500;
int  moisture_max  = 3000;
bool auto_mode     = true;
bool pump_state    = false;
bool rain_expected = false;

unsigned long lastReadTime   = 0;
unsigned long lastConfigTime = 0;

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
  Serial.println("Cloud-Connected Firmware");
  Serial.println("===================================");

  connectWiFi();
  fetchDeviceConfig();
}

/* ════════════════════════════════════════════════════════════════
   LOOP
════════════════════════════════════════════════════════════════ */
void loop() {
  unsigned long now = millis();

  // Refresh config every 30s (picks up UI changes: plant, mode, rain toggle)
  if (now - lastConfigTime >= CONFIG_INTERVAL) {
    fetchDeviceConfig();
    lastConfigTime = now;
  }

  // Read sensor + post to Supabase every 10s
  if (now - lastReadTime >= READ_INTERVAL) {
    int raw = readMoisture();
    postSensorData(raw);
    controlPump(raw);
    lastReadTime = now;
  }

  // Reconnect WiFi if dropped
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[WiFi] Disconnected — reconnecting...");
    WiFi.disconnect(true);  // Force-stop the stuck connection attempt
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
   Reads: auto_mode, pump_state, rain_expected, moisture_min/max
════════════════════════════════════════════════════════════════ */
void fetchDeviceConfig() {
  if (WiFi.status() != WL_CONNECTED) return;

  String url = String(SB_URL)
    + "/rest/v1/device_config"
    + "?device_id=eq." + DEVICE_ID
    + "&select=auto_mode,pump_state,rain_expected,plants(moisture_min,moisture_max)";

  WiFiClientSecure client;
  client.setInsecure();   // Skip TLS cert validation (standard for IoT)

  HTTPClient http;
  http.begin(client, url);
  http.addHeader("apikey",        SB_API_KEY);
  http.addHeader("Authorization", String("Bearer ") + SB_API_KEY);
  http.addHeader("Content-Type",  "application/json");

  int code = http.GET();

  if (code == 200) {
    String body = http.getString();
    Serial.println("[Config] " + body);

    StaticJsonDocument<512> doc;
    if (!deserializeJson(doc, body) && doc.is<JsonArray>() && doc.size() > 0) {
      JsonObject cfg = doc[0];

      auto_mode     = cfg["auto_mode"]     | true;
      pump_state    = cfg["pump_state"]    | false;
      rain_expected = cfg["rain_expected"] | false;

      if (!cfg["plants"].isNull()) {
        moisture_min = cfg["plants"]["moisture_min"] | 1500;
        moisture_max = cfg["plants"]["moisture_max"] | 3000;
      }

      Serial.printf("[Config] mode=%s min=%d max=%d rain=%s\n",
        auto_mode ? "AUTO" : "MANUAL", moisture_min, moisture_max,
        rain_expected ? "YES" : "NO");

      if (!auto_mode) {
        setPump(pump_state, "MANUAL — UI commanded");
      }
    }
  } else {
    Serial.printf("[Config] HTTP Error: %d\n", code);
  }

  http.end();
}

/* ════════════════════════════════════════════════════════════════
   READ SENSOR  (average of 5 samples to reduce noise)
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
    Serial.printf("[Sensor] DRY   (ADC %d > max %d)\n", value, moisture_max);
  else if (value < moisture_min)
    Serial.printf("[Sensor] WET   (ADC %d < min %d)\n", value, moisture_min);
  else
    Serial.printf("[Sensor] OK    (ADC %d, range %d-%d)\n", value, moisture_min, moisture_max);

  return value;
}

/* ════════════════════════════════════════════════════════════════
   PUMP CONTROL
   value > moisture_max  → DRY  → Pump ON
   value < moisture_max - HYSTERESIS → WET/OK → Pump OFF
   value >= AIR_VALUE    → AIR  → Safety OFF
════════════════════════════════════════════════════════════════ */
void controlPump(int value) {
  if (!auto_mode) {
    Serial.println("[Pump] Manual mode — skipping auto logic");
    return;
  }

  if (value >= AIR_VALUE) {
    setPump(false, "AIR DETECTED — Safety OFF");
    return;
  }

  if (rain_expected) {
    if (pump_state) setPump(false, "RAIN EXPECTED — Conserving water");
    else Serial.println("[Pump] Rain expected — holding OFF");
    return;
  }

  // Hysteresis prevents relay chatter at the moisture_max boundary
  if (value > moisture_max && !pump_state) {
    setPump(true, "DRY SOIL — Pump ON");
  } else if (value < (moisture_max - HYSTERESIS) && pump_state) {
    setPump(false, "OPTIMAL — Pump OFF");
  }
}

/* ════════════════════════════════════════════════════════════════
   SET PUMP  (hardware pin + sync to Supabase)
════════════════════════════════════════════════════════════════ */
void setPump(bool on, const char* reason) {
  pump_state = on;
  digitalWrite(RELAY_PIN, on ? HIGH : LOW);
  Serial.printf("[Pump] %s → %s\n", on ? "ON" : "OFF", reason);
  updatePumpState(on);
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
  Serial.printf("[Post] ADC=%d pump=%s → HTTP %d\n",
    value, pump_state ? "ON" : "OFF", code);

  http.end();
}

/* ════════════════════════════════════════════════════════════════
   UPDATE PUMP STATE IN SUPABASE  (so UI reflects it)
════════════════════════════════════════════════════════════════ */
void updatePumpState(bool on) {
  if (WiFi.status() != WL_CONNECTED) return;

  String url  = String(SB_URL) + "/rest/v1/device_config"
              + "?device_id=eq." + DEVICE_ID;
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
