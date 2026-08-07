# frmLG Rules Engine Report

## Purpose

`frmLG_rules.js` is a self-contained JavaScript rule engine derived from the rule data exported under `db/` and the restriction queries recovered from `raw_decompile/frmLG.frm`.

The module does not read `.txt` files at runtime. All required rule data is embedded in the JavaScript module.

## Source Queries

The original VB6 form loads these rule families through database queries:

| Rule | Recovered query |
|---|---|
| Brade | `SELECT * FROM Brade WHERE Brade=...` |
| Power | `SELECT * FROM POWER` |
| APoo | `SELECT * FROM APoo` |
| NetKhat | `SELECT * FROM NetKhat` |
| Part | `SELECT * FROM Part WHERE Part=...` |
| SM | `SELECT * FROM SM WHERE Flag='SS'` and related flags |
| Brother | `SELECT * FROM Brother` |

The query locations are documented in `raw_decompile/frmLG.frm` at the previously identified decompiler locations for Brade, Power, APoo, NetKhat, Part, SM, and Brother.

## Raw Data Files

The source data is stored in the workspace `db/` folder:

| File | Raw rows | Data shape |
|---|---:|---|
| `Brade.txt` | 100 | `weight,number` |
| `Power.txt` | 10 | `number` |
| `APoo.txt` | 10 | `number` |
| `NetKhat.txt` | 10 | `number` |
| `Part.txt` | 190 | `weight,number` |
| `SM.txt` | 110 | `flag,number` |
| `Brother.txt` | 20 | `number` |

The source files contain quoted number values and comma-separated weighted or flagged rows.

## Embedded Data

The embedded data is held in `EMBEDDED_RULE_TEXT` in `frmLG_rules.js`.

It is parsed once into `DEFAULT_RULE_TABLES` when the module is loaded. The default table sizes exposed by the engine are:

```text
Brade:   100 rows
Power:    10 rows
APoo:     10 rows
NetKhat:  10 rows
Part:    100 effective rows
SM:      110 rows
Brother:  20 rows
```

### Part duplicate handling

`Part.txt` contains 190 raw rows with duplicate numbers. The original lookup behavior uses a map keyed by the two-digit number, so the last effective row for a number replaces earlier rows.

The embedded Part representation therefore contains one effective entry for every number from `00` through `99`. Its effective weight is the larger digit:

```text
05 -> weight 5
16 -> weight 6
50 -> weight 5
99 -> weight 9
```

This preserves the result used by the JavaScript lookup index rather than retaining duplicate rows that cannot coexist in the map.

## Number Normalization

`normalizeTwoDigit(value)` accepts one- or two-digit numeric input:

```text
5   -> "05"
05  -> "05"
50  -> "50"
abc -> null
123 -> null
```

Whitespace is removed before validation. Values outside one or two decimal digits are invalid.

## Parsing

`parseCsvLine(line)` parses one embedded CSV row and supports quoted fields.

`parseRuleText(text)` then:

1. Splits the text into lines.
2. Trims whitespace.
3. Removes blank lines.
4. Parses each row as CSV.
5. Returns an array of fields.

The parser is retained for the embedded data format; it does not access the filesystem.

## Rule Table Conversion

The engine converts the parsed rows into normalized objects:

### Weighted rules

Used by Brade and Part:

```js
{ number: '05', weight: 5 }
```

### Pair rules

Used by Power, APoo, NetKhat, and Brother:

```js
{ number: '05' }
```

### SM rules

Used by SM:

```js
{ flag: 'SM', number: '05' }
```

The supported SM flags found in the raw data are:

```text
SS
MM
SM
MS
PP
```

## Index Construction

`buildIndexes(tables)` creates fast lookup structures:

| Rule | Index |
|---|---|
| Brade | `Map<number, row>` |
| Power | `Set<number>` |
| APoo | `Set<number>` |
| NetKhat | `Set<number>` |
| Part | `Map<number, row>` |
| Brother | `Set<number>` |
| SM | `Map<number, flag>` |

This makes each rule check constant-time for a normalized number.

## Evaluation Algorithm

`createRuleEngine()` builds the normalized tables and indexes. `evaluate(number)` then follows this flow:

```text
1. Normalize input to a two-digit number.
2. Reject invalid input.
3. Check Brade and return its weight if present.
4. Check Power.
5. Check APoo.
6. Check NetKhat.
7. Check Part and return its weight if present.
8. Check Brother.
9. Check SM and return its flag if present.
10. Return all matches together.
```

A number can match multiple rule families at the same time.

## API

```js
import { createRuleEngine } from './frmLG_rules.js';

const rules = createRuleEngine();

const result = rules.evaluate('05');
const results = rules.evaluateMany(['00', '01', '05', '50']);
```

The result for valid input has this shape:

```js
{
  number: '05',
  valid: true,
  matches: [
    { rule: 'Brade', number: '05', weight: 5 },
    { rule: 'Power', number: '05' },
    { rule: 'Part', number: '05', weight: 5 },
    { rule: 'SM', number: '05', flag: 'SM' }
  ]
}
```

Invalid input returns:

```js
{
  number: null,
  valid: false,
  matches: []
}
```

## Verified Examples

### Number `05`

```text
Brade  -> weight 5
Power  -> matched
Part   -> weight 5
SM     -> flag SM
```

### Number `01`

```text
Brade  -> weight 1
Part   -> weight 1
Brother -> matched
SM     -> flag SM
```

### Number `00`

```text
Brade -> weight 10
APoo  -> matched
Part  -> weight 0
SM    -> flag PP
```

## Validation

The module was executed with Node.js using the default embedded tables.

Validation confirmed:

- All seven rule families load without filesystem access.
- Expected embedded row counts are present.
- `05`, `01`, and `00` return the expected combined matches.
- No JavaScript errors were reported by the workspace error checker.
- No `.txt`, `node:fs`, `readFile`, or `db/` reference remains in `frmLG_rules.js`.

## Accuracy Boundary

This algorithm accurately reproduces the available lookup data and the recovered table-oriented restriction behavior.

It does not claim to reproduce undocumented VB6 calculations that depend on transaction totals, agent state, session state, or database fields not present in the exported rule files. Those higher-level checks should call this engine and then apply their transaction-specific limits separately.
