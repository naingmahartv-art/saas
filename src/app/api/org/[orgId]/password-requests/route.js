import { NextResponse } from 'next/server';
import { orgPasswordResetRequestsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { canManageOrgUsers } from '@/lib/auth/permissions.js';

// GET /api/org/[orgId]/password-requests — list this org's password reset requests, newest first
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId) || !canManageOrgUsers(session.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const snap = await orgPasswordResetRequestsCol(orgId).orderBy('requestedAt', 'desc').get();
  const requests = snap.docs.map(d => d.data());

  return NextResponse.json({ requests });
}
