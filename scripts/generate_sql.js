const fs = require('fs');
const seederCode = fs.readFileSync('./scripts/seed_150_plants.js', 'utf8');

function extractArray(varName) {
  const match = seederCode.match(new RegExp(`const ${varName} = \\[(\\s|\\S)*?\\];`));
  if (!match) return [];
  return eval(match[0].replace(`const ${varName} =`, ''));
}

const tropical = extractArray('tropicalPlants');
const bonsai = extractArray('bonsaiPlants');
const medicinal = extractArray('medicinalPlants');
const all = [...tropical, ...bonsai, ...medicinal];

let sql = `-- ============================================================
-- SOILIQ: 150 BOTANICAL SPECIMENS (50 TROPICAL, 50 BONSAI, 50 MEDICINAL)
-- Calibrated for ESP32 Capacitive Soil Moisture Sensor (0-4095 ADC)
-- Paste into Supabase SQL Editor and click Run
-- ============================================================

-- 1. Ensure category column exists
ALTER TABLE plants ADD COLUMN IF NOT EXISTS category TEXT;

-- 2. Insert or update all 150 specimens
`;

all.forEach(p => {
  const esc = s => (s || '').replace(/'/g, "''");
  sql += `INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('${esc(p.name)}', '${esc(p.scientific_name)}', '${p.category}', ${p.moisture_min}, ${p.moisture_max}, '${esc(p.description)}', '${esc(p.sunlight)}', '${esc(p.water_level)}', '${esc(p.fertilizer)}', '${esc(p.emoji)}', '${esc(p.watering_freq)}', '${esc(p.overwatering_issue)}', '${esc(p.solution)}', '${esc(p.ph_need)}')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = '${esc(p.scientific_name)}',
  category = '${p.category}',
  moisture_min = ${p.moisture_min},
  moisture_max = ${p.moisture_max},
  description = '${esc(p.description)}',
  sunlight = '${esc(p.sunlight)}',
  water_level = '${esc(p.water_level)}',
  fertilizer = '${esc(p.fertilizer)}',
  emoji = '${esc(p.emoji)}',
  watering_freq = '${esc(p.watering_freq)}',
  overwatering_issue = '${esc(p.overwatering_issue)}',
  solution = '${esc(p.solution)}',
  ph_need = '${esc(p.ph_need)}'
WHERE name = '${esc(p.name)}';

`;
});

fs.writeFileSync('supabase_150_plants.sql', sql, 'utf8');
console.log(`Generated supabase_150_plants.sql for all ${all.length} plants.`);
