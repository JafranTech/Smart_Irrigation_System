# 🌱 Smart Irrigation System — Master Reference Document

> **⚠️ MANDATORY**: Read this file in full before starting **any** task in this project.
> Every decision — architecture, schema, logic, UI, firmware — must align with this document.
> Deviation without explicit user approval is not permitted.

---

## 1. ROLE & BEHAVIOUR

Act as a **World-Class Senior IoT Systems Architect and Full-Stack Engineer** responsible for:

- Designing and building a cloud-connected, intelligent irrigation system
- Ensuring production-grade code quality, security, and reliability
- Treating every output as part of a **scalable, closed-loop IoT platform** — not a hobby project

### Mandatory Self-Review Checklist (run after every task)

- [ ] Every component has **loading**, **error**, and **empty** states
- [ ] No inline styles, no hardcoded colors, no `console.log` left in production code
- [ ] Every component is **under 150 lines** (split if larger)
- [ ] All form validation runs **before** any Supabase call
- [ ] Service role key is **NEVER** present in frontend code
- [ ] RLS is **enabled** on all Supabase tables
- [ ] No sensitive data in URL params
- [ ] No unhandled Promise rejections
- [ ] All `useEffect` hooks have cleanup functions where needed
- [ ] All list renders have `key` props

### Final Report (required after every phase)

- List every file created or modified
- List every security check — PASS or FAIL
- List every test case — PASS or FAIL
- List bugs found and fixed
- **Do not mark any phase complete until all checks pass**

---

## 2. SYSTEM ARCHITECTURE

### Closed-Loop Data Flow

```
PWA (Vercel) → Supabase (DB + REST API) → ESP32 → Sensor / Relay / Pump → Plant
     ↑                                                                         |
     └─────────────────── SensorData logged back to Supabase ─────────────────┘
```

### Golden Rules — Never Break These

| Rule | Detail |
|------|--------|
| **No direct UI ↔ ESP32 communication** | UI talks only to Supabase; ESP32 talks only to Supabase |
| **No external API calls from ESP32** | ESP32 reads flags already stored in Supabase (e.g. `rain_expected`) |
| **No hardcoded plant data in ESP32** | ESP32 always fetches plant config from Supabase at runtime |
| **No schema changes mid-project** | Schema is frozen after Phase 2; changing it breaks all integrations |
| **Range-based logic only** | Single-threshold logic is forbidden |

---

## 3. CORE IRRIGATION LOGIC

The pump control logic is **strict and non-negotiable**:

```
IF   moisture_value < moisture_min   → Soil is DRY   → Pump ON
IF   moisture_value > moisture_max   → Soil is WET   → Pump OFF
ELSE (moisture_min ≤ value ≤ moisture_max) → Optimal → Pump OFF
```

### Critical Safety Rules

- **Air reading (≈ 4095) must NEVER trigger watering** — treat as sensor-disconnected state
- `moisture_min` and `moisture_max` are **plant-specific**, fetched from Supabase — never hardcoded
- In `auto_mode = false` (manual), pump state is driven by user override in the UI, not sensor logic
- If `rain_expected = true` in Supabase, ESP32 skips watering regardless of moisture reading

---

## 4. FIXED DATABASE SCHEMA

> **⛔ This schema is frozen. Do not add, remove, or rename any column.**

### Table: `plants`

| Column | Type | Description |
|--------|------|-------------|
| `id` | `uuid` (PK) | Unique plant identifier |
| `name` | `text` | Plant display name |
| `moisture_min` | `integer` | Lower bound — below this, soil is dry |
| `moisture_max` | `integer` | Upper bound — above this, soil is wet |
| `description` | `text` | Short plant description |
| `sunlight` | `text` | Sunlight requirement (e.g. Full Sun) |
| `water_level` | `text` | Water needs label (e.g. High, Low) |
| `fertilizer` | `text` | Fertilizer recommendation |

### Table: `device_config`

| Column | Type | Description |
|--------|------|-------------|
| `device_id` | `text` (PK) | Unique ESP32 identifier |
| `plant_id` | `uuid` (FK → plants.id) | Currently selected plant |
| `auto_mode` | `boolean` | `true` = autonomous, `false` = manual |
| `pump_state` | `boolean` | Current desired pump state (for manual override) |
| `rain_expected` | `boolean` | Set by frontend via weather API; read by ESP32 |

### Table: `sensor_data`

| Column | Type | Description |
|--------|------|-------------|
| `id` | `uuid` (PK, auto) | Record identifier |
| `device_id` | `text` (FK → device_config) | Source ESP32 |
| `moisture_value` | `integer` | Raw ADC reading (0–4095) |
| `timestamp` | `timestamptz` | Auto-set via `now()` default |

### RLS Policy Requirement

All three tables must have **Row Level Security enabled**. The frontend uses the `anon` key only for reads and permitted writes. The service role key stays server-side only.

---

## 5. ESP32 FIRMWARE BEHAVIOUR

### Startup Sequence

1. Connect to WiFi (credentials stored in firmware config, not Supabase)
2. On connection success → fetch `device_config` from Supabase via HTTP GET
3. Begin main loop

### Main Loop (every N seconds, configurable)

1. `analogRead(AO_PIN)` → get raw moisture value (0–4095)
2. HTTP GET `/rest/v1/device_config?device_id=eq.<id>` → fetch `plant_id`, `auto_mode`, `pump_state`, `rain_expected`
3. HTTP GET `/rest/v1/plants?id=eq.<plant_id>` → fetch `moisture_min`, `moisture_max`
4. Apply moisture logic (see Section 3)
5. Control relay: `digitalWrite(RELAY_PIN, ...)` — verify HIGH/LOW polarity per hardware
6. HTTP POST `/rest/v1/sensor_data` → log `device_id`, `moisture_value`, `timestamp`

### Relay Wiring Note

- Determine whether relay is **active-HIGH** or **active-LOW** before writing firmware
- Document the chosen polarity in this file once confirmed
- Default pin state on boot must be verified — an undefined pin state can accidentally activate the pump

### Sensor Calibration

| Reading | Meaning |
|---------|---------|
| ~4095 | Sensor in air — treat as disconnected, skip watering |
| ~0–500 | Fully submerged / saturated |
| 1000–3000 | Normal operational range (varies by soil/sensor) |

---

## 6. PWA FRONTEND SPECIFICATION

### Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Next.js (hosted on Vercel) |
| Database client | Supabase JS client (`@supabase/supabase-js`) |
| Styling | Vanilla CSS / CSS Modules — no TailwindCSS unless approved |
| PWA | `next-pwa` or equivalent manifest + service worker |

### Required Screens

#### 6.1 Plant Selection (`/plants`)
- Card-based grid layout
- Each card: plant image, name, description
- Tap → navigate to Plant Detail page

#### 6.2 Plant Detail (`/plants/[id]`)
- Full plant info: name, description, sunlight, water_level, fertilizer
- Moisture range display (min / max)
- **"Set Plant"** CTA → writes `plant_id` to `device_config` in Supabase

#### 6.3 Dashboard (`/dashboard`)
- Live moisture value (auto-refreshing, e.g. every 10s)
- Target moisture range bar (min–max)
- System status badge: `DRY` / `OPTIMAL` / `WET`
- Pump state indicator: `ON` / `OFF`
- Auto / Manual mode toggle → writes `auto_mode` to `device_config`
- Manual pump override button (visible only in manual mode)
- Optional: rain status indicator

### UI Design Principles

- Mobile-first, consumer-grade food-app quality feel
- No generic/plain colors — use curated HSL palettes
- Micro-animations on state changes (pump ON/OFF, status badge transitions)
- Every screen must have loading, error, and empty states
- No placeholder images — generate real assets

---

## 7. WEATHER INTEGRATION (Optional)

- Frontend fetches weather data from a public API (e.g. OpenWeatherMap)
- Computes `rain_expected: boolean` based on forecast
- Writes `rain_expected` to `device_config` in Supabase
- **ESP32 reads this flag from Supabase** — it never calls the weather API directly
- When `rain_expected = true`, ESP32 skips watering even if soil is dry

---

## 8. ALERT SYSTEM (Optional)

- **Buzzer alert** on ESP32 for:
  - Soil overwatered (moisture > moisture_max by a large margin)
  - Soil extremely dry (moisture > 4000 — near air reading)
- Alert state can optionally be logged to Supabase and shown in the UI

---

## 9. DEVELOPMENT PHASES

Follow phases **in order**. Each phase must produce a working, testable system before proceeding.

| Phase | Goal | Output |
|-------|------|--------|
| **Phase 1** | UI with dummy/hardcoded data | All screens functional with static data |
| **Phase 2** | Supabase schema setup | Tables, RLS, seed data for plants |
| **Phase 3** | UI ↔ Supabase integration | Live reads/writes; no more dummy data |
| **Phase 4** | ESP32 ↔ Supabase integration | Firmware reads config, posts sensor data |
| **Phase 5** | Smart logic refinement | Edge cases, auto/manual handoff, calibration |
| **Phase 6** | Alerts & weather integration | Buzzer, rain_expected flag, UI indicators |

---

## 10. DEBUGGING GUIDE

### Layered Isolation Approach

Always isolate the failure layer before applying a fix:

| Symptom | Probable Layer | Check |
|---------|---------------|-------|
| Pump always ON | ESP32 / Hardware | Relay trigger polarity; default pin state on boot |
| Pump never ON | ESP32 / Logic | moisture_min/max values; sensor AO pin |
| Sensor reads ~4095 always | Hardware | AO pin wiring; sensor power |
| UI shows no data | Frontend / Supabase | Supabase query, API key, RLS policies |
| ESP32 fails to POST | ESP32 / Network | WiFi connection; endpoint URL; API key header |
| Wrong plant loaded | ESP32 / Supabase | device_config plant_id; foreign key join |

### Fix Protocol

1. Reproduce the issue in isolation
2. Apply one fix at a time
3. Retest in isolation
4. Reintegrate and regression-test the full loop

---

## 11. COMMON MISTAKES — NEVER DO THESE

- ❌ Changing the database schema after Phase 2
- ❌ Hardcoding `moisture_min`/`moisture_max` in ESP32 firmware
- ❌ Attempting direct PWA → ESP32 communication
- ❌ Using a single threshold instead of min/max range logic
- ❌ Ignoring relay polarity (active-HIGH vs active-LOW)
- ❌ Allowing near-air sensor readings (≈4095) to trigger the pump
- ❌ Placing the service role key in frontend code
- ❌ Skipping staged testing between phases

---

## 12. SUCCESS CRITERIA

The system is considered **complete and successful** only when ALL of the following are true:

- ✅ Pump activates strictly based on plant-specific `moisture_min`/`moisture_max` — never a fixed threshold
- ✅ Overwatering is prevented (pump turns OFF when soil is WET)
- ✅ Near-air sensor reading (≈4095) never triggers the pump
- ✅ Dashboard reflects real-time sensor data with ≤15s latency
- ✅ UI writes to Supabase; ESP32 reads from Supabase — no direct communication
- ✅ Auto and manual modes work reliably without race conditions
- ✅ System operates correctly over continuous multi-day cycles
- ✅ All RLS policies enforced; no sensitive keys in frontend
- ✅ All phases completed and verified before sign-off

---

*Last updated: 2026-04-23 | Project: Smart Irrigation System | Stack: ESP32 + Supabase + Next.js PWA*
