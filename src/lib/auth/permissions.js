import { orgSessionsCol } from '@/lib/db/firestore.js';

// roles: 'super_admin' | 'org_admin' | 'supervisor' | 'cashier'
export const ALL_ROLES = ['super_admin', 'org_admin', 'supervisor', 'cashier'];
export const ADMIN_ROLES = ['super_admin', 'org_admin'];
// Roles an org_admin is allowed to hand out — org_admin cannot create other org_admins.
export const ORG_ASSIGNABLE_ROLES = ['supervisor', 'cashier'];

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
