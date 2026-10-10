-- ============================================================
-- SOILIQ: 150 BOTANICAL SPECIMENS (50 TROPICAL, 50 BONSAI, 50 MEDICINAL)
-- Calibrated for ESP32 Capacitive Soil Moisture Sensor (0-4095 ADC)
-- Paste into Supabase SQL Editor and click Run
-- ============================================================

-- 1. Ensure category column exists
ALTER TABLE plants ADD COLUMN IF NOT EXISTS category TEXT;

-- 2. Insert or update all 150 specimens
INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Monstera Deliciosa', 'Monstera deliciosa', 'tropical', 1100, 2100, 'Iconic jungle climber with broad fenestrated leaves. Thrives in humid understory conditions with chunky, aerated soil.', 'medium', 'Medium', 'Balanced NPK 20-20-20 half strength monthly during active growth', '🌿', 'Every 7–10 days', 'Root rot, blackened leaf margins, yellowing lower foliage', 'Allow top 2–3 inches to dry; repot into chunky aroid bark mix', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Monstera deliciosa',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Iconic jungle climber with broad fenestrated leaves. Thrives in humid understory conditions with chunky, aerated soil.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced NPK 20-20-20 half strength monthly during active growth',
  emoji = '🌿',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Root rot, blackened leaf margins, yellowing lower foliage',
  solution = 'Allow top 2–3 inches to dry; repot into chunky aroid bark mix',
  ph_need = '5.5–6.5'
WHERE name = 'Monstera Deliciosa';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Fiddle Leaf Fig', 'Ficus lyrata', 'tropical', 1200, 2200, 'West African lowland tree known for dramatic violin-shaped leaves. Sensitive to overwatering and low ambient humidity.', 'high', 'Medium', 'High-nitrogen NPK 3-1-2 liquid fertilizer biweekly in spring/summer', '🪴', 'Every 7–10 days', 'Edema (brown cellular blisters), leaf drop, root rot', 'Drain drip tray immediately; water only when upper half of pot is dry', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus lyrata',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'West African lowland tree known for dramatic violin-shaped leaves. Sensitive to overwatering and low ambient humidity.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'High-nitrogen NPK 3-1-2 liquid fertilizer biweekly in spring/summer',
  emoji = '🪴',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Edema (brown cellular blisters), leaf drop, root rot',
  solution = 'Drain drip tray immediately; water only when upper half of pot is dry',
  ph_need = '6.0–7.0'
WHERE name = 'Fiddle Leaf Fig';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Bird of Paradise', 'Strelitzia reginae', 'tropical', 1000, 2000, 'South African perennial boasting architectural paddle-like leaves and crane-like vibrant blooms. Demands copious light and consistent moisture.', 'high', 'High', 'Balanced slow-release NPK 14-14-14 every 3 months', '🦜', 'Every 5–7 days', 'Crown rot, split leaves, musty anaerobic root zone', 'Ensure unrestricted drainage holes and bright sunlight exposure', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Strelitzia reginae',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 2000,
  description = 'South African perennial boasting architectural paddle-like leaves and crane-like vibrant blooms. Demands copious light and consistent moisture.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Balanced slow-release NPK 14-14-14 every 3 months',
  emoji = '🦜',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Crown rot, split leaves, musty anaerobic root zone',
  solution = 'Ensure unrestricted drainage holes and bright sunlight exposure',
  ph_need = '5.5–6.5'
WHERE name = 'Bird of Paradise';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Calathea Orbifolia', 'Goeppertia orbifolia', 'tropical', 1000, 1800, 'Bolivian prayer plant with oversized metallic silver-striped foliage. Requires uniformly damp potting mix and high relative humidity.', 'medium', 'High', 'Gentle organic seaweed/fish extract diluted monthly', '🍃', 'Every 4–6 days', 'Stem collapse, fungus gnats, leaf spot diseases', 'Use distilled water; keep soil consistently moist but never soggy', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Goeppertia orbifolia',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Bolivian prayer plant with oversized metallic silver-striped foliage. Requires uniformly damp potting mix and high relative humidity.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Gentle organic seaweed/fish extract diluted monthly',
  emoji = '🍃',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Stem collapse, fungus gnats, leaf spot diseases',
  solution = 'Use distilled water; keep soil consistently moist but never soggy',
  ph_need = '6.0–6.5'
WHERE name = 'Calathea Orbifolia';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Anthurium', 'Anthurium andraeanum', 'tropical', 1100, 2000, 'Neotropical epiphyte prized for glossy heart-shaped spathes. Demands an airy epiphytic root medium with high airflow.', 'medium', 'Medium', 'High-phosphorus NPK 10-20-10 diluted quarter strength monthly', '🌺', 'Every 5–7 days', 'Rhizome rot, yellow tips with dark chlorotic halos', 'Plant in orchid bark/perlite/peat mix; ensure quick draining', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Anthurium andraeanum',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Neotropical epiphyte prized for glossy heart-shaped spathes. Demands an airy epiphytic root medium with high airflow.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'High-phosphorus NPK 10-20-10 diluted quarter strength monthly',
  emoji = '🌺',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Rhizome rot, yellow tips with dark chlorotic halos',
  solution = 'Plant in orchid bark/perlite/peat mix; ensure quick draining',
  ph_need = '5.5–6.5'
WHERE name = 'Anthurium';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Alocasia Polly', 'Alocasia amazonica', 'tropical', 1100, 1900, 'Amazonian elephant ear with arrowhead leaves and contrasting white veins. Highly susceptible to rhizome saturation dormancy.', 'medium', 'Medium', 'Liquid aroid fertilizer NPK 20-20-20 half strength every 3 weeks', '🌱', 'Every 5–8 days', 'Tuber rot, rapid yellowing of lowest petioles', 'Withhold water until top 2 inches dry; inspect corm for softness', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Alocasia amazonica',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 1900,
  description = 'Amazonian elephant ear with arrowhead leaves and contrasting white veins. Highly susceptible to rhizome saturation dormancy.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Liquid aroid fertilizer NPK 20-20-20 half strength every 3 weeks',
  emoji = '🌱',
  watering_freq = 'Every 5–8 days',
  overwatering_issue = 'Tuber rot, rapid yellowing of lowest petioles',
  solution = 'Withhold water until top 2 inches dry; inspect corm for softness',
  ph_need = '5.5–6.5'
WHERE name = 'Alocasia Polly';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Golden Pothos', 'Epipremnum aureum', 'tropical', 1300, 2400, 'Hardy Solomon Islands vine with variegated heart foliage. Tolerates dry periods and low light with exceptional vigor.', 'medium', 'Medium', 'General foliage NPK 10-10-10 once every 6 weeks', '🌿', 'Every 7–10 days', 'Stem browning at soil level, limp translucent foliage', 'Let soil dry down to 50% depth between waterings', '6.0–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Epipremnum aureum',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2400,
  description = 'Hardy Solomon Islands vine with variegated heart foliage. Tolerates dry periods and low light with exceptional vigor.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'General foliage NPK 10-10-10 once every 6 weeks',
  emoji = '🌿',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Stem browning at soil level, limp translucent foliage',
  solution = 'Let soil dry down to 50% depth between waterings',
  ph_need = '6.0–6.8'
WHERE name = 'Golden Pothos';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Philodendron Pink Princess', 'Philodendron erubescens', 'tropical', 1100, 2000, 'Sought-after climbing aroid featuring dark burgundy foliage with bubblegum pink variegation. Needs support and moist roots.', 'medium', 'Medium', 'Liquid balanced NPK 20-20-20 half strength monthly', '🌸', 'Every 6–8 days', 'Leaf melting, root loss, variegation browning', 'Provide moss pole and Chunky aroid substrate with pumice', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Philodendron erubescens',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Sought-after climbing aroid featuring dark burgundy foliage with bubblegum pink variegation. Needs support and moist roots.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Liquid balanced NPK 20-20-20 half strength monthly',
  emoji = '🌸',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Leaf melting, root loss, variegation browning',
  solution = 'Provide moss pole and Chunky aroid substrate with pumice',
  ph_need = '5.5–6.5'
WHERE name = 'Philodendron Pink Princess';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Rubber Tree', 'Ficus elastica', 'tropical', 1300, 2300, 'Southeast Asian banyan tree with thick leathery burgundy-green leaves. Demands bright light and moderate watering cycles.', 'high', 'Medium', 'Balanced houseplant NPK 3-1-2 monthly during spring and summer', '🪴', 'Every 7–12 days', 'Lower leaf drop, yellowing without wilting', 'Allow top 50% of rootball to dry before adding water', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus elastica',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Southeast Asian banyan tree with thick leathery burgundy-green leaves. Demands bright light and moderate watering cycles.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced houseplant NPK 3-1-2 monthly during spring and summer',
  emoji = '🪴',
  watering_freq = 'Every 7–12 days',
  overwatering_issue = 'Lower leaf drop, yellowing without wilting',
  solution = 'Allow top 50% of rootball to dry before adding water',
  ph_need = '6.0–7.0'
WHERE name = 'Rubber Tree';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Areca Palm', 'Dypsis lutescens', 'tropical', 1000, 1900, 'Clumping Madagascar palm with graceful arching feathery fronds. Acts as an excellent natural indoor air humidifier.', 'high', 'High', 'Palm-specific fertilizer NPK 8-2-12 with micronutrients quarterly', '🌴', 'Every 5–7 days', 'Frond tip necrosis, basal rot, frond yellowing', 'Ensure coarse sand drainage and empty saucer beneath pot', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Dypsis lutescens',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Clumping Madagascar palm with graceful arching feathery fronds. Acts as an excellent natural indoor air humidifier.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Palm-specific fertilizer NPK 8-2-12 with micronutrients quarterly',
  emoji = '🌴',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Frond tip necrosis, basal rot, frond yellowing',
  solution = 'Ensure coarse sand drainage and empty saucer beneath pot',
  ph_need = '6.0–6.5'
WHERE name = 'Areca Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Kentia Palm', 'Howea forsteriana', 'tropical', 1200, 2100, 'Lord Howe Island palm renowned for elegant slow-growing fronds and remarkable tolerance of indoor shade.', 'medium', 'Medium', 'Slow-release palm fertilizer with magnesium twice a year', '🌴', 'Every 7–10 days', 'Root rot, orange-brown blotches on lower leaflets', 'Water only when soil feels dry down 2 inches; avoid waterlogging', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Howea forsteriana',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Lord Howe Island palm renowned for elegant slow-growing fronds and remarkable tolerance of indoor shade.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Slow-release palm fertilizer with magnesium twice a year',
  emoji = '🌴',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Root rot, orange-brown blotches on lower leaflets',
  solution = 'Water only when soil feels dry down 2 inches; avoid waterlogging',
  ph_need = '6.0–7.0'
WHERE name = 'Kentia Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Peace Lily', 'Spathiphyllum wallisii', 'tropical', 900, 1800, 'Central American floor plant with deep emerald leaves and white spathiphyllum flowers. Dramatic wilter when thirsty.', 'low', 'High', 'Diluted balanced NPK 20-20-20 bi-monthly in summer', '🤍', 'Every 4–6 days', 'Black leaf tips, soggy base, bacterial soft rot', 'Maintain constant mild moisture without standing pooling water', '5.8–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Spathiphyllum wallisii',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1800,
  description = 'Central American floor plant with deep emerald leaves and white spathiphyllum flowers. Dramatic wilter when thirsty.',
  sunlight = 'low',
  water_level = 'High',
  fertilizer = 'Diluted balanced NPK 20-20-20 bi-monthly in summer',
  emoji = '🤍',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Black leaf tips, soggy base, bacterial soft rot',
  solution = 'Maintain constant mild moisture without standing pooling water',
  ph_need = '5.8–6.5'
WHERE name = 'Peace Lily';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Red Aglaonema', 'Aglaonema commutatum', 'tropical', 1200, 2200, 'Vibrant Chinese evergreen cultivar with vivid pink-red leaf margins. Extremely tolerant of varied humidity levels.', 'medium', 'Medium', 'Standard liquid plant food diluted quarter strength monthly', '🍂', 'Every 7–10 days', 'Stem mushiness at base, yellowing leaf petioles', 'Allow top 2 inches to dry completely between waterings', '5.6–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Aglaonema commutatum',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Vibrant Chinese evergreen cultivar with vivid pink-red leaf margins. Extremely tolerant of varied humidity levels.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Standard liquid plant food diluted quarter strength monthly',
  emoji = '🍂',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Stem mushiness at base, yellowing leaf petioles',
  solution = 'Allow top 2 inches to dry completely between waterings',
  ph_need = '5.6–6.5'
WHERE name = 'Red Aglaonema';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Swiss Cheese Vine', 'Monstera adansonii', 'tropical', 1100, 2000, 'Fast-growing vining aroid with oval leaves perforated with dozens of natural holes. Loves climbing or cascading.', 'medium', 'Medium', 'Balanced NPK 10-10-10 water-soluble fertilizer every 3 weeks', '🌿', 'Every 5–7 days', 'Yellowing fenestrations, root rot, fungal leaf blight', 'Grow in chunky coco coir/perlite; let top 1.5 inches dry', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Monstera adansonii',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Fast-growing vining aroid with oval leaves perforated with dozens of natural holes. Loves climbing or cascading.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced NPK 10-10-10 water-soluble fertilizer every 3 weeks',
  emoji = '🌿',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Yellowing fenestrations, root rot, fungal leaf blight',
  solution = 'Grow in chunky coco coir/perlite; let top 1.5 inches dry',
  ph_need = '5.5–6.5'
WHERE name = 'Swiss Cheese Vine';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Zebra Plant', 'Aphelandra squarrosa', 'tropical', 1000, 1800, 'Brazilian Atlantic Forest understory shrub with deep green striped leaves and golden flower bracts.', 'medium', 'High', 'High-phosphorus water-soluble fertilizer every 2 weeks during bloom', '🦓', 'Every 4–5 days', 'Crown rot, leaf droop with wet soil, stem browning', 'Keep moist using warm room-temp water; provide 60%+ humidity', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Aphelandra squarrosa',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Brazilian Atlantic Forest understory shrub with deep green striped leaves and golden flower bracts.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'High-phosphorus water-soluble fertilizer every 2 weeks during bloom',
  emoji = '🦓',
  watering_freq = 'Every 4–5 days',
  overwatering_issue = 'Crown rot, leaf droop with wet soil, stem browning',
  solution = 'Keep moist using warm room-temp water; provide 60%+ humidity',
  ph_need = '5.5–6.5'
WHERE name = 'Zebra Plant';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dieffenbachia', 'Dieffenbachia seguine', 'tropical', 1200, 2200, 'Dumb cane with broad marbled cream-and-emerald foliage. Rapid grower in humid tropical conditions.', 'medium', 'Medium', 'Balanced liquid fertilizer NPK 20-20-20 monthly', '🪴', 'Every 6–8 days', 'Soft cane rot, yellowing outer leaves, root loss', 'Allow top 2 inches to dry; use aerated potting soil with perlite', '6.1–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Dieffenbachia seguine',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Dumb cane with broad marbled cream-and-emerald foliage. Rapid grower in humid tropical conditions.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced liquid fertilizer NPK 20-20-20 monthly',
  emoji = '🪴',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Soft cane rot, yellowing outer leaves, root loss',
  solution = 'Allow top 2 inches to dry; use aerated potting soil with perlite',
  ph_need = '6.1–6.8'
WHERE name = 'Dieffenbachia';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Calathea Medallion', 'Goeppertia veitchiana', 'tropical', 1000, 1800, 'Large round patterned leaves resembling intricate stained glass medallions with deep purple undersides.', 'medium', 'High', 'Half-strength nitrogen-rich organic foliar spray monthly', '🏵️', 'Every 4–6 days', 'Brown crisped leaf halos caused by root asphyxiation', 'Use rain/distilled water; maintain consistent gentle moisture', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Goeppertia veitchiana',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Large round patterned leaves resembling intricate stained glass medallions with deep purple undersides.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Half-strength nitrogen-rich organic foliar spray monthly',
  emoji = '🏵️',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Brown crisped leaf halos caused by root asphyxiation',
  solution = 'Use rain/distilled water; maintain consistent gentle moisture',
  ph_need = '6.0–6.5'
WHERE name = 'Calathea Medallion';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Stromanthe Triostar', 'Stromanthe thalia', 'tropical', 1000, 1900, 'Brazilian prayer plant relative sporting stunning splashes of pastel green, cream, and magenta pink.', 'medium', 'High', 'Gentle balanced houseplant fertilizer diluted quarter strength monthly', '🌸', 'Every 5–7 days', 'Rotting rhizomes, limp leaves that fail to pray upright', 'Ensure high humidity and well-draining peat-perlite potting mix', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Stromanthe thalia',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Brazilian prayer plant relative sporting stunning splashes of pastel green, cream, and magenta pink.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Gentle balanced houseplant fertilizer diluted quarter strength monthly',
  emoji = '🌸',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Rotting rhizomes, limp leaves that fail to pray upright',
  solution = 'Ensure high humidity and well-draining peat-perlite potting mix',
  ph_need = '6.0–6.5'
WHERE name = 'Stromanthe Triostar';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Philodendron Birkin', 'Philodendron cordatum cv.', 'tropical', 1200, 2100, 'Compact self-heading aroid exhibiting crisp white pinstripes across glossy dark green cordate leaves.', 'medium', 'Medium', 'Standard balanced NPK 10-10-10 monthly in spring and summer', '🌱', 'Every 7–10 days', 'Bacterial leaf spot, soft brown wet patches on foliage', 'Water soil base directly; let top 2 inches dry between cycles', '5.8–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Philodendron cordatum cv.',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Compact self-heading aroid exhibiting crisp white pinstripes across glossy dark green cordate leaves.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Standard balanced NPK 10-10-10 monthly in spring and summer',
  emoji = '🌱',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Bacterial leaf spot, soft brown wet patches on foliage',
  solution = 'Water soil base directly; let top 2 inches dry between cycles',
  ph_need = '5.8–6.5'
WHERE name = 'Philodendron Birkin';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Alocasia Zebrina', 'Alocasia zebrina', 'tropical', 1100, 1900, 'Filipino rainforest treasure celebrated for distinctive zebra-striped leopard petioles and sculptural arrowhead leaves.', 'medium', 'Medium', 'Liquid micro-nutrient fertilizer every 3 weeks in summer', '🦓', 'Every 6–8 days', 'Petioles collapse under weight due to basal stem softness', 'Plant in chunky bark mix; water thoroughly then drain completely', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Alocasia zebrina',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 1900,
  description = 'Filipino rainforest treasure celebrated for distinctive zebra-striped leopard petioles and sculptural arrowhead leaves.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Liquid micro-nutrient fertilizer every 3 weeks in summer',
  emoji = '🦓',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Petioles collapse under weight due to basal stem softness',
  solution = 'Plant in chunky bark mix; water thoroughly then drain completely',
  ph_need = '5.5–6.5'
WHERE name = 'Alocasia Zebrina';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Boston Fern', 'Nephrolepis exaltata', 'tropical', 900, 1700, 'Lush sword fern with graceful drooping fronds. Native to humid swamp forests and tropical hammocks.', 'medium', 'High', 'Liquid houseplant fertilizer diluted to half strength monthly', '🌿', 'Every 3–5 days', 'Frond yellowing, sour soil smell, gray mold in crown', 'Never let soil dry out completely, but ensure drainage holes flow freely', '5.0–5.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Nephrolepis exaltata',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Lush sword fern with graceful drooping fronds. Native to humid swamp forests and tropical hammocks.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Liquid houseplant fertilizer diluted to half strength monthly',
  emoji = '🌿',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Frond yellowing, sour soil smell, gray mold in crown',
  solution = 'Never let soil dry out completely, but ensure drainage holes flow freely',
  ph_need = '5.0–5.5'
WHERE name = 'Boston Fern';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Staghorn Fern', 'Platycerium bifurcatum', 'tropical', 1200, 2200, 'Epiphytic fern featuring fertile antler-like fronds and basal shield fronds that clasp tree bark.', 'medium', 'Medium', 'Diluted fish emulsion or 1:1 balanced fertilizer sprayed bi-monthly', '🦌', 'Soak every 7–10 days', 'Basal shield frond blackening and rot', 'Mount on cedar board with sphagnum moss; allow moss to dry moderately', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Platycerium bifurcatum',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Epiphytic fern featuring fertile antler-like fronds and basal shield fronds that clasp tree bark.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Diluted fish emulsion or 1:1 balanced fertilizer sprayed bi-monthly',
  emoji = '🦌',
  watering_freq = 'Soak every 7–10 days',
  overwatering_issue = 'Basal shield frond blackening and rot',
  solution = 'Mount on cedar board with sphagnum moss; allow moss to dry moderately',
  ph_need = '5.5–6.5'
WHERE name = 'Staghorn Fern';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Maidenhair Fern', 'Adiantum raddianum', 'tropical', 900, 1600, 'Delicate fern with wiry black stems and fan-shaped leaflets. Highly sensitive to even temporary soil desiccation.', 'medium', 'High', 'Weak liquid fertilizer once a month in spring/summer only', '🌱', 'Every 2–4 days', 'Fungal damping-off at root crown if air circulation is poor', 'Maintain constant moisture using self-watering wicks and pebble trays', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Adiantum raddianum',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1600,
  description = 'Delicate fern with wiry black stems and fan-shaped leaflets. Highly sensitive to even temporary soil desiccation.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Weak liquid fertilizer once a month in spring/summer only',
  emoji = '🌱',
  watering_freq = 'Every 2–4 days',
  overwatering_issue = 'Fungal damping-off at root crown if air circulation is poor',
  solution = 'Maintain constant moisture using self-watering wicks and pebble trays',
  ph_need = '6.0–7.0'
WHERE name = 'Maidenhair Fern';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Bird''s Nest Fern', 'Asplenium nidus', 'tropical', 1000, 1800, 'Epiphytic tropical fern with undivided wavy apple-green fronds radiating from a central rosette nest.', 'medium', 'High', 'Half-strength balanced NPK 20-20-20 monthly in warm months', '🪺', 'Every 5–7 days', 'Central crown rot if water is poured into center rosette', 'Water only the surrounding soil perimeter, never into the central cup', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Asplenium nidus',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Epiphytic tropical fern with undivided wavy apple-green fronds radiating from a central rosette nest.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Half-strength balanced NPK 20-20-20 monthly in warm months',
  emoji = '🪺',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Central crown rot if water is poured into center rosette',
  solution = 'Water only the surrounding soil perimeter, never into the central cup',
  ph_need = '5.5–6.5'
WHERE name = 'Bird''s Nest Fern';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Croton', 'Codiaeum variegatum', 'tropical', 1100, 2000, 'Indonesian shrub exhibiting intense kaleidoscope patterns of yellow, orange, scarlet, and purple leaves.', 'high', 'Medium', 'Slow-release NPK 8-2-10 every 2 months in spring and summer', '🍁', 'Every 5–7 days', 'Edema, sudden shedding of lower colored leaves', 'Provide 6+ hours bright light; water when top inch of soil is dry', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Codiaeum variegatum',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Indonesian shrub exhibiting intense kaleidoscope patterns of yellow, orange, scarlet, and purple leaves.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Slow-release NPK 8-2-10 every 2 months in spring and summer',
  emoji = '🍁',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Edema, sudden shedding of lower colored leaves',
  solution = 'Provide 6+ hours bright light; water when top inch of soil is dry',
  ph_need = '6.0–6.5'
WHERE name = 'Croton';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Cordyline', 'Cordyline fruticosa', 'tropical', 1100, 2000, 'Hawaiian Ti plant with broad hot pink, magenta, and dark bronze lance-shaped tropical foliage.', 'high', 'Medium', 'Balanced liquid fertilizer NPK 10-10-10 monthly', '🌾', 'Every 5–8 days', 'Fluoride sensitivity and tip necrosis exacerbated by soggy soil', 'Use filtered water; maintain moist but loose, porous substrate', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cordyline fruticosa',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Hawaiian Ti plant with broad hot pink, magenta, and dark bronze lance-shaped tropical foliage.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced liquid fertilizer NPK 10-10-10 monthly',
  emoji = '🌾',
  watering_freq = 'Every 5–8 days',
  overwatering_issue = 'Fluoride sensitivity and tip necrosis exacerbated by soggy soil',
  solution = 'Use filtered water; maintain moist but loose, porous substrate',
  ph_need = '6.0–6.5'
WHERE name = 'Cordyline';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Bromeliad Guzmania', 'Guzmania lingulata', 'tropical', 1300, 2300, 'Central American epiphyte sporting shiny green strap foliage and a brilliant long-lasting scarlet flower bract.', 'medium', 'Medium', 'Foliar fertilizer spray at 1/4 strength applied to cup every 6 weeks', '🏵️', 'Every 7–10 days', 'Stagnant water rot in central urn, root zone rot', 'Flush central cup with fresh rainwater weekly; keep soil barely damp', '5.5–6.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Guzmania lingulata',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Central American epiphyte sporting shiny green strap foliage and a brilliant long-lasting scarlet flower bract.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Foliar fertilizer spray at 1/4 strength applied to cup every 6 weeks',
  emoji = '🏵️',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Stagnant water rot in central urn, root zone rot',
  solution = 'Flush central cup with fresh rainwater weekly; keep soil barely damp',
  ph_need = '5.5–6.0'
WHERE name = 'Bromeliad Guzmania';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Neoregelia Bromeliad', 'Neoregelia carolinae', 'tropical', 1300, 2300, 'Blushing bromeliad with spreading rosettes that turn electric crimson in the center prior to blooming.', 'high', 'Medium', 'Very dilute slow-release granules around base once per season', '🌺', 'Every 7–10 days', 'Algal growth in tank, rotting outer strap leaves', 'Empty and refill central reservoir weekly; avoid heavy wet soil', '5.5–6.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Neoregelia carolinae',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Blushing bromeliad with spreading rosettes that turn electric crimson in the center prior to blooming.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Very dilute slow-release granules around base once per season',
  emoji = '🌺',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Algal growth in tank, rotting outer strap leaves',
  solution = 'Empty and refill central reservoir weekly; avoid heavy wet soil',
  ph_need = '5.5–6.0'
WHERE name = 'Neoregelia Bromeliad';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Heliconia', 'Heliconia psittacorum', 'tropical', 900, 1700, 'Parrot''s beak flower with upright banana-like foliage and claw-shaped vivid orange and yellow floral bracts.', 'high', 'High', 'Heavy feeder: slow-release NPK 12-4-8 every 6 weeks', '🦜', 'Every 3–5 days', 'Rhizome rot in heavy compact soils with poor aeration', 'Grow in rich, well-aerated organic soil with deep regular hydration', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Heliconia psittacorum',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Parrot''s beak flower with upright banana-like foliage and claw-shaped vivid orange and yellow floral bracts.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Heavy feeder: slow-release NPK 12-4-8 every 6 weeks',
  emoji = '🦜',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Rhizome rot in heavy compact soils with poor aeration',
  solution = 'Grow in rich, well-aerated organic soil with deep regular hydration',
  ph_need = '5.5–6.5'
WHERE name = 'Heliconia';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Canna Lily', 'Canna indica', 'tropical', 900, 1700, 'Vigorous tropical rhizome with paddle leaves and fiery blossoms. Thrives in boggy margins and heat.', 'high', 'High', 'Balanced organic compost plus high-potassium fertilizer monthly', '🌷', 'Every 3–5 days', 'Rarely overwatered in warm sun, but winter cold causes rhizome rot', 'Ensure maximum sunlight; reduce watering during cold dormancy', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Canna indica',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Vigorous tropical rhizome with paddle leaves and fiery blossoms. Thrives in boggy margins and heat.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Balanced organic compost plus high-potassium fertilizer monthly',
  emoji = '🌷',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Rarely overwatered in warm sun, but winter cold causes rhizome rot',
  solution = 'Ensure maximum sunlight; reduce watering during cold dormancy',
  ph_need = '6.0–7.5'
WHERE name = 'Canna Lily';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Chinese Fan Palm', 'Livistona chinensis', 'tropical', 1200, 2200, 'Hardy tropical palm with dramatic fan-like fronds ending in weeping ribbon tips. Adapts well to containers.', 'high', 'Medium', 'Palm food with chelated iron and manganese every 3 months', '🌴', 'Every 7–10 days', 'Frond tip browning, root suffocating in standing saucer water', 'Water deeply when upper 2 inches dry, drain excess runoff', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Livistona chinensis',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Hardy tropical palm with dramatic fan-like fronds ending in weeping ribbon tips. Adapts well to containers.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Palm food with chelated iron and manganese every 3 months',
  emoji = '🌴',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Frond tip browning, root suffocating in standing saucer water',
  solution = 'Water deeply when upper 2 inches dry, drain excess runoff',
  ph_need = '6.0–7.0'
WHERE name = 'Chinese Fan Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Parlor Palm', 'Chamaedorea elegans', 'tropical', 1200, 2200, 'Compact Mexican rainforest palm with delicate pinnate fronds. Tolerates dimmer indoor lighting conditions.', 'low', 'Medium', 'Light liquid houseplant fertilizer NPK 10-10-10 every 2 months', '🌴', 'Every 7–10 days', 'Yellowing stems, brown frond tips, root decay', 'Allow top inch of potting soil to dry before adding water', '6.0–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Chamaedorea elegans',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Compact Mexican rainforest palm with delicate pinnate fronds. Tolerates dimmer indoor lighting conditions.',
  sunlight = 'low',
  water_level = 'Medium',
  fertilizer = 'Light liquid houseplant fertilizer NPK 10-10-10 every 2 months',
  emoji = '🌴',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Yellowing stems, brown frond tips, root decay',
  solution = 'Allow top inch of potting soil to dry before adding water',
  ph_need = '6.0–6.8'
WHERE name = 'Parlor Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Majesty Palm', 'Ravenea rivularis', 'tropical', 1000, 1800, 'Madagascan riverbank palm requiring abundant moisture, high humidity, and consistent bright light.', 'high', 'High', 'Epsom salts (magnesium) plus palm fertilizer monthly in summer', '🌴', 'Every 4–6 days', 'Frond bleaching and fungal rust if soil stagnates cold', 'Keep soil evenly moist like a wrung-out sponge; never bone dry', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ravenea rivularis',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Madagascan riverbank palm requiring abundant moisture, high humidity, and consistent bright light.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Epsom salts (magnesium) plus palm fertilizer monthly in summer',
  emoji = '🌴',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Frond bleaching and fungal rust if soil stagnates cold',
  solution = 'Keep soil evenly moist like a wrung-out sponge; never bone dry',
  ph_need = '5.5–6.5'
WHERE name = 'Majesty Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ponytail Palm', 'Beaucarnea recurvata', 'tropical', 1800, 3000, 'Mexican succulent tree featuring a swollen bulbous caudex that stores water for months beneath cascading leaves.', 'high', 'Low', 'Cactus and succulent fertilizer NPK 2-7-7 once in spring', '🪵', 'Every 14–21 days', 'Soft squishy caudex trunk base, lethal root rot', 'Let soil completely dry throughout before watering; use gritty mix', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Beaucarnea recurvata',
  category = 'tropical',
  moisture_min = 1800,
  moisture_max = 3000,
  description = 'Mexican succulent tree featuring a swollen bulbous caudex that stores water for months beneath cascading leaves.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Cactus and succulent fertilizer NPK 2-7-7 once in spring',
  emoji = '🪵',
  watering_freq = 'Every 14–21 days',
  overwatering_issue = 'Soft squishy caudex trunk base, lethal root rot',
  solution = 'Let soil completely dry throughout before watering; use gritty mix',
  ph_need = '6.5–7.5'
WHERE name = 'Ponytail Palm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dragon Tree', 'Dracaena marginata', 'tropical', 1400, 2500, 'Architectural Madagascar native with slender ribbon leaves edged in crimson atop woody curving stems.', 'medium', 'Low', 'Half-strength balanced liquid plant food every 6 weeks', '🎋', 'Every 10–14 days', 'Soft canes, droopy yellow leaves, black mushy roots', 'Allow top 50–75% of soil to dry before watering again', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Dracaena marginata',
  category = 'tropical',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Architectural Madagascar native with slender ribbon leaves edged in crimson atop woody curving stems.',
  sunlight = 'medium',
  water_level = 'Low',
  fertilizer = 'Half-strength balanced liquid plant food every 6 weeks',
  emoji = '🎋',
  watering_freq = 'Every 10–14 days',
  overwatering_issue = 'Soft canes, droopy yellow leaves, black mushy roots',
  solution = 'Allow top 50–75% of soil to dry before watering again',
  ph_need = '6.0–7.0'
WHERE name = 'Dragon Tree';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dracaena Fragrans', 'Dracaena fragrans', 'tropical', 1300, 2300, 'Corn plant with wide arching yellow-striped leaves. Extremely resilient indoor companion plant.', 'medium', 'Medium', 'General indoor plant fertilizer diluted to half strength monthly', '🌽', 'Every 7–10 days', 'Crown collapse, spongy cane base, brown leaf tips', 'Ensure pot drains thoroughly; wait until top 2 inches dry', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Dracaena fragrans',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Corn plant with wide arching yellow-striped leaves. Extremely resilient indoor companion plant.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'General indoor plant fertilizer diluted to half strength monthly',
  emoji = '🌽',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Crown collapse, spongy cane base, brown leaf tips',
  solution = 'Ensure pot drains thoroughly; wait until top 2 inches dry',
  ph_need = '6.0–6.5'
WHERE name = 'Dracaena Fragrans';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Philodendron Gloriosum', 'Philodendron gloriosum', 'tropical', 1100, 2000, 'Crawling terrestrial aroid with velvety cordate leaves and striking white veins that creep along the soil.', 'medium', 'Medium', 'Slow-release organic pellets plus fish emulsion monthly', '💚', 'Every 6–8 days', 'Crawling rhizome rot if buried too deeply in wet mud', 'Keep top half of rhizome exposed above airy chunky aroid mix', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Philodendron gloriosum',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Crawling terrestrial aroid with velvety cordate leaves and striking white veins that creep along the soil.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Slow-release organic pellets plus fish emulsion monthly',
  emoji = '💚',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Crawling rhizome rot if buried too deeply in wet mud',
  solution = 'Keep top half of rhizome exposed above airy chunky aroid mix',
  ph_need = '5.5–6.5'
WHERE name = 'Philodendron Gloriosum';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Anthurium Clarinervium', 'Anthurium clarinervium', 'tropical', 1200, 2100, 'Mexican lithophytic aroid with thick cardboard-textured velvety leaves etched with bright white veins.', 'medium', 'Medium', 'Low-salt gentle orchid fertilizer NPK 20-10-20 monthly', '🤍', 'Every 6–9 days', 'Root rot in dense potting soil; yellow spots on dark velvet', 'Pot in chunky mix of orchid bark, perlite, and charcoal', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Anthurium clarinervium',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Mexican lithophytic aroid with thick cardboard-textured velvety leaves etched with bright white veins.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Low-salt gentle orchid fertilizer NPK 20-10-20 monthly',
  emoji = '🤍',
  watering_freq = 'Every 6–9 days',
  overwatering_issue = 'Root rot in dense potting soil; yellow spots on dark velvet',
  solution = 'Pot in chunky mix of orchid bark, perlite, and charcoal',
  ph_need = '6.0–6.5'
WHERE name = 'Anthurium Clarinervium';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Syngonium Neon Robusta', 'Syngonium podophyllum', 'tropical', 1100, 2000, 'Arrowhead vine cultivar with pastel dusty-pink arrow leaves. Climbs vigorously on trellises.', 'medium', 'Medium', 'Balanced liquid fertilizer NPK 20-20-20 every 4 weeks', '🎀', 'Every 6–8 days', 'Translucent watery lower foliage, fungus gnats', 'Let top inch of soil dry; provide good ambient airflow', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Syngonium podophyllum',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Arrowhead vine cultivar with pastel dusty-pink arrow leaves. Climbs vigorously on trellises.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced liquid fertilizer NPK 20-20-20 every 4 weeks',
  emoji = '🎀',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Translucent watery lower foliage, fungus gnats',
  solution = 'Let top inch of soil dry; provide good ambient airflow',
  ph_need = '5.5–6.5'
WHERE name = 'Syngonium Neon Robusta';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Schefflera Umbrella Tree', 'Schefflera arboricola', 'tropical', 1200, 2200, 'Dwarf umbrella tree with wheel-spoke leaflets. Highly adaptable and readily pruned into tree forms.', 'high', 'Medium', 'Standard liquid houseplant food bi-weekly in spring and summer', '☂️', 'Every 7–10 days', 'Sudden massive green leaf drop, black leaf attachment joints', 'Let top 2 inches dry out; check that bottom holes are not clogged', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Schefflera arboricola',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Dwarf umbrella tree with wheel-spoke leaflets. Highly adaptable and readily pruned into tree forms.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Standard liquid houseplant food bi-weekly in spring and summer',
  emoji = '☂️',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Sudden massive green leaf drop, black leaf attachment joints',
  solution = 'Let top 2 inches dry out; check that bottom holes are not clogged',
  ph_need = '6.0–6.5'
WHERE name = 'Schefflera Umbrella Tree';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ti Plant', 'Cordyline terminalis', 'tropical', 1100, 2000, 'Polynesian sacred plant displaying radiant tropical leaves from deep purple to neon magenta.', 'high', 'Medium', 'Controlled-release NPK 14-14-14 granules applied in spring', '🌺', 'Every 5–8 days', 'Root necrosis, bacterial leaf streak in overly damp air', 'Water thoroughly, drain saucer, avoid mineral-heavy tap water', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cordyline terminalis',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Polynesian sacred plant displaying radiant tropical leaves from deep purple to neon magenta.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Controlled-release NPK 14-14-14 granules applied in spring',
  emoji = '🌺',
  watering_freq = 'Every 5–8 days',
  overwatering_issue = 'Root necrosis, bacterial leaf streak in overly damp air',
  solution = 'Water thoroughly, drain saucer, avoid mineral-heavy tap water',
  ph_need = '6.0–6.5'
WHERE name = 'Ti Plant';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Banana Leaf Fig', 'Ficus maclellandii', 'tropical', 1200, 2100, 'Elegant weeping fig with long, narrow willow-like tropical leaves that gracefully drape.', 'high', 'Medium', 'Balanced houseplant NPK 10-10-10 monthly in spring/summer', '🌿', 'Every 7–10 days', 'Chlorosis, widespread shedding of mature leaves', 'Ensure bright light and allow top third of soil to dry', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus maclellandii',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Elegant weeping fig with long, narrow willow-like tropical leaves that gracefully drape.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced houseplant NPK 10-10-10 monthly in spring/summer',
  emoji = '🌿',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Chlorosis, widespread shedding of mature leaves',
  solution = 'Ensure bright light and allow top third of soil to dry',
  ph_need = '6.0–7.0'
WHERE name = 'Banana Leaf Fig';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Medinilla Magnifica', 'Medinilla magnifica', 'tropical', 1100, 2000, 'Philippine showpiece epiphyte with tiered cascading pink flower panicles and thick ribbed leathery leaves.', 'medium', 'Medium', 'High-potassium orchid fertilizer every 2 weeks during budding', '🌸', 'Every 6–8 days', 'Bud blast (dropping unopened blooms), root rot', 'Grow in airy orchid mix; water thoroughly then allow to drain completely', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Medinilla magnifica',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Philippine showpiece epiphyte with tiered cascading pink flower panicles and thick ribbed leathery leaves.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'High-potassium orchid fertilizer every 2 weeks during budding',
  emoji = '🌸',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Bud blast (dropping unopened blooms), root rot',
  solution = 'Grow in airy orchid mix; water thoroughly then allow to drain completely',
  ph_need = '5.5–6.5'
WHERE name = 'Medinilla Magnifica';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Pachira Money Tree', 'Pachira aquatica', 'tropical', 1300, 2400, 'Central American wetland tree with braided woody trunks and bright palmate foliage. Stores moisture in its trunk base.', 'medium', 'Medium', 'Liquid foliage fertilizer diluted to half strength monthly', '💸', 'Every 8–12 days', 'Trunk rot near base, yellowing and dropping of leaflets', 'Do not water when trunk base feels soft; let top 2 inches dry out', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Pachira aquatica',
  category = 'tropical',
  moisture_min = 1300,
  moisture_max = 2400,
  description = 'Central American wetland tree with braided woody trunks and bright palmate foliage. Stores moisture in its trunk base.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Liquid foliage fertilizer diluted to half strength monthly',
  emoji = '💸',
  watering_freq = 'Every 8–12 days',
  overwatering_issue = 'Trunk rot near base, yellowing and dropping of leaflets',
  solution = 'Do not water when trunk base feels soft; let top 2 inches dry out',
  ph_need = '6.0–7.0'
WHERE name = 'Pachira Money Tree';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Thaumatophyllum Xanadu', 'Thaumatophyllum xanadu', 'tropical', 1100, 2100, 'Dense mounding Brazilian tropical shrub with deeply lobed, finger-like glossy emerald fronds.', 'medium', 'Medium', 'Balanced 20-20-20 fertilizer every 4–6 weeks', '🪴', 'Every 6–8 days', 'Pale yellowing leaves, mushy petiole bases', 'Use chunky aerated potting soil with perlite and bark', '5.6–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Thaumatophyllum xanadu',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Dense mounding Brazilian tropical shrub with deeply lobed, finger-like glossy emerald fronds.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced 20-20-20 fertilizer every 4–6 weeks',
  emoji = '🪴',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Pale yellowing leaves, mushy petiole bases',
  solution = 'Use chunky aerated potting soil with perlite and bark',
  ph_need = '5.6–6.5'
WHERE name = 'Thaumatophyllum Xanadu';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Rhaphidophora Tetrasperma', 'Rhaphidophora tetrasperma', 'tropical', 1100, 2000, 'Mini monstera native to southern Thailand and Malaysia. Fast climbing vine with distinctive open fenestrations.', 'high', 'Medium', 'Complete NPK 20-20-20 half strength monthly during growth', '🌿', 'Every 6–8 days', 'Yellowing fenestrated leaves, dark brown watery edges', 'Allow top 1.5 inches to dry; provide coco coir pole for aerial roots', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Rhaphidophora tetrasperma',
  category = 'tropical',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Mini monstera native to southern Thailand and Malaysia. Fast climbing vine with distinctive open fenestrations.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Complete NPK 20-20-20 half strength monthly during growth',
  emoji = '🌿',
  watering_freq = 'Every 6–8 days',
  overwatering_issue = 'Yellowing fenestrated leaves, dark brown watery edges',
  solution = 'Allow top 1.5 inches to dry; provide coco coir pole for aerial roots',
  ph_need = '6.0–6.5'
WHERE name = 'Rhaphidophora Tetrasperma';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Rattlesnake Plant', 'Goeppertia insignis', 'tropical', 1000, 1800, 'Wavy slender lance-shaped leaves with brushstroke dark spots and rich plum-purple undersides that fold upwards at night.', 'medium', 'High', 'Diluted nitrogen-phosphorus houseplant food monthly', '🐍', 'Every 4–6 days', 'Root rot causing foliage to lose vibrant markings and wilt', 'Keep moist with filtered water; maintain high ambient humidity', '6.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Goeppertia insignis',
  category = 'tropical',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Wavy slender lance-shaped leaves with brushstroke dark spots and rich plum-purple undersides that fold upwards at night.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Diluted nitrogen-phosphorus houseplant food monthly',
  emoji = '🐍',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Root rot causing foliage to lose vibrant markings and wilt',
  solution = 'Keep moist with filtered water; maintain high ambient humidity',
  ph_need = '6.0–6.5'
WHERE name = 'Rattlesnake Plant';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ficus Audrey', 'Ficus benghalensis', 'tropical', 1200, 2200, 'Indian banyan tree with velvety emerald leaves and striking pale veins. Hardier and less finicky than Ficus lyrata.', 'high', 'Medium', 'High-nitrogen organic plant food monthly in spring/summer', '🌳', 'Every 7–10 days', 'Yellow spots progressing to leaf shedding', 'Ensure bright direct-indirect sun; let top 2 inches dry out', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus benghalensis',
  category = 'tropical',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Indian banyan tree with velvety emerald leaves and striking pale veins. Hardier and less finicky than Ficus lyrata.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'High-nitrogen organic plant food monthly in spring/summer',
  emoji = '🌳',
  watering_freq = 'Every 7–10 days',
  overwatering_issue = 'Yellow spots progressing to leaf shedding',
  solution = 'Ensure bright direct-indirect sun; let top 2 inches dry out',
  ph_need = '6.0–7.0'
WHERE name = 'Ficus Audrey';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Plumeria Frangipani', 'Plumeria rubra', 'tropical', 1400, 2600, 'Tropical deciduous tree famous for intensely fragrant spiral blossoms used in Hawaiian leis. Loves warm sun.', 'high', 'Low', 'High-phosphorus bloom booster NPK 10-52-10 every 2 weeks in bloom', '🌺', 'Every 7–12 days', 'Stem rot (black tip rot) during cool or dormant periods', 'Water only when completely dry; stop watering during winter dormancy', '6.5–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Plumeria rubra',
  category = 'tropical',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Tropical deciduous tree famous for intensely fragrant spiral blossoms used in Hawaiian leis. Loves warm sun.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'High-phosphorus bloom booster NPK 10-52-10 every 2 weeks in bloom',
  emoji = '🌺',
  watering_freq = 'Every 7–12 days',
  overwatering_issue = 'Stem rot (black tip rot) during cool or dormant periods',
  solution = 'Water only when completely dry; stop watering during winter dormancy',
  ph_need = '6.5–7.0'
WHERE name = 'Plumeria Frangipani';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('White Ginger Lily', 'Hedychium coronarium', 'tropical', 900, 1700, 'Himalayan tropical perennial with lush ginger foliage and exquisite butterfly-like pure white scented blossoms.', 'high', 'High', 'Rich organic compost and liquid balanced NPK every 3 weeks', '🤍', 'Every 3–5 days', 'Rhizome rot in unventilated cold standing water', 'Provide warm temperatures, bright light, and rich loose soil', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Hedychium coronarium',
  category = 'tropical',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Himalayan tropical perennial with lush ginger foliage and exquisite butterfly-like pure white scented blossoms.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Rich organic compost and liquid balanced NPK every 3 weeks',
  emoji = '🤍',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Rhizome rot in unventilated cold standing water',
  solution = 'Provide warm temperatures, bright light, and rich loose soil',
  ph_need = '5.5–6.5'
WHERE name = 'White Ginger Lily';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Black Pine Bonsai', 'Pinus thunbergii', 'bonsai', 1400, 2500, 'Classic king of coniferous bonsai known for rugged flaky bark, strong needles, and masculine styling.', 'high', 'Medium', 'Organic rapeseed cakes (aburakasu) applied monthly in spring and autumn', '🌲', 'Daily in summer, every 3–4 days in winter', 'Needle drop, root rot (Pythium), lack of needle bud candle formation', 'Plant in 100% coarse akadama/pumice/lava rock grit; water when surface feels dry', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Pinus thunbergii',
  category = 'bonsai',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Classic king of coniferous bonsai known for rugged flaky bark, strong needles, and masculine styling.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic rapeseed cakes (aburakasu) applied monthly in spring and autumn',
  emoji = '🌲',
  watering_freq = 'Daily in summer, every 3–4 days in winter',
  overwatering_issue = 'Needle drop, root rot (Pythium), lack of needle bud candle formation',
  solution = 'Plant in 100% coarse akadama/pumice/lava rock grit; water when surface feels dry',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Black Pine Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Red Pine Bonsai', 'Pinus densiflora', 'bonsai', 1400, 2500, 'Graceful feminine pine displaying reddish-orange peeling bark and softer, pliable needles.', 'high', 'Medium', 'Balanced organic bonsai fertilizer pellets every 4 weeks', '🌲', 'Daily in hot weather; check soil moisture twice daily', 'Root fungal asphyxiation, yellowing needle tips', 'Ensure porous bonsai soil; never leave pot submerged in runoff water', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Pinus densiflora',
  category = 'bonsai',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Graceful feminine pine displaying reddish-orange peeling bark and softer, pliable needles.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic bonsai fertilizer pellets every 4 weeks',
  emoji = '🌲',
  watering_freq = 'Daily in hot weather; check soil moisture twice daily',
  overwatering_issue = 'Root fungal asphyxiation, yellowing needle tips',
  solution = 'Ensure porous bonsai soil; never leave pot submerged in runoff water',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Red Pine Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese White Pine Bonsai', 'Pinus parviflora', 'bonsai', 1500, 2600, 'Five-needle pine displaying blue-green needles with white stomatal bands. Highly sensitive to excess moisture.', 'high', 'Low', 'Mild organic fertilizer with low nitrogen in spring and autumn', '🌲', 'Every 2–3 days; let soil dry between waterings', 'Root rot; white pines are exceptionally vulnerable to overwatering', 'Incorporate 50%+ pumice/kiryu; water only when akadama turns light brown', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Pinus parviflora',
  category = 'bonsai',
  moisture_min = 1500,
  moisture_max = 2600,
  description = 'Five-needle pine displaying blue-green needles with white stomatal bands. Highly sensitive to excess moisture.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Mild organic fertilizer with low nitrogen in spring and autumn',
  emoji = '🌲',
  watering_freq = 'Every 2–3 days; let soil dry between waterings',
  overwatering_issue = 'Root rot; white pines are exceptionally vulnerable to overwatering',
  solution = 'Incorporate 50%+ pumice/kiryu; water only when akadama turns light brown',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese White Pine Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Shimpaku Juniper Bonsai', 'Juniperus chinensis ''Shimpaku''', 'bonsai', 1400, 2400, 'Revered evergreen bonsai prized for compact scale-like foliage, striking deadwood jin and shari features.', 'high', 'Medium', 'Slow-release organic pellets monthly from spring through autumn', '🎋', 'Daily in summer, every 2–3 days in cooler seasons', 'Foliage dullness, brittle scale tips, root rot', 'Foliage misting with clean water; allow soil surface to dry between waterings', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Juniperus chinensis ''Shimpaku''',
  category = 'bonsai',
  moisture_min = 1400,
  moisture_max = 2400,
  description = 'Revered evergreen bonsai prized for compact scale-like foliage, striking deadwood jin and shari features.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Slow-release organic pellets monthly from spring through autumn',
  emoji = '🎋',
  watering_freq = 'Daily in summer, every 2–3 days in cooler seasons',
  overwatering_issue = 'Foliage dullness, brittle scale tips, root rot',
  solution = 'Foliage misting with clean water; allow soil surface to dry between waterings',
  ph_need = '6.0–7.0'
WHERE name = 'Shimpaku Juniper Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Procumbens Nana Juniper Bonsai', 'Juniperus procumbens ''Nana''', 'bonsai', 1400, 2400, 'Dwarf green mound juniper with tight prickly juvenile needles. Extremely popular for cascading styles.', 'high', 'Medium', 'Balanced organic bonsai fertilizer every 3 weeks in active season', '🎋', 'Daily in sunny summer; check pot weight', 'Root rot; foliage turns grey-brown weeks after roots have already died', 'Use fast-draining gritty mix (akadama, pumice, volcanic rock)', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Juniperus procumbens ''Nana''',
  category = 'bonsai',
  moisture_min = 1400,
  moisture_max = 2400,
  description = 'Dwarf green mound juniper with tight prickly juvenile needles. Extremely popular for cascading styles.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic bonsai fertilizer every 3 weeks in active season',
  emoji = '🎋',
  watering_freq = 'Daily in sunny summer; check pot weight',
  overwatering_issue = 'Root rot; foliage turns grey-brown weeks after roots have already died',
  solution = 'Use fast-draining gritty mix (akadama, pumice, volcanic rock)',
  ph_need = '6.0–7.0'
WHERE name = 'Procumbens Nana Juniper Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Chinese Elm Bonsai', 'Ulmus parvifolia', 'bonsai', 1200, 2200, 'Tough, forgiving deciduous bonsai with tiny serrated leaves and fine branch ramification.', 'high', 'Medium', 'Liquid balanced NPK 10-10-10 bi-weekly through spring and summer', '🌳', 'Daily in summer; every 2 days in moderate weather', 'Yellowing inner leaves, fungal gnats, root rot in dense peat', 'Repot into free-draining granular bonsai mix; ensure full drainage', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ulmus parvifolia',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Tough, forgiving deciduous bonsai with tiny serrated leaves and fine branch ramification.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Liquid balanced NPK 10-10-10 bi-weekly through spring and summer',
  emoji = '🌳',
  watering_freq = 'Daily in summer; every 2 days in moderate weather',
  overwatering_issue = 'Yellowing inner leaves, fungal gnats, root rot in dense peat',
  solution = 'Repot into free-draining granular bonsai mix; ensure full drainage',
  ph_need = '6.0–7.0'
WHERE name = 'Chinese Elm Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Maple Bonsai', 'Acer palmatum', 'bonsai', 1100, 2100, 'Graceful deciduous bonsai known for delicate palmate leaves and spectacular fiery autumn coloration.', 'medium', 'High', 'Low-nitrogen organic fertilizer during spring; high potassium in autumn', '🍁', 'Twice daily in hot summer, daily in spring/autumn', 'Verticillium wilt vulnerability, root rot, blackened leaf tips', 'Protect shallow root system; maintain uniform moisture without stagnant standing water', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Acer palmatum',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Graceful deciduous bonsai known for delicate palmate leaves and spectacular fiery autumn coloration.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Low-nitrogen organic fertilizer during spring; high potassium in autumn',
  emoji = '🍁',
  watering_freq = 'Twice daily in hot summer, daily in spring/autumn',
  overwatering_issue = 'Verticillium wilt vulnerability, root rot, blackened leaf tips',
  solution = 'Protect shallow root system; maintain uniform moisture without stagnant standing water',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Maple Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Trident Maple Bonsai', 'Acer buergerianum', 'bonsai', 1200, 2200, 'Vigorous deciduous maple with three-lobed leaves and massive, sculptural root flare (nebari).', 'high', 'High', 'Heavy feeder: solid organic cakes monthly from bud break to autumn', '🍁', 'Daily to twice daily during midsummer heat', 'Root rot in poorly draining pots, mildew on shaded lower leaves', 'Use coarse akadama mix; water thoroughly until it streams out of drainage holes', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Acer buergerianum',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Vigorous deciduous maple with three-lobed leaves and massive, sculptural root flare (nebari).',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Heavy feeder: solid organic cakes monthly from bud break to autumn',
  emoji = '🍁',
  watering_freq = 'Daily to twice daily during midsummer heat',
  overwatering_issue = 'Root rot in poorly draining pots, mildew on shaded lower leaves',
  solution = 'Use coarse akadama mix; water thoroughly until it streams out of drainage holes',
  ph_need = '6.0–7.0'
WHERE name = 'Trident Maple Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ficus Retusa Bonsai', 'Ficus retusa', 'bonsai', 1200, 2200, 'Banyan-style tropical indoor bonsai producing aerial roots and shiny waxy oval leaves.', 'high', 'Medium', 'Liquid bonsai food every 2 weeks year-round (indoor temperatures)', '🪴', 'Every 2–3 days indoors; daily outdoors in summer', 'Yellow leaf drop, softened spongy base of trunk', 'Allow top half-inch of soil to dry before watering again', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus retusa',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Banyan-style tropical indoor bonsai producing aerial roots and shiny waxy oval leaves.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Liquid bonsai food every 2 weeks year-round (indoor temperatures)',
  emoji = '🪴',
  watering_freq = 'Every 2–3 days indoors; daily outdoors in summer',
  overwatering_issue = 'Yellow leaf drop, softened spongy base of trunk',
  solution = 'Allow top half-inch of soil to dry before watering again',
  ph_need = '6.0–7.0'
WHERE name = 'Ficus Retusa Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ginseng Ficus Bonsai', 'Ficus microcarpa', 'bonsai', 1300, 2300, 'Sturdy bonsai featuring swollen, bulbous potato-like aerial caudex roots and lush crown foliage.', 'medium', 'Medium', 'General indoor bonsai fertilizer monthly during growing period', '🪴', 'Every 3–5 days', 'Rotting of the fat caudex base, sudden dropping of all green leaves', 'Drain water tray; never allow base of pot to sit in stagnant water', '6.0–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus microcarpa',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Sturdy bonsai featuring swollen, bulbous potato-like aerial caudex roots and lush crown foliage.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'General indoor bonsai fertilizer monthly during growing period',
  emoji = '🪴',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Rotting of the fat caudex base, sudden dropping of all green leaves',
  solution = 'Drain water tray; never allow base of pot to sit in stagnant water',
  ph_need = '6.0–6.8'
WHERE name = 'Ginseng Ficus Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Willow Leaf Ficus Bonsai', 'Ficus salicaria', 'bonsai', 1200, 2200, 'Superior indoor tropical bonsai with naturally narrow, willow-like leaves that reduce dramatically.', 'high', 'Medium', 'Balanced liquid NPK 20-20-20 half strength every 2 weeks', '🌿', 'Every 2–3 days', 'Root rot, loss of interior ramification foliage', 'Keep warm above 15°C; provide gritty fast-draining substrate', '6.0–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus salicaria',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Superior indoor tropical bonsai with naturally narrow, willow-like leaves that reduce dramatically.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced liquid NPK 20-20-20 half strength every 2 weeks',
  emoji = '🌿',
  watering_freq = 'Every 2–3 days',
  overwatering_issue = 'Root rot, loss of interior ramification foliage',
  solution = 'Keep warm above 15°C; provide gritty fast-draining substrate',
  ph_need = '6.0–6.8'
WHERE name = 'Willow Leaf Ficus Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Fukien Tea Bonsai', 'Carmona retusa', 'bonsai', 1100, 2000, 'Tropical evergreen bonsai featuring tiny shiny bristled leaves, star-shaped white blossoms, and red berries.', 'high', 'High', 'Gentle organic liquid fertilizer biweekly in spring and summer', '🍵', 'Daily in warm weather; sensitive to both drought and soaking', 'Blackened leaves, root rot, fungal leaf drop', 'Keep consistently damp; never let dry out completely, never leave waterlogged', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Carmona retusa',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Tropical evergreen bonsai featuring tiny shiny bristled leaves, star-shaped white blossoms, and red berries.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Gentle organic liquid fertilizer biweekly in spring and summer',
  emoji = '🍵',
  watering_freq = 'Daily in warm weather; sensitive to both drought and soaking',
  overwatering_issue = 'Blackened leaves, root rot, fungal leaf drop',
  solution = 'Keep consistently damp; never let dry out completely, never leave waterlogged',
  ph_need = '5.5–6.5'
WHERE name = 'Fukien Tea Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Satsuki Azalea Bonsai', 'Rhododendron indicum', 'bonsai', 1000, 1900, 'Celebrated flowering bonsai with prolific multi-colored blooms. Acid-loving plant requiring Kanuma soil.', 'medium', 'High', 'Acid-formulating fertilizer with no calcium; feed after blooming', '🌺', 'Daily; keep continuously moist with rainwater', 'Root asphyxiation if drainage is blocked; chlorosis from alkaline tap water', 'Pot exclusively in Kanuma volcanic clay; use acid rainwater only', '4.5–5.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Rhododendron indicum',
  category = 'bonsai',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Celebrated flowering bonsai with prolific multi-colored blooms. Acid-loving plant requiring Kanuma soil.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Acid-formulating fertilizer with no calcium; feed after blooming',
  emoji = '🌺',
  watering_freq = 'Daily; keep continuously moist with rainwater',
  overwatering_issue = 'Root asphyxiation if drainage is blocked; chlorosis from alkaline tap water',
  solution = 'Pot exclusively in Kanuma volcanic clay; use acid rainwater only',
  ph_need = '4.5–5.5'
WHERE name = 'Satsuki Azalea Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Kurume Azalea Bonsai', 'Rhododendron kiusianum', 'bonsai', 1000, 1900, 'Dwarf Japanese mountain azalea densely cloaked in small pink to purple flowers in early spring.', 'medium', 'High', 'Specialized ericaceous fertilizer monthly after flowering concludes', '🌸', 'Daily in warm weather', 'Fine fibrous root decay, premature flower browning', 'Use pure Kanuma clay substrate; protect from hot afternoon baking sun', '4.5–5.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Rhododendron kiusianum',
  category = 'bonsai',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Dwarf Japanese mountain azalea densely cloaked in small pink to purple flowers in early spring.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Specialized ericaceous fertilizer monthly after flowering concludes',
  emoji = '🌸',
  watering_freq = 'Daily in warm weather',
  overwatering_issue = 'Fine fibrous root decay, premature flower browning',
  solution = 'Use pure Kanuma clay substrate; protect from hot afternoon baking sun',
  ph_need = '4.5–5.5'
WHERE name = 'Kurume Azalea Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Chinese Banyan Bonsai', 'Ficus microcarpa', 'bonsai', 1200, 2200, 'Vigorous Asian fig capable of forming magnificent pillar aerial roots and compact crown pads.', 'high', 'Medium', 'NPK 12-4-8 liquid fertilizer every 2 weeks during active growth', '🌳', 'Every 2–3 days', 'Oedema blisters, fungal gnats, rotting of aerial root tips', 'Let top 1/3 of soil dry out between thorough waterings', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ficus microcarpa',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Vigorous Asian fig capable of forming magnificent pillar aerial roots and compact crown pads.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'NPK 12-4-8 liquid fertilizer every 2 weeks during active growth',
  emoji = '🌳',
  watering_freq = 'Every 2–3 days',
  overwatering_issue = 'Oedema blisters, fungal gnats, rotting of aerial root tips',
  solution = 'Let top 1/3 of soil dry out between thorough waterings',
  ph_need = '6.0–7.0'
WHERE name = 'Chinese Banyan Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dwarf Pomegranate Bonsai', 'Punica granatum ''Nana''', 'bonsai', 1300, 2300, 'Fascinating deciduous bonsai with twisted ancient bark, tubular scarlet blossoms, and miniature edible fruits.', 'high', 'Medium', 'High-potassium and phosphorus fertilizer monthly during flowering/fruiting', '🍎', 'Daily when bearing fruit; every 2–3 days in cooler weather', 'Split fruits, root rot in wet winter dormant period', 'Reduce watering during winter dormancy; maintain fast drainage', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Punica granatum ''Nana''',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Fascinating deciduous bonsai with twisted ancient bark, tubular scarlet blossoms, and miniature edible fruits.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'High-potassium and phosphorus fertilizer monthly during flowering/fruiting',
  emoji = '🍎',
  watering_freq = 'Daily when bearing fruit; every 2–3 days in cooler weather',
  overwatering_issue = 'Split fruits, root rot in wet winter dormant period',
  solution = 'Reduce watering during winter dormancy; maintain fast drainage',
  ph_need = '6.0–7.5'
WHERE name = 'Dwarf Pomegranate Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Olive Tree Bonsai', 'Olea europaea', 'bonsai', 1500, 2700, 'Mediterranean icon with gnarled silver-grey trunk and leathery narrow leaves with silver undersides.', 'high', 'Low', 'Slow-release Mediterranean fertilizer pellets in spring and autumn', '🫒', 'Every 3–5 days; let soil dry between waterings', 'Yellowing leaves that drop while still supple, root rot', 'Plant in gritty mix with 50% pumice/lava rock; provide full sun', '6.5–8.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Olea europaea',
  category = 'bonsai',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Mediterranean icon with gnarled silver-grey trunk and leathery narrow leaves with silver undersides.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Slow-release Mediterranean fertilizer pellets in spring and autumn',
  emoji = '🫒',
  watering_freq = 'Every 3–5 days; let soil dry between waterings',
  overwatering_issue = 'Yellowing leaves that drop while still supple, root rot',
  solution = 'Plant in gritty mix with 50% pumice/lava rock; provide full sun',
  ph_need = '6.5–8.0'
WHERE name = 'Olive Tree Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Rockspray Cotoneaster Bonsai', 'Cotoneaster horizontalis', 'bonsai', 1300, 2300, 'Herringbone-branching shrub featuring tiny glossy leaves, pink blossoms, and vivid scarlet winter berries.', 'high', 'Medium', 'Balanced organic pellets once a month in spring and summer', '🍒', 'Daily in sunny summer; every 2–3 days in spring', 'Fire blight susceptibility in warm soggy conditions, root rot', 'Ensure great air circulation and sharp gritty drainage', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cotoneaster horizontalis',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Herringbone-branching shrub featuring tiny glossy leaves, pink blossoms, and vivid scarlet winter berries.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic pellets once a month in spring and summer',
  emoji = '🍒',
  watering_freq = 'Daily in sunny summer; every 2–3 days in spring',
  overwatering_issue = 'Fire blight susceptibility in warm soggy conditions, root rot',
  solution = 'Ensure great air circulation and sharp gritty drainage',
  ph_need = '6.0–7.5'
WHERE name = 'Rockspray Cotoneaster Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Firethorn Bonsai', 'Pyracantha coccinea', 'bonsai', 1300, 2300, 'Hardy thorny evergreen bonsai loaded with white spring blossoms and heavy clusters of orange-red berries.', 'high', 'Medium', 'NPK 10-10-10 monthly; switch to high potassium in late summer for berries', '🔥', 'Daily in midsummer; every 2–3 days otherwise', 'Scab disease, berry drop, root rot', 'Water only when soil surface dries; maintain full exterior sunlight', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Pyracantha coccinea',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Hardy thorny evergreen bonsai loaded with white spring blossoms and heavy clusters of orange-red berries.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'NPK 10-10-10 monthly; switch to high potassium in late summer for berries',
  emoji = '🔥',
  watering_freq = 'Daily in midsummer; every 2–3 days otherwise',
  overwatering_issue = 'Scab disease, berry drop, root rot',
  solution = 'Water only when soil surface dries; maintain full exterior sunlight',
  ph_need = '6.0–7.0'
WHERE name = 'Firethorn Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Snowrose Serissa Bonsai', 'Serissa japonica', 'bonsai', 1100, 2000, 'Known as the "Tree of a Thousand Stars", adorned with tiny white flowers and fissured miniature bark.', 'medium', 'High', 'Mild organic liquid fertilizer every 2 weeks during flowering', '⭐', 'Daily; keep consistently damp without waterlogging', 'Extremely notorious for dropping all leaves upon overwatering or moving', 'Keep environment stable; ensure bottom holes drain within seconds', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Serissa japonica',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Known as the "Tree of a Thousand Stars", adorned with tiny white flowers and fissured miniature bark.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Mild organic liquid fertilizer every 2 weeks during flowering',
  emoji = '⭐',
  watering_freq = 'Daily; keep consistently damp without waterlogging',
  overwatering_issue = 'Extremely notorious for dropping all leaves upon overwatering or moving',
  solution = 'Keep environment stable; ensure bottom holes drain within seconds',
  ph_need = '5.5–6.5'
WHERE name = 'Snowrose Serissa Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Zelkova Bonsai', 'Zelkova serrata', 'bonsai', 1200, 2200, 'Quintessential broom-style (Hokidachi) bonsai with a clean straight trunk and a fan of delicate fine twigs.', 'high', 'Medium', 'Solid organic cakes bi-monthly during spring and early summer', '🧹', 'Daily in active summer growth', 'Dieback of delicate fine tip twigs, root rot', 'Prune dead twigs; keep in porous akadama-dominant mix', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Zelkova serrata',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Quintessential broom-style (Hokidachi) bonsai with a clean straight trunk and a fan of delicate fine twigs.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Solid organic cakes bi-monthly during spring and early summer',
  emoji = '🧹',
  watering_freq = 'Daily in active summer growth',
  overwatering_issue = 'Dieback of delicate fine tip twigs, root rot',
  solution = 'Prune dead twigs; keep in porous akadama-dominant mix',
  ph_need = '6.0–7.0'
WHERE name = 'Japanese Zelkova Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('European Hornbeam Bonsai', 'Carpinus betulus', 'bonsai', 1200, 2200, 'Smooth grey bark with fluted trunks and corrugated foliage that turns golden bronze in autumn.', 'high', 'Medium', 'Organic bonsai pellets every 4 weeks in spring and early autumn', '🍂', 'Daily in summer; every 2–3 days in cooler months', 'Foliar mildew, root rot, dieback of branch ramification', 'Allow topsoil to dry slightly before each watering', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Carpinus betulus',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Smooth grey bark with fluted trunks and corrugated foliage that turns golden bronze in autumn.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic bonsai pellets every 4 weeks in spring and early autumn',
  emoji = '🍂',
  watering_freq = 'Daily in summer; every 2–3 days in cooler months',
  overwatering_issue = 'Foliar mildew, root rot, dieback of branch ramification',
  solution = 'Allow topsoil to dry slightly before each watering',
  ph_need = '6.0–7.5'
WHERE name = 'European Hornbeam Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Korean Hornbeam Bonsai', 'Carpinus coreana', 'bonsai', 1200, 2200, 'Highly prized bonsai with tiny corrugated leaves that turn brilliant shades of fiery orange and red in autumn.', 'high', 'Medium', 'Low-nitrogen organic pellets during spring; feed well in autumn', '🍁', 'Daily in summer; check pot daily', 'Root rot during damp cool spring weather, mildew', 'Use pure akadama/pumice mix; protect from continuous prolonged rain', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Carpinus coreana',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Highly prized bonsai with tiny corrugated leaves that turn brilliant shades of fiery orange and red in autumn.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Low-nitrogen organic pellets during spring; feed well in autumn',
  emoji = '🍁',
  watering_freq = 'Daily in summer; check pot daily',
  overwatering_issue = 'Root rot during damp cool spring weather, mildew',
  solution = 'Use pure akadama/pumice mix; protect from continuous prolonged rain',
  ph_need = '6.0–7.0'
WHERE name = 'Korean Hornbeam Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('European Beech Bonsai', 'Fagus sylvatica', 'bonsai', 1200, 2100, 'Stately deciduous tree with smooth silver bark, translucent spring foliage, and copper winter marcescent leaves.', 'medium', 'Medium', 'Organic cakes monthly in spring; stop in midsummer heat', '🌳', 'Daily in warm weather; never let dry out completely', 'Mycorrhizae fungus destruction by waterlogged soil, root rot', 'Preserve beneficial mycorrhizal fungal roots in gritty well-aerated soil', '5.5–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Fagus sylvatica',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Stately deciduous tree with smooth silver bark, translucent spring foliage, and copper winter marcescent leaves.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Organic cakes monthly in spring; stop in midsummer heat',
  emoji = '🌳',
  watering_freq = 'Daily in warm weather; never let dry out completely',
  overwatering_issue = 'Mycorrhizae fungus destruction by waterlogged soil, root rot',
  solution = 'Preserve beneficial mycorrhizal fungal roots in gritty well-aerated soil',
  ph_need = '5.5–6.8'
WHERE name = 'European Beech Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Beech Bonsai', 'Fagus crenata', 'bonsai', 1200, 2100, 'Aristocratic Japanese forest bonsai celebrated for pure white-grey bark and delicate pointed spring buds.', 'medium', 'Medium', 'Mild organic fertilizer pellets once a month in spring', '🌳', 'Daily; protect from baking afternoon summer sun', 'Leaf scorch from root rot (roots rot, then fail to uptake water to leaves)', 'Use breathable terracotta or unglazed bonsai pots with 50% pumice', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Fagus crenata',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Aristocratic Japanese forest bonsai celebrated for pure white-grey bark and delicate pointed spring buds.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Mild organic fertilizer pellets once a month in spring',
  emoji = '🌳',
  watering_freq = 'Daily; protect from baking afternoon summer sun',
  overwatering_issue = 'Leaf scorch from root rot (roots rot, then fail to uptake water to leaves)',
  solution = 'Use breathable terracotta or unglazed bonsai pots with 50% pumice',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Beech Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('European Larch Bonsai', 'Larix decidua', 'bonsai', 1100, 2100, 'Deciduous conifer with soft needle rosettes that turn bright gold in autumn before dropping, revealing fine winter ramification.', 'high', 'High', 'Heavy feeder: organic pellets every 3 weeks from bud break to autumn', '🌲', 'Daily to twice daily in summer heat', 'Yellowing needles in early spring if soil remains cold and waterlogged', 'Provide full sun and sharp drainage using akadama and pumice grit', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Larix decidua',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Deciduous conifer with soft needle rosettes that turn bright gold in autumn before dropping, revealing fine winter ramification.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Heavy feeder: organic pellets every 3 weeks from bud break to autumn',
  emoji = '🌲',
  watering_freq = 'Daily to twice daily in summer heat',
  overwatering_issue = 'Yellowing needles in early spring if soil remains cold and waterlogged',
  solution = 'Provide full sun and sharp drainage using akadama and pumice grit',
  ph_need = '5.5–6.5'
WHERE name = 'European Larch Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Larch Bonsai', 'Larix kaempferi', 'bonsai', 1100, 2100, 'Fast-growing alpine conifer with bluish-green needle whorls and warm reddish shoots. Superb autumn foliage.', 'high', 'High', 'Balanced organic fertilizer pellets monthly through growing season', '🌲', 'Daily in warm weather; thirsty when active', 'Root rot during dormant winter wetness', 'Shelter from excessive winter rains; keep soil just slightly moist', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Larix kaempferi',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Fast-growing alpine conifer with bluish-green needle whorls and warm reddish shoots. Superb autumn foliage.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Balanced organic fertilizer pellets monthly through growing season',
  emoji = '🌲',
  watering_freq = 'Daily in warm weather; thirsty when active',
  overwatering_issue = 'Root rot during dormant winter wetness',
  solution = 'Shelter from excessive winter rains; keep soil just slightly moist',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Larch Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Bald Cypress Bonsai', 'Taxodium distichum', 'bonsai', 800, 1600, 'Swamp-dwelling deciduous conifer capable of sitting in shallow water trays during hot summer months.', 'high', 'High', 'High-nitrogen fertilizer monthly in spring and summer', '🌲', 'Daily; can be kept in shallow water tray during midsummer', 'Extremely tolerant of water; however, winter dormancy requires drainage', 'Remove from water tray in autumn to prevent winter root rot', '5.0–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Taxodium distichum',
  category = 'bonsai',
  moisture_min = 800,
  moisture_max = 1600,
  description = 'Swamp-dwelling deciduous conifer capable of sitting in shallow water trays during hot summer months.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'High-nitrogen fertilizer monthly in spring and summer',
  emoji = '🌲',
  watering_freq = 'Daily; can be kept in shallow water tray during midsummer',
  overwatering_issue = 'Extremely tolerant of water; however, winter dormancy requires drainage',
  solution = 'Remove from water tray in autumn to prevent winter root rot',
  ph_need = '5.0–6.5'
WHERE name = 'Bald Cypress Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dawn Redwood Bonsai', 'Metasequoia glyptostroboides', 'bonsai', 900, 1700, 'Living fossil deciduous conifer with feathery opposing needles, fluted trunk base, and rapid trunk thickening.', 'high', 'High', 'Balanced NPK 10-10-10 every 2 weeks during peak summer', '🌲', 'Daily; loves ample water in hot summer', 'Branch tip dieback if roots freeze while saturated in winter', 'Protect roots from hard freezes; ensure free-draining coarse soil', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Metasequoia glyptostroboides',
  category = 'bonsai',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Living fossil deciduous conifer with feathery opposing needles, fluted trunk base, and rapid trunk thickening.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Balanced NPK 10-10-10 every 2 weeks during peak summer',
  emoji = '🌲',
  watering_freq = 'Daily; loves ample water in hot summer',
  overwatering_issue = 'Branch tip dieback if roots freeze while saturated in winter',
  solution = 'Protect roots from hard freezes; ensure free-draining coarse soil',
  ph_need = '5.5–6.5'
WHERE name = 'Dawn Redwood Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Cedar of Lebanon Bonsai', 'Cedrus libani', 'bonsai', 1400, 2500, 'Majestic evergreen conifer with horizontal tiered branch pads and dark green barrel-like needle clusters.', 'high', 'Medium', 'Mild organic bonsai pellets once a month in spring', '🌲', 'Every 2–3 days; let soil dry between waterings', 'Extremely sensitive to root asphyxiation, needle cast', 'Use 60% pumice/lava rock grit; water strictly when dry', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cedrus libani',
  category = 'bonsai',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Majestic evergreen conifer with horizontal tiered branch pads and dark green barrel-like needle clusters.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Mild organic bonsai pellets once a month in spring',
  emoji = '🌲',
  watering_freq = 'Every 2–3 days; let soil dry between waterings',
  overwatering_issue = 'Extremely sensitive to root asphyxiation, needle cast',
  solution = 'Use 60% pumice/lava rock grit; water strictly when dry',
  ph_need = '6.0–7.5'
WHERE name = 'Cedar of Lebanon Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Atlas Cedar Bonsai', 'Cedrus atlantica', 'bonsai', 1500, 2600, 'North African mountain cedar featuring striking silvery-blue needle rosettes and rugged furrowed bark.', 'high', 'Low', 'Organic rapeseed cake pellets in spring and autumn', '🌲', 'Every 3–4 days; dislikes wet feet', 'Root rot; needles turn dull yellowish grey and drop', 'Plant on slight mound in bonsai pot; ensure oversized drainage holes', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cedrus atlantica',
  category = 'bonsai',
  moisture_min = 1500,
  moisture_max = 2600,
  description = 'North African mountain cedar featuring striking silvery-blue needle rosettes and rugged furrowed bark.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Organic rapeseed cake pellets in spring and autumn',
  emoji = '🌲',
  watering_freq = 'Every 3–4 days; dislikes wet feet',
  overwatering_issue = 'Root rot; needles turn dull yellowish grey and drop',
  solution = 'Plant on slight mound in bonsai pot; ensure oversized drainage holes',
  ph_need = '6.0–7.5'
WHERE name = 'Atlas Cedar Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Bougainvillea Bonsai', 'Bougainvillea glabra', 'bonsai', 1500, 2700, 'Vibrant tropical vine trained into gnarled bonsai with paper-thin magenta bracts. Blooms heavily when stressed dry.', 'high', 'Low', 'High-potassium and phosphorus food every 2 weeks; low nitrogen', '🌺', 'Every 3–5 days; allow soil to dry between waterings', 'Excessive vegetative growth with zero flowers, root rot', 'Withhold water until slight leaf wilt to stimulate profuse blooming', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Bougainvillea glabra',
  category = 'bonsai',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Vibrant tropical vine trained into gnarled bonsai with paper-thin magenta bracts. Blooms heavily when stressed dry.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'High-potassium and phosphorus food every 2 weeks; low nitrogen',
  emoji = '🌺',
  watering_freq = 'Every 3–5 days; allow soil to dry between waterings',
  overwatering_issue = 'Excessive vegetative growth with zero flowers, root rot',
  solution = 'Withhold water until slight leaf wilt to stimulate profuse blooming',
  ph_need = '5.5–6.5'
WHERE name = 'Bougainvillea Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Dwarf Jade Portulacaria Bonsai', 'Portulacaria afra', 'bonsai', 1700, 2900, 'South African "Elephant Bush" succulent with fleshy jade leaves and reddish stems. Nearly indestructible.', 'high', 'Low', 'Cactus & succulent fertilizer at half strength once a month in summer', '🪴', 'Every 7–12 days; allow soil to completely dry', 'Mushy yellow leaves, black rotting branches that snap easily', 'Use 70% inorganic pumice/perlite mix; water only when leaves lose plumpness', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Portulacaria afra',
  category = 'bonsai',
  moisture_min = 1700,
  moisture_max = 2900,
  description = 'South African "Elephant Bush" succulent with fleshy jade leaves and reddish stems. Nearly indestructible.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Cactus & succulent fertilizer at half strength once a month in summer',
  emoji = '🪴',
  watering_freq = 'Every 7–12 days; allow soil to completely dry',
  overwatering_issue = 'Mushy yellow leaves, black rotting branches that snap easily',
  solution = 'Use 70% inorganic pumice/perlite mix; water only when leaves lose plumpness',
  ph_need = '6.0–7.0'
WHERE name = 'Dwarf Jade Portulacaria Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Wisteria Bonsai', 'Wisteria floribunda', 'bonsai', 1000, 1800, 'Woody climbing vine trained as a bonsai, renowned for hanging racemes of fragrant violet-purple blossoms.', 'high', 'High', 'High-phosphorus fertilizer after blooming; avoid excess nitrogen', '🪻', 'Daily to twice daily in summer; can stand in shallow water in peak summer', 'Only problematic in winter; root rot during cold dormant period', 'Keep well-drained in winter; provide heavy water during spring bud swell', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Wisteria floribunda',
  category = 'bonsai',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Woody climbing vine trained as a bonsai, renowned for hanging racemes of fragrant violet-purple blossoms.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'High-phosphorus fertilizer after blooming; avoid excess nitrogen',
  emoji = '🪻',
  watering_freq = 'Daily to twice daily in summer; can stand in shallow water in peak summer',
  overwatering_issue = 'Only problematic in winter; root rot during cold dormant period',
  solution = 'Keep well-drained in winter; provide heavy water during spring bud swell',
  ph_need = '6.0–7.0'
WHERE name = 'Japanese Wisteria Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Flowering Quince Bonsai', 'Chaenomeles speciosa', 'bonsai', 1200, 2200, 'Clumping shrub with thorny branches, producing glowing cup-shaped scarlet flowers in late winter before leaves.', 'high', 'Medium', 'Organic pellets monthly in spring; phosphorus boost in autumn', '🌺', 'Daily in summer; every 2–3 days in cooler weather', 'Chlorosis from poor root health, flower bud drop', 'Plant in gritty compost-akadama mix; prune suckers regularly', '6.0–6.8')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Chaenomeles speciosa',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Clumping shrub with thorny branches, producing glowing cup-shaped scarlet flowers in late winter before leaves.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic pellets monthly in spring; phosphorus boost in autumn',
  emoji = '🌺',
  watering_freq = 'Daily in summer; every 2–3 days in cooler weather',
  overwatering_issue = 'Chlorosis from poor root health, flower bud drop',
  solution = 'Plant in gritty compost-akadama mix; prune suckers regularly',
  ph_need = '6.0–6.8'
WHERE name = 'Flowering Quince Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Hall Crabapple Bonsai', 'Malus halliana', 'bonsai', 1100, 2000, 'Delightful deciduous fruiting bonsai draped in drooping pink blossoms followed by tiny ornamental apples.', 'high', 'High', 'Organic pellets monthly; high potassium for fruit set', '🍎', 'Daily in summer; thirsty when bearing fruit', 'Scab fungus, premature fruit drop, root rot', 'Ensure full air circulation and sharp drainage in pot', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Malus halliana',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Delightful deciduous fruiting bonsai draped in drooping pink blossoms followed by tiny ornamental apples.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Organic pellets monthly; high potassium for fruit set',
  emoji = '🍎',
  watering_freq = 'Daily in summer; thirsty when bearing fruit',
  overwatering_issue = 'Scab fungus, premature fruit drop, root rot',
  solution = 'Ensure full air circulation and sharp drainage in pot',
  ph_need = '6.0–7.0'
WHERE name = 'Hall Crabapple Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Flowering Cherry Bonsai', 'Prunus serrulata', 'bonsai', 1200, 2100, 'Iconic Sakura bonsai adorned with clouds of fragile pale pink flowers in early spring.', 'high', 'Medium', 'Organic cakes applied after flowers drop until mid-autumn', '🌸', 'Daily in spring/summer; check surface daily', 'Bacterial canker, silver leaf fungus, root rot', 'Never allow soil to stay waterlogged; seal pruning cuts immediately', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Prunus serrulata',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Iconic Sakura bonsai adorned with clouds of fragile pale pink flowers in early spring.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic cakes applied after flowers drop until mid-autumn',
  emoji = '🌸',
  watering_freq = 'Daily in spring/summer; check surface daily',
  overwatering_issue = 'Bacterial canker, silver leaf fungus, root rot',
  solution = 'Never allow soil to stay waterlogged; seal pruning cuts immediately',
  ph_need = '6.0–7.0'
WHERE name = 'Japanese Flowering Cherry Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Apricot Bonsai', 'Prunus mume', 'bonsai', 1200, 2200, 'Beloved Ume bonsai with rugged ancient bark that blooms with intensely sweet-scented flowers in the dead of winter.', 'high', 'Medium', 'Balanced organic pellets applied after blooming through summer', '🌸', 'Daily in summer; keep slightly moist in winter', 'Branch dieback, flower bud rot during damp cold snaps', 'Protect from excess winter rains while buds swell; maintain gritty mix', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Prunus mume',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Beloved Ume bonsai with rugged ancient bark that blooms with intensely sweet-scented flowers in the dead of winter.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic pellets applied after blooming through summer',
  emoji = '🌸',
  watering_freq = 'Daily in summer; keep slightly moist in winter',
  overwatering_issue = 'Branch dieback, flower bud rot during damp cold snaps',
  solution = 'Protect from excess winter rains while buds swell; maintain gritty mix',
  ph_need = '6.0–7.0'
WHERE name = 'Japanese Apricot Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Maidenhair Tree Bonsai', 'Ginkgo biloba', 'bonsai', 1200, 2200, 'Primitive sacred tree with distinctive fan-shaped leaves that turn incandescent golden-yellow in autumn.', 'high', 'Medium', 'Solid organic cakes monthly from spring until leaf color change', '💛', 'Daily in warm weather; every 3–4 days in winter', 'Fleshy roots are prone to rotting in cold anaerobic soil', 'Use coarse 60% pumice/akadama mix; water only when dry to touch', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ginkgo biloba',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Primitive sacred tree with distinctive fan-shaped leaves that turn incandescent golden-yellow in autumn.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Solid organic cakes monthly from spring until leaf color change',
  emoji = '💛',
  watering_freq = 'Daily in warm weather; every 3–4 days in winter',
  overwatering_issue = 'Fleshy roots are prone to rotting in cold anaerobic soil',
  solution = 'Use coarse 60% pumice/akadama mix; water only when dry to touch',
  ph_need = '6.0–7.0'
WHERE name = 'Maidenhair Tree Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Chinese Sweet Plum Bonsai', 'Sageretia theezans', 'bonsai', 1100, 2000, 'Subtropical indoor bonsai with fine glossy foliage, mottled peeling bark, and tiny blue-black berries.', 'medium', 'High', 'Liquid bonsai fertilizer every 2 weeks through spring and summer', '🫐', 'Daily; sensitive to dry soil', 'Mildew on dense foliage pads, root rot in stagnant pots', 'Keep moist with well-aerated soil; prune inner dense twigs for airflow', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Sageretia theezans',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Subtropical indoor bonsai with fine glossy foliage, mottled peeling bark, and tiny blue-black berries.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Liquid bonsai fertilizer every 2 weeks through spring and summer',
  emoji = '🫐',
  watering_freq = 'Daily; sensitive to dry soil',
  overwatering_issue = 'Mildew on dense foliage pads, root rot in stagnant pots',
  solution = 'Keep moist with well-aerated soil; prune inner dense twigs for airflow',
  ph_need = '5.5–6.5'
WHERE name = 'Chinese Sweet Plum Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Kingsville Boxwood Bonsai', 'Buxus microphylla ''Compacta''', 'bonsai', 1300, 2300, 'Super-dwarf boxwood with miniature leaves and corky aged bark. Perfect for mame and shohin bonsai.', 'medium', 'Medium', 'Balanced slow-release pellets applied in spring and autumn', '🪴', 'Every 2–3 days; let topsoil dry slightly', 'Root rot (Phytophthora), bronzing and yellowing of interior foliage', 'Provide excellent drainage; avoid wetting foliage in late evening', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Buxus microphylla ''Compacta''',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Super-dwarf boxwood with miniature leaves and corky aged bark. Perfect for mame and shohin bonsai.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced slow-release pellets applied in spring and autumn',
  emoji = '🪴',
  watering_freq = 'Every 2–3 days; let topsoil dry slightly',
  overwatering_issue = 'Root rot (Phytophthora), bronzing and yellowing of interior foliage',
  solution = 'Provide excellent drainage; avoid wetting foliage in late evening',
  ph_need = '6.5–7.5'
WHERE name = 'Kingsville Boxwood Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('English Yew Bonsai', 'Taxus baccata', 'bonsai', 1300, 2300, 'Ancient European evergreen conifer with red flaky bark, deep green flat needles, and exceptional deadwood carving qualities.', 'medium', 'Medium', 'Organic pellets monthly in spring; light feed in early autumn', '🌲', 'Every 2–3 days; hates soggy soil', 'Needle chlorosis, lethal root rot in poorly draining pots', 'Use 50% pumice/lava rock; water only when soil surface feels dry', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Taxus baccata',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Ancient European evergreen conifer with red flaky bark, deep green flat needles, and exceptional deadwood carving qualities.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Organic pellets monthly in spring; light feed in early autumn',
  emoji = '🌲',
  watering_freq = 'Every 2–3 days; hates soggy soil',
  overwatering_issue = 'Needle chlorosis, lethal root rot in poorly draining pots',
  solution = 'Use 50% pumice/lava rock; water only when soil surface feels dry',
  ph_need = '6.0–7.5'
WHERE name = 'English Yew Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Yew Bonsai', 'Taxus cuspidata', 'bonsai', 1300, 2300, 'Hardy mountain yew renowned for natural deadwood jin and shari, dense dark needles, and extreme longevity.', 'medium', 'Medium', 'Organic rapeseed pellets twice per season', '🌲', 'Every 2–3 days in summer; sparingly in winter', 'Needle browning from root rot', 'Plant in unglazed pot with coarse akadama and volcanic rock', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Taxus cuspidata',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Hardy mountain yew renowned for natural deadwood jin and shari, dense dark needles, and extreme longevity.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Organic rapeseed pellets twice per season',
  emoji = '🌲',
  watering_freq = 'Every 2–3 days in summer; sparingly in winter',
  overwatering_issue = 'Needle browning from root rot',
  solution = 'Plant in unglazed pot with coarse akadama and volcanic rock',
  ph_need = '6.0–7.0'
WHERE name = 'Japanese Yew Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Hinoki Cypress Bonsai', 'Chamaecyparis obtusa', 'bonsai', 1200, 2100, 'Sacred Japanese cypress with fan-like scale foliage. Extremely sensitive to foliage dieback if roots are compromised.', 'high', 'Medium', 'Balanced organic fertilizer every 4 weeks in spring and autumn', '🌲', 'Daily in summer; keep uniformly moist', 'Inner branch dieback (Hinoki does not back-bud on old wood!)', 'Maintain high aeration; never let soil stay soggy or dry out completely', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Chamaecyparis obtusa',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Sacred Japanese cypress with fan-like scale foliage. Extremely sensitive to foliage dieback if roots are compromised.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic fertilizer every 4 weeks in spring and autumn',
  emoji = '🌲',
  watering_freq = 'Daily in summer; keep uniformly moist',
  overwatering_issue = 'Inner branch dieback (Hinoki does not back-bud on old wood!)',
  solution = 'Maintain high aeration; never let soil stay soggy or dry out completely',
  ph_need = '5.5–6.5'
WHERE name = 'Hinoki Cypress Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Cedar Sugi Bonsai', 'Cryptomeria japonica', 'bonsai', 1100, 2000, 'National tree of Japan featuring soft needle whorls that turn bronze in winter and reddish stringy bark.', 'high', 'High', 'Solid organic cakes monthly during spring and summer', '🌲', 'Daily; loves ample water and humidity', 'Root rot during freezing winter conditions', 'Water heavily during growing season; reduce during freezing winter months', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cryptomeria japonica',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'National tree of Japan featuring soft needle whorls that turn bronze in winter and reddish stringy bark.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Solid organic cakes monthly during spring and summer',
  emoji = '🌲',
  watering_freq = 'Daily; loves ample water and humidity',
  overwatering_issue = 'Root rot during freezing winter conditions',
  solution = 'Water heavily during growing season; reduce during freezing winter months',
  ph_need = '5.5–6.5'
WHERE name = 'Japanese Cedar Sugi Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Common Hawthorn Bonsai', 'Crataegus monogyna', 'bonsai', 1200, 2200, 'Rugged hedgerow tree with deeply lobed leaves, white scented spring flowers, and deep crimson haws in autumn.', 'high', 'Medium', 'Balanced organic cakes applied monthly from April to September', '🫐', 'Daily in summer; every 2–3 days in spring', 'Powdery mildew, leaf rust, root rot', 'Grow outdoors in full sun and wind; water when top layer dries', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Crataegus monogyna',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Rugged hedgerow tree with deeply lobed leaves, white scented spring flowers, and deep crimson haws in autumn.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic cakes applied monthly from April to September',
  emoji = '🫐',
  watering_freq = 'Daily in summer; every 2–3 days in spring',
  overwatering_issue = 'Powdery mildew, leaf rust, root rot',
  solution = 'Grow outdoors in full sun and wind; water when top layer dries',
  ph_need = '6.0–7.5'
WHERE name = 'Common Hawthorn Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Brazilian Raintree Bonsai', 'Chloroleucon tortum', 'bonsai', 1200, 2100, 'Exotic tropical legume bonsai with twisted fluted bark, delicate bipinnate leaves that fold at dusk, and sweet blossoms.', 'high', 'Medium', 'High-nitrogen fertilizer every 2 weeks during active tropical heat', '🌳', 'Daily in summer; every 2–3 days indoors in winter', 'Leaf shedding, trunk rot at soil level', 'Protect from temperatures below 12°C; ensure fast-draining soil', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Chloroleucon tortum',
  category = 'bonsai',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Exotic tropical legume bonsai with twisted fluted bark, delicate bipinnate leaves that fold at dusk, and sweet blossoms.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'High-nitrogen fertilizer every 2 weeks during active tropical heat',
  emoji = '🌳',
  watering_freq = 'Daily in summer; every 2–3 days indoors in winter',
  overwatering_issue = 'Leaf shedding, trunk rot at soil level',
  solution = 'Protect from temperatures below 12°C; ensure fast-draining soil',
  ph_need = '6.0–7.0'
WHERE name = 'Brazilian Raintree Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Tamarind Bonsai', 'Tamarindus indica', 'bonsai', 1300, 2400, 'Tropical hardwood bonsai with feathery pinnate leaves that close at night and rough fissured bark.', 'high', 'Medium', 'Balanced NPK 10-10-10 monthly in warm months', '🫘', 'Every 2–3 days in summer; sparingly in winter', 'Petiolar drop, root rot in cool soil', 'Provide maximum sunlight and warm environment; allow soil to dry slightly', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Tamarindus indica',
  category = 'bonsai',
  moisture_min = 1300,
  moisture_max = 2400,
  description = 'Tropical hardwood bonsai with feathery pinnate leaves that close at night and rough fissured bark.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced NPK 10-10-10 monthly in warm months',
  emoji = '🫘',
  watering_freq = 'Every 2–3 days in summer; sparingly in winter',
  overwatering_issue = 'Petiolar drop, root rot in cool soil',
  solution = 'Provide maximum sunlight and warm environment; allow soil to dry slightly',
  ph_need = '6.0–7.5'
WHERE name = 'Tamarind Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('African Baobab Bonsai', 'Adansonia digitata', 'bonsai', 1800, 3200, 'Iconic "Tree of Life" succulent tree with a massive swollen pachycaul trunk that stores tons of water.', 'high', 'Low', 'Very dilute cactus fertilizer once in early summer only', '🪵', 'Every 10–14 days in summer; ZERO water in winter dormancy', 'Trunk rot; baobabs rot extremely quickly if watered during dormancy', 'Completely stop watering when leaves drop in autumn until spring buds break', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Adansonia digitata',
  category = 'bonsai',
  moisture_min = 1800,
  moisture_max = 3200,
  description = 'Iconic "Tree of Life" succulent tree with a massive swollen pachycaul trunk that stores tons of water.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Very dilute cactus fertilizer once in early summer only',
  emoji = '🪵',
  watering_freq = 'Every 10–14 days in summer; ZERO water in winter dormancy',
  overwatering_issue = 'Trunk rot; baobabs rot extremely quickly if watered during dormancy',
  solution = 'Completely stop watering when leaves drop in autumn until spring buds break',
  ph_need = '6.5–7.5'
WHERE name = 'African Baobab Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Japanese Stewartia Bonsai', 'Stewartia pseudocamellia', 'bonsai', 1100, 2000, 'Prized deciduous bonsai boasting multi-colored camellia-like peeling bark, white summer blossoms, and red autumn leaves.', 'medium', 'High', 'Acid-friendly organic fertilizer pellets after flowering', '🌸', 'Daily; keep uniformly moist with soft rainwater', 'Root rot in heavy soil; leaf edge burn if roots suffer water stress', 'Use Kanuma and akadama mixture; provide partial afternoon shade', '5.0–6.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Stewartia pseudocamellia',
  category = 'bonsai',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Prized deciduous bonsai boasting multi-colored camellia-like peeling bark, white summer blossoms, and red autumn leaves.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Acid-friendly organic fertilizer pellets after flowering',
  emoji = '🌸',
  watering_freq = 'Daily; keep uniformly moist with soft rainwater',
  overwatering_issue = 'Root rot in heavy soil; leaf edge burn if roots suffer water stress',
  solution = 'Use Kanuma and akadama mixture; provide partial afternoon shade',
  ph_need = '5.0–6.0'
WHERE name = 'Japanese Stewartia Bonsai';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Tulsi Holy Basil', 'Ocimum tenuiflorum', 'medicinal', 1300, 2300, 'Sacred Ayurvedic adaptogen herb rich in eugenol and rosmarinic acid. Alleviates stress, boosts immunity, and purifies air.', 'high', 'Medium', 'Organic vermicompost or liquid seaweed extract monthly', '🌿', 'Every 2–3 days; keep soil moist but well-aerated', 'Fusarium wilt, root rot, yellowing and dropping of aromatic leaves', 'Ensure terracotta drainage; let top 1 inch dry before watering', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ocimum tenuiflorum',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Sacred Ayurvedic adaptogen herb rich in eugenol and rosmarinic acid. Alleviates stress, boosts immunity, and purifies air.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic vermicompost or liquid seaweed extract monthly',
  emoji = '🌿',
  watering_freq = 'Every 2–3 days; keep soil moist but well-aerated',
  overwatering_issue = 'Fusarium wilt, root rot, yellowing and dropping of aromatic leaves',
  solution = 'Ensure terracotta drainage; let top 1 inch dry before watering',
  ph_need = '6.0–7.0'
WHERE name = 'Tulsi Holy Basil';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Ashwagandha', 'Withania somnifera', 'medicinal', 1600, 2800, 'Ayurvedic "Indian Ginseng" adaptogenic nightshade. Tuberous roots boost vitality, lower cortisol, and restore cognitive energy.', 'high', 'Low', 'Light compost top-dressing; avoid excessive nitrogen which hinders root potency', '🌾', 'Every 5–8 days; drought hardy', 'Fleshy medicinal root rot, damping off in seedlings', 'Plant in sandy, rocky well-draining loam; let soil dry between waterings', '7.0–8.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Withania somnifera',
  category = 'medicinal',
  moisture_min = 1600,
  moisture_max = 2800,
  description = 'Ayurvedic "Indian Ginseng" adaptogenic nightshade. Tuberous roots boost vitality, lower cortisol, and restore cognitive energy.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Light compost top-dressing; avoid excessive nitrogen which hinders root potency',
  emoji = '🌾',
  watering_freq = 'Every 5–8 days; drought hardy',
  overwatering_issue = 'Fleshy medicinal root rot, damping off in seedlings',
  solution = 'Plant in sandy, rocky well-draining loam; let soil dry between waterings',
  ph_need = '7.0–8.0'
WHERE name = 'Ashwagandha';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Aloe Vera Barbadensis', 'Aloe barbadensis Miller', 'medicinal', 1800, 3000, 'Renowned succulent with thick mucilaginous leaves containing acemannan. Soothes dermal burns, wounds, and gastrointestinal inflammation.', 'high', 'Low', 'Low-nitrogen succulent fertilizer diluted quarter strength twice a year', '🌵', 'Every 14–20 days', 'Soft translucent jelly leaves, black mushy root rot', 'Plant in cactus grit mix; water only when soil is 100% dry', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Aloe barbadensis Miller',
  category = 'medicinal',
  moisture_min = 1800,
  moisture_max = 3000,
  description = 'Renowned succulent with thick mucilaginous leaves containing acemannan. Soothes dermal burns, wounds, and gastrointestinal inflammation.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Low-nitrogen succulent fertilizer diluted quarter strength twice a year',
  emoji = '🌵',
  watering_freq = 'Every 14–20 days',
  overwatering_issue = 'Soft translucent jelly leaves, black mushy root rot',
  solution = 'Plant in cactus grit mix; water only when soil is 100% dry',
  ph_need = '6.5–7.5'
WHERE name = 'Aloe Vera Barbadensis';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Indian Neem', 'Azadirachta indica', 'medicinal', 1500, 2700, 'Sacred Indian "Village Pharmacy" tree. Leaves and bark yield azadirachtin, offering potent antimicrobial, antifungal, and insecticidal properties.', 'high', 'Low', 'Organic compost or bone meal once in spring', '🌳', 'Every 7–10 days; exceptionally drought-tolerant', 'Yellowing leaflets, root asphyxiation in waterlogged pots', 'Ensure deep drainage and loose sandy soil; withstands heat and drying', '6.2–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Azadirachta indica',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Sacred Indian "Village Pharmacy" tree. Leaves and bark yield azadirachtin, offering potent antimicrobial, antifungal, and insecticidal properties.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Organic compost or bone meal once in spring',
  emoji = '🌳',
  watering_freq = 'Every 7–10 days; exceptionally drought-tolerant',
  overwatering_issue = 'Yellowing leaflets, root asphyxiation in waterlogged pots',
  solution = 'Ensure deep drainage and loose sandy soil; withstands heat and drying',
  ph_need = '6.2–7.0'
WHERE name = 'Indian Neem';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Brahmi', 'Bacopa monnieri', 'medicinal', 900, 1600, 'Ayurvedic wetland nootropic herb rich in bacosides. Enhances memory retention, mental clarity, and nerve regeneration.', 'high', 'High', 'Diluted fish emulsion or organic kelp meal monthly', '🌱', 'Daily; requires consistently wet to muddy conditions', 'Almost immune to overwatering; suffers severely from drying out', 'Keep soil continuously submerged or soaking wet in saucers', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Bacopa monnieri',
  category = 'medicinal',
  moisture_min = 900,
  moisture_max = 1600,
  description = 'Ayurvedic wetland nootropic herb rich in bacosides. Enhances memory retention, mental clarity, and nerve regeneration.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Diluted fish emulsion or organic kelp meal monthly',
  emoji = '🌱',
  watering_freq = 'Daily; requires consistently wet to muddy conditions',
  overwatering_issue = 'Almost immune to overwatering; suffers severely from drying out',
  solution = 'Keep soil continuously submerged or soaking wet in saucers',
  ph_need = '6.5–7.5'
WHERE name = 'Brahmi';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Giloy Guduchi', 'Tinospora cordifolia', 'medicinal', 1400, 2500, 'Celebrated "Amrita" (root of immortality) climbing vine. Potent immunomodulator and antipyretic used to treat fevers and detoxify the liver.', 'high', 'Medium', 'Balanced organic compost twice a year', '🌿', 'Every 4–6 days', 'Stem rot at ground level, root dieback in cold stagnant water', 'Provide climbing trellis and fast-draining loamy garden soil', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Tinospora cordifolia',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Celebrated "Amrita" (root of immortality) climbing vine. Potent immunomodulator and antipyretic used to treat fevers and detoxify the liver.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic compost twice a year',
  emoji = '🌿',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Stem rot at ground level, root dieback in cold stagnant water',
  solution = 'Provide climbing trellis and fast-draining loamy garden soil',
  ph_need = '6.0–7.5'
WHERE name = 'Giloy Guduchi';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Turmeric Curcuma', 'Curcuma longa', 'medicinal', 1000, 1900, 'Golden Ayurvedic rhizome packed with anti-inflammatory curcumin. Powerfully combats cellular oxidation and joint inflammation.', 'high', 'High', 'High-potassium organic compost and vermicompost every 4 weeks', '🟡', 'Every 3–5 days during active leaf growth', 'Rhizome rot in dense un-aerated clay; fungal soft rot', 'Plant in rich, raised loose potting mix; cease watering during winter dormancy', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Curcuma longa',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Golden Ayurvedic rhizome packed with anti-inflammatory curcumin. Powerfully combats cellular oxidation and joint inflammation.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'High-potassium organic compost and vermicompost every 4 weeks',
  emoji = '🟡',
  watering_freq = 'Every 3–5 days during active leaf growth',
  overwatering_issue = 'Rhizome rot in dense un-aerated clay; fungal soft rot',
  solution = 'Plant in rich, raised loose potting mix; cease watering during winter dormancy',
  ph_need = '5.5–6.5'
WHERE name = 'Turmeric Curcuma';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Culinary Ginger', 'Zingiber officinale', 'medicinal', 1000, 1900, 'Pungent subterranean rhizome rich in gingerol. Renowned for relieving nausea, aiding digestion, and stimulating circulatory warmth.', 'medium', 'High', 'Organic compost plus liquid seaweed bi-weekly', '🫚', 'Every 4–6 days', 'Bacterial wilt and mushy brown rhizomes', 'Grow in light airy loam with generous compost; ensure thorough drainage', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Zingiber officinale',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Pungent subterranean rhizome rich in gingerol. Renowned for relieving nausea, aiding digestion, and stimulating circulatory warmth.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Organic compost plus liquid seaweed bi-weekly',
  emoji = '🫚',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Bacterial wilt and mushy brown rhizomes',
  solution = 'Grow in light airy loam with generous compost; ensure thorough drainage',
  ph_need = '5.5–6.5'
WHERE name = 'Culinary Ginger';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Peppermint', 'Mentha x piperita', 'medicinal', 1000, 1800, 'Aromatic hybrid mint loaded with natural menthol. Provides soothing relief for gastrointestinal spasms, tension headaches, and nasal congestion.', 'medium', 'High', 'Balanced NPK 10-10-10 monthly in spring and summer', '🍃', 'Every 2–4 days; keep soil evenly moist', 'Mint rust and powdery mildew if drainage is completely stalled', 'Provide bright light and good airflow; grow in dedicated pots', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Mentha x piperita',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Aromatic hybrid mint loaded with natural menthol. Provides soothing relief for gastrointestinal spasms, tension headaches, and nasal congestion.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Balanced NPK 10-10-10 monthly in spring and summer',
  emoji = '🍃',
  watering_freq = 'Every 2–4 days; keep soil evenly moist',
  overwatering_issue = 'Mint rust and powdery mildew if drainage is completely stalled',
  solution = 'Provide bright light and good airflow; grow in dedicated pots',
  ph_need = '6.0–7.0'
WHERE name = 'Peppermint';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Spearmint', 'Mentha spicata', 'medicinal', 1000, 1800, 'Sweet culinary and medicinal mint rich in carvone. Known for balancing hormones, soothing digestion, and reducing hirsutism.', 'medium', 'High', 'Liquid fish fertilizer monthly during active vegetative growth', '🌿', 'Every 2–4 days', 'Stem rot at root line under soggy cold conditions', 'Harvest regularly to stimulate airflow; maintain steady moisture', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Mentha spicata',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1800,
  description = 'Sweet culinary and medicinal mint rich in carvone. Known for balancing hormones, soothing digestion, and reducing hirsutism.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Liquid fish fertilizer monthly during active vegetative growth',
  emoji = '🌿',
  watering_freq = 'Every 2–4 days',
  overwatering_issue = 'Stem rot at root line under soggy cold conditions',
  solution = 'Harvest regularly to stimulate airflow; maintain steady moisture',
  ph_need = '6.0–7.5'
WHERE name = 'Spearmint';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Rosemary', 'Salvia rosmarinus', 'medicinal', 1600, 2900, 'Woody Mediterranean shrub rich in rosmarinic acid and carnosic acid. Enhances memory recall, cerebral circulation, and scalp health.', 'high', 'Low', 'Very light feeder: slow-release balanced pellets once in spring', '🌿', 'Every 7–10 days; allow soil to dry out between waterings', 'Lethal root rot (Phytophthora); leaves turn dark brown and crisp', 'Use gritty cactus/herb soil with perlite; never leave pot in standing saucer', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Salvia rosmarinus',
  category = 'medicinal',
  moisture_min = 1600,
  moisture_max = 2900,
  description = 'Woody Mediterranean shrub rich in rosmarinic acid and carnosic acid. Enhances memory recall, cerebral circulation, and scalp health.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Very light feeder: slow-release balanced pellets once in spring',
  emoji = '🌿',
  watering_freq = 'Every 7–10 days; allow soil to dry out between waterings',
  overwatering_issue = 'Lethal root rot (Phytophthora); leaves turn dark brown and crisp',
  solution = 'Use gritty cactus/herb soil with perlite; never leave pot in standing saucer',
  ph_need = '6.5–7.5'
WHERE name = 'Rosemary';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('German Chamomile', 'Matricaria chamomilla', 'medicinal', 1300, 2300, 'Delicate daisy-like herbal blossom rich in chamazulene and apigenin. Induces restful sleep, calms anxiety, and soothes digestion.', 'high', 'Medium', 'Light compost; excessive fertilizer reduces aromatic essential oil concentration', '🌼', 'Every 4–6 days', 'Stem collapse, damping-off, diminished flower essential oils', 'Provide 6+ hours sun and loose, moderately dry well-aerated soil', '5.6–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Matricaria chamomilla',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Delicate daisy-like herbal blossom rich in chamazulene and apigenin. Induces restful sleep, calms anxiety, and soothes digestion.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Light compost; excessive fertilizer reduces aromatic essential oil concentration',
  emoji = '🌼',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Stem collapse, damping-off, diminished flower essential oils',
  solution = 'Provide 6+ hours sun and loose, moderately dry well-aerated soil',
  ph_need = '5.6–7.5'
WHERE name = 'German Chamomile';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('English Lavender', 'Lavandula angustifolia', 'medicinal', 1700, 3000, 'Aromatic subshrub boasting violet spikes rich in linalool. Calms nervous agitation, eases insomnia, and promotes restful relaxation.', 'high', 'Low', 'Lean soil preferred; avoid nitrogen which causes weak leggy growth', '🪻', 'Every 8–14 days; highly drought resistant', 'Root rot; leaves turn dull grey-brown and entire plant wilts', 'Add horticultural grit or coarse sand; water only when soil is dry to 3 inches', '6.5–8.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Lavandula angustifolia',
  category = 'medicinal',
  moisture_min = 1700,
  moisture_max = 3000,
  description = 'Aromatic subshrub boasting violet spikes rich in linalool. Calms nervous agitation, eases insomnia, and promotes restful relaxation.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Lean soil preferred; avoid nitrogen which causes weak leggy growth',
  emoji = '🪻',
  watering_freq = 'Every 8–14 days; highly drought resistant',
  overwatering_issue = 'Root rot; leaves turn dull grey-brown and entire plant wilts',
  solution = 'Add horticultural grit or coarse sand; water only when soil is dry to 3 inches',
  ph_need = '6.5–8.0'
WHERE name = 'English Lavender';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Echinacea Purple Coneflower', 'Echinacea purpurea', 'medicinal', 1400, 2500, 'North American prairie flower containing alkylamides and polysaccharides. Activates white blood cells to combat upper respiratory infections.', 'high', 'Medium', 'Annual top dressing of compost in early spring', '🌸', 'Every 5–7 days; deep taproot withstands dry spells', 'Crown rot and fungal powdery mildew', 'Ensure well-drained loamy garden bed with unrestricted subsoil drainage', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Echinacea purpurea',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'North American prairie flower containing alkylamides and polysaccharides. Activates white blood cells to combat upper respiratory infections.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Annual top dressing of compost in early spring',
  emoji = '🌸',
  watering_freq = 'Every 5–7 days; deep taproot withstands dry spells',
  overwatering_issue = 'Crown rot and fungal powdery mildew',
  solution = 'Ensure well-drained loamy garden bed with unrestricted subsoil drainage',
  ph_need = '6.0–7.0'
WHERE name = 'Echinacea Purple Coneflower';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Kalmegh Green Chiretta', 'Andrographis paniculata', 'medicinal', 1300, 2300, 'The "King of Bitters" Ayurvedic plant containing andrographolide. Clinically proven remedy for acute cold symptoms, fevers, and hepatoprotection.', 'high', 'Medium', 'Vermicompost or balanced organic fertilizer monthly', '🌿', 'Every 3–5 days', 'Collar rot and leaf chlorosis', 'Grow in raised beds with sandy loam; water at the base of the plant', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Andrographis paniculata',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'The "King of Bitters" Ayurvedic plant containing andrographolide. Clinically proven remedy for acute cold symptoms, fevers, and hepatoprotection.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Vermicompost or balanced organic fertilizer monthly',
  emoji = '🌿',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Collar rot and leaf chlorosis',
  solution = 'Grow in raised beds with sandy loam; water at the base of the plant',
  ph_need = '6.0–7.0'
WHERE name = 'Kalmegh Green Chiretta';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Shatavari Wild Asparagus', 'Asparagus racemosus', 'medicinal', 1400, 2600, 'Ayurvedic female reproductive tonic with tuberous roots. Balances hormones, supports lactation, and acts as a cooling demulcent adaptogen.', 'high', 'Medium', 'Organic compost and wood ash twice a year', '🌾', 'Every 5–7 days; swollen roots store reserve moisture', 'Tuber rot and fungal blight of cladodes', 'Ensure deep porous container with gravel base; avoid water retention', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Asparagus racemosus',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Ayurvedic female reproductive tonic with tuberous roots. Balances hormones, supports lactation, and acts as a cooling demulcent adaptogen.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic compost and wood ash twice a year',
  emoji = '🌾',
  watering_freq = 'Every 5–7 days; swollen roots store reserve moisture',
  overwatering_issue = 'Tuber rot and fungal blight of cladodes',
  solution = 'Ensure deep porous container with gravel base; avoid water retention',
  ph_need = '6.5–7.5'
WHERE name = 'Shatavari Wild Asparagus';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Amla Indian Gooseberry', 'Phyllanthus emblica', 'medicinal', 1400, 2600, 'Sacred deciduous tree bearing astringent fruits packed with concentrated vitamin C and polyphenols. Rejuvenates tissues and enhances collagen.', 'high', 'Medium', 'Balanced organic manure and rock phosphate biannually', '🍈', 'Every 5–8 days for container trees; drought tolerant once established', 'Root rot in heavy clay; fruit drop', 'Plant in deep well-draining loamy soil with full open sun exposure', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Phyllanthus emblica',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Sacred deciduous tree bearing astringent fruits packed with concentrated vitamin C and polyphenols. Rejuvenates tissues and enhances collagen.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic manure and rock phosphate biannually',
  emoji = '🍈',
  watering_freq = 'Every 5–8 days for container trees; drought tolerant once established',
  overwatering_issue = 'Root rot in heavy clay; fruit drop',
  solution = 'Plant in deep well-draining loamy soil with full open sun exposure',
  ph_need = '6.5–7.5'
WHERE name = 'Amla Indian Gooseberry';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('West Indian Lemongrass', 'Cymbopogon citratus', 'medicinal', 1100, 2100, 'Vigorous clumping grass packed with citral essential oil. Antimicrobial, analgesic, and digestive carminative.', 'high', 'High', 'High-nitrogen organic fertilizer every 4 weeks in warm seasons', '🌾', 'Every 3–5 days', 'Basal stem rot, rust fungus in stagnant standing water', 'Provide generous pot size with unobstructed drainage holes', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Cymbopogon citratus',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'Vigorous clumping grass packed with citral essential oil. Antimicrobial, analgesic, and digestive carminative.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'High-nitrogen organic fertilizer every 4 weeks in warm seasons',
  emoji = '🌾',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Basal stem rot, rust fungus in stagnant standing water',
  solution = 'Provide generous pot size with unobstructed drainage holes',
  ph_need = '6.0–7.5'
WHERE name = 'West Indian Lemongrass';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Common Thyme', 'Thymus vulgaris', 'medicinal', 1600, 2900, 'Compact Mediterranean aromatic subshrub rich in thymol. Powerful antiseptic, expectorant, and bronchospasm reliever.', 'high', 'Low', 'Lean soil preferred; avoid rich fertilizers to preserve thymol oils', '🌿', 'Every 7–10 days; let soil dry out between waterings', 'Root rot; stems turn black and mushy at ground level', 'Pot in 50% gritty sand/perlite; ensure maximum sunlight exposure', '6.5–8.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Thymus vulgaris',
  category = 'medicinal',
  moisture_min = 1600,
  moisture_max = 2900,
  description = 'Compact Mediterranean aromatic subshrub rich in thymol. Powerful antiseptic, expectorant, and bronchospasm reliever.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Lean soil preferred; avoid rich fertilizers to preserve thymol oils',
  emoji = '🌿',
  watering_freq = 'Every 7–10 days; let soil dry out between waterings',
  overwatering_issue = 'Root rot; stems turn black and mushy at ground level',
  solution = 'Pot in 50% gritty sand/perlite; ensure maximum sunlight exposure',
  ph_need = '6.5–8.0'
WHERE name = 'Common Thyme';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Greek Oregano', 'Origanum vulgare', 'medicinal', 1500, 2800, 'Hardy Mediterranean perennial containing carvacrol and thymol. Potent natural broad-spectrum antimicrobial and digestive aid.', 'high', 'Low', 'Light compost once a year in spring', '🌿', 'Every 6–9 days', 'Root rot, loss of spicy aromatic potency, fungal leaf blight', 'Keep soil lean and rocky; let top 2 inches dry between waterings', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Origanum vulgare',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2800,
  description = 'Hardy Mediterranean perennial containing carvacrol and thymol. Potent natural broad-spectrum antimicrobial and digestive aid.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Light compost once a year in spring',
  emoji = '🌿',
  watering_freq = 'Every 6–9 days',
  overwatering_issue = 'Root rot, loss of spicy aromatic potency, fungal leaf blight',
  solution = 'Keep soil lean and rocky; let top 2 inches dry between waterings',
  ph_need = '6.5–7.5'
WHERE name = 'Greek Oregano';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Culinary Sage', 'Salvia officinalis', 'medicinal', 1500, 2700, 'Velvety grey-green Mediterranean herb packed with thujone and antioxidants. Relieves sore throats, enhances memory, and reduces night sweats.', 'high', 'Low', 'Mild organic fertilizer once in spring', '🌿', 'Every 6–9 days; let soil dry between waterings', 'Powdery mildew, root rot, yellowing lower leaves', 'Provide full direct sun and ensure soil drains within seconds', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Salvia officinalis',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Velvety grey-green Mediterranean herb packed with thujone and antioxidants. Relieves sore throats, enhances memory, and reduces night sweats.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Mild organic fertilizer once in spring',
  emoji = '🌿',
  watering_freq = 'Every 6–9 days; let soil dry between waterings',
  overwatering_issue = 'Powdery mildew, root rot, yellowing lower leaves',
  solution = 'Provide full direct sun and ensure soil drains within seconds',
  ph_need = '6.0–7.0'
WHERE name = 'Culinary Sage';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Lemon Balm', 'Melissa officinalis', 'medicinal', 1200, 2200, 'Lemon-scented mint relative rich in rosmarinic acid. Promotes GABA neurotransmitter levels, easing stress, anxiety, and cold sores.', 'medium', 'Medium', 'Balanced liquid organic fertilizer monthly in spring/summer', '🍋', 'Every 4–6 days', 'Powdery mildew on lower leaves, stem mushiness in cold soil', 'Grow in well-drained fertile loam; prune regularly for aeration', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Melissa officinalis',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Lemon-scented mint relative rich in rosmarinic acid. Promotes GABA neurotransmitter levels, easing stress, anxiety, and cold sores.',
  sunlight = 'medium',
  water_level = 'Medium',
  fertilizer = 'Balanced liquid organic fertilizer monthly in spring/summer',
  emoji = '🍋',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Powdery mildew on lower leaves, stem mushiness in cold soil',
  solution = 'Grow in well-drained fertile loam; prune regularly for aeration',
  ph_need = '6.0–7.5'
WHERE name = 'Lemon Balm';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Gotu Kola Asiatic Pennywort', 'Centella asiatica', 'medicinal', 900, 1700, 'Creeping fan-leaved wetland herb rich in asiaticoside. Accelerates skin collagen synthesis, heals ulcers, and sharpens brain focus.', 'medium', 'High', 'Organic compost and seaweed meal monthly', '🍀', 'Daily to every 2 days; prefers marshy wet soil', 'Extremely tolerant of water; drying out is fatal', 'Keep soil moist at all times; use glazed or plastic moisture-retaining pots', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Centella asiatica',
  category = 'medicinal',
  moisture_min = 900,
  moisture_max = 1700,
  description = 'Creeping fan-leaved wetland herb rich in asiaticoside. Accelerates skin collagen synthesis, heals ulcers, and sharpens brain focus.',
  sunlight = 'medium',
  water_level = 'High',
  fertilizer = 'Organic compost and seaweed meal monthly',
  emoji = '🍀',
  watering_freq = 'Daily to every 2 days; prefers marshy wet soil',
  overwatering_issue = 'Extremely tolerant of water; drying out is fatal',
  solution = 'Keep soil moist at all times; use glazed or plastic moisture-retaining pots',
  ph_need = '6.0–7.0'
WHERE name = 'Gotu Kola Asiatic Pennywort';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Moringa Miracle Tree', 'Moringa oleifera', 'medicinal', 1500, 2800, 'Fast-growing drought-tolerant tree loaded with vitamins, minerals, protein, and quercetin. Stabilizes blood sugar and reduces inflammation.', 'high', 'Low', 'Organic manure or balanced 10-10-10 every 2 months', '🌿', 'Every 6–10 days; tuberous taproot stores water', 'Sudden root rot of fleshy taproot; yellow leaf drop', 'Grow in deep sandy loam; allow soil to dry completely between cycles', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Moringa oleifera',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2800,
  description = 'Fast-growing drought-tolerant tree loaded with vitamins, minerals, protein, and quercetin. Stabilizes blood sugar and reduces inflammation.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Organic manure or balanced 10-10-10 every 2 months',
  emoji = '🌿',
  watering_freq = 'Every 6–10 days; tuberous taproot stores water',
  overwatering_issue = 'Sudden root rot of fleshy taproot; yellow leaf drop',
  solution = 'Grow in deep sandy loam; allow soil to dry completely between cycles',
  ph_need = '6.5–7.5'
WHERE name = 'Moringa Miracle Tree';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Fenugreek Methi', 'Trigonella foenum-graecum', 'medicinal', 1200, 2200, 'Annual aromatic legume yielding saponin-rich seeds and greens. Supports healthy blood glucose control and promotes lactation in nursing mothers.', 'high', 'Medium', 'Phosphate-rich fertilizer; fixates own nitrogen', '🌱', 'Every 3–5 days', 'Damping-off fungal disease, root rot in seedlings', 'Ensure well-aerated sandy soil; avoid overhead soaking', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Trigonella foenum-graecum',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Annual aromatic legume yielding saponin-rich seeds and greens. Supports healthy blood glucose control and promotes lactation in nursing mothers.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Phosphate-rich fertilizer; fixates own nitrogen',
  emoji = '🌱',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Damping-off fungal disease, root rot in seedlings',
  solution = 'Ensure well-aerated sandy soil; avoid overhead soaking',
  ph_need = '6.0–7.0'
WHERE name = 'Fenugreek Methi';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Medicinal Garlic', 'Allium sativum', 'medicinal', 1300, 2300, 'Pungent bulb loaded with allicin. Clinically supported for cardiovascular health, hypertension reduction, and broad-spectrum antimicrobial action.', 'high', 'Medium', 'High-nitrogen organic meal in early spring; stop before bulb maturation', '🧄', 'Every 4–6 days; cease watering 2 weeks prior to harvest', 'White rot (Sclerotium cepivorum), rotting of underground cloves', 'Stop watering completely when lower leaves yellow before harvest', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Allium sativum',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Pungent bulb loaded with allicin. Clinically supported for cardiovascular health, hypertension reduction, and broad-spectrum antimicrobial action.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'High-nitrogen organic meal in early spring; stop before bulb maturation',
  emoji = '🧄',
  watering_freq = 'Every 4–6 days; cease watering 2 weeks prior to harvest',
  overwatering_issue = 'White rot (Sclerotium cepivorum), rotting of underground cloves',
  solution = 'Stop watering completely when lower leaves yellow before harvest',
  ph_need = '6.0–7.0'
WHERE name = 'Medicinal Garlic';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Candyleaf Stevia', 'Stevia rebaudiana', 'medicinal', 1100, 2100, 'South American sweet shrub rich in steviol glycosides. Zero-calorie natural sweetener that does not elevate blood glucose levels.', 'high', 'Medium', 'Organic low-nitrogen fertilizer every 4 weeks', '🍃', 'Every 3–5 days; shallow feeder roots', 'Pythium root rot and black stem lesions', 'Ensure loose compost mix with perlite; never let dry bone dry or sit soaking', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Stevia rebaudiana',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2100,
  description = 'South American sweet shrub rich in steviol glycosides. Zero-calorie natural sweetener that does not elevate blood glucose levels.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic low-nitrogen fertilizer every 4 weeks',
  emoji = '🍃',
  watering_freq = 'Every 3–5 days; shallow feeder roots',
  overwatering_issue = 'Pythium root rot and black stem lesions',
  solution = 'Ensure loose compost mix with perlite; never let dry bone dry or sit soaking',
  ph_need = '6.0–7.0'
WHERE name = 'Candyleaf Stevia';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('St. John''s Wort', 'Hypericum perforatum', 'medicinal', 1400, 2500, 'Perennial with perforated leaves and bright yellow star flowers containing hypericin. Widely researched for lifting mild-to-moderate depression.', 'high', 'Medium', 'Light organic compost in spring; adapts to poor soils', '⭐', 'Every 5–7 days', 'Root rot in heavy damp soils, rust fungus', 'Provide sunny, well-draining garden soil with minimal nitrogen', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Hypericum perforatum',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Perennial with perforated leaves and bright yellow star flowers containing hypericin. Widely researched for lifting mild-to-moderate depression.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Light organic compost in spring; adapts to poor soils',
  emoji = '⭐',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Root rot in heavy damp soils, rust fungus',
  solution = 'Provide sunny, well-draining garden soil with minimal nitrogen',
  ph_need = '6.0–7.0'
WHERE name = 'St. John''s Wort';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Common Valerian', 'Valeriana officinalis', 'medicinal', 1100, 2000, 'Tall flowering herb whose pungent roots contain valerenic acid. A premier botanical sedative for combating severe insomnia and anxiety.', 'high', 'High', 'Rich compost and balanced organic fertilizer monthly', '🌸', 'Every 3–5 days; prefers rich moist soils', 'Root rot if water stagnates completely without aeration', 'Grow in rich, moisture-retentive but well-aerated organic loam', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Valeriana officinalis',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Tall flowering herb whose pungent roots contain valerenic acid. A premier botanical sedative for combating severe insomnia and anxiety.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Rich compost and balanced organic fertilizer monthly',
  emoji = '🌸',
  watering_freq = 'Every 3–5 days; prefers rich moist soils',
  overwatering_issue = 'Root rot if water stagnates completely without aeration',
  solution = 'Grow in rich, moisture-retentive but well-aerated organic loam',
  ph_need = '6.0–7.0'
WHERE name = 'Common Valerian';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Milk Thistle', 'Silybum marianum', 'medicinal', 1500, 2700, 'Spiny Mediterranean thistle with milk-veined foliage yielding silymarin. The world''s foremost botanical hepatic protector and regenerator.', 'high', 'Low', 'Minimal needs; adapts to lean agricultural soils', '🪻', 'Every 7–10 days; deeply taprooted', 'Crown rot and foliar mildew in damp stagnant climates', 'Ensure full sun, deep aeration, and minimal standing water', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Silybum marianum',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Spiny Mediterranean thistle with milk-veined foliage yielding silymarin. The world''s foremost botanical hepatic protector and regenerator.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Minimal needs; adapts to lean agricultural soils',
  emoji = '🪻',
  watering_freq = 'Every 7–10 days; deeply taprooted',
  overwatering_issue = 'Crown rot and foliar mildew in damp stagnant climates',
  solution = 'Ensure full sun, deep aeration, and minimal standing water',
  ph_need = '6.0–7.5'
WHERE name = 'Milk Thistle';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Maidenhair Ginkgo', 'Ginkgo biloba', 'medicinal', 1200, 2200, 'Ancient deciduous tree whose fan leaves yield ginkgolides and bilobalide. Protects neuronal pathways and enhances microvascular perfusion.', 'high', 'Medium', 'Balanced organic slow-release fertilizer in early spring', '💛', 'Every 4–7 days', 'Root rot in thick wet clay; leaves turn pale yellow and drop early', 'Ensure deep drainage and loose loamy soil substrate', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Ginkgo biloba',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Ancient deciduous tree whose fan leaves yield ginkgolides and bilobalide. Protects neuronal pathways and enhances microvascular perfusion.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Balanced organic slow-release fertilizer in early spring',
  emoji = '💛',
  watering_freq = 'Every 4–7 days',
  overwatering_issue = 'Root rot in thick wet clay; leaves turn pale yellow and drop early',
  solution = 'Ensure deep drainage and loose loamy soil substrate',
  ph_need = '6.0–7.0'
WHERE name = 'Maidenhair Ginkgo';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Korean Red Ginseng', 'Panax ginseng', 'medicinal', 1200, 2100, 'Precious shade-grown forest adaptogen rich in ginsenosides. Restores physical endurance, supports adrenals, and enhances longevity.', 'low', 'Medium', 'Decomposed forest leaf mold and gentle bone meal annually', '🪵', 'Every 4–6 days; must be shaded from direct sun', 'Alternaria blight, destructive root rot of valuable tuber', 'Grow under 75% shade canopy in rich, highly aerated forest loam', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Panax ginseng',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2100,
  description = 'Precious shade-grown forest adaptogen rich in ginsenosides. Restores physical endurance, supports adrenals, and enhances longevity.',
  sunlight = 'low',
  water_level = 'Medium',
  fertilizer = 'Decomposed forest leaf mold and gentle bone meal annually',
  emoji = '🪵',
  watering_freq = 'Every 4–6 days; must be shaded from direct sun',
  overwatering_issue = 'Alternaria blight, destructive root rot of valuable tuber',
  solution = 'Grow under 75% shade canopy in rich, highly aerated forest loam',
  ph_need = '5.5–6.5'
WHERE name = 'Korean Red Ginseng';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Licorice Root', 'Glycyrrhiza glabra', 'medicinal', 1300, 2400, 'Subterranean legume root yielding glycyrrhizin. A premier demulcent that coats irritated mucous membranes and supports adrenal stamina.', 'high', 'Medium', 'Organic compost applied annually in spring', '🌾', 'Every 5–7 days; deep roots search for moisture', 'Medicinal root rot in un-aerated clay', 'Plant in deep, stone-free sandy riverbed soil with full drainage', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Glycyrrhiza glabra',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2400,
  description = 'Subterranean legume root yielding glycyrrhizin. A premier demulcent that coats irritated mucous membranes and supports adrenal stamina.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic compost applied annually in spring',
  emoji = '🌾',
  watering_freq = 'Every 5–7 days; deep roots search for moisture',
  overwatering_issue = 'Medicinal root rot in un-aerated clay',
  solution = 'Plant in deep, stone-free sandy riverbed soil with full drainage',
  ph_need = '6.0–7.5'
WHERE name = 'Licorice Root';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Marshmallow Herb', 'Althaea officinalis', 'medicinal', 1000, 1900, 'Velvety coastal wetland mallow yielding thick soothing mucilage. Coats the throat, heals stomach lining, and relieves dry coughs.', 'high', 'High', 'Rich organic compost applied twice per season', '🌸', 'Every 3–5 days; thrives in damp marshy soil', 'Rust fungus on leaves in stagnant air', 'Provide high moisture with open air circulation and sunshine', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Althaea officinalis',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Velvety coastal wetland mallow yielding thick soothing mucilage. Coats the throat, heals stomach lining, and relieves dry coughs.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Rich organic compost applied twice per season',
  emoji = '🌸',
  watering_freq = 'Every 3–5 days; thrives in damp marshy soil',
  overwatering_issue = 'Rust fungus on leaves in stagnant air',
  solution = 'Provide high moisture with open air circulation and sunshine',
  ph_need = '6.0–7.5'
WHERE name = 'Marshmallow Herb';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Common Dandelion', 'Taraxacum officinale', 'medicinal', 1200, 2200, 'Prolific bitter medicinal herb. Leaves act as a gentle potassium-sparing diuretic; roots stimulate bile flow and liver cleansing.', 'high', 'Medium', 'Needs no fertilizer; thrives in ordinary garden soils', '🌼', 'Every 4–6 days', 'Powdery mildew on crowded rosette foliage', 'Allow topsoil to dry slightly; deep taproot easily accesses moisture', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Taraxacum officinale',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Prolific bitter medicinal herb. Leaves act as a gentle potassium-sparing diuretic; roots stimulate bile flow and liver cleansing.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Needs no fertilizer; thrives in ordinary garden soils',
  emoji = '🌼',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Powdery mildew on crowded rosette foliage',
  solution = 'Allow topsoil to dry slightly; deep taproot easily accesses moisture',
  ph_need = '6.0–7.5'
WHERE name = 'Common Dandelion';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Common Yarrow', 'Achillea millefolium', 'medicinal', 1500, 2700, 'Feather-leaved perennial containing achilleine. Renowned for staunching bleeding (styptic), breaking fevers, and calming menstrual cramps.', 'high', 'Low', 'Lean soil preferred; excess fertilizer causes weak sprawling stems', '🤍', 'Every 6–9 days; highly drought tolerant', 'Powdery mildew, root rot, floppy weak stems', 'Plant in lean, sandy, well-drained soil under full sun', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Achillea millefolium',
  category = 'medicinal',
  moisture_min = 1500,
  moisture_max = 2700,
  description = 'Feather-leaved perennial containing achilleine. Renowned for staunching bleeding (styptic), breaking fevers, and calming menstrual cramps.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Lean soil preferred; excess fertilizer causes weak sprawling stems',
  emoji = '🤍',
  watering_freq = 'Every 6–9 days; highly drought tolerant',
  overwatering_issue = 'Powdery mildew, root rot, floppy weak stems',
  solution = 'Plant in lean, sandy, well-drained soil under full sun',
  ph_need = '6.0–7.5'
WHERE name = 'Common Yarrow';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Pot Marigold Calendula', 'Calendula officinalis', 'medicinal', 1200, 2200, 'Vibrant golden-orange flower heads packed with flavonoids and triterpenoids. The golden standard for soothing skin wounds, burns, and rashes.', 'high', 'Medium', 'Light balanced organic fertilizer monthly', '🏵️', 'Every 3–5 days', 'Powdery mildew and root rot in stagnant damp soil', 'Water at soil level to keep flowers dry; deadhead spent blooms', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Calendula officinalis',
  category = 'medicinal',
  moisture_min = 1200,
  moisture_max = 2200,
  description = 'Vibrant golden-orange flower heads packed with flavonoids and triterpenoids. The golden standard for soothing skin wounds, burns, and rashes.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Light balanced organic fertilizer monthly',
  emoji = '🏵️',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Powdery mildew and root rot in stagnant damp soil',
  solution = 'Water at soil level to keep flowers dry; deadhead spent blooms',
  ph_need = '6.0–7.0'
WHERE name = 'Pot Marigold Calendula';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Purple Passionflower', 'Passiflora incarnata', 'medicinal', 1100, 2000, 'Intricate climbing vine yielding passiflorine. Clinically documented to boost brain GABA, alleviating acute insomnia and nervous agitation.', 'high', 'High', 'Balanced organic NPK 10-10-10 every 4 weeks in spring/summer', '💜', 'Every 3–5 days', 'Root rot in cold wet winters, fungal leaf spots', 'Provide climbing trellis and well-drained loamy compost', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Passiflora incarnata',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Intricate climbing vine yielding passiflorine. Clinically documented to boost brain GABA, alleviating acute insomnia and nervous agitation.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Balanced organic NPK 10-10-10 every 4 weeks in spring/summer',
  emoji = '💜',
  watering_freq = 'Every 3–5 days',
  overwatering_issue = 'Root rot in cold wet winters, fungal leaf spots',
  solution = 'Provide climbing trellis and well-drained loamy compost',
  ph_need = '6.0–7.0'
WHERE name = 'Purple Passionflower';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Feverfew', 'Tanacetum parthenium', 'medicinal', 1400, 2500, 'Citrus-scented daisy containing parthenolide. Renowned preventative herbal therapy for chronic migraines and arthritic stiffness.', 'high', 'Medium', 'Light organic compost in spring', '🌼', 'Every 5–7 days', 'Root rot and stem damping-off in soggy soil', 'Ensure sunny position with loose fast-draining garden soil', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Tanacetum parthenium',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2500,
  description = 'Citrus-scented daisy containing parthenolide. Renowned preventative herbal therapy for chronic migraines and arthritic stiffness.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Light organic compost in spring',
  emoji = '🌼',
  watering_freq = 'Every 5–7 days',
  overwatering_issue = 'Root rot and stem damping-off in soggy soil',
  solution = 'Ensure sunny position with loose fast-draining garden soil',
  ph_need = '6.0–7.0'
WHERE name = 'Feverfew';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Cat''s Claw Una de Gato', 'Uncaria tomentosa', 'medicinal', 1100, 2000, 'Amazonian woody climbing liana rich in oxindole alkaloids. Stimulates phagocytic immune activity and soothes chronic joint pain.', 'high', 'High', 'Organic tropical plant food every 6 weeks', '🐾', 'Every 4–6 days; rainforest native', 'Root decay if potting soil compacts and loses oxygen', 'Use chunky aerated jungle mix with bark and perlite', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Uncaria tomentosa',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'Amazonian woody climbing liana rich in oxindole alkaloids. Stimulates phagocytic immune activity and soothes chronic joint pain.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Organic tropical plant food every 6 weeks',
  emoji = '🐾',
  watering_freq = 'Every 4–6 days; rainforest native',
  overwatering_issue = 'Root decay if potting soil compacts and loses oxygen',
  solution = 'Use chunky aerated jungle mix with bark and perlite',
  ph_need = '5.5–6.5'
WHERE name = 'Cat''s Claw Una de Gato';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Huang Qi Astragalus', 'Astragalus membranaceus', 'medicinal', 1400, 2600, 'Traditional Chinese Medicine adaptogenic root. Tonifies Wei Qi (defensive energy), strengthens heart stamina, and protects telomeres.', 'high', 'Medium', 'Organic compost and rock phosphate in spring', '🌾', 'Every 5–8 days; deep taproot', 'Root rot; fleshy medicinal taproot decays in heavy wet clay', 'Plant in deep sandy loam; ensure water never pools at surface', '6.5–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Astragalus membranaceus',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Traditional Chinese Medicine adaptogenic root. Tonifies Wei Qi (defensive energy), strengthens heart stamina, and protects telomeres.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic compost and rock phosphate in spring',
  emoji = '🌾',
  watering_freq = 'Every 5–8 days; deep taproot',
  overwatering_issue = 'Root rot; fleshy medicinal taproot decays in heavy wet clay',
  solution = 'Plant in deep sandy loam; ensure water never pools at surface',
  ph_need = '6.5–7.5'
WHERE name = 'Huang Qi Astragalus';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Golden Root Rhodiola', 'Rhodiola rosea', 'medicinal', 1600, 2800, 'Arctic alpine succulent root containing salidroside and rosavins. Banishes physical fatigue, altitude sickness, and mental burnout.', 'high', 'Low', 'Minimal; native to nutrient-poor rocky scree', '💛', 'Every 7–10 days; hates excessive humidity and heat', 'Root rot and stem melting under hot humid wet conditions', 'Grow in 70% volcanic rock grit; keep cool with exceptional air movement', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Rhodiola rosea',
  category = 'medicinal',
  moisture_min = 1600,
  moisture_max = 2800,
  description = 'Arctic alpine succulent root containing salidroside and rosavins. Banishes physical fatigue, altitude sickness, and mental burnout.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Minimal; native to nutrient-poor rocky scree',
  emoji = '💛',
  watering_freq = 'Every 7–10 days; hates excessive humidity and heat',
  overwatering_issue = 'Root rot and stem melting under hot humid wet conditions',
  solution = 'Grow in 70% volcanic rock grit; keep cool with exceptional air movement',
  ph_need = '6.0–7.0'
WHERE name = 'Golden Root Rhodiola';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Black Elderberry', 'Sambucus nigra', 'medicinal', 1100, 2000, 'European deciduous shrub bearing anthocyanin-rich dark berries and flowers. Shortens viral influenza duration and stimulates immune defense.', 'high', 'High', 'Annual top dressing of rich compost and manure in early spring', '🫐', 'Every 3–5 days; moisture loving', 'Canker and root rot in stagnant boggy mud', 'Provide fertile, moisture-retentive but draining loam soil', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Sambucus nigra',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 2000,
  description = 'European deciduous shrub bearing anthocyanin-rich dark berries and flowers. Shortens viral influenza duration and stimulates immune defense.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Annual top dressing of rich compost and manure in early spring',
  emoji = '🫐',
  watering_freq = 'Every 3–5 days; moisture loving',
  overwatering_issue = 'Canker and root rot in stagnant boggy mud',
  solution = 'Provide fertile, moisture-retentive but draining loam soil',
  ph_need = '6.0–7.0'
WHERE name = 'Black Elderberry';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Mountain Arnica', 'Arnica montana', 'medicinal', 1300, 2300, 'Alpine meadow blossom containing helenalin. Legendary topical remedy for healing blunt trauma bruises, sprains, and muscle soreness.', 'high', 'Medium', 'Acid-friendly organic compost; sensitive to excess lime or calcium', '🌼', 'Every 4–6 days; requires cool mountain conditions', 'Root rot in warm heavy soil; highly sensitive to stagnant moisture', 'Plant in acidic sandy peat mix; ensure rapid free drainage', '5.0–6.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Arnica montana',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Alpine meadow blossom containing helenalin. Legendary topical remedy for healing blunt trauma bruises, sprains, and muscle soreness.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Acid-friendly organic compost; sensitive to excess lime or calcium',
  emoji = '🌼',
  watering_freq = 'Every 4–6 days; requires cool mountain conditions',
  overwatering_issue = 'Root rot in warm heavy soil; highly sensitive to stagnant moisture',
  solution = 'Plant in acidic sandy peat mix; ensure rapid free drainage',
  ph_need = '5.0–6.0'
WHERE name = 'Mountain Arnica';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Russian Comfrey', 'Symphytum officinale', 'medicinal', 1000, 1900, 'Traditional "Knitbone" herb containing allantoin. Promotes rapid cellular division to accelerate bone fracture, tendon, and tissue healing.', 'high', 'High', 'Heavy feeder: liquid compost tea and mulch; dynamic nutrient accumulator', '🌿', 'Every 3–5 days; robust taproot', 'Crown rot during winter dormancy in waterlogged soil', 'Ensure well-drained fertile loam; virtually indestructible in growing season', '6.0–7.0')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Symphytum officinale',
  category = 'medicinal',
  moisture_min = 1000,
  moisture_max = 1900,
  description = 'Traditional "Knitbone" herb containing allantoin. Promotes rapid cellular division to accelerate bone fracture, tendon, and tissue healing.',
  sunlight = 'high',
  water_level = 'High',
  fertilizer = 'Heavy feeder: liquid compost tea and mulch; dynamic nutrient accumulator',
  emoji = '🌿',
  watering_freq = 'Every 3–5 days; robust taproot',
  overwatering_issue = 'Crown rot during winter dormancy in waterlogged soil',
  solution = 'Ensure well-drained fertile loam; virtually indestructible in growing season',
  ph_need = '6.0–7.0'
WHERE name = 'Russian Comfrey';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Goldenseal', 'Hydrastis canadensis', 'medicinal', 1100, 1900, 'Woodland woodland perennial with yellow knotted rhizomes containing berberine and hydrastine. Potent mucous membrane astringent and antimicrobial.', 'low', 'High', 'Decayed rich hardwood leaf mulch and bone meal annually', '💛', 'Every 3–5 days; shade-dwelling forest plant', 'Rhizome rot in heavy stagnant clay', 'Plant under dense shade canopy in rich, highly aerated humus soil', '5.5–6.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Hydrastis canadensis',
  category = 'medicinal',
  moisture_min = 1100,
  moisture_max = 1900,
  description = 'Woodland woodland perennial with yellow knotted rhizomes containing berberine and hydrastine. Potent mucous membrane astringent and antimicrobial.',
  sunlight = 'low',
  water_level = 'High',
  fertilizer = 'Decayed rich hardwood leaf mulch and bone meal annually',
  emoji = '💛',
  watering_freq = 'Every 3–5 days; shade-dwelling forest plant',
  overwatering_issue = 'Rhizome rot in heavy stagnant clay',
  solution = 'Plant under dense shade canopy in rich, highly aerated humus soil',
  ph_need = '5.5–6.5'
WHERE name = 'Goldenseal';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Vasaka Malabar Nut', 'Justicia adhatoda', 'medicinal', 1300, 2300, 'Ayurvedic respiratory shrub containing the alkaloid vasicine. Acts as a potent natural bronchodilator, expectorant, and cough suppressant.', 'high', 'Medium', 'Organic compost applied every 2 months during active growth', '🌿', 'Every 4–6 days', 'Leaf drop and root rot in waterlogged pots', 'Plant in well-draining loamy garden soil with full sun exposure', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Justicia adhatoda',
  category = 'medicinal',
  moisture_min = 1300,
  moisture_max = 2300,
  description = 'Ayurvedic respiratory shrub containing the alkaloid vasicine. Acts as a potent natural bronchodilator, expectorant, and cough suppressant.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic compost applied every 2 months during active growth',
  emoji = '🌿',
  watering_freq = 'Every 4–6 days',
  overwatering_issue = 'Leaf drop and root rot in waterlogged pots',
  solution = 'Plant in well-draining loamy garden soil with full sun exposure',
  ph_need = '6.0–7.5'
WHERE name = 'Vasaka Malabar Nut';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Haritaki Chebulic Myrobalan', 'Terminalia chebula', 'medicinal', 1400, 2600, 'Revered Ayurvedic "King of Medicines" tree and cornerstone of Triphala. Cleanses the colon, sharpens intellect, and aids digestive fire.', 'high', 'Medium', 'Organic manure and rock phosphate once in spring', '🌳', 'Every 6–9 days; drought tolerant once established', 'Root rot in poorly draining clay beds', 'Ensure deep aeration and full open sunlight; allow soil to dry between waterings', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Terminalia chebula',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Revered Ayurvedic "King of Medicines" tree and cornerstone of Triphala. Cleanses the colon, sharpens intellect, and aids digestive fire.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic manure and rock phosphate once in spring',
  emoji = '🌳',
  watering_freq = 'Every 6–9 days; drought tolerant once established',
  overwatering_issue = 'Root rot in poorly draining clay beds',
  solution = 'Ensure deep aeration and full open sunlight; allow soil to dry between waterings',
  ph_need = '6.0–7.5'
WHERE name = 'Haritaki Chebulic Myrobalan';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Baheda Bibhitaki', 'Terminalia bellirica', 'medicinal', 1400, 2600, 'Key Triphala medicinal tree. Nut fruits balance Kapha dosha, relieve chronic asthma, detoxify plasma, and promote vocal cord clarity.', 'high', 'Medium', 'Organic compost applied biannually', '🌳', 'Every 6–9 days', 'Seedling damping-off and root asphyxiation', 'Plant in deep sandy loam; provide unobstructed deep drainage', '6.0–7.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Terminalia bellirica',
  category = 'medicinal',
  moisture_min = 1400,
  moisture_max = 2600,
  description = 'Key Triphala medicinal tree. Nut fruits balance Kapha dosha, relieve chronic asthma, detoxify plasma, and promote vocal cord clarity.',
  sunlight = 'high',
  water_level = 'Medium',
  fertilizer = 'Organic compost applied biannually',
  emoji = '🌳',
  watering_freq = 'Every 6–9 days',
  overwatering_issue = 'Seedling damping-off and root asphyxiation',
  solution = 'Plant in deep sandy loam; provide unobstructed deep drainage',
  ph_need = '6.0–7.5'
WHERE name = 'Baheda Bibhitaki';

INSERT INTO plants (name, scientific_name, category, moisture_min, moisture_max, description, sunlight, water_level, fertilizer, emoji, watering_freq, overwatering_issue, solution, ph_need)
VALUES ('Alexandrian Senna', 'Senna alexandrina', 'medicinal', 1600, 2900, 'Desert shrub whose pods and leaflets yield sennosides. The world''s leading natural stimulant laxative for short-term constipation relief.', 'high', 'Low', 'Minimal needs; tolerates arid nutrient-poor desert soils', '🌾', 'Every 8–14 days; desert plant', 'Rapid root rot and fungal stem collapse in moist soil', 'Plant in sandy gravel mix; water sparingly and provide maximum heat and sun', '7.0–8.5')
ON CONFLICT (id) DO NOTHING;

UPDATE plants SET
  scientific_name = 'Senna alexandrina',
  category = 'medicinal',
  moisture_min = 1600,
  moisture_max = 2900,
  description = 'Desert shrub whose pods and leaflets yield sennosides. The world''s leading natural stimulant laxative for short-term constipation relief.',
  sunlight = 'high',
  water_level = 'Low',
  fertilizer = 'Minimal needs; tolerates arid nutrient-poor desert soils',
  emoji = '🌾',
  watering_freq = 'Every 8–14 days; desert plant',
  overwatering_issue = 'Rapid root rot and fungal stem collapse in moist soil',
  solution = 'Plant in sandy gravel mix; water sparingly and provide maximum heat and sun',
  ph_need = '7.0–8.5'
WHERE name = 'Alexandrian Senna';

