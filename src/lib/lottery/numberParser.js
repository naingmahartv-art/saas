/**
 * Lottery Number Expression Parser
 *
 * Parses the custom input language used in the VB6 frmLGEnt / frmLG forms
 * (txtNum_Change / cmdSave_Click, decompiled from raw_decompile/frmLGEnt.frm).
 *
 * Input charset (from decompiled VB6):
 *   "012S3456789RPBWNFAXT+-/*.[]SZDG"
 *
 * Grammar (informal) — there is NO delimiter between a number and its amount;
 * amounts are read as the run of digits that follows, up to the next modifier
 * letter or the end of the token:
 *
 *   expression  = group (' ' group)*
 *   group       = token ('+' token)*
 *   token       = modifier* digit digit amount (modifier amount)*
 *   modifier    = R|P|B|W|N|F|A|X|T|S|Z|D|G
 *   amount      = digit+
 *   digit       = 0-9
 *   '.'         = shorthand for "00"
 *
 * e.g. "20300R200" → base number "20" gets 300, then modifier "R" (reverse)
 * applies to the base number "20" → reverse "02" gets 200.
 * Result: { 20: 300, 02: 200 }
 *
 * Modifier semantics (A, R, W, N, B, P, F, X, T confirmed; others are injectable via config):
 *   A   → expand to the APoo table (00,11,22,...,99) — confirmed
 *   R   → reverse of the base number (12 → 21), gets its OWN amount — confirmed
 *   W   → "Power", fixed 10-number table from ruleEngine.js (05,50,16,61,27,72,38,83,94,49) — confirmed
 *   N   → "NetKhat", fixed 10-number table from ruleEngine.js (07,70,18,81,24,42,35,53,69,96) — confirmed
 *   X   → "Brother", fixed 20-number table from ruleEngine.js — confirmed
 *   T   → "Thai NetKhat", fixed 10-number table (09,13,26,31,47,58,62,74,85,90) — confirmed
 *   B   → "Brade": num is a WEIGHT 1-10 (not a lottery number), e.g. "1B"/"5B"/"10B"
 *         ("0B" == "10B") — expands to the 10 Brade-table numbers sharing that weight — confirmed
 *   P   → "Part": num is a SEED DIGIT 0-9 (not a lottery number), e.g. "1P"
 *         — expands to every number containing that digit, 19 numbers — confirmed
 *   F   → "Series": num is a SEED DIGIT 0-9, e.g. "1F" — expands to the tens-D
 *         series D0-D9 (10 numbers), EXCEPT "0F" starts at 01, skipping "00"
 *         (9 numbers) — confirmed
 *   others → injected via expandModifier(modifier, num, amount) in config
 *
 * A/W/N/X/T behave like a table lookup: standalone (no digits before the letter,
 * e.g. "A100") expands to the WHOLE table; with a specific number attached
 * (e.g. "22A100") it only keeps that number if it's actually in the table,
 * otherwise it's dropped. B and P instead treat the preceding digits as a
 * weight/seed key, not a real lottery number, and always expand.
 *
 * Parity flags — confirmed: "+"=even, "-"=odd, "S"="+", "M"="-". A 2-char
 * prefix with no base number, e.g. "SM30" or "+-30" (both mean the same
 * thing): SS/++ = tens even & units even, MM/-- = tens odd & units odd,
 * SM/+- = tens even & units odd, MS/-+ = tens odd & units even. Each group
 * has 25 numbers (doubles like 00/22/44/66/88 stay in their parity group).
 *
 * Brackets — confirmed: "[digits]amount" is a digit-pool Cartesian product —
 * every 2-digit number where BOTH digits come from the bracketed set, e.g.
 * "[23]100" -> 22,23,32,33 all at 100. Duplicate digits collapse to a set,
 * so "[00]" is the same as "[0]" -> just "00".
 *
 * Special keys:
 *   Space  → commit current group
 *   Enter  → commit and finalise all
 *   '.'    → replaced by "00"
 *   50-entry hard limit (VB6 original: "Too Large. Cann't Add. Please save!!")
 */

import { createRuleEngine } from './ruleEngine.js';

const RULE_TABLES = createRuleEngine().tables;
const APOO_NUMBERS = RULE_TABLES.apoo.map(row => row.number);
const POWER_NUMBERS = RULE_TABLES.power.map(row => row.number);
const NETKHAT_NUMBERS = RULE_TABLES.netKhat.map(row => row.number);
const BROTHER_NUMBERS = RULE_TABLES.brother.map(row => row.number);

// Thai NetKhat: fixed 10-number table (not part of ruleEngine.js — specific to
// the "T" modifier in this input grammar).
const THAI_NETKHAT_NUMBERS = ['09','13','26','31','47','58','62','74','85','90'];

// Parity flag groups (25 numbers each, from ruleEngine.js's raw SM table —
// doubles like 00/22/44/66/88 stay in their parity group here, unlike the
// PP-override used by classifyNumber()).
// "+"=even, "-"=odd, "S"="+", "M"="-": SS=++ (tens even,units even),
// MM=-- (tens odd,units odd), SM=+- (tens even,units odd), MS=-+ (tens odd,units even).
const SM_GROUPS = new Map();
for (const row of RULE_TABLES.sm) {
  if (row.flag === 'PP') continue;
  const arr = SM_GROUPS.get(row.flag) || [];
  arr.push(row.number);
  SM_GROUPS.set(row.flag, arr);
}
const PARITY_FLAG_ALIASES = { '++': 'SS', '--': 'MM', '+-': 'SM', '-+': 'MS', SS: 'SS', MM: 'MM', SM: 'SM', MS: 'MS' };
const PARITY_FLAG_RE = /^(\+\+|\+-|-\+|--|SS|MM|MS|SM)(\d*)$/;

// Brade weight (1-10) -> the 10 numbers sharing that weight, e.g. "1B" -> 01,10,29,38,47,56,65,74,83,92
const BRADE_BY_WEIGHT = new Map();
for (const row of RULE_TABLES.brade) {
  const arr = BRADE_BY_WEIGHT.get(row.weight) || [];
  arr.push(row.number);
  BRADE_BY_WEIGHT.set(row.weight, arr);
}

const MAX_ENTRIES = 50;

// All two-digit numbers 00–99
const ALL_NUMBERS = Array.from({ length: 100 }, (_, i) => String(i).padStart(2, '0'));

/**
 * Default modifier expander.
 * Extend this in config.expandModifier to add R, P, B, W, N, F, X, T, S, Z, D, G semantics
 * once their meaning is confirmed by the user.
 *
 * @param {string} modifier - single letter modifier
 * @param {string} num      - two-digit number string "00"–"99", or null if standalone
 * @param {number} amount   - bet amount
 * @returns {{ num: string, amount: number }[]}
 */
function defaultExpandModifier(modifier, num, amount, baseIncluded) {
  switch (modifier.toUpperCase()) {
    case 'A':
      // APoo: all same-digit numbers (00,11,...,99)
      // +A = even doubles (00,22,44,66,88)
      // -A = odd doubles (11,33,55,77,99)
      if (num === '+' || num === 'EVEN') {
        return ['00', '22', '44', '66', '88'].map(n => ({ num: n, amount }));
      }
      if (num === '-' || num === 'ODD') {
        return ['11', '33', '55', '77', '99'].map(n => ({ num: n, amount }));
      }
      if (num) {
        return APOO_NUMBERS.includes(num) ? [{ num, amount }] : [];
      }
      return APOO_NUMBERS.map(n => ({ num: n, amount }));

    case 'R': {
      // Reverse: two cases, depending on whether an amount was typed
      // between the base number and "R".
      //   "78300R200" (300 typed before R) → base already added with its
      //     OWN amount — R only contributes the reverse, with its own
      //     amount: 78/300, 87/200 (independent amounts).
      //   "34R300" (nothing typed before R) → base was NOT added yet — R's
      //     amount applies to BOTH the base and its reverse: 34/300, 43/300.
      if (!num) return [];
      const reversed = num[1] + num[0];
      if (reversed === num) {
        return baseIncluded ? [] : [{ num, amount }];
      }
      if (baseIncluded) return [{ num: reversed, amount }];
      return [{ num, amount }, { num: reversed, amount }];
    }

    case 'W':
      // Power (nicknamed "W"): fixed 10-number table from ruleEngine.js
      // (05,50,16,61,27,72,38,83,94,49). If a number is given, only include
      // it if it's a Power number.
      if (num) {
        return POWER_NUMBERS.includes(num) ? [{ num, amount }] : [];
      }
      return POWER_NUMBERS.map(n => ({ num: n, amount }));

    case 'P': {
      // Part: `num` isn't a lottery number — it's the seed digit 0-9
      // (e.g. "1P" -> digit 1). Expands to every number CONTAINING that
      // digit in either position — 19 numbers (includes both "D0" and "0D").
      if (!num) return [];
      const digit = num[1];
      const out = [];
      for (let t = 0; t <= 9; t++) out.push({ num: `${t}${digit}`, amount });
      for (let u = 0; u <= 9; u++) {
        const n = `${digit}${u}`;
        if (!out.some(e => e.num === n)) out.push({ num: n, amount });
      }
      return out;
    }

    case 'N':
      // NetKhat: fixed 10-number table from ruleEngine.js (07,70,18,81,24,42,35,53,69,96).
      // If a number is given, only include it if it's a NetKhat number.
      if (num) {
        return NETKHAT_NUMBERS.includes(num) ? [{ num, amount }] : [];
      }
      return NETKHAT_NUMBERS.map(n => ({ num: n, amount }));

    case 'B': {
      // Brade: here `num` isn't a lottery number — it's the weight 1-10
      // (e.g. "1B", "5B", "10B"). "0B" is equivalent to "10B".
      // Expands to the 10 Brade-table numbers sharing that weight.
      if (!num) return [];
      let weight = parseInt(num, 10);
      if (weight === 0) weight = 10;
      const numbers = BRADE_BY_WEIGHT.get(weight) || [];
      return numbers.map(n => ({ num: n, amount }));
    }

    case 'F': {
      // Series:
      // Case 1: Digit AFTER F (e.g. F1300 -> BACK_1) -> Units digit fixed to d (01,11,21,...,91)
      // Case 2: Digit BEFORE F (e.g. 1F300 -> 01) -> Tens digit fixed to d (10,11,12,...,19)
      if (!num) return [];

      if (typeof num === 'string' && num.startsWith('BACK_')) {
        const unitDigit = num.replace('BACK_', '');
        const out = [];
        for (let t = 0; t <= 9; t++) {
          out.push({ num: `${t}${unitDigit}`, amount });
        }
        return out;
      }

      const digit = num.length === 2 ? num[1] : num[0];
      const start = digit === '0' ? 1 : 0;
      const out = [];
      for (let u = start; u <= 9; u++) out.push({ num: `${digit}${u}`, amount });
      return out;
    }

    case 'X':
      // Brother: fixed 20-number table from ruleEngine.js. Standalone use
      // only (e.g. "X100"). If a number is given, only include it if it's
      // a Brother number.
      if (num) {
        return BROTHER_NUMBERS.includes(num) ? [{ num, amount }] : [];
      }
      return BROTHER_NUMBERS.map(n => ({ num: n, amount }));

    case 'T':
      // Thai NetKhat: fixed 10-number table (09,13,26,31,47,58,62,74,85,90).
      // Standalone use only (e.g. "T100"). If a number is given, only
      // include it if it's a Thai NetKhat number.
      if (num) {
        return THAI_NETKHAT_NUMBERS.includes(num) ? [{ num, amount }] : [];
      }
      return THAI_NETKHAT_NUMBERS.map(n => ({ num: n, amount }));

    // Placeholders — return the number as-is until user confirms meanings
    // User should override these in config.expandModifier
    case 'S':
    case 'Z':
    case 'D':
    case 'G':
    default:
      if (!num) return [];
      return [{ num, amount }];
  }
}

/**
 * Parse a single token like "20300R200", "A200", "T00300", "1650".
 *
 * There is no delimiter between a number and its amount: the base number is
 * always the first two digits, and every amount is simply the run of digits
 * that follows — up to the next modifier letter, or the end of the token.
 * Each modifier letter introduces its own trailing amount, e.g.
 * "20300R200" → base "20" gets 300, then "R" (reverse of "20") gets 200.
 *
 * @param {string} token    - the token string (letters + digits, e.g. "20300R200")
 * @param {Function} expand - modifier expansion function
 * @returns {{ num: string, amount: number }[]}
 */
function parseToken(token, expand) {
  token = token.toUpperCase().trim();
  if (!token) return [];

  // Parity flags (++/--/+-/-+/SS/MM/SM/MS) are a fixed 2-char prefix with
  // no base number — handled separately since they don't fit the
  // digit/letter-modifier grammar below (e.g. "SM30" is one flag, not the
  // modifiers "S" then "M").
  const parityMatch = token.match(PARITY_FLAG_RE);
  if (parityMatch) {
    const flag = PARITY_FLAG_ALIASES[parityMatch[1]];
    const amount = parseFloat(parityMatch[2]) || 0;
    return (SM_GROUPS.get(flag) || []).map(n => ({ num: n, amount }));
  }

  // Bracket digit-pool: "[23]100" -> every 2-digit number where BOTH digits
  // come from the set inside the brackets (Cartesian product of the set with
  // itself), e.g. [23] -> 22,23,32,33. Duplicate digits collapse to a set,
  // so [00] is just [0] -> 00.
  // If 'A' (or 'a') is present inside the brackets (e.g. "[A123]100"), exclude
  // pairs where the front digit equals the back digit (e.g. 11, 22, 33).
  const bracketMatch = token.match(/^\[([A-Z0-9]+)\](\d*)$/i);
  if (bracketMatch) {
    const rawContent = bracketMatch[1].toUpperCase();
    const excludeDoubles = rawContent.includes('A');
    const digitChars = rawContent.replace(/[^0-9]/g, '');
    const digits = [...new Set(digitChars.split(''))];
    const amount = parseFloat(bracketMatch[2]) || 0;
    const out = [];
    for (const t of digits) {
      for (const u of digits) {
        if (excludeDoubles && t === u) continue;
        out.push({ num: `${t}${u}`, amount });
      }
    }
    return out;
  }

  // Helper for trailing modifiers on prefix matches (+A, -A, Fd, dF)
  function expandTrail(baseItems, trail, expFn) {
    if (!trail) return baseItems;
    const results = [...baseItems];
    let idx = 0;
    const readTrailDigits = () => {
      let start = idx;
      while (idx < trail.length && /[0-9]/.test(trail[idx])) idx++;
      return trail.slice(start, idx);
    };
    while (idx < trail.length) {
      const mod = trail[idx];
      if (!/[A-Z]/.test(mod)) { idx++; continue; }
      idx++;
      const amt = parseFloat(readTrailDigits()) || 0;
      for (const item of baseItems) {
        results.push(...expFn(mod, item.num, amt, true));
      }
    }
    return results;
  }

  // +A (Even Apoo) e.g. "+A300" or "+A300R200"
  const plusAMatch = token.match(/^\+A(\d*)([A-Z0-9]*)$/i);
  if (plusAMatch) {
    const amount = parseFloat(plusAMatch[1]) || 0;
    const trail = plusAMatch[2];
    const baseItems = expand('A', '+', amount, false);
    return expandTrail(baseItems, trail, expand);
  }

  // -A (Odd Apoo) e.g. "-A300" or "-A300R200"
  const minusAMatch = token.match(/^-A(\d*)([A-Z0-9]*)$/i);
  if (minusAMatch) {
    const amount = parseFloat(minusAMatch[1]) || 0;
    const trail = minusAMatch[2];
    const baseItems = expand('A', '-', amount, false);
    return expandTrail(baseItems, trail, expand);
  }

  // Fd (Digit AFTER F, e.g. F1300, F2300, F0300)
  const fBackMatch = token.match(/^F([0-9])(\d*)([A-Z0-9]*)$/i);
  if (fBackMatch) {
    const unitDigit = fBackMatch[1];
    const amount = parseFloat(fBackMatch[2]) || 0;
    const trail = fBackMatch[3];
    const baseItems = expand('F', `BACK_${unitDigit}`, amount, false);
    return expandTrail(baseItems, trail, expand);
  }

  // dF (Digit BEFORE F, e.g. 1F300, 2F300, 0F300)
  const fFrontMatch = token.match(/^([0-9])F(\d*)([A-Z0-9]*)$/i);
  if (fFrontMatch) {
    const tensDigit = fFrontMatch[1];
    const amount = parseFloat(fFrontMatch[2]) || 0;
    const trail = fFrontMatch[3];
    const baseItems = expand('F', `0${tensDigit}`, amount, false);
    return expandTrail(baseItems, trail, expand);
  }


  let i = 0;
  const results = [];

  const readDigits = () => {
    let start = i;
    while (i < token.length && /[0-9]/.test(token[i])) i++;
    return token.slice(start, i);
  };

  // Leading modifiers before any digits (e.g. "A200" — no base number)
  let leadingMods = '';
  while (i < token.length && /[A-Z]/.test(token[i])) {
    leadingMods += token[i];
    i++;
  }

  // Base number — exactly the first two digits (single digit is left-padded).
  // Only advance past those 1-2 chars so readDigits() below still has the
  // remaining digits available to read as the amount.
  let num = null;
  if (!leadingMods) {
    let digits = '';
    while (i < token.length && /[0-9]/.test(token[i]) && digits.length < 2) {
      digits += token[i];
      i++;
    }
    if (digits.length === 1) num = '0' + digits;
    else if (digits.length === 2) num = digits;
  }

  // The amount immediately following the base number (or leading modifiers)
  const firstAmount = parseFloat(readDigits()) || 0;
  const baseIncluded = Boolean(num && firstAmount > 0);

  if (leadingMods) {
    for (const mod of leadingMods) {
      results.push(...expand(mod, null, firstAmount, baseIncluded));
    }
  } else if (baseIncluded) {
    // Skip when firstAmount is 0 — that happens when a single-digit seed
    // (e.g. "1" in "1P100") was left-padded into `num` but has no amount
    // of its own; the seed isn't a real bet, just input to the modifier below.
    results.push({ num, amount: firstAmount });
  }

  // Remaining modifier+amount pairs, each with its own explicit amount
  while (i < token.length) {
    const mod = token[i];
    if (!/[A-Z]/.test(mod)) { i++; continue; }
    i++;
    const amt = parseFloat(readDigits()) || 0;
    results.push(...expand(mod, num, amt, baseIncluded));
  }

  return results;
}

/**
 * Validate syntax of an individual token (e.g. "32P100", "3R100", "AP300").
 * Returns an error string if the token is invalid, or null if valid.
 */
function validateTokenSyntax(token) {
  const t = token.toUpperCase().trim();
  if (!t) return null;

  // 1. Check AP / PA combined (e.g. AP300)
  if (/AP|PA/i.test(t)) {
    return `'${t}' is not allowed. Cannot combine 'A' (Apoo) and 'P' (Part). Use 'A300' for Apoo or '3P300' for Part.`;
  }

  // 2. Check 2 digits before P (e.g. 32P100)
  const twoDigitPMatch = t.match(/^(\d{2,})P/i);
  if (twoDigitPMatch) {
    return `'${t}' is not allowed. 'P' (Part) requires a single-digit seed (e.g. 2P100 or 3P100), not multiple digits like '${twoDigitPMatch[1]}P'.`;
  }

  // 3. Check 1 digit before R (e.g. 3R100)
  const singleDigitRMatch = t.match(/^(\d{1})R/i);
  if (singleDigitRMatch) {
    return `'${t}' is not allowed. 'R' (Reverse) requires a 2-digit number (e.g. 03R100), not 1 digit like '${singleDigitRMatch[1]}R'.`;
  }

  // 4. Check 2 digits before F (e.g. 12F100)
  const twoDigitFMatch = t.match(/^(\d{2,})F/i);
  if (twoDigitFMatch) {
    return `'${t}' is not allowed. 'F' (Series) requires a single-digit seed (e.g. 1F100), not multiple digits like '${twoDigitFMatch[1]}F'.`;
  }

  // 5. Check B (Brade) weight
  const bMatch = t.match(/^(\d*)B/i);
  if (bMatch) {
    const rawWeight = bMatch[1];
    if (!rawWeight) {
      return `'${t}' is not allowed. 'B' (Brade) requires a weight digit (e.g. 1B100 or 5B100).`;
    }
    const weightNum = parseInt(rawWeight, 10);
    if (weightNum > 10) {
      return `'${t}' is not allowed. 'B' (Brade) weight must be 0 to 10, not '${rawWeight}'.`;
    }
  }

  // 6. Check unknown modifier letters
  const ALLOWED_LETTERS = new Set(['A','R','W','N','B','P','F','X','T','S','Z','D','G','M']);
  const letters = t.replace(/[^A-Z]/g, '');
  for (const char of letters) {
    if (!ALLOWED_LETTERS.has(char)) {
      return `'${t}' contains invalid modifier letter '${char}'.`;
    }
  }

  return null;
}

/**
 * Parse a number expression string into an array of { num, amount } bets.
 *
 * @param {string} expression - e.g. "20300R200 45500 A100"
 * @param {object} config
 * @param {number}   [config.maxEntries=50]         - max entries allowed
 * @param {Function} [config.expandModifier]        - override modifier semantics
 * @returns {{ entries: { num: string, amount: number }[], error: string|null }}
 */
export function parseNumberExpression(expression, config = {}) {
  const maxEntries = config.maxEntries ?? MAX_ENTRIES;
  const expand = config.expandModifier
    ? (mod, num, amt) => config.expandModifier(mod, num, amt) ?? defaultExpandModifier(mod, num, amt)
    : defaultExpandModifier;

  if (!expression || !expression.trim()) {
    return { entries: [], error: null };
  }

  // Clean commas and '=' signs, and replace '.' with '00' before splitting
  const normalised = expression.trim().replace(/,/g, '').replace(/=/g, ' ').replace(/\./g, '00');

  // Split by space — each group is committed independently
  const groups = normalised.split(/\s+/).filter(Boolean);

  const allEntries = [];

  for (const group of groups) {
    // Parity-flag groups (++/--/+-/-+/SS/MM/SM/MS) and +A/-A shortcodes are single tokens —
    // don't split them on '+'/'*' below (parseToken handles them directly).
    if (PARITY_FLAG_RE.test(group.toUpperCase()) || /^(\+|-)?A/i.test(group)) {
      const syntaxErr = validateTokenSyntax(group);
      if (syntaxErr) return { entries: [], error: syntaxErr };

      const expanded = parseToken(group, expand);
      if (expanded.length === 0) {
        return { entries: [], error: `'${group}' is not allowed. Invalid expression or missing bet amount.` };
      }
      allEntries.push(...expanded);
      continue;
    }

    // '+' and '*' chain multiple independent number+amount entries together
    // within one group, e.g. "20300+45200" = 20/300 and 45/200
    const tokens = group.split(/[+*]/);

    for (const token of tokens) {
      const trimmed = token.trim();
      if (!trimmed) continue;

      const syntaxErr = validateTokenSyntax(trimmed);
      if (syntaxErr) return { entries: [], error: syntaxErr };

      const expanded = parseToken(trimmed, expand);
      if (expanded.length === 0) {
        return { entries: [], error: `'${trimmed}' is not allowed. Invalid expression or missing bet amount.` };
      }
      allEntries.push(...expanded);
    }
  }

  if (allEntries.length > maxEntries) {
    return {
      entries: [],
      error: `Too Large. Can't Add. Please save!! (${allEntries.length} entries, max ${maxEntries})`,
    };
  }

  return { entries: allEntries, error: null };
}

/**
 * Classify a two-digit number's SM flag, per the real SM table confirmed
 * against src/lib/lottery/ruleEngine.js (all 100 numbers 00-99 verified):
 *   SS = tens even, units even   (e.g. 02, 20, 22)
 *   MM = tens odd,  units odd    (e.g. 13, 31, 33)
 *   SM = tens even, units odd    (e.g. 05, 21)
 *   MS = tens odd,  units even   (e.g. 10, 32)
 *   PP = doubles (00,11,...,99) — overrides the parity flag above
 *
 * @param {string} num - two-digit number "00"–"99"
 * @returns {{ flag: 'SS'|'MM'|'SM'|'MS'|'PP' }}
 */
export function classifyNumber(num) {
  const tens = parseInt(num[0], 10);
  const units = parseInt(num[1], 10);

  let flag;
  if (tens === units) flag = 'PP';
  else if (tens % 2 === 0 && units % 2 === 0) flag = 'SS';
  else if (tens % 2 === 1 && units % 2 === 1) flag = 'MM';
  else if (tens % 2 === 0 && units % 2 === 1) flag = 'SM';
  else flag = 'MS';

  return { flag };
}

/**
 * Check if a number is an APoo number (both digits the same).
 * @param {string} num
 */
export function isApoo(num) {
  return num.length === 2 && num[0] === num[1];
}

/**
 * Get all numbers that share a digit with the given number.
 * Used for Part restriction checks.
 * @param {string} num
 */
export function getPartNumbers(digit) {
  return ALL_NUMBERS.filter(n => n[0] === digit || n[1] === digit);
}

/**
 * Validate a parsed entry against restriction tables.
 *
 * @param {{ num: string, amount: number }} entry
 * @param {object} restrictions - loaded restriction data
 * @param {string[]}  restrictions.notBuy     - blocked numbers
 * @param {string[]}  restrictions.hot        - hot (warn) numbers
 * @param {number}    restrictions.limit      - max bet per number (0 = no limit)
 * @param {object}    restrictions.totals     - { [num]: currentTotal } running totals
 * @returns {{ valid: boolean, warnings: string[], errors: string[] }}
 */
export function validateEntry(entry, restrictions = {}) {
  const warnings = [];
  const errors = [];

  const { num, amount } = entry;
  const { notBuy = [], hot = [], limit = 0, totals = {} } = restrictions;

  if (notBuy.includes(num)) {
    errors.push(`${num} is in the Not-Buy list`);
  }

  if (hot.includes(num)) {
    warnings.push(`${num} is a hot number`);
  }

  if (limit > 0) {
    const currentTotal = totals[num] || 0;
    if (currentTotal + amount > limit) {
      errors.push(`${num} exceeds limit (current: ${currentTotal}, adding: ${amount}, limit: ${limit})`);
    }
  }

  return {
    valid: errors.length === 0,
    warnings,
    errors,
  };
}

export { APOO_NUMBERS, ALL_NUMBERS, MAX_ENTRIES };
