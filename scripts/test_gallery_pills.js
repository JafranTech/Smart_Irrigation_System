const fs = require('fs');

const SB_URL = 'https://mwfbxspdxzvfhchbngoj.supabase.co';
const SB_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13ZmJ4c3BkeHp2ZmhjaGJuZ29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY5NjI4NTUsImV4cCI6MjA5MjUzODg1NX0.KV9NF4qAtxibpGfDfDLRZO4RM0WMKrF4sWMwcJWStzY';

const html = fs.readFileSync('soiliq_ui.html', 'utf8');

const catStart = html.indexOf('const PLANT_CATEGORIES = [');
const catEnd = html.indexOf('function getCategoryInfo(catId)', catStart);

const snippet = html.substring(catStart, catEnd);
// Wrap in a function that returns an object
const fn = new Function(`${snippet}; return { PLANT_CATEGORIES, PLANT_CATEGORY_MAP, getPlantCategory };`);
const { PLANT_CATEGORIES, PLANT_CATEGORY_MAP, getPlantCategory } = fn();

console.log('Categories defined:', PLANT_CATEGORIES.map(c => `${c.emoji} ${c.label} (${c.id})`));

async function runTest() {
  const res = await fetch(`${SB_URL}/rest/v1/plants?select=*`, {
    headers: { apikey: SB_KEY, Authorization: `Bearer ${SB_KEY}` }
  });
  const plants = await res.json();
  console.log(`\nFetched ${plants.length} plants from Supabase.`);

  const counts = { all: plants.length };
  PLANT_CATEGORIES.forEach(c => { if (c.id !== 'all') counts[c.id] = 0; });

  plants.forEach(p => {
    const cat = getPlantCategory(p);
    if (counts[cat] !== undefined) {
      counts[cat]++;
    } else {
      console.warn(`Unmatched category '${cat}' for plant: ${p.name}`);
    }
  });

  console.log('\n========================================');
  console.log('LIVE UI BOTANY GALLERY CATEGORY PILL COUNTS:');
  console.log('========================================');
  PLANT_CATEGORIES.forEach(c => {
    console.log(`${c.emoji} ${c.label.padEnd(25)} : ${counts[c.id]} plants`);
  });
  console.log('========================================');

  // Assertions for user request
  if (counts['tropical'] === 50 && counts['bonsai'] === 50 && counts['medicinal'] === 50) {
    console.log('\nSUCCESS! Exactly 50 Tropical Plants, 50 Bonsai, and 50 Medicinal Plants verified live in SoilIQ!');
  } else {
    console.error('\nFAIL: Category counts do not match requested 50 each!');
    process.exit(1);
  }
}

runTest().catch(console.error);
