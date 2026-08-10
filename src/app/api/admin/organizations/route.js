import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { orgsCol, orgSubscriptionsCol, PLAN_PRICES } from '@/lib/db/firestore.js';
import { v4 as uuidv4 } from 'uuid';

// GET — list all organizations
export async function GET(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const snap = await orgsCol().orderBy('createdAt', 'asc').get();
  return NextResponse.json(snap.docs.map(d => d.data()));
}

// POST — create organization
export async function POST(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { name, plan = 'basic' } = await request.json();
  if (!name) return NextResponse.json({ error: 'Name is required' }, { status: 400 });

  const slug = name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
  const orgId = uuidv4();
  const now = Date.now();

  await orgsCol().doc(orgId).set({
    id: orgId,
    name,
    slug,
    plan,
    status: 'active',
    createdBy: session.id,
    createdAt: now,
  });

  const subId = uuidv4();
  await orgSubscriptionsCol(orgId).doc(subId).set({
    id: subId,
    orgId,
    plan,
    amount: PLAN_PRICES[plan],
    status: 'active',
    createdAt: now,
  });

  return NextResponse.json({ id: orgId, name, plan, slug }, { status: 201 });
}
