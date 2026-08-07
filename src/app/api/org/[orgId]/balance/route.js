import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { balance, receive } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/balance — agent balance summary
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const agentName = searchParams.get('agentName');

  const db = getDb();

  const balances = await db
    .select()
    .from(balance)
    .where(
      agentName
        ? and(eq(balance.orgId, orgId), eq(balance.agentName, agentName))
        : eq(balance.orgId, orgId)
    )
    .orderBy(desc(balance.onDate));

  const receives = await db
    .select()
    .from(receive)
    .where(
      agentName
        ? and(eq(receive.orgId, orgId), eq(receive.agentName, agentName))
        : eq(receive.orgId, orgId)
    )
    .orderBy(desc(receive.onDate));

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

  const db = getDb();
  const id = randomUUID();
  const now = Date.now();

  await db.insert(balance).values({
    id,
    orgId,
    agentName: agentName.trim(),
    amount: parseFloat(amount),
    onDate,
    createdAt: now,
  });

  const [balanceRow] = await db.select().from(balance).where(eq(balance.id, id));
  return NextResponse.json({ success: true, balance: balanceRow });
}
