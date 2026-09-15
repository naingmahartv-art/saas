import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import {
  getDb,
  orgSessionDoc,
  orgSessionVouchersCol,
  orgAgentDoc,
  sessionId as buildSessionId,
} from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { assertCashierWriteAllowed, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (error) {
      const err = new Error(error);
      err.token = tokenText;
      throw err;
    }
    expanded.push(...entries);
  }
  return expanded;
}

// POST /api/org/[orgId]/ledger/buy-voucher — process Buy Voucher
export async function POST(request, { params }) {
  try {
    const { orgId } = await params;
    const session = await getSession();
    if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const { onCount, ampm, onDate, machineId, agentId, tokens, items } = await request.json();

    if (!onCount || !ampm || !onDate) {
      return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
    }

    let finalTokens = [];
    let entries = [];

    if (Array.isArray(tokens) && tokens.length > 0) {
      finalTokens = tokens;
      try {
        entries = expandTokens(tokens);
      } catch (err) {
        return NextResponse.json({ error: `Could not parse "${err.token}": ${err.message}` }, { status: 400 });
      }
    } else if (Array.isArray(items) && items.length > 0) {
      entries = items;
      finalTokens = items.map(item => `${String(item.num).padStart(2, '0')}+${item.amount}`);
    } else {
      return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
    }

    if (entries.length === 0) {
      return NextResponse.json({ error: 'No valid numbers specified' }, { status: 400 });
    }

    const lockError = await assertCashierWriteAllowed(session, orgId);
    if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

    const sid = buildSessionId(onDate, ampm, onCount);
    const sessionRef = orgSessionDoc(orgId, sid);

    let targetAgentId = 'buy_offload';
    let targetAgentName = 'Buy Offload (အဝယ်စာရင်း)';

    if (agentId && agentId !== 'buy_offload') {
      const agentSnap = await orgAgentDoc(orgId, agentId).get();
      if (agentSnap.exists) {
        targetAgentId = agentId;
        targetAgentName = agentSnap.data().agentName;
      }
    }

    let totalBuyAmount = 0;
    for (const e of entries) {
      const amt = parseFloat(e.amount) || 0;
      totalBuyAmount += amt;
    }

    const now = Date.now();
    const db = getDb();
    const voucherRef = orgSessionVouchersCol(orgId, sid).doc();

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
        agentId: targetAgentId,
        agentName: targetAgentName,
        amount: totalBuyAmount,
        tokens: finalTokens,
        isBuyVoucher: true,
        voucherType: 'buy',
        createdAt: now,
        createdBy: session.id,
      });

      tx.update(sessionRef, { voucherCount: nextSrNo });
      return { srNo: nextSrNo };
    });

    await logActivity({
      orgId,
      userId: session.id,
      userName: session.name,
      userRole: session.role,
      action: 'create',
      entity: 'buy_voucher',
      entityId: String(srNo),
      details: { srNo, onCount, ampm, totalBuyAmount, tokens: finalTokens },
      ipAddress: getClientIp(request),
    });

    return NextResponse.json({ success: true, srNo, totalBuyAmount });
  } catch (err) {
    const isNetworkError =
      err?.code === 14 ||
      err?.message?.includes('UNAVAILABLE') ||
      err?.message?.includes('EHOSTUNREACH') ||
      err?.message?.includes('ECONNREFUSED') ||
      err?.message?.includes('ETIMEDOUT') ||
      err?.message?.includes('network');

    if (isNetworkError) {
      return NextResponse.json(
        { error: 'Database service is unreachable (network offline). Please retry when connected.', code: 'UNAVAILABLE' },
        { status: 503 }
      );
    }

    console.error('Error saving buy voucher:', err);
    return NextResponse.json({ error: err.message || 'Internal Server Error' }, { status: 500 });
  }
}
