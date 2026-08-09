import { NextResponse } from 'next/server';
import { orgAgentsCol, orgAgentDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// PUT /api/org/[orgId]/agents/[agentId] — update an agent
export async function PUT(request, { params }) {
  const { orgId, agentId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentName, address, phone, commission, rate } = await request.json();

  if (!agentName?.trim()) {
    return NextResponse.json({ error: 'Agent name is required' }, { status: 400 });
  }

  // Case-insensitive uniqueness check — exclude self.
  const existingSnap = await orgAgentsCol(orgId).get();
  const nameLower = agentName.trim().toLowerCase();
  if (existingSnap.docs.some(d => d.id !== agentId && d.data().agentName?.toLowerCase() === nameLower)) {
    return NextResponse.json({ error: 'AgentName Already Exist' }, { status: 409 });
  }

  const ref = orgAgentDoc(orgId, agentId);
  const snap = await ref.get();
  if (!snap.exists) {
    return NextResponse.json({ error: 'Not found' }, { status: 404 });
  }

  const patch = {
    agentName: agentName.trim(),
    address: address?.trim() || null,
    phone: phone?.trim() || null,
    commission: parseFloat(commission) || 0,
    rate: parseFloat(rate) || 0,
  };
  await ref.update(patch);

  return NextResponse.json({ agent: { ...snap.data(), ...patch } });
}

// DELETE /api/org/[orgId]/agents/[agentId]
export async function DELETE(request, { params }) {
  const { orgId, agentId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  await orgAgentDoc(orgId, agentId).delete();
  return NextResponse.json({ ok: true });
}
