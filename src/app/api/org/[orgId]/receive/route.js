import { NextResponse } from 'next/server';
import { randomUUID } from 'crypto';
import { orgReceiveCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

const byDateDesc = (a, b) => (a.onDate < b.onDate ? 1 : a.onDate > b.onDate ? -1 : 0);

// GET /api/org/[orgId]/receive — list cash receipts
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const agentName = searchParams.get('agentName');
  const onDate = searchParams.get('onDate');

  let query = orgReceiveCol(orgId);
  if (agentName) query = query.where('agentName', '==', agentName);
  if (onDate) query = query.where('onDate', '==', onDate);

  const snap = await query.get();
  const receives = snap.docs.map(d => d.data()).sort(byDateDesc);

  return NextResponse.json({ receives });
}

// POST /api/org/[orgId]/receive — record cash received from agent
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentName, amount, onDate, onCount, ampm } = await request.json();

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
  const receiveRow = {
    id,
    orgId,
    agentName: agentName.trim(),
    amount: parseFloat(amount),
    onDate,
    onCount: onCount != null && onCount !== '' ? parseInt(onCount, 10) : null,
    ampm: ampm || null,
    createdAt: now,
  };

  await orgReceiveCol(orgId).doc(id).set(receiveRow);

  return NextResponse.json({ success: true, receive: receiveRow });
}
