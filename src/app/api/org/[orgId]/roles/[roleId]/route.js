import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { orgRoleDoc } from '@/lib/db/firestore.js';
import { DEFAULT_ROLES } from '@/lib/auth/permissionMatrix.js';
import { logActivity } from '@/lib/db/log-activity.js';

export async function PUT(request, { params }) {
  try {
    const { orgId, roleId } = await params;
    const session = await getSession();
    if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();
    const { name, description, permissions } = body;

    const safePermissions = Array.isArray(permissions) ? permissions : [];
    const updateData = {
      permissions: safePermissions,
      updatedAt: Date.now(),
      updatedBy: session.id || session.userId || 'admin',
    };

    if (name) updateData.name = name.trim();
    if (description !== undefined) updateData.description = description.trim();

    await orgRoleDoc(orgId, roleId).set(updateData, { merge: true });

    await logActivity({
      orgId,
      userId: session.id || session.userId,
      userName: session.name,
      userRole: session.role,
      action: 'edit',
      entity: 'role',
      entityId: roleId,
      details: `Updated permissions for role "${name || roleId}" (${safePermissions.length} permissions)`,
    }).catch(() => {});

    return NextResponse.json({ success: true, roleId, ...updateData });
  } catch (err) {
    return NextResponse.json({ error: err.message || 'Failed to update role' }, { status: 500 });
  }
}

export async function DELETE(request, { params }) {
  try {
    const { orgId, roleId } = await params;
    const session = await getSession();
    if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const isSystem = DEFAULT_ROLES.some((r) => r.id === roleId);
    if (isSystem) {
      // If it's a system role, deleting custom overrides will restore factory defaults
      await orgRoleDoc(orgId, roleId).delete();
      return NextResponse.json({ success: true, restoredDefault: true });
    }

    await orgRoleDoc(orgId, roleId).delete();

    await logActivity({
      orgId,
      userId: session.id || session.userId,
      userName: session.name,
      userRole: session.role,
      action: 'delete',
      entity: 'role',
      entityId: roleId,
      details: `Deleted custom user role "${roleId}"`,
    }).catch(() => {});

    return NextResponse.json({ success: true });
  } catch (err) {
    return NextResponse.json({ error: err.message || 'Failed to delete role' }, { status: 500 });
  }
}
