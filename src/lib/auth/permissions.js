import { orgSessionsCol, orgRoleDoc } from '../db/firestore.js';
import { DEFAULT_ROLES, ALL_PERMISSION_KEYS } from './permissionMatrix.js';

// roles: 'super_admin' | 'org_admin' | 'supervisor' | 'cashier'
export const ALL_ROLES = ['super_admin', 'org_admin', 'supervisor', 'cashier'];
export const ADMIN_ROLES = ['super_admin', 'org_admin'];
// Roles an org_admin is allowed to hand out — org_admin cannot create other org_admins.
export const ORG_ASSIGNABLE_ROLES = ['supervisor', 'cashier'];

/**
 * Fetch permissions for a given role in an organization (combines defaults with Firestore custom overrides).
 */
export async function getRolePermissions(orgId, roleId) {
  if (!roleId) return [];
  if (roleId === 'super_admin') return ALL_PERMISSION_KEYS;

  try {
    if (orgId) {
      const snap = await orgRoleDoc(orgId, roleId).get();
      if (snap.exists) {
        const data = snap.data();
        if (Array.isArray(data.permissions)) {
          return data.permissions;
        }
      }
    }
  } catch {
    // Offline / Firestore fallback
  }

  const defRole = DEFAULT_ROLES.find((r) => r.id === roleId);
  return defRole ? defRole.permissions : [];
}

/**
 * Check if the user session has the required permission.
 */
export async function hasPermission(session, orgId, permissionKey) {
  if (!session) return false;
  if (session.role === 'super_admin') return true;
  if (session.role === 'org_admin') {
    // Org Admin has all permissions unless explicitly overridden in orgRoleDoc
    const perms = await getRolePermissions(orgId, session.role);
    return perms.length > 0 ? perms.includes(permissionKey) : true;
  }

  const permissions = await getRolePermissions(orgId, session.role);
  return permissions.includes(permissionKey);
}

/**
 * Assertion helper to guard API endpoints with granular permissions.
 */
export async function assertPermission(session, orgId, permissionKey) {
  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    return { error: 'Unauthorized', status: 401 };
  }

  const allowed = await hasPermission(session, orgId, permissionKey);
  if (!allowed) {
    return {
      error: `Forbidden: Your user role (${session.role}) does not have permission for "${permissionKey}"`,
      status: 403,
    };
  }
  return null;
}

export function canAccessAdminPanel(role) {
  return ADMIN_ROLES.includes(role);
}

export function canAccessOrgApp(role) {
  return Boolean(role && typeof role === 'string' && role.trim().length > 0);
}

export function canManageOrgUsers(role) {
  return ADMIN_ROLES.includes(role);
}

/** The org's currently-open lottery session doc, or null. */
export async function getActiveSession(orgId) {
  const snap = await orgSessionsCol(orgId).where('isActive', '==', true).limit(1).get();
  if (snap.empty) return null;
  const data = snap.docs[0].data() || {};
  const plainData = JSON.parse(
    JSON.stringify(data, (key, value) => {
      if (value && typeof value === 'object' && ('_seconds' in value || typeof value.toDate === 'function')) {
        return value._seconds ? value._seconds * 1000 : String(value);
      }
      return value;
    })
  );
  return { id: snap.docs[0].id, ...plainData };
}

/** True while the org has a currently-open lottery session. */
export async function hasActiveSession(orgId) {
  return !!(await getActiveSession(orgId));
}

/**
 * Check if the user is permitted to write (create, edit, delete) vouchers for a session.
 * - Admin roles ('super_admin', 'org_admin') & 'supervisor' can create/edit vouchers at any time,
 *   including past/finished sessions.
 * - 'cashier' can ONLY create/edit vouchers while the session is OPEN and active.
 */
export async function assertCashierWriteAllowed(session, orgId, targetSessionData = null) {
  // Unrestricted roles: super_admin, org_admin, supervisor
  if (['super_admin', 'org_admin', 'supervisor'].includes(session.role)) {
    return null;
  }

  // If a specific target session is provided (e.g., editing/saving to a specific session doc)
  if (targetSessionData) {
    const isActive = targetSessionData.isActive === true;
    if (!isActive) {
      return {
        error: 'This session has finished. Cashiers cannot create or edit vouchers after session closes.',
        status: 403,
      };
    }
    return null;
  }

  // Otherwise check if there is an active session currently open in the organization
  const active = await hasActiveSession(orgId);
  if (!active) {
    return {
      error: 'No active session. Cashiers cannot create or edit vouchers when the session is closed.',
      status: 403,
    };
  }
  return null;
}

export function getClientIp(request) {
  const forwarded = request.headers.get('x-forwarded-for');
  if (forwarded) return forwarded.split(',')[0].trim();
  return request.headers.get('x-real-ip') || null;
}
