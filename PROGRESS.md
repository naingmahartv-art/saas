# SaaS Lottery Platform — Build Progress

## Database
- [x] Neon PostgreSQL connected
- [x] 28 tables created via drizzle-kit push
- [x] drizzle.config.js loads .env.local

## Phases completed
- [x] Phase 1 — Schema (organizations, users, subscriptions + 25 lottery tables)
- [x] Phase 2a — Session management (/org/[orgId]/session)
- [x] Phase 2c — Number parser (src/lib/lottery/numberParser.js)
- [x] Phase 3 — Agent management (/org/[orgId]/agents)
- [x] Phase 4 — Ledger entry form (/org/[orgId]/ledger)

## Phase 4 details
- LedgerEntry.js: number input with space/Enter commit, R/A modifiers, notBuy/hot/limit validation, 50-entry cap
- 10×10 grid (00–99): green=entered, yellow=hot, gray=notBuy, click to prefill
- API route POST /api/org/[orgId]/ledger → inserts lg + lgDetail rows
- Bilingual Myanmar+English labels

## To do next
- [ ] Run seed: `node scripts/seed.js`
- [ ] Start dev: `npm run dev`
- [ ] Phase 5 — Lucky number entry + results
- [ ] Phase 6 — Reports / payout calculation
- [ ] Phase 7 — Balance / receive management
