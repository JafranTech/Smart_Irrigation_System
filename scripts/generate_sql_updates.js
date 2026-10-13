const fs = require('fs');
const { PLANT_TRANSLATIONS } = require('./plant_translations_data.js');
const plants = JSON.parse(fs.readFileSync('scripts/plants_list.json', 'utf8'));

function escapeSql(str) {
  if (!str) return 'NULL';
  return "'" + str.replace(/'/g, "''") + "'";
}

const sqlLines = plants.map(p => {
  const trans = PLANT_TRANSLATIONS[p.name];
  const ta = escapeSql(trans.ta);
  const hi = escapeSql(trans.hi);
  const ko = escapeSql(trans.ko);
  const id = escapeSql(p.id);
  return `UPDATE plants SET name_ta = ${ta}, name_hi = ${hi}, name_ko = ${ko} WHERE id = ${id};`;
});

fs.writeFileSync('scripts/update_plant_translations.sql', sqlLines.join('\n'), 'utf8');
console.log('Successfully generated', sqlLines.length, 'SQL update statements.');
