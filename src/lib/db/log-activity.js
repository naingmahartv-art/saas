import { randomUUID } from 'crypto';
import { activityLogs } from './schema.js';

// Best-effort audit trail write — failures are logged but never thrown, so a
// broken/unavailable log table can't take down the request it's describing.
export async function logActivity(db, { orgId, userId, userName, userRole, action, entity, entityId, details, ipAddress }) {
  try {
    await db.insert(activityLogs).values({
      id: randomUUID(),
      orgId,
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
