const fs = require('fs');

const SB_URL = 'https://mwfbxspdxzvfhchbngoj.supabase.co';
const SB_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13ZmJ4c3BkeHp2ZmhjaGJuZ29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY5NjI4NTUsImV4cCI6MjA5MjUzODg1NX0.KV9NF4qAtxibpGfDfDLRZO4RM0WMKrF4sWMwcJWStzY';

// Read seeder file content to extract the plant lists without re-running seedDatabase
const seederCode = fs.readFileSync('./scripts/seed_150_plants.js', 'utf8');

function extractArray(varName) {
  const match = seederCode.match(new RegExp(`const ${varName} = \\[(\\s|\\S)*?\\];`));
  if (!match) return [];
  // Evaluate safely
  return eval(match[0].replace(`const ${varName} =`, ''));
}

const tropical = extractArray('tropicalPlants');
const bonsai = extractArray('bonsaiPlants');
const medicinal = extractArray('medicinalPlants');

console.log('Extracted:', {
  tropical: tropical.length,
  bonsai: bonsai.length,
  medicinal: medicinal.length
});

// Build mapping
const map = {};
tropical.forEach(p => { map[p.name] = 'tropical'; });
bonsai.forEach(p => { map[p.name] = 'bonsai'; });
medicinal.forEach(p => { map[p.name] = 'medicinal'; });

async function verify() {
  const res = await fetch(`${SB_URL}/rest/v1/plants?select=*`, {
    headers: { apikey: SB_KEY, Authorization: `Bearer ${SB_KEY}` }
  });
  const plants = await res.json();
  console.log('Fetched total plants:', plants.length);

  const counts = {
    tropical: 0,
    bonsai: 0,
    medicinal: 0,
    other: 0
  };

  const categorized = {
    tropical: [],
    bonsai: [],
    medicinal: []
  };

  plants.forEach(p => {
    let cat = map[p.name];
    if (!cat) {
      const n = (p.name || '').toLowerCase();
      if (n.includes('bonsai')) cat = 'bonsai';
      else if (n.includes('tropical')) cat = 'tropical';
    }
    if (cat === 'tropical') { counts.tropical++; categorized.tropical.push(p.name); }
    else if (cat === 'bonsai') { counts.bonsai++; categorized.bonsai.push(p.name); }
    else if (cat === 'medicinal') { counts.medicinal++; categorized.medicinal.push(p.name); }
    else counts.other++;
  });

  console.log('\n--- VERIFICATION COUNTS ---');
  console.log('🌴 Tropical:', counts.tropical);
  console.log('🎋 Bonsai:', counts.bonsai);
  console.log('🌿 Medicinal:', counts.medicinal);
  console.log('🌱 Other:', counts.other);
  console.log('Total:', plants.length);

  if (counts.tropical !== 50) {
    console.log('Discrepancy in tropical. List:', categorized.tropical);
  }
  if (counts.bonsai !== 50) {
    console.log('Discrepancy in bonsai. List:', categorized.bonsai);
  }
  if (counts.medicinal !== 50) {
    console.log('Discrepancy in medicinal. List:', categorized.medicinal);
  }
}

verify().catch(console.error);
