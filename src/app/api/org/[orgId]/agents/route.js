import { NextResponse } from 'next/server';
import { randomUUID } from 'crypto';
import { orgAgentsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// GET /api/org/[orgId]/agents — list all agents for the org
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const snap = await orgAgentsCol(orgId).orderBy('agentName', 'asc').get();
  const agentsList = snap.docs.map(d => d.data());

  return NextResponse.json({ agents: agentsList });
}

// POST /api/org/[orgId]/agents — create a new agent
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentName, address, phone, commission, rate } = await request.json();

  if (!agentName?.trim()) {
    return NextResponse.json({ error: 'Agent name is required' }, { status: 400 });
  }

  // Case-insensitive uniqueness check per org — no server-side LOWER() index in
  // Firestore, so compare against the (small, per-org) agent list in JS.
  const existingSnap = await orgAgentsCol(orgId).get();
  const nameLower = agentName.trim().toLowerCase();
  if (existingSnap.docs.some(d => d.data().agentName?.toLowerCase() === nameLower)) {
    return NextResponse.json({ error: 'AgentName Already Exist' }, { status: 409 });
  }

  const id = randomUUID();
  const now = Date.now();
  const agent = {
    id,
    orgId,
    agentName: agentName.trim(),
    address: address?.trim() || null,
    phone: phone?.trim() || null,
    commission: parseFloat(commission) || 0,
    rate: parseFloat(rate) || 0,
    createdAt: now,
  };

  await orgAgentsCol(orgId).doc(id).set(agent);

  return NextResponse.json({ agent }, { status: 201 });
}
