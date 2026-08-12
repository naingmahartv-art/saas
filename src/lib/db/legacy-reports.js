import { eq, and, desc } from 'drizzle-orm';
import { getLegacyDb, legacySchema } from './index.js';

// The date this org's live data moved from Postgres to Firestore. Firestore
// starts empty (no backfill), so any session dated before this belongs to
// the old Postgres tables; anything on/after belongs to Firestore. Update
// this once, at the moment the migration actually goes live in production.
export const CUTOVER_DATE = '2026-08-09';

export function isBeforeCutover(onDate) {
  return onDate < CUTOVER_DATE;
}

const pad2 = (n) => String(n).padStart(2, '0');
const ALL_NUMBERS = Array.from({ length: 100 }, (_, i) => pad2(i));

/** Pre-cutover equivalent of GET /api/org/[orgId]/ledger — reads the old lg/lgDetail/lgVoucherToken tables. */
export async function getLegacyLedgerSlips(orgId, { onCount, ampm, onDate, agentName }) {
  const { lg, lgDetail, lgVoucherToken } = legacySchema;
  const db = getLegacyDb();

  const conditions = [eq(lg.orgId, orgId)];
  if (onCount) conditions.push(eq(lg.onCount, parseInt(onCount)));
  if (ampm) conditions.push(eq(lg.ampm, ampm));
  if (onDate) conditions.push(eq(lg.onDate, onDate));

  const slips = await db.select().from(lg).where(and(...conditions)).orderBy(desc(lg.srNo));

  const withDetails = await Promise.all(
    slips.map(async (slip) => {
      const [details, tokens] = await Promise.all([
        db.select().from(lgDetail).where(and(
          eq(lgDetail.orgId, orgId), eq(lgDetail.srNo, slip.srNo),
          eq(lgDetail.onCount, slip.onCount), eq(lgDetail.ampm, slip.ampm),
        )),
        db.select().from(lgVoucherToken).where(and(
          eq(lgVoucherToken.orgId, orgId), eq(lgVoucherToken.srNo, slip.srNo),
          eq(lgVoucherToken.onCount, slip.onCount), eq(lgVoucherToken.ampm, slip.ampm),
        )),
      ]);
      return { ...slip, details, tokens: tokens.map(t => t.tokenText) };
    })
  );

  return agentName
    ? withDetails.filter(s => s.agentName?.trim().toLowerCase() === agentName.trim().toLowerCase())
    : withDetails;
}

/** Pre-cutover equivalent of GET /api/org/[orgId]/results. */
export async function getLegacyResults(orgId, { onCount, ampm, onDate }) {
  const { luckyNo, lgDetail, lg, rates } = legacySchema;
  const db = getLegacyDb();
  const onCountInt = parseInt(onCount);

  const [[luckyRow], details, [rateRow], headers] = await Promise.all([
    db.select().from(luckyNo)
      .where(and(eq(luckyNo.orgId, orgId), eq(luckyNo.onDate, onDate), eq(luckyNo.ampm, ampm)))
      .orderBy(desc(luckyNo.createdAt)).limit(1),
    db.select().from(lgDetail)
      .where(and(eq(lgDetail.orgId, orgId), eq(lgDetail.onCount, onCountInt), eq(lgDetail.ampm, ampm))),
    db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1),
    db.select().from(lg)
      .where(and(eq(lg.orgId, orgId), eq(lg.onCount, onCountInt), eq(lg.ampm, ampm))),
  ]);

  const lNo = luckyRow?.lNo ?? null;
  const num1Rate = rateRow?.num1Rate ?? 0;
  const agentNames = [...new Set(headers.map(h => h.agentName))].sort();

  const numberTotals = new Map();
  for (const d of details) numberTotals.set(d.num1, (numberTotals.get(d.num1) || 0) + d.value);

  const totalBet = details.reduce((sum, d) => sum + d.value, 0);
  const totalWinnerBet = lNo ? (numberTotals.get(lNo) || 0) : 0;
  const totalPayout = totalWinnerBet * num1Rate;

  const perAgent = agentNames.map(agentName => {
    const agentDetails = details.filter(d => d.agentName === agentName);
    const agentTotalBet = agentDetails.reduce((sum, d) => sum + d.value, 0);
    const winnerBet = lNo ? agentDetails.filter(d => d.num1 === lNo).reduce((sum, d) => sum + d.value, 0) : 0;
    const payout = winnerBet * num1Rate;
    return { agentName, totalBet: agentTotalBet, winnerBet, payout, net: agentTotalBet - payout };
  });

  const numberSummary = ALL_NUMBERS.map(num => {
    const numTotalBet = numberTotals.get(num) || 0;
    const isWinner = lNo === num;
    return { num, totalBet: numTotalBet, isWinner, payout: isWinner ? numTotalBet * num1Rate : 0 };
  });

  return {
    luckyNo: lNo,
    totalBet,
    winnerNum: lNo,
    totalWinnerBet,
    totalPayout,
    profit: totalBet - totalPayout,
    perAgent,
    numberSummary,
  };
}
