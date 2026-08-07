import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { agents } from '@/lib/db/schema.js';
import { eq, and, sql } from 'drizzle-orm';
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

  const db = getDb();

  // Case-insensitive uniqueness check — exclude self
  const [existing] = await db
    .select({ id: agents.id })
    .from(agents)
    .where(
      sql`${agents.orgId} = ${orgId} AND LOWER(${agents.agentName}) = LOWER(${agentName.trim()}) AND ${agents.id} != ${agentId}`
    )
    .limit(1);

  if (existing) {
    return NextResponse.json({ error: 'AgentName Already Exist' }, { status: 409 });
  }

  await db
    .update(agents)
    .set({
      agentName: agentName.trim(),
      address: address?.trim() || null,
      phone: phone?.trim() || null,
      commission: parseFloat(commission) || 0,
      rate: parseFloat(rate) || 0,
    })
    .where(and(eq(agents.id, agentId), eq(agents.orgId, orgId)));

  const [agent] = await db.select().from(agents).where(eq(agents.id, agentId));
  if (!agent) {
    return NextResponse.json({ error: 'Not found' }, { status: 404 });
  }

  return NextResponse.json({ agent });
}

// DELETE /api/org/[orgId]/agents/[agentId]
export async function DELETE(request, { params }) {
  const { orgId, agentId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();
  await db.delete(agents).where(and(eq(agents.id, agentId), eq(agents.orgId, orgId)));
  return NextResponse.json({ ok: true });
}
