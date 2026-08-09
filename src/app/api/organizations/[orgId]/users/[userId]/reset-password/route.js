import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { userDoc } from '@/lib/db/firestore.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { applyPasswordReset } from '@/lib/auth/reset-password.js';

// POST — reset a user's password to a freshly generated one, returned once.
export async function POST(request, { params }) {
  const session = await getSession();
  const { orgId, userId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const snap = await userDoc(userId).get();
  const target = snap.exists ? snap.data() : null;
  if (!target || target.orgId !== orgId) {
    return NextResponse.json({ error: 'User not found' }, { status: 404 });
  }
  if (session.role !== 'super_admin' && ['org_admin', 'super_admin'].includes(target.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const tempPassword = await applyPasswordReset({
    orgId,
    userId,
    targetName: target.name,
    actingSession: session,
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true, tempPassword });
}
