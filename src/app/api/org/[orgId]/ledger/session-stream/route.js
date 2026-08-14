import { NextResponse } from 'next/server';
import { orgSessionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';

// GET /api/org/[orgId]/ledger/session-stream?sessionId=...
// Standard JSON endpoint returning session state (No SSE streaming connections)
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const sessionId = searchParams.get('sessionId');
  if (!sessionId) {
    return NextResponse.json({ error: 'sessionId is required' }, { status: 400 });
  }

  const snap = await orgSessionDoc(orgId, sessionId).get();
  if (!snap.exists) {
    return NextResponse.json({ totals: {}, buyTotals: {}, luckyNumber: null, vouchersCount: 0 });
  }

  const data = snap.data() || {};
  return NextResponse.json({
    totals: data.totals || {},
    buyTotals: data.buyTotals || {},
    luckyNumber: data.luckyNumber || null,
    hotNumbers: data.hotNumbers || [],
    notBuyNumbers: data.notBuyNumbers || [],
    vouchersCount: data.voucherCount || data.vouchersCount || 0,
  });
}
