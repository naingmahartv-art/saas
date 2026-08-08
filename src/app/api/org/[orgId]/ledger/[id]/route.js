import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { lg, lgDetail, lgVoucherToken } from '@/lib/db/schema.js';
import { eq, and } from 'drizzle-orm';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { randomUUID } from 'crypto';
import { assertCashierWriteAllowed, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

async function loadSlip(db, orgId, id) {
  const [slip] = await db
    .select()
    .from(lg)
    .where(and(eq(lg.orgId, orgId), eq(lg.id, id)))
    .limit(1);
  return slip;
}

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

// PUT /api/org/[orgId]/ledger/[id] — edit a voucher: replace its raw tokens
// and fully re-derive the expanded detail lines from scratch (delete + re-expand,
// not a diff).
export async function PUT(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { tokens } = await request.json();
  if (!Array.isArray(tokens) || tokens.length === 0) {
    return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
  }

  const db = getDb();

  const lockError = await assertCashierWriteAllowed(session, orgId, db);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const slip = await loadSlip(db, orgId, id);
  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
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

  const srNoMatch = and(
    eq(lgVoucherToken.orgId, orgId),
    eq(lgVoucherToken.srNo, slip.srNo),
    eq(lgVoucherToken.onCount, slip.onCount),
    eq(lgVoucherToken.ampm, slip.ampm),
  );
  const detailMatch = and(
    eq(lgDetail.orgId, orgId),
    eq(lgDetail.srNo, slip.srNo),
    eq(lgDetail.onCount, slip.onCount),
    eq(lgDetail.ampm, slip.ampm),
  );

  await db.delete(lgVoucherToken).where(srNoMatch);
  await db.delete(lgDetail).where(detailMatch);

  const now = Date.now();
  const amount = entries.reduce((sum, e) => sum + (parseFloat(e.amount) || 0), 0);

  await db.insert(lgVoucherToken).values(
    tokens.map(tokenText => ({
      id: randomUUID(),
      orgId,
      srNo: slip.srNo,
      onCount: slip.onCount,
      ampm: slip.ampm,
      tokenText,
      createdAt: now,
    }))
  );

  await db.insert(lgDetail).values(
    entries.map(e => ({
      id: randomUUID(),
      orgId,
      srNo: slip.srNo,
      onCount: slip.onCount,
      ampm: slip.ampm,
      agentName: slip.agentName,
      num1: e.num,
      value: parseFloat(e.amount) || 0,
      post: 0,
      createdAt: now,
    }))
  );

  await db.update(lg).set({ amount }).where(and(eq(lg.orgId, orgId), eq(lg.id, id)));

  await logActivity(db, {
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: slip.onCount, ampm: slip.ampm, amount, tokens },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/ledger/[id] — remove a saved ledger slip, its
// voucher tokens, and its detail lines. No renumbering of srNo afterward —
// gaps are fine.
export async function DELETE(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();

  const lockError = await assertCashierWriteAllowed(session, orgId, db);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const slip = await loadSlip(db, orgId, id);
  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
  }

  await db.delete(lgVoucherToken).where(and(
    eq(lgVoucherToken.orgId, orgId),
    eq(lgVoucherToken.srNo, slip.srNo),
    eq(lgVoucherToken.onCount, slip.onCount),
    eq(lgVoucherToken.ampm, slip.ampm),
  ));

  await db.delete(lgDetail).where(and(
    eq(lgDetail.orgId, orgId),
    eq(lgDetail.srNo, slip.srNo),
    eq(lgDetail.onCount, slip.onCount),
    eq(lgDetail.ampm, slip.ampm),
  ));

  await db.delete(lg).where(and(eq(lg.orgId, orgId), eq(lg.id, id)));

  await logActivity(db, {
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'delete',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: slip.onCount, ampm: slip.ampm, agentName: slip.agentName, amount: slip.amount },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}
