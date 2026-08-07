import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { luckyNo, lgDetail, lg, rates } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';

const pad2 = (n) => String(n).padStart(2, '0');
const ALL_NUMBERS = Array.from({ length: 100 }, (_, i) => pad2(i));

// GET /api/org/[orgId]/results — calculate payout results for a session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCountRaw = searchParams.get('onCount');
  const ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');

  if (!onCountRaw || !ampm || !onDate) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
  }

  const onCount = parseInt(onCountRaw);
  if (Number.isNaN(onCount)) {
    return NextResponse.json({ error: 'onCount must be a number' }, { status: 400 });
  }

  const db = getDb();

  const [luckyRow] = await db
    .select()
    .from(luckyNo)
    .where(and(eq(luckyNo.orgId, orgId), eq(luckyNo.onDate, onDate), eq(luckyNo.ampm, ampm)))
    .orderBy(desc(luckyNo.createdAt))
    .limit(1);

  const lNo = luckyRow?.lNo ?? null;

  const details = await db
    .select()
    .from(lgDetail)
    .where(and(eq(lgDetail.orgId, orgId), eq(lgDetail.onCount, onCount), eq(lgDetail.ampm, ampm)));

  const [rateRow] = await db
    .select()
    .from(rates)
    .where(eq(rates.orgId, orgId))
    .limit(1);

  const num1Rate = rateRow?.num1Rate ?? 0;

  const headers = await db
    .select()
    .from(lg)
    .where(and(eq(lg.orgId, orgId), eq(lg.onCount, onCount), eq(lg.ampm, ampm)));

  const agentNames = [...new Set(headers.map(h => h.agentName))].sort();

  // Per-number totals
  const numberTotals = new Map();
  for (const d of details) {
    numberTotals.set(d.num1, (numberTotals.get(d.num1) || 0) + d.value);
  }

  const totalBet = details.reduce((sum, d) => sum + d.value, 0);
  const totalWinnerBet = lNo ? (numberTotals.get(lNo) || 0) : 0;
  const totalPayout = totalWinnerBet * num1Rate;
  const profit = totalBet - totalPayout;

  const perAgent = agentNames.map(agentName => {
    const agentDetails = details.filter(d => d.agentName === agentName);
    const agentTotalBet = agentDetails.reduce((sum, d) => sum + d.value, 0);
    const winnerBet = lNo
      ? agentDetails.filter(d => d.num1 === lNo).reduce((sum, d) => sum + d.value, 0)
      : 0;
    const payout = winnerBet * num1Rate;
    return {
      agentName,
      totalBet: agentTotalBet,
      winnerBet,
      payout,
      net: agentTotalBet - payout,
    };
  });

  const numberSummary = ALL_NUMBERS.map(num => {
    const numTotalBet = numberTotals.get(num) || 0;
    const isWinner = lNo === num;
    return {
      num,
      totalBet: numTotalBet,
      isWinner,
      payout: isWinner ? numTotalBet * num1Rate : 0,
    };
  });

  return NextResponse.json({
    luckyNo: lNo,
    totalBet,
    winnerNum: lNo,
    totalWinnerBet,
    totalPayout,
    profit,
    perAgent,
    numberSummary,
  });
}
