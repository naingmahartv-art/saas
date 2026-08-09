import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { usersCol, userDoc } from '@/lib/db/firestore.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// org_admin may only touch supervisor/cashier accounts (never other
// org_admins or super_admin) — super_admin can touch anyone in the org.
async function loadManageableTarget(session, orgId, userId) {
  const snap = await userDoc(userId).get();
  const target = snap.exists ? snap.data() : null;
  if (!target || target.orgId !== orgId) {
    return { error: NextResponse.json({ error: 'User not found' }, { status: 404 }) };
  }
  if (session.role !== 'super_admin' && ['org_admin', 'super_admin'].includes(target.role)) {
    return { error: NextResponse.json({ error: 'Unauthorized' }, { status: 401 }) };
  }
  return { target };
}

export async function DELETE(request, { params }) {
  const session = await getSession();
  const { orgId, userId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { target, error } = await loadManageableTarget(session, orgId, userId);
  if (error) return error;

  await usersCol().doc(userId).delete();

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'delete',
    entity: 'user',
    entityId: userId,
    details: { name: target.name, email: target.email, role: target.role },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true });
}

// PATCH — suspend / unsuspend a user
export async function PATCH(request, { params }) {
  const session = await getSession();
  const { orgId, userId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { status } = await request.json();
  if (!['active', 'suspended'].includes(status)) {
    return NextResponse.json({ error: "status must be 'active' or 'suspended'" }, { status: 400 });
  }

  const { target, error } = await loadManageableTarget(session, orgId, userId);
  if (error) return error;

  await usersCol().doc(userId).update({ status });

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'suspend',
    entity: 'user',
    entityId: userId,
    details: { name: target.name, from: target.status, to: status },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true, status });
}
