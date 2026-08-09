import { randomUUID } from 'crypto';
import { orgActivityLogsCol } from './firestore.js';

// Best-effort audit trail write — failures are logged but never thrown, so a
// broken/unavailable log store can't take down the request it's describing.
export async function logActivity({ orgId, userId, userName, userRole, action, entity, entityId, details, ipAddress }) {
  try {
    const id = randomUUID();
    await orgActivityLogsCol(orgId || 'platform').doc(id).set({
      id,
      orgId: orgId || 'platform',
      userId,
      userName,
      userRole,
      action,
      entity,
      entityId: entityId ?? null,
      details: details != null ? JSON.stringify(details) : null,
      ipAddress: ipAddress ?? null,
      createdAt: Date.now(),
    });
  } catch (err) {
    console.error('logActivity failed:', err);
  }
}
