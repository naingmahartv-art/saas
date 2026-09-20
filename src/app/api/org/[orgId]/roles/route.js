import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { orgRolesCol, orgRoleDoc } from '@/lib/db/firestore.js';
import { DEFAULT_ROLES, ALL_PERMISSION_KEYS } from '@/lib/auth/permissionMatrix.js';
import { logActivity } from '@/lib/db/log-activity.js';

export async function GET(request, { params }) {
  try {
    const { orgId } = await params;
    const session = await getSession();
    if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    // Fetch custom roles or role overrides from Firestore
    let customRoles = [];
    try {
      const snap = await orgRolesCol(orgId).get();
      customRoles = snap.docs.map((d) => ({ id: d.id, ...d.data() }));
    } catch {
      // Offline fallback
    }

    const customRoleMap = new Map(customRoles.map((r) => [r.id, r]));

    // Merge default roles with custom roles (or overrides)
    const mergedRoles = DEFAULT_ROLES.map((def) => {
      const override = customRoleMap.get(def.id);
      if (override) {
        customRoleMap.delete(def.id);
        return {
          ...def,
          ...override,
          isSystem: true,
        };
      }
      return def;
    });

    // Append custom created roles
    customRoleMap.forEach((role) => {
      mergedRoles.push({
        ...role,
        isSystem: false,
      });
    });

    return NextResponse.json({ roles: mergedRoles });
  } catch (err) {
    return NextResponse.json({ error: err.message || 'Failed to fetch roles' }, { status: 500 });
  }
}

export async function POST(request, { params }) {
  try {
    const { orgId } = await params;
    const session = await getSession();
    if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();
    const { name, description, permissions, roleId } = body;

    if (!name || typeof name !== 'string' || !name.trim()) {
      return NextResponse.json({ error: 'Role name is required' }, { status: 400 });
    }

    const safePermissions = Array.isArray(permissions) ? permissions : [];
    const id = (roleId || name.toLowerCase().replace(/[^a-z0-9]/g, '_')).trim();

    const roleData = {
      name: name.trim(),
      description: (description || '').trim(),
      permissions: safePermissions,
      updatedAt: Date.now(),
      createdAt: Date.now(),
      createdBy: session.id || session.userId || 'admin',
    };

    await orgRoleDoc(orgId, id).set(roleData, { merge: true });

    await logActivity({
      orgId,
      userId: session.id || session.userId,
      userName: session.name,
      userRole: session.role,
      action: 'create',
      entity: 'role',
      entityId: id,
      details: `Created user role "${name.trim()}" with ${safePermissions.length} permissions`,
    }).catch(() => {});

    return NextResponse.json({ role: { id, ...roleData, isSystem: false } });
  } catch (err) {
    return NextResponse.json({ error: err.message || 'Failed to save role' }, { status: 500 });
  }
}
