# Smart Irrigation System — SoilIQ

Cloud-connected intelligent irrigation system using **ESP32 + Supabase + PWA**.

## 🏗️ Architecture
```
PWA (Vercel) → Supabase (DB + REST) → ESP32 → Sensor/Relay → Plant
```

## 📁 Project Structure
```
├── soiliq_ui.html          # PWA Frontend (Phase 3 — Live Supabase)
├── esp32_irrigation.ino    # ESP32 Firmware (Phase 4 — Cloud Connected)
├── supabase_schema.sql     # Database schema reference
└── docs/
    └── gemini.md           # Architecture & design rules
```

## 🚀 Setup

### Frontend (PWA)
- Hosted on Vercel — open `soiliq_ui.html` directly or visit the Vercel URL
- Connects live to Supabase (no build step required)

### ESP32 Firmware
1. Open `esp32_irrigation.ino` in Arduino IDE
2. Edit lines 23–24 with your WiFi credentials
3. Install library: **ArduinoJson** (Library Manager)
4. Board: **ESP32 Dev Module** → Upload

### Database
- Hosted on Supabase
- Tables: `plants` (50 species), `device_config`, `sensor_data`
- RLS enabled on all tables

## ⚡ Features
- Real-time soil moisture monitoring
- Plant-specific moisture ranges (50 plant profiles)
- Auto/Manual pump control
- Supabase Realtime updates (no page refresh needed)
- Safety guard: sensor disconnection detection (ADC ≥ 4000 → never pumps)
- Remote plant switching (ESP32 picks up changes within 30 seconds)

## 🛠️ Tech Stack
| Layer | Technology |
|---|---|
| Frontend | HTML, CSS, Vanilla JS |
| Backend/DB | Supabase (PostgreSQL + REST) |
| Hardware | ESP32, Capacitive Soil Sensor, Relay Module |
| Hosting | Vercel (Frontend) |

## 👨‍💻 Developed by
B.Tech Final Year Project — Smart Irrigation System
