import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import { orgAgentsCol } from '@/lib/db/firestore.js';
import LocalVouchersManager from './LocalVouchersManager.js';

export const dynamic = 'force-dynamic';

export default async function LocalVouchersPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  let agents = [];
  try {
    const fetchPromise = orgAgentsCol(orgId).orderBy('agentName', 'asc').get();
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('timeout')), 2000)
    );
    const snap = await Promise.race([fetchPromise, timeoutPromise]);
    if (snap?.docs) {
      agents = snap.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    }
  } catch {
    // Offline fallback
  }

  // Instant offline rendering — full width layout
  return (
    <div className="w-full p-3 sm:p-6">
      <LocalVouchersManager orgId={orgId} initialAgents={agents} />
    </div>
  );
}
