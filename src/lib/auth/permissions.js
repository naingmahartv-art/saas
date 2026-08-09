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
  return ALL_ROLES.includes(role);
}

export function canManageOrgUsers(role) {
  return ADMIN_ROLES.includes(role);
}

/** The org's currently-open lottery session doc, or null. */
export async function getActiveSession(orgId) {
  const snap = await orgSessionsCol(orgId).where('isActive', '==', true).limit(1).get();
  if (snap.empty) return null;
  return { id: snap.docs[0].id, ...snap.docs[0].data() };
}

/** True while the org has a currently-open lottery session. */
export async function hasActiveSession(orgId) {
  return !!(await getActiveSession(orgId));
}

/**
 * Cashiers can only create/edit voucher entries while a lottery session is
 * active; once the session is closed they're read-only until the next one
 * opens. Every other role is unrestricted. Returns an { error, status }
 * object to return as-is from the route on failure, or null when allowed.
 */
export async function assertCashierWriteAllowed(session, orgId) {
  if (session.role !== 'cashier') return null;
  const active = await hasActiveSession(orgId);
  if (!active) {
    return { error: 'No active session — read-only until a new session starts', status: 403 };
  }
  return null;
}

export function getClientIp(request) {
  const forwarded = request.headers.get('x-forwarded-for');
  if (forwarded) return forwarded.split(',')[0].trim();
  return request.headers.get('x-real-ip') || null;
}
