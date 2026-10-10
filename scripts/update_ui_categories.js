const fs = require('fs');

const seederCode = fs.readFileSync('./scripts/seed_150_plants.js', 'utf8');

function extractArray(varName) {
  const startMarker = `const ${varName} = [`;
  const startIdx = seederCode.indexOf(startMarker);
  if (startIdx === -1) return [];
  const endIdx = seederCode.indexOf('];', startIdx);
  const jsonStr = seederCode.substring(startIdx + startMarker.length - 1, endIdx + 1);
  return eval(jsonStr);
}

const tropical = extractArray('tropicalPlants');
const bonsai = extractArray('bonsaiPlants');
const medicinal = extractArray('medicinalPlants');

console.log(`Loaded from seeder: ${tropical.length} Tropical, ${bonsai.length} Bonsai, ${medicinal.length} Medicinal`);

let html = fs.readFileSync('soiliq_ui.html', 'utf8');

// 1. Update CSS badges
const cssOld = `.cat-vegetables { background: rgba(56, 189, 248, 0.12); color: #38bdf8; border: 1px solid rgba(56, 189, 248, 0.25); }`;
const cssNew = `.cat-tropical   { background: rgba(16, 185, 129, 0.15); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.35); }
    .cat-bonsai     { background: rgba(245, 158, 11, 0.15); color: #f59e0b; border: 1px solid rgba(245, 158, 11, 0.35); }
    .cat-medicinal  { background: rgba(14, 165, 233, 0.15); color: #0ea5e9; border: 1px solid rgba(14, 165, 233, 0.35); }
    .cat-vegetables { background: rgba(56, 189, 248, 0.12); color: #38bdf8; border: 1px solid rgba(56, 189, 248, 0.25); }`;

if (html.includes(cssOld) && !html.includes('.cat-tropical')) {
  html = html.replace(cssOld, cssNew);
  console.log('Updated CSS category badges.');
}

// 2. Build updated PLANT_CATEGORIES
const plantCategoriesCode = `const PLANT_CATEGORIES = [
      { id: 'all', label: 'All Plants', emoji: '🌱' },
      { id: 'tropical', label: 'Tropical Plants', emoji: '🌴' },
      { id: 'bonsai', label: 'Bonsai', emoji: '🎋' },
      { id: 'medicinal', label: 'Medicinal Plants', emoji: '🌿' },
      { id: 'vegetables', label: 'Vegetables & Crops', emoji: '🍅' },
      { id: 'fruits', label: 'Fruits & Trees', emoji: '🍎' },
      { id: 'herbs', label: 'Herbs & Spices', emoji: '🍃' },
      { id: 'houseplants', label: 'Houseplants', emoji: '🪴' },
      { id: 'flowers', label: 'Flowers', emoji: '🌸' },
      { id: 'succulents', label: 'Succulents & Cacti', emoji: '🌵' }
    ];`;

// 3. Build updated PLANT_CATEGORY_MAP
let mapEntries = [];

// Add 50 Tropical
mapEntries.push('      // 🌴 Tropical Plants (50 Species)');
tropical.forEach(p => {
  mapEntries.push(`      '${p.name.replace(/'/g, "\\'")}': 'tropical',`);
});

// Add 50 Bonsai
mapEntries.push('\n      // 🎋 Bonsai (50 Species)');
bonsai.forEach(p => {
  mapEntries.push(`      '${p.name.replace(/'/g, "\\'")}': 'bonsai',`);
});

// Add 50 Medicinal
mapEntries.push('\n      // 🌿 Medicinal Plants (50 Species)');
medicinal.forEach(p => {
  mapEntries.push(`      '${p.name.replace(/'/g, "\\'")}': 'medicinal',`);
});

// Add existing crops
mapEntries.push(`\n      // Vegetables & Root Crops
      'Tomato': 'vegetables', 'Potato': 'vegetables', 'Carrot': 'vegetables', 'Onion': 'vegetables',
      'Garlic': 'vegetables', 'Spinach': 'vegetables', 'Lettuce': 'vegetables', 'Cabbage': 'vegetables',
      'Broccoli': 'vegetables', 'Cauliflower': 'vegetables', 'Bell Pepper': 'vegetables', 'Chili': 'vegetables',
      'Cucumber': 'vegetables', 'Zucchini': 'vegetables', 'Pumpkin': 'vegetables', 'Bean (Green)': 'vegetables',
      'Pea': 'vegetables', 'Peanut': 'vegetables', 'Sweet Potato': 'vegetables', 'Radish': 'vegetables',
      'Beetroot': 'vegetables', 'Corn': 'vegetables', 'Wheat': 'vegetables', 'Asparagus': 'vegetables',
      'Eggplant': 'vegetables', 'Kale': 'vegetables', 'Leek': 'vegetables',

      // Fruits & Orchard Trees
      'Apple Tree': 'fruits', 'Orange Tree': 'fruits', 'Lemon Tree': 'fruits', 'Mango': 'fruits',
      'Banana': 'fruits', 'Papaya': 'fruits', 'Peach Tree': 'fruits', 'Pear Tree': 'fruits',
      'Cherry Tree': 'fruits', 'Avocado': 'fruits', 'Guava': 'fruits', 'Pomegranate': 'fruits',
      'Pineapple': 'fruits', 'Melon': 'fruits', 'Watermelon': 'fruits', 'Strawberry': 'fruits',
      'Blueberry': 'fruits', 'Grape Vine': 'fruits', 'Coconut': 'fruits', 'Tamarind': 'fruits',

      // Herbs & Spices
      'Basil': 'herbs', 'Mint': 'herbs', 'Coriander': 'herbs', 'Saffron': 'herbs',

      // Houseplants
      'Snake Plant': 'houseplants', 'ZZ Plant': 'houseplants', 'Money Plant': 'houseplants',

      // Flowers & Ornamentals
      'Rose': 'flowers', 'Jasmine': 'flowers', 'Hibiscus': 'flowers', 'Marigold': 'flowers',
      'Chrysanthemum': 'flowers', 'Daisy': 'flowers', 'Petunia': 'flowers', 'Hydrangea': 'flowers',
      'Geranium': 'flowers', 'Tulip': 'flowers', 'Lily': 'flowers', 'Orchid': 'flowers',
      'Sunflower': 'flowers', 'Hosta': 'flowers',

      // Succulents & Specialty
      'Cactus': 'succulents', 'Succulent': 'succulents', 'Jade Plant': 'succulents',
      'Dragon Fruit': 'succulents', 'Bamboo': 'succulents', 'Lotus': 'succulents', 'Venus Flytrap': 'succulents'`);

const plantCategoryMapCode = `const PLANT_CATEGORY_MAP = {\n${mapEntries.join('\n')}\n    };`;

// Replace from "const PLANT_CATEGORIES = [" up to "};" before "function getPlantCategory(p)"
const catStartMarker = 'const PLANT_CATEGORIES = [';
const mapEndMarker = 'function getPlantCategory(p)';

const startIdx = html.indexOf(catStartMarker);
const endIdx = html.indexOf(mapEndMarker);

if (startIdx !== -1 && endIdx !== -1) {
  const replacement = `${plantCategoriesCode}\n\n    ${plantCategoryMapCode}\n\n    `;
  html = html.substring(0, startIdx) + replacement + html.substring(endIdx);
  fs.writeFileSync('soiliq_ui.html', html, 'utf8');
  console.log('Successfully updated PLANT_CATEGORIES and PLANT_CATEGORY_MAP in soiliq_ui.html!');
} else {
  console.error('Could not locate PLANT_CATEGORIES or getPlantCategory markers in soiliq_ui.html');
}
