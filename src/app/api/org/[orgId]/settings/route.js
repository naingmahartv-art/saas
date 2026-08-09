import { NextResponse } from 'next/server';
import { orgRatesDoc, orgRestrictionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// GET /api/org/[orgId]/settings — load all settings for the org
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const [ratesSnap, limitsSnap] = await Promise.all([
    orgRatesDoc(orgId).get(),
    orgRestrictionDoc(orgId, 'limits').get(),
  ]);

  return NextResponse.json({
    rates: ratesSnap.exists ? ratesSnap.data() : null,
    limits: limitsSnap.exists ? limitsSnap.data() : null,
  });
}

// POST /api/org/[orgId]/settings — upsert rates
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { num1Rate, num2Rate } = await request.json();

  if (num1Rate === undefined || num2Rate === undefined) {
    return NextResponse.json({ error: 'num1Rate and num2Rate are required' }, { status: 400 });
  }

  const now = Date.now();
  const updated = { orgId, num1Rate: parseFloat(num1Rate) || 0, num2Rate: parseFloat(num2Rate) || 0, updatedAt: now };
  await orgRatesDoc(orgId).set(updated, { merge: true });

  return NextResponse.json({ success: true, rates: updated });
}
