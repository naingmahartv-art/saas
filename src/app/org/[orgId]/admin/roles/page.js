import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, orgRolesCol } from '@/lib/db/firestore.js';
import { canAccessAdminPanel } from '@/lib/auth/permissions.js';
import { DEFAULT_ROLES, PERMISSION_GROUPS } from '@/lib/auth/permissionMatrix.js';
import RoleManager from './RoleManager.js';

export const dynamic = 'force-dynamic';

export default async function RolesAdminPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessAdminPanel(session.role)) {
    redirect(`/org/${orgId}/2d/ledger`);
  }

  let orgName = session.orgName || 'Admin Panel';
  let initialRoles = DEFAULT_ROLES;

  try {
    const [orgSnap, rolesSnap] = await Promise.all([
      orgDoc(orgId).get(),
      orgRolesCol(orgId).get(),
    ]);

    if (orgSnap.exists) {
      orgName = orgSnap.data()?.name || orgName;
    }

    const customRoles = rolesSnap.docs.map((d) => ({ id: d.id, ...d.data() }));
    const customRoleMap = new Map(customRoles.map((r) => [r.id, r]));

    const merged = DEFAULT_ROLES.map((def) => {
      const override = customRoleMap.get(def.id);
      if (override) {
        customRoleMap.delete(def.id);
        return { ...def, ...override, isSystem: true };
      }
      return def;
    });

    customRoleMap.forEach((role) => {
      merged.push({ ...role, isSystem: false });
    });

    initialRoles = merged;
  } catch {
    // Offline fallback
  }

  return (
    <div className="p-6 max-w-6xl mx-auto space-y-6">
      <RoleManager
        orgId={orgId}
        orgName={orgName}
        initialRoles={initialRoles}
        permissionGroups={PERMISSION_GROUPS}
        currentUserRole={session.role}
      />
    </div>
  );
}
