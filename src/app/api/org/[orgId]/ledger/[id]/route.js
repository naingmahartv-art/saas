import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import { getDb, orgSessionDoc, orgSessionVoucherDoc, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { assertCashierWriteAllowed, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

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

// Both PUT and DELETE need onCount/ampm/onDate to locate the voucher's
// session doc — Firestore has no cross-session doc-id lookup, so the caller
// tells us which session this voucher belongs to.
function parseSessionCoords(source) {
  const onCount = source.get ? source.get('onCount') : source.onCount;
  const ampm = source.get ? source.get('ampm') : source.ampm;
  const onDate = source.get ? source.get('onDate') : source.onDate;
  if (!onCount || !ampm || !onDate) return null;
  return { onCount, ampm, onDate };
}

// PUT /api/org/[orgId]/ledger/[id] — edit a voucher: replace its raw tokens
// and fully re-derive the expanded detail lines from scratch, adjusting the
// session's running totals by the delta (old amounts removed, new added) in
// the same transaction as the rewrite.
export async function PUT(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { tokens } = body;
  const coords = parseSessionCoords(body);
  if (!coords) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
  }
  if (!Array.isArray(tokens) || tokens.length === 0) {
    return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(coords.onDate, coords.ampm, coords.onCount);
  const voucherRef = orgSessionVoucherDoc(orgId, sid, id);
  const sessionRef = orgSessionDoc(orgId, sid);

  let entries;
  try {
    entries = expandTokens(tokens);
  } catch (err) {
    return NextResponse.json({ error: `Could not parse "${err.token}": ${err.message}` }, { status: 400 });
  }
  if (entries.length === 0) {
    return NextResponse.json({ error: 'Tokens did not expand to any numbers' }, { status: 400 });
  }

  const newDetails = entries.map(e => ({ num1: e.num, value: parseFloat(e.amount) || 0 }));
  const newAmount = newDetails.reduce((sum, d) => sum + d.value, 0);
  const now = Date.now();

  const db = getDb();
  let slip;
  await db.runTransaction(async (tx) => {
    const voucherSnap = await tx.get(voucherRef);
    if (!voucherSnap.exists) throw new Error('NOT_FOUND');
    slip = voucherSnap.data();

    // Net delta per number: subtract the old voucher's amounts, add the new ones.
    const delta = {};
    for (const d of slip.details || []) delta[d.num1] = (delta[d.num1] || 0) - d.value;
    for (const d of newDetails) delta[d.num1] = (delta[d.num1] || 0) + d.value;

    const totalsUpdate = {};
    for (const [num, amt] of Object.entries(delta)) {
      if (amt !== 0) totalsUpdate[`totals.${num}`] = FieldValue.increment(amt);
    }

    tx.update(voucherRef, { tokens, details: newDetails, amount: newAmount });
    if (Object.keys(totalsUpdate).length > 0) tx.update(sessionRef, totalsUpdate);
  }).catch(err => {
    if (err.message === 'NOT_FOUND') return null;
    throw err;
  });

  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: coords.onCount, ampm: coords.ampm, amount: newAmount, tokens },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/ledger/[id]?onCount=&ampm=&onDate= — remove a saved
// voucher and back out its amounts from the session's running totals. No
// renumbering of srNo afterward — gaps are fine.
export async function DELETE(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const coords = parseSessionCoords({
    onCount: searchParams.get('onCount'),
    ampm: searchParams.get('ampm'),
    onDate: searchParams.get('onDate'),
  });
  if (!coords) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate query params are required' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(coords.onDate, coords.ampm, coords.onCount);
  const voucherRef = orgSessionVoucherDoc(orgId, sid, id);
  const sessionRef = orgSessionDoc(orgId, sid);

  const db = getDb();
  let slip;
  await db.runTransaction(async (tx) => {
    const voucherSnap = await tx.get(voucherRef);
    if (!voucherSnap.exists) throw new Error('NOT_FOUND');
    slip = voucherSnap.data();

    const totalsUpdate = {};
    for (const d of slip.details || []) {
      totalsUpdate[`totals.${d.num1}`] = FieldValue.increment(-d.value);
    }

    tx.delete(voucherRef);
    if (Object.keys(totalsUpdate).length > 0) tx.update(sessionRef, totalsUpdate);
  }).catch(err => {
    if (err.message === 'NOT_FOUND') return null;
    throw err;
  });

  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'delete',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: coords.onCount, ampm: coords.ampm, agentName: slip.agentName, amount: slip.amount },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}
