import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import {
  getDb,
  orgSessionDoc,
  orgSessionVouchersCol,
  sessionId as buildSessionId,
} from '@/lib/db/firestore.js';
import { applyRtdbBuyDelta } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { assertCashierWriteAllowed, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// POST /api/org/[orgId]/ledger/buy-voucher — process Buy Voucher (over-limit offload)
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { onCount, ampm, onDate, machineId, items } = await request.json();

  if (!onCount || !ampm || !onDate) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
  }
  if (!Array.isArray(items) || items.length === 0) {
    return NextResponse.json({ error: 'items must be a non-empty array' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(onDate, ampm, onCount);
  const sessionRef = orgSessionDoc(orgId, sid);

  const perNumber = {};
  const tokens = [];
  let totalBuyAmount = 0;

  for (const item of items) {
    const num = String(item.num).padStart(2, '0');
    const amt = parseFloat(item.amount) || 0;
    if (amt > 0) {
      perNumber[num] = amt;
      totalBuyAmount += amt;
      tokens.push(`${num}R${amt}`);
    }
  }

  if (totalBuyAmount === 0 || tokens.length === 0) {
    return NextResponse.json({ error: 'No valid buy amounts specified' }, { status: 400 });
  }

  const now = Date.now();
  const db = getDb();
  const voucherRef = orgSessionVouchersCol(orgId, sid).doc();

  // Increment buyTotals in session document (00-99 ledger grid totals remain untouched!)


  const { srNo } = await db.runTransaction(async (tx) => {
    const sSnap = await tx.get(sessionRef);
    if (!sSnap.exists || !sSnap.data().isActive) {
      throw new Error('SESSION_NOT_ACTIVE');
    }

    const nextSrNo = (sSnap.data().voucherCount || 0) + 1;

    tx.set(voucherRef, {
      id: voucherRef.id,
      orgId,
      sessionId: sid,
      srNo: nextSrNo,
      onCount: parseInt(onCount),
      ampm,
      onDate,
      machineId: parseInt(machineId) || 1,
      agentId: 'buy_offload',
      agentName: 'Buy Offload (အဝယ်စာရင်း)',
      amount: totalBuyAmount,
      tokens,
      isBuyVoucher: true,
      voucherType: 'buy',
      buyItems: items,
      createdAt: now,
      createdBy: session.id,
    });

    tx.update(sessionRef, { voucherCount: nextSrNo });
    return { srNo: nextSrNo };
  });

  // Apply buyTotals delta to Realtime Database so live SSE streams update buyTotals in real-time
  await applyRtdbBuyDelta(orgId, sid, perNumber);

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'create',
    entity: 'buy_voucher',
    entityId: String(srNo),
    details: { srNo, onCount, ampm, totalBuyAmount, items },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true, srNo, totalBuyAmount });
}
