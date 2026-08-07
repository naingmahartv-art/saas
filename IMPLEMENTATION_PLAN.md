# VB6 Lottery System → Next.js SaaS — Implementation Plan

## Application Summary

The source app is a **Thai lottery betting management system** (two-digit ledger/sale entry) used by lottery agent businesses. It runs on VB6 with DAO/MDB databases, MSFlexGrid grids, Crystal Reports, and floppy-disk/network data sync.

This plan migrates it to the existing `saas-platform` (Next.js 15 + SQLite + JWT) with the 3-tier hierarchy:

| Tier | VB6 equivalent | Role in lottery system |
|---|---|---|
| Project Owner (super_admin) | System administrator | Manages all agent businesses |
| Organization | Lottery agent shop | One business per org |
| User (org_admin / user) | Staff / data entry operators | Enter bets, run reports |

---

## Phase 1 — Database Schema Extension

Extend `src/lib/db/schema.js` and `src/lib/db/index.js` with all lottery tables.

### New tables

```
sessions          OnCount, AMPM (AM/PM/Full), OnDate, orgId — current betting session
rates             RateID, Num1Rate, Num2Rate, orgId — payout rates
agents            AgentID, AgentName, Address, Phone, Commission, Rate, orgId
lg                SrNo, OnCount, AMPM, OnDate, MachineID, AgentName, Num1, Amount, orgId
lgDetail          id, SrNo, OnCount, AMPM, AgentName, Num1, Value, Post, orgId
lgSale            SrNo, OnCount, AMPM, OnDate, AgentID, orgId
lgSaleDetail      id, SrNo, OnCount, AMPM, Num, Value, orgId
balance           id, AgentName, Amount, OnDate, orgId
receive           id, AgentName, Amount, OnDate, OnCount, AMPM, orgId
luckyNo           id, OnDate, AMPM, LNo, orgId
hotNumbers        id, OnCount, Num, orgId
notBuyNumbers     id, OnCount, Num, orgId
limits            id, LimitValue, orgId
restrictions      id, type (Power|Brade|APoo|NetKhat|Part|SM|Brother), Num, orgId
keyConfig         id, KeyValue, orgId
```

### Key design decisions

- All tables carry `orgId` for multi-tenancy (each org has isolated data)
- Replace `MachineID`/`MachineIP` concept with per-user session identity
- Replace shared `Tmp*` tables with per-request computation (avoids multi-user collisions)
- Replace Crystal Reports `.rpt` files with server-side aggregation queries + JSON responses rendered as web tables/charts

---

## Phase 2 — Core Infrastructure

### 2a. Session management

File: `src/lib/lottery/session.js`

```js
// Current betting session state per org
// OnCount = sequential round number (e.g. 1, 2, 3...)
// AMPM = 'AM' | 'PM' | 'FULL'
// OnDate = date string YYYY-MM-DD

getActiveSession(orgId)
setActiveSession(orgId, { onCount, ampm, onDate })
```

Page: `src/app/org/[orgId]/session/page.js`
- Select current OnCount from dropdown (populated from existing LG records)
- Select AMPM
- Set date
- Maps to `frmOnCount.frm`

### 2b. Rate configuration

File: `src/lib/lottery/rates.js`

Page: `src/app/org/[orgId]/settings/rates/page.js`
- Edit payout rates (maps to Rate table)
- Maps to `modMain.bas loadRate`

### 2c. Number expression parser

File: `src/lib/lottery/numberParser.js`

This is the most critical piece. The VB6 `txtNum_KeyPress` accepts:

```
Characters: 0-9 R P B W N F A X + - / * . [ ] T
Special:    Space = process group
            .     = append "00"
            Enter = commit entry
            50-entry limit
            4-position group wrap (increments OnCount sub-index)
```

The parser must:
- Accept a multi-expression string like `12/50 34/30 56.`
- Split by space into groups
- Expand `.` shorthand to `00`
- Apply letter-prefix modifiers (R, P, B, W, N, F, A, X, T) — business meaning TBD from production data
- Return array of `{ num, amount }` entries
- Enforce 50-entry limit

---

## Phase 3 — Agent Management

Maps to: `frmAgentThai.frm`

### Pages

```
/org/[orgId]/agents               — list all agents (table with search)
/org/[orgId]/agents/new           — create agent
/org/[orgId]/agents/[id]/edit     — edit agent
```

### API routes

```
GET    /api/org/[orgId]/agents          — list
POST   /api/org/[orgId]/agents          — create
PUT    /api/org/[orgId]/agents/[id]     — update
DELETE /api/org/[orgId]/agents/[id]     — delete (with confirmation)
```

### Fields

```
AgentName (unique per org), Address, Phone, Commission (%), Rate
```

### Validation

- AgentName must be unique per org (maps to "AgentName Already Exist" warning)
- Commission and Rate must be numeric

---

## Phase 4 — Ledger Entry (Core Feature)

Maps to: `frmLGEnt.frm` and `frmLG.frm`

This is the **central feature** of the app — where operators enter lottery bets.

### Pages

```
/org/[orgId]/ledger               — main ledger entry screen
/org/[orgId]/ledger/search        — search existing entries
```

### Components

```
src/components/lottery/
  NumberInput.js       — the custom expression input field
  LedgerGrid.js        — tabular view of entered bets (replaces MSFlexGrid)
  AgentSelector.js     — agent/customer lookup combo
  SessionBanner.js     — shows current OnCount, AMPM, Date, serial range
  ValidationBadge.js   — shows limit/hot/notbuy warnings inline
```

### Entry flow

```
1. Operator selects agent from AgentSelector
2. Operator types number expression in NumberInput
3. On Enter: parser runs, validation checks fire:
     a. Limit check — reject if number exceeds configured limit
     b. Power check — check Brade/Power/APoo/NetKhat/Part/SM/Brother restrictions
     c. Hot check — warn if number is in hot list
     d. NotBuy check — reject if number is in not-buy list
     e. LuckyNo check — flag lucky numbers
4. Valid entries appear in LedgerGrid
5. On Save: write LG + LGDetail rows to DB
6. Grid refreshes with running totals
```

### Validation API

```
POST /api/org/[orgId]/ledger/validate
  body: { num, amount, onCount, ampm, agentName }
  returns: { valid: bool, warnings: [], errors: [] }
```

### Save API

```
POST /api/org/[orgId]/ledger/entries
  body: { entries: [{num, amount, agentName}], onCount, ampm, onDate }
  returns: { srNo, saved: number }

DELETE /api/org/[orgId]/ledger/entries/[srNo]
  — deletes LG + LGDetail rows for that serial
```

### Keyboard shortcuts (map VB6 function keys to browser shortcuts)

```
Ctrl+S    → Save (was F1)
Ctrl+F    → Search (was F8)
Ctrl+Q    → Exit/close (was F4)
Ctrl+K    → Check numbers (was F12)
```

---

## Phase 5 — Configuration Screens

Maps to: `frmLuckyNo`, `frmHot`, `frmNotBuy`, `frmLimit`, `frmComfi`, `frmRefresh`

### Pages under `/org/[orgId]/settings/`

| Page | VB6 form | Purpose |
|---|---|---|
| `/settings/lucky-number` | frmLuckyNo | Set today's lucky number per AMPM |
| `/settings/hot-numbers` | frmHot | Add/remove hot numbers list |
| `/settings/not-buy` | frmNotBuy | Add/remove not-buy list |
| `/settings/limit` | frmLimit | Set numeric bet limit |
| `/settings/key-config` | frmComfi | Edit 3-character key config |
| `/settings/restrictions` | frmAdv | View/edit Power, Brade, APoo, NetKhat rules |

### Unified settings layout

A left-nav settings shell under `/org/[orgId]/settings/layout.js` with links to all sub-pages.

---

## Phase 6 — Financial Management

Maps to: `frmBalance.frm`, `frmReceive.frm`

### Pages

```
/org/[orgId]/finance/balance      — balance records per agent
/org/[orgId]/finance/receipts     — receipt records
```

### API routes

```
GET/POST   /api/org/[orgId]/finance/balance
DELETE     /api/org/[orgId]/finance/balance/[id]

GET/POST   /api/org/[orgId]/finance/receipts
DELETE     /api/org/[orgId]/finance/receipts/[id]
```

### Receive save logic

```
INSERT into receive
UPDATE balance (increase or create for agent)
```

### Receive delete logic

```
Confirm
Reverse balance amount for agent
DELETE receive row
```

---

## Phase 7 — Booking

Maps to: `frmBook.frm`

### Page

```
/org/[orgId]/booking
```

### Flow

```
1. Enter or search serial number
2. Load LG record + LGDetail for that serial
3. Enter customer name (AgentThai lookup)
4. Enter commission
5. Save booking to LG row
```

### API

```
GET  /api/org/[orgId]/booking/[srNo]     — load LG + LGDetail
PUT  /api/org/[orgId]/booking/[srNo]     — save customer/commission
```

---

## Phase 8 — Reports

Maps to: Crystal Reports (`ZLg1.rpt`, `ZLg3.rpt`, `ZTSale.rpt`, `TotalWeek.rpt`, `Agent.rpt`, `Lagent.rpt`, `ZSrNo.rpt`, `sragent.rpt`)

Replace Crystal OLE with server-aggregated JSON + rendered HTML tables (printable).

### Report pages

| URL | Replaces | Description |
|---|---|---|
| `/org/[orgId]/reports/session` | ZLg1.rpt | Agent sale totals for current session |
| `/org/[orgId]/reports/detail` | ZLg3.rpt | Sale detail for current session |
| `/org/[orgId]/reports/total-sale` | ZTSale.rpt | Aggregated sale vs purchase |
| `/org/[orgId]/reports/weekly` | TotalWeek.rpt | Weekly summary (date range + count range) |
| `/org/[orgId]/reports/agent-list` | Agent.rpt | All agents |
| `/org/[orgId]/reports/lucky-agent` | Lagent.rpt | Lucky customer report for date |
| `/org/[orgId]/reports/sr-agent` | sragent.rpt | Serial + agent cross-report |
| `/org/[orgId]/reports/top-numbers` | Command3 / TmpLGTotalSale | Top numbers by profit |

### API routes (aggregate on server, return JSON)

```
GET /api/org/[orgId]/reports/session?onCount=&ampm=
GET /api/org/[orgId]/reports/weekly?start=&end=&ampm=
GET /api/org/[orgId]/reports/top-numbers?onCount=&n=10
```

### Print support

Each report page has a `window.print()` button. Use `@media print` CSS to hide nav and show only the table.

---

## Phase 9 — Data Management

Maps to: `modImExPort.bas`, `modGlobal.bas`, `frmBackUpData.frm`

### Pages

```
/org/[orgId]/data/export    — export org data as JSON or CSV
/org/[orgId]/data/import    — import from JSON/CSV file
/org/[orgId]/data/backup    — download SQLite DB snapshot (super_admin only)
```

### Notes

- Replace floppy/Rar.exe/network-drive logic with browser file download and `<input type="file">` upload
- Export: generate CSV of LG, LGDetail, LGSale, LGSaleDetail filtered by orgId
- Import: parse CSV, validate orgId, batch insert with transaction
- Machine sync concept is no longer needed (web app is centralized)

---

## Phase 10 — Dashboard Upgrade

Extend existing `/org/[orgId]/dashboard` with lottery-specific stats:

```
Today's total bets
Total amount entered today
Active agents count
Current OnCount session
Quick links: Enter Bets | Reports | Lucky No | Hot Numbers
```

---

## Implementation Order (Recommended)

```
1. Schema extension (Phase 1)           — 1 day
2. Number parser + unit tests (Phase 2c) — 1 day
3. Session management (Phase 2a)        — 0.5 day
4. Agent CRUD (Phase 3)                 — 1 day
5. Ledger entry form (Phase 4)          — 3 days (most complex)
6. Configuration screens (Phase 5)      — 1 day
7. Financial management (Phase 6)       — 1 day
8. Booking (Phase 7)                    — 0.5 day
9. Reports (Phase 8)                    — 2 days
10. Data export/import (Phase 9)        — 1 day
11. Dashboard upgrade (Phase 10)        — 0.5 day
```

**Total estimate: ~12 working days**

---

## Key Uncertainties (Require Production Data)

```
1. Letter modifiers in number expressions (R, P, B, W, N, F, A, X, T)
   — exact business meaning cannot be determined from decompiled code alone

2. Commission formula in frmBook
   — decompiler lost the exact calculation

3. Power, Brade, APoo, NetKhat, Part, SM, Brother restriction logic
   — rule conditions are partially recovered but need test data to verify

4. Column widths and sort labels in MSFlexGrid cboSort1
   — stored in binary frmLG.frx, not recoverable

5. Crystal Reports formula expressions
   — embedded in .rpt OLE blobs, not accessible

6. Exact VB6 global variable names
   — lost in decompilation; recovered from behavioral analysis only
```

---

## Technology Mapping

| VB6 component | Next.js replacement |
|---|---|
| DAO/MDB database | SQLite (better-sqlite3) via Drizzle ORM |
| MSFlexGrid | HTML `<table>` with sorting |
| Crystal Reports | Server aggregation + printable HTML |
| Floppy/Rar.exe sync | Browser file download/upload |
| Registry settings | DB-stored config per org |
| Machine serial ranges | Per-user session context |
| Modal VB6 forms | Next.js modal overlays / separate pages |
| WinHaka font (Burmese?) | UTF-8 — requires clarification on language |
