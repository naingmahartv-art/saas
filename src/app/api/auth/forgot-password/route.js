import { NextResponse } from 'next/server';
import { randomUUID } from 'crypto';
import { usersCol, orgPasswordResetRequestsCol } from '@/lib/db/firestore.js';
import { logActivity } from '@/lib/db/log-activity.js';
import { getClientIp } from '@/lib/auth/permissions.js';

// Always the same response, whether or not the email matched — avoids leaking which emails have accounts.
const GENERIC_MESSAGE = 'If that account exists, your organization admin has been notified.';

// POST /api/auth/forgot-password — public, unauthenticated. Queues a
// password-reset request for the user's org admin to approve; no email is
// ever sent and the user never gets to set a password directly.
export async function POST(request) {
  const { email } = await request.json();
  if (!email || typeof email !== 'string') {
    return NextResponse.json({ error: 'Email is required' }, { status: 400 });
  }

  const snap = await usersCol().where('email', '==', email.trim().toLowerCase()).limit(1).get();
  const user = snap.empty ? null : { id: snap.docs[0].id, ...snap.docs[0].data() };

  if (user && user.orgId && user.status !== 'suspended') {
    const existingPending = await orgPasswordResetRequestsCol(user.orgId)
      .where('userId', '==', user.id)
      .where('status', '==', 'pending')
      .limit(1)
      .get();

    if (existingPending.empty) {
      const id = randomUUID();
      const now = Date.now();
      await orgPasswordResetRequestsCol(user.orgId).doc(id).set({
        id,
        orgId: user.orgId,
        userId: user.id,
        userEmail: user.email,
        userName: user.name,
        status: 'pending',
        requestedAt: now,
        resolvedAt: null,
        resolvedBy: null,
        updatedAt: now,
      });

      await logActivity({
        orgId: user.orgId,
        userId: user.id,
        userName: user.name,
        userRole: user.role,
        action: 'create',
        entity: 'password_reset_request',
        entityId: user.id,
        ipAddress: getClientIp(request),
      });
    }
  }

  return NextResponse.json({ message: GENERIC_MESSAGE });
}
