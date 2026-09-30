import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { usersCol, userDoc, orgRolesCol } from '@/lib/db/firestore.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

export const dynamic = 'force-dynamic';
export const revalidate = 0;

// org_admin may only touch supervisor/cashier accounts (never other
// org_admins or super_admin) — super_admin can touch anyone in the org.
async function loadManageableTarget(session, orgId, userId) {
  const snap = await userDoc(userId).get();
  const target = snap.exists ? snap.data() : null;
  if (!target || target.orgId !== orgId) {
    return { error: NextResponse.json({ error: 'User not found' }, { status: 404 }) };
  }
  if (session.role !== 'super_admin' && ['org_admin', 'super_admin'].includes(target.role)) {
    return { error: NextResponse.json({ error: 'Unauthorized to manage this account' }, { status: 401 }) };
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

// PATCH — update user details (role, status, name)
export async function PATCH(request, { params }) {
  const session = await getSession();
  const { orgId, userId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { status, role, name } = body;

  if (!status && !role && !name) {
    return NextResponse.json({ error: 'No fields to update provided' }, { status: 400 });
  }

  const { target, error } = await loadManageableTarget(session, orgId, userId);
  if (error) return error;

  const updates = {
    updatedAt: Date.now(),
  };

  // Validate and apply status change
  if (status !== undefined) {
    if (!['active', 'suspended'].includes(status)) {
      return NextResponse.json({ error: "status must be 'active' or 'suspended'" }, { status: 400 });
    }
    updates.status = status;
  }

  // Validate and apply role change
  if (role !== undefined) {
    let customRoleIds = [];
    try {
      const snap = await orgRolesCol(orgId).get();
      customRoleIds = snap.docs.map(d => d.id);
    } catch {
      // fallback
    }

    const baseAllowed = session.role === 'super_admin'
      ? ['org_admin', 'supervisor', 'cashier']
      : ['supervisor', 'cashier'];

    const allowedRoles = Array.from(new Set([...baseAllowed, ...customRoleIds]));
    if (!allowedRoles.includes(role)) {
      return NextResponse.json({
        error: `Role "${role}" is not valid or assignable. Allowed: ${allowedRoles.join(', ')}`,
      }, { status: 400 });
    }
    updates.role = role;
  }

  // Optional name update
  if (name !== undefined && typeof name === 'string' && name.trim()) {
    updates.name = name.trim();
  }

  await usersCol().doc(userId).update(updates);

  // Log activity
  let action = 'edit';
  let details = { name: target.name, ...updates };

  if (role && role !== target.role) {
    action = 'edit_role';
    details = { name: target.name, fromRole: target.role, toRole: role };
  } else if (status && status !== target.status) {
    action = 'suspend';
    details = { name: target.name, from: target.status, to: status };
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action,
    entity: 'user',
    entityId: userId,
    details,
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({
    ok: true,
    user: {
      id: userId,
      name: updates.name || target.name,
      email: target.email,
      role: updates.role || target.role,
      status: updates.status || target.status,
      updatedAt: updates.updatedAt,
    },
  });
}
