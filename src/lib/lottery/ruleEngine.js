function parseCsvLine(line) {
  const fields = [];
  let field = '';
  let quoted = false;

  for (let index = 0; index < line.length; index += 1) {
    const character = line[index];
    if (character === '"') {
      if (quoted && line[index + 1] === '"') {
        field += '"';
        index += 1;
      } else {
        quoted = !quoted;
      }
    } else if (character === ',' && !quoted) {
      fields.push(field.trim());
      field = '';
    } else {
      field += character;
    }
  }

  fields.push(field.trim());
  return fields;
}

function parseRuleText(text) {
  return String(text)
    .split(/\r?\n/)
    .map(line => line.trim())
    .filter(Boolean)
    .map(parseCsvLine)
    .filter(fields => fields.some(Boolean));
}

const EMBEDDED_RULE_TEXT = Object.freeze({
  brade: `10,"00"
1,"01"
1,"10"
2,"02"
2,"20"
2,"11"
3,"03"
3,"30"
3,"12"
3,"21"
4,"04"
4,"40"
4,"13"
4,"31"
4,"22"
5,"05"
5,"50"
5,"14"
5,"41"
5,"23"
5,"32"
6,"06"
6,"60"
6,"15"
6,"51"
6,"24"
6,"42"
6,"33"
7,"07"
7,"70"
7,"16"
7,"61"
7,"25"
7,"52"
7,"34"
7,"43"
8,"08"
8,"80"
8,"17"
8,"71"
8,"26"
8,"62"
8,"35"
8,"53"
8,"44"
9,"09"
9,"90"
9,"18"
9,"81"
9,"27"
9,"72"
9,"36"
9,"63"
9,"45"
9,"54"
10,"19"
10,"91"
10,"28"
10,"82"
10,"37"
10,"73"
10,"46"
10,"64"
10,"55"
1,"29"
1,"92"
1,"38"
1,"83"
1,"47"
1,"74"
1,"56"
1,"65"
2,"39"
2,"93"
2,"48"
2,"84"
2,"57"
2,"75"
2,"66"
3,"49"
3,"94"
3,"58"
3,"85"
3,"67"
3,"76"
4,"59"
4,"95"
4,"68"
4,"86"
4,"77"
5,"69"
5,"96"
5,"78"
5,"87"
6,"79"
6,"97"
6,"88"
7,"89"
7,"98"
8,"99"`,
  power: `"05"
"50"
"16"
"61"
"27"
"72"
"38"
"83"
"94"
"49"`,
  apoo: `"00"
"11"
"22"
"33"
"44"
"55"
"66"
"77"
"88"
"99"`,
  netKhat: `"07"
"70"
"18"
"81"
"24"
"42"
"35"
"53"
"69"
"96"`,
  brother: `"01"
"10"
"12"
"21"
"23"
"32"
"34"
"43"
"45"
"54"
"56"
"65"
"67"
"76"
"78"
"87"
"89"
"98"
"09"
"90"`,
  sm: `"SS","00"
"SS","02"
"SS","04"
"SS","06"
"SS","08"
"SS","20"
"SS","22"
"SS","24"
"SS","26"
"SS","28"
"SS","40"
"SS","42"
"SS","44"
"SS","46"
"SS","48"
"SS","60"
"SS","62"
"SS","64"
"SS","66"
"SS","68"
"SS","80"
"SS","82"
"SS","84"
"SS","86"
"SS","88"
"MM","11"
"MM","13"
"MM","15"
"MM","17"
"MM","19"
"MM","31"
"MM","33"
"MM","35"
"MM","37"
"MM","39"
"MM","51"
"MM","53"
"MM","55"
"MM","57"
"MM","59"
"MM","71"
"MM","73"
"MM","75"
"MM","77"
"MM","79"
"MM","91"
"MM","93"
"MM","95"
"MM","97"
"MM","99"
"SM","01"
"SM","03"
"SM","05"
"SM","07"
"SM","09"
"SM","21"
"SM","23"
"SM","25"
"SM","27"
"SM","29"
"SM","41"
"SM","43"
"SM","45"
"SM","47"
"SM","49"
"SM","61"
"SM","63"
"SM","65"
"SM","67"
"SM","69"
"SM","81"
"SM","83"
"SM","85"
"SM","87"
"SM","89"
"MS","10"
"MS","12"
"MS","14"
"MS","16"
"MS","18"
"MS","30"
"MS","32"
"MS","34"
"MS","36"
"MS","38"
"MS","50"
"MS","52"
"MS","54"
"MS","56"
"MS","58"
"MS","70"
"MS","72"
"MS","74"
"MS","76"
"MS","78"
"MS","90"
"MS","92"
"MS","94"
"MS","96"
"MS","98"
"PP","00"
"PP","11"
"PP","22"
"PP","33"
"PP","44"
"PP","55"
"PP","66"
"PP","77"
"PP","88"
"PP","99"`
});

const DEFAULT_RULE_TABLES = Object.freeze({
  ...Object.fromEntries(
    Object.entries(EMBEDDED_RULE_TEXT).map(([rule, text]) => [rule, parseRuleText(text)])
  ),
  part: Array.from({ length: 100 }, (_, number) => [
    Math.max(Math.floor(number / 10), number % 10),
    String(number).padStart(2, '0')
  ])
});

function normalizeTwoDigit(value) {
  const text = String(value ?? '').trim();
  if (!/^\d{1,2}$/.test(text)) {
    return null;
  }
  return text.padStart(2, '0');
}

function weightedRows(rows) {
  return rows.map(([weight, number]) => ({
    number: normalizeTwoDigit(number),
    weight: Number(weight)
  })).filter(row => row.number !== null && Number.isFinite(row.weight));
}

function pairRows(rows) {
  return rows.map(([number]) => normalizeTwoDigit(number))
    .filter(Boolean)
    .map(number => ({ number }));
}

function smRows(rows) {
  return rows.map(([flag, number]) => ({
    flag: String(flag).trim().toUpperCase(),
    number: normalizeTwoDigit(number)
  })).filter(row => row.number !== null && row.flag);
}

function buildIndexes(tables) {
  return {
    brade: new Map(tables.brade.map(row => [row.number, row])),
    power: new Set(tables.power.map(row => row.number)),
    apoo: new Set(tables.apoo.map(row => row.number)),
    netKhat: new Set(tables.netKhat.map(row => row.number)),
    part: new Map(tables.part.map(row => [row.number, row])),
    brother: new Set(tables.brother.map(row => row.number)),
    sm: new Map(tables.sm.map(row => [row.number, row.flag]))
  };
}

function createRuleEngine(tables = DEFAULT_RULE_TABLES) {
  const normalizedTables = {
    brade: weightedRows(tables.brade ?? []),
    power: pairRows(tables.power ?? []),
    apoo: pairRows(tables.apoo ?? []),
    netKhat: pairRows(tables.netKhat ?? []),
    part: weightedRows(tables.part ?? []),
    sm: smRows(tables.sm ?? []),
    brother: pairRows(tables.brother ?? [])
  };
  const indexes = buildIndexes(normalizedTables);

  function evaluate(number) {
    const normalizedNumber = normalizeTwoDigit(number);
    if (normalizedNumber === null) {
      return { number: null, valid: false, matches: [] };
    }

    const matches = [];
    const addMatch = (rule, row = {}) => matches.push({ rule, number: normalizedNumber, ...row });

    if (indexes.brade.has(normalizedNumber)) {
      addMatch('Brade', indexes.brade.get(normalizedNumber));
    }
    if (indexes.power.has(normalizedNumber)) {
      addMatch('Power');
    }
    if (indexes.apoo.has(normalizedNumber)) {
      addMatch('APoo');
    }
    if (indexes.netKhat.has(normalizedNumber)) {
      addMatch('NetKhat');
    }
    if (indexes.part.has(normalizedNumber)) {
      addMatch('Part', indexes.part.get(normalizedNumber));
    }
    if (indexes.brother.has(normalizedNumber)) {
      addMatch('Brother');
    }
    if (indexes.sm.has(normalizedNumber)) {
      addMatch('SM', { flag: indexes.sm.get(normalizedNumber) });
    }

    return { number: normalizedNumber, valid: true, matches };
  }

  function evaluateMany(numbers) {
    return [...numbers].map(evaluate);
  }

  return { tables: normalizedTables, evaluate, evaluateMany };
}

export {
  DEFAULT_RULE_TABLES,
  createRuleEngine,
  normalizeTwoDigit,
  parseRuleText
};