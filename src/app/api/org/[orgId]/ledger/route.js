import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { lg, lgDetail, lgVoucherToken, lotterySessions, agents } from '@/lib/db/schema.js';
import { eq, and, count, like, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/ledger — search saved ledger slips (defaults to the
// active session if no onCount/ampm/onDate given), each with its raw voucher
// tokens (source of truth) and expanded detail lines (derived, for display)
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCount = searchParams.get('onCount');
  const ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');
  const agentName = searchParams.get('agentName');

  const db = getDb();
  const conditions = [eq(lg.orgId, orgId)];

  if (onCount) conditions.push(eq(lg.onCount, parseInt(onCount)));
  if (ampm) conditions.push(eq(lg.ampm, ampm));
  if (onDate) conditions.push(eq(lg.onDate, onDate));
  if (agentName) conditions.push(like(lg.agentName, `%${agentName}%`));

  if (!onCount && !ampm && !onDate) {
    const [activeSession] = await db
      .select()
      .from(lotterySessions)
      .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
      .limit(1);
    if (activeSession) {
      conditions.push(eq(lg.onCount, activeSession.onCount));
      conditions.push(eq(lg.ampm, activeSession.ampm));
    }
  }

  const slips = await db
    .select()
    .from(lg)
    .where(and(...conditions))
    .orderBy(desc(lg.srNo));

  const withDetails = await Promise.all(
    slips.map(async (slip) => {
      const [details, tokens] = await Promise.all([
        db
          .select()
          .from(lgDetail)
          .where(and(
            eq(lgDetail.orgId, orgId),
            eq(lgDetail.srNo, slip.srNo),
            eq(lgDetail.onCount, slip.onCount),
            eq(lgDetail.ampm, slip.ampm),
          )),
        db
          .select()
          .from(lgVoucherToken)
          .where(and(
            eq(lgVoucherToken.orgId, orgId),
            eq(lgVoucherToken.srNo, slip.srNo),
            eq(lgVoucherToken.onCount, slip.onCount),
            eq(lgVoucherToken.ampm, slip.ampm),
          )),
      ]);
      return { ...slip, details, tokens: tokens.map(t => t.tokenText) };
    })
  );

  return NextResponse.json({ slips: withDetails });
}

// Re-runs the (untouched) number-expression parser server-side so expanded
// amounts are always derived from the raw tokens, never trusted from the
// client. Throws with the offending token on a parse error.
function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens) {
    const { entries, error } = parseNumberExpression(tokenText);
    if (error) {
      const err = new Error(error);
      err.token = tokenText;
      throw err;
    }
    expanded.push(...entries);
  }
  return expanded;
}

// POST /api/org/[orgId]/ledger — save a voucher: the raw typed tokens are the
// source of truth; expanded numbers are derived here and stored alongside
// for the grid/aggregate views.
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentId, onCount, ampm, onDate, machineId, tokens } = await request.json();

  if (!agentId || !onCount || !ampm || !onDate) {
    return NextResponse.json({ error: 'agentId, onCount, ampm, and onDate are required' }, { status: 400 });
  }
  if (!Array.isArray(tokens) || tokens.length === 0) {
    return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
  }

  const db = getDb();

  const [activeSession] = await db
    .select()
    .from(lotterySessions)
    .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
    .limit(1);

  if (!activeSession) {
    return NextResponse.json({ error: 'No active session' }, { status: 400 });
  }

  const [agent] = await db
    .select()
    .from(agents)
    .where(and(eq(agents.orgId, orgId), eq(agents.id, agentId)))
    .limit(1);

  if (!agent) {
    return NextResponse.json({ error: 'Agent not found for this organization' }, { status: 400 });
  }

  let entries;
  try {
    entries = expandTokens(tokens);
  } catch (err) {
    return NextResponse.json({ error: `Could not parse "${err.token}": ${err.message}` }, { status: 400 });
  }
  if (entries.length === 0) {
    return NextResponse.json({ error: 'Tokens did not expand to any numbers' }, { status: 400 });
  }

  const [{ value: existingCount }] = await db
    .select({ value: count() })
    .from(lg)
    .where(and(eq(lg.orgId, orgId), eq(lg.onCount, onCount), eq(lg.ampm, ampm)));

  const srNo = existingCount + 1;
  const now = Date.now();
  const amount = entries.reduce((sum, e) => sum + (parseFloat(e.amount) || 0), 0);

  await db.insert(lg).values({
    id: randomUUID(),
    orgId,
    srNo,
    onCount,
    ampm,
    onDate,
    machineId: parseInt(machineId) || 1,
    agentName: agent.agentName,
    amount,
    createdAt: now,
  });

  await db.insert(lgVoucherToken).values(
    tokens.map(tokenText => ({
      id: randomUUID(),
      orgId,
      srNo,
      onCount,
      ampm,
      tokenText,
      createdAt: now,
    }))
  );

  await db.insert(lgDetail).values(
    entries.map(e => ({
      id: randomUUID(),
      orgId,
      srNo,
      onCount,
      ampm,
      agentName: agent.agentName,
      num1: e.num,
      value: parseFloat(e.amount) || 0,
      post: 0,
      createdAt: now,
    }))
  );

  return NextResponse.json({ success: true, srNo });
}
