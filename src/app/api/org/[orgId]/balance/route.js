import { NextResponse } from 'next/server';
import { randomUUID } from 'crypto';
import { orgBalanceCol, orgReceiveCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

const byDateDesc = (a, b) => (a.onDate < b.onDate ? 1 : a.onDate > b.onDate ? -1 : 0);

// GET /api/org/[orgId]/balance — agent balance summary
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const agentName = searchParams.get('agentName');

  const [balanceSnap, receiveSnap] = await Promise.all([
    agentName ? orgBalanceCol(orgId).where('agentName', '==', agentName).get() : orgBalanceCol(orgId).get(),
    agentName ? orgReceiveCol(orgId).where('agentName', '==', agentName).get() : orgReceiveCol(orgId).get(),
  ]);

  const balances = balanceSnap.docs.map(d => d.data()).sort(byDateDesc);
  const receives = receiveSnap.docs.map(d => d.data()).sort(byDateDesc);

  return NextResponse.json({ balances, receives });
}

// POST /api/org/[orgId]/balance — add a balance entry (agent owes amount)
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentName, amount, onDate } = await request.json();

  if (!agentName?.trim()) {
    return NextResponse.json({ error: 'Agent name is required' }, { status: 400 });
  }
  if (!(parseFloat(amount) > 0)) {
    return NextResponse.json({ error: 'Amount must be greater than 0' }, { status: 400 });
  }
  if (!onDate) {
    return NextResponse.json({ error: 'Date is required' }, { status: 400 });
  }

  const id = randomUUID();
  const now = Date.now();
  const balanceRow = { id, orgId, agentName: agentName.trim(), amount: parseFloat(amount), onDate, createdAt: now };

  await orgBalanceCol(orgId).doc(id).set(balanceRow);

  return NextResponse.json({ success: true, balance: balanceRow });
}
