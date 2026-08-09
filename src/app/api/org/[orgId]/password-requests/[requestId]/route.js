import { NextResponse } from 'next/server';
import { orgPasswordResetRequestsCol, userDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { canManageOrgUsers, getClientIp } from '@/lib/auth/permissions.js';
import { applyPasswordReset } from '@/lib/auth/reset-password.js';

// PATCH /api/org/[orgId]/password-requests/[requestId] — approve (issues a new temp password) or deny a pending request
export async function PATCH(request, { params }) {
  const { orgId, requestId } = await params;
  const session = await getSession();
  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId) || !canManageOrgUsers(session.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { action } = await request.json();
  if (!['approve', 'deny'].includes(action)) {
    return NextResponse.json({ error: 'action must be "approve" or "deny"' }, { status: 400 });
  }

  const reqRef = orgPasswordResetRequestsCol(orgId).doc(requestId);
  const reqSnap = await reqRef.get();
  const reqRow = reqSnap.exists ? reqSnap.data() : null;
  if (!reqRow) return NextResponse.json({ error: 'Request not found' }, { status: 404 });
  if (reqRow.status !== 'pending') {
    return NextResponse.json({ error: 'Request has already been resolved' }, { status: 400 });
  }

  const now = Date.now();

  if (action === 'deny') {
    await reqRef.update({ status: 'denied', resolvedAt: now, resolvedBy: session.id, updatedAt: now });
    return NextResponse.json({ ok: true, status: 'denied' });
  }

  const targetSnap = await userDoc(reqRow.userId).get();
  const target = targetSnap.exists ? targetSnap.data() : null;
  if (!target || target.orgId !== orgId) return NextResponse.json({ error: 'User not found' }, { status: 404 });
  if (session.role !== 'super_admin' && ['org_admin', 'super_admin'].includes(target.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const tempPassword = await applyPasswordReset({
    orgId,
    userId: target.id,
    targetName: target.name,
    actingSession: session,
    ipAddress: getClientIp(request),
    details: { viaPasswordResetRequest: requestId },
  });

  await reqRef.update({ status: 'approved', resolvedAt: now, resolvedBy: session.id, updatedAt: now });

  return NextResponse.json({ ok: true, status: 'approved', tempPassword });
}
