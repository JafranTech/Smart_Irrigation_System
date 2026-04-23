-- ============================================================
-- SMART IRRIGATION SYSTEM — SUPABASE SCHEMA (FIXED)
-- Matches gemini.md frozen schema exactly.
-- Paste ENTIRE file into Supabase SQL Editor → Run All
-- ============================================================


-- ─────────────────────────────────────────────────────────────
-- TABLE 1: plants
-- Plant library with species-specific moisture targets.
-- gemini.md columns: id, name, moisture_min, moisture_max,
--                    description, sunlight, water_level, fertilizer
-- Extra display-only columns kept (do not affect logic).
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS plants (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name            TEXT        NOT NULL,
  moisture_min    INTEGER     NOT NULL,   -- 0–4095 ADC  (dry threshold)
  moisture_max    INTEGER     NOT NULL,   -- 0–4095 ADC  (wet threshold)
  description     TEXT,
  sunlight        TEXT,                   -- 'low' | 'medium' | 'high'
  water_level     TEXT,                   -- 'Low' | 'Medium' | 'High'
  fertilizer      TEXT,
  -- Display-only extras (no logic depends on these)
  scientific_name TEXT,
  emoji           TEXT,
  watering_freq   TEXT
);


-- ─────────────────────────────────────────────────────────────
-- TABLE 2: device_config
-- One row per ESP32 device.
-- gemini.md columns: device_id (TEXT PK), plant_id, auto_mode,
--                    pump_state, rain_expected
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS device_config (
  device_id       TEXT        PRIMARY KEY,           -- e.g. 'ESP32-01'
  plant_id        UUID        REFERENCES plants(id), -- currently selected plant
  auto_mode       BOOLEAN     NOT NULL DEFAULT TRUE, -- TRUE = system controls pump
  pump_state      BOOLEAN     NOT NULL DEFAULT FALSE,-- TRUE = pump ON
  rain_expected   BOOLEAN     NOT NULL DEFAULT FALSE -- set by PWA via weather API
);


-- ─────────────────────────────────────────────────────────────
-- TABLE 3: sensor_data
-- Time-series moisture readings from ESP32.
-- gemini.md columns: id, device_id, moisture_value, timestamp
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS sensor_data (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  device_id       TEXT        REFERENCES device_config(device_id) ON DELETE CASCADE,
  moisture_value  INTEGER     NOT NULL,              -- raw ADC (0–4095)
  timestamp       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- ─────────────────────────────────────────────────────────────
-- INDEXES — performance on high-frequency sensor table
-- ─────────────────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_sensor_data_device_id
  ON sensor_data(device_id);

CREATE INDEX IF NOT EXISTS idx_sensor_data_timestamp
  ON sensor_data(timestamp DESC);


-- ─────────────────────────────────────────────────────────────
-- ROW LEVEL SECURITY
-- MVP mode: full public access (anon key works for ESP32 + PWA).
-- Production: replace with JWT-based policies.
-- ─────────────────────────────────────────────────────────────
ALTER TABLE plants        ENABLE ROW LEVEL SECURITY;
ALTER TABLE device_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE sensor_data   ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_all" ON plants        FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all" ON device_config FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all" ON sensor_data   FOR ALL USING (true) WITH CHECK (true);


-- ─────────────────────────────────────────────────────────────
-- SEED DATA: Plant Library (10 plants)
-- moisture_min / moisture_max are RAW ADC (0–4095).
-- Lower ADC = wetter soil.  Higher ADC = drier soil.
-- Example: Tomato optimal = ADC 800–1600  (moderately moist)
-- ─────────────────────────────────────────────────────────────
INSERT INTO plants
  (name, moisture_min, moisture_max, description, sunlight, water_level, fertilizer,
   scientific_name, emoji, watering_freq)
VALUES
  ('Tomato',     800,  1600, 'Needs consistent moisture for fruit development.',
   'high',   'High',   'NPK 10-10-10',    'Solanum lycopersicum', '🍅', 'Every 2 days'),

  ('Rose',       1000, 1800, 'Prefers well-drained soil with moderate moisture.',
   'high',   'Medium', 'Rose fertilizer', 'Rosa',                 '🌹', 'Every 3 days'),

  ('Cactus',     2800, 3800, 'Desert plant. Overwatering causes root rot.',
   'high',   'Low',    'None',            'Cactaceae',            '🌵', 'Every 14 days'),

  ('Basil',      900,  1700, 'Prefers moist but not waterlogged soil.',
   'medium', 'High',   'Liquid nitrogen', 'Ocimum basilicum',     '🌿', 'Every 2 days'),

  ('Aloe Vera',  2200, 3200, 'Drought tolerant. Let soil dry between watering.',
   'medium', 'Low',    'None',            'Aloe barbadensis',     '🪴', 'Every 7 days'),

  ('Spinach',    700,  1400, 'Leafy green needing consistent moisture.',
   'medium', 'High',   'Nitrogen-rich',   'Spinacia oleracea',    '🥬', 'Every day'),

  ('Lavender',   2000, 3000, 'Drought tolerant once established.',
   'high',   'Low',    'Low phosphorus',  'Lavandula',            '💜', 'Every 7 days'),

  ('Peace Lily', 800,  1600, 'Tropical plant, likes consistently moist soil.',
   'low',    'High',   'Balanced NPK',    'Spathiphyllum',        '🌸', 'Every 3 days'),

  ('Chili',      900,  1700, 'Needs good drainage and moderate watering.',
   'high',   'Medium', 'Potassium-rich',  'Capsicum annuum',      '🌶️', 'Every 2 days'),

  ('Mint',       700,  1400, 'Loves moisture. Spreads fast — use containers.',
   'medium', 'High',   'Balanced NPK',    'Mentha',               '🍃', 'Every day');


-- ─────────────────────────────────────────────────────────────
-- SEED DATA: Default Device
-- device_id must match the string hardcoded in ESP32 firmware.
-- ─────────────────────────────────────────────────────────────
INSERT INTO device_config (device_id, auto_mode, pump_state, rain_expected)
  VALUES ('ESP32-01', TRUE, FALSE, FALSE);


-- ─────────────────────────────────────────────────────────────
-- REALTIME — enables live push to PWA without polling
-- ─────────────────────────────────────────────────────────────
ALTER PUBLICATION supabase_realtime ADD TABLE sensor_data;
ALTER PUBLICATION supabase_realtime ADD TABLE device_config;


-- ============================================================
-- DONE.
-- Tables:  plants | device_config | sensor_data
-- Schema matches gemini.md frozen spec.
-- ============================================================