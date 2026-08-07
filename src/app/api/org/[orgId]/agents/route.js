import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { agents } from '@/lib/db/schema.js';
import { eq, and, asc, sql } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/agents — list all agents for the org
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();
  const agentsList = await db
    .select()
    .from(agents)
    .where(eq(agents.orgId, orgId))
    .orderBy(asc(agents.agentName));

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

  const db = getDb();

  // Case-insensitive uniqueness check per org
  const [existing] = await db
    .select({ id: agents.id })
    .from(agents)
    .where(
      sql`${agents.orgId} = ${orgId} AND LOWER(${agents.agentName}) = LOWER(${agentName.trim()})`
    )
    .limit(1);

  if (existing) {
    return NextResponse.json({ error: 'AgentName Already Exist' }, { status: 409 });
  }

  const id = randomUUID();
  const now = Date.now();

  await db.insert(agents).values({
    id,
    orgId,
    agentName: agentName.trim(),
    address: address?.trim() || null,
    phone: phone?.trim() || null,
    commission: parseFloat(commission) || 0,
    rate: parseFloat(rate) || 0,
    createdAt: now,
  });

  const [agent] = await db.select().from(agents).where(eq(agents.id, id));
  return NextResponse.json({ agent }, { status: 201 });
}
