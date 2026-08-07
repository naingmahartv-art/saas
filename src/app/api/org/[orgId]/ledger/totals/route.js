import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { lgDetail, lotterySessions } from '@/lib/db/schema.js';
import { eq, and, sql } from 'drizzle-orm';
import { getSession } from '@/lib/auth';

// GET /api/org/[orgId]/ledger/totals?onCount=&ampm=
//   -> { totals: { [num]: total } } for every number with activity this session
// GET .../totals?onCount=&ampm=&num=62
//   -> { byAgent: [{ agentName, total }] } — per-agent breakdown for one number
//      (feeds the "Checking Agent" overlay)
// Defaults to the active session when onCount/ampm aren't given.
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  let onCount = searchParams.get('onCount');
  let ampm = searchParams.get('ampm');
  const num = searchParams.get('num');

  const db = getDb();

  if (!onCount || !ampm) {
    const [activeSession] = await db
      .select()
      .from(lotterySessions)
      .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
      .limit(1);
    if (!activeSession) {
      return NextResponse.json(num ? { byAgent: [] } : { totals: {} });
    }
    onCount = activeSession.onCount;
    ampm = activeSession.ampm;
  } else {
    onCount = parseInt(onCount);
  }

  if (num) {
    const rows = await db
      .select({ agentName: lgDetail.agentName, total: sql`sum(${lgDetail.value})`.mapWith(Number) })
      .from(lgDetail)
      .where(and(
        eq(lgDetail.orgId, orgId),
        eq(lgDetail.onCount, onCount),
        eq(lgDetail.ampm, ampm),
        eq(lgDetail.num1, num),
      ))
      .groupBy(lgDetail.agentName);
    return NextResponse.json({ byAgent: rows });
  }

  const rows = await db
    .select({ num1: lgDetail.num1, total: sql`sum(${lgDetail.value})`.mapWith(Number) })
    .from(lgDetail)
    .where(and(
      eq(lgDetail.orgId, orgId),
      eq(lgDetail.onCount, onCount),
      eq(lgDetail.ampm, ampm),
    ))
    .groupBy(lgDetail.num1);

  const totals = {};
  for (const row of rows) totals[row.num1] = row.total;

  return NextResponse.json({ totals });
}
