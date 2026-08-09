import bcrypt from 'bcryptjs';
import { randomBytes } from 'crypto';
import { userDoc } from '@/lib/db/firestore.js';
import { logActivity } from '@/lib/db/log-activity.js';

export function generateTempPassword() {
  // 12 URL-safe chars, no confusable padding — shown once to the admin.
  return randomBytes(9).toString('base64url');
}

/** Resets a user's password to a freshly generated one, logs the action, and returns the plaintext temp password once. */
export async function applyPasswordReset({ orgId, userId, targetName, actingSession, ipAddress, details }) {
  const tempPassword = generateTempPassword();
  await userDoc(userId).update({ passwordHash: bcrypt.hashSync(tempPassword, 10), updatedAt: Date.now() });

  await logActivity({
    orgId,
    userId: actingSession.id,
    userName: actingSession.name,
    userRole: actingSession.role,
    action: 'edit',
    entity: 'user',
    entityId: userId,
    details: { name: targetName, resetPassword: true, ...details },
    ipAddress,
  });

  return tempPassword;
}
