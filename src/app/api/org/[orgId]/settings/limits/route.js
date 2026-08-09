import { NextResponse } from 'next/server';
import { orgRestrictionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// POST /api/org/[orgId]/settings/limits — upsert bet limit
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { limitValue } = await request.json();

  if (limitValue === undefined) {
    return NextResponse.json({ error: 'limitValue is required' }, { status: 400 });
  }

  const now = Date.now();
  await orgRestrictionDoc(orgId, 'limits').set(
    { orgId, limitValue: parseFloat(limitValue) || 0, updatedAt: now },
    { merge: true }
  );

  return NextResponse.json({ success: true });
}
