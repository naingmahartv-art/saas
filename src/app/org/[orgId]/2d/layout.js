import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth/session.js';
import { orgDoc, userDoc } from '@/lib/db/firestore.js';
import Sidebar2D from '@/components/Sidebar2D.js';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';

export default async function TwoDLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  let org = null;
  let me = null;

  try {
    const fetchPromise = Promise.all([orgDoc(orgId).get(), userDoc(session.id).get()]);
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const [orgSnap, meSnap] = await Promise.race([fetchPromise, timeoutPromise]);
    org = orgSnap?.exists ? orgSnap.data() : null;
    me = meSnap?.exists ? meSnap.data() : null;
    if (org && me?.status === 'suspended') {
      redirect('/suspended');
    }
  } catch {
    // Offline / Firestore timeout - use JWT session information
  }

  const orgName = org?.name || session.orgName || '2D Workspace';
  const isOfflineMode = Boolean(org?.isOfflineMode || org?.operatingMode === 'offline');

  return (
    <div className="min-h-screen flex bg-gray-50 dark:bg-slate-950 dark:text-slate-100">
      <Sidebar2D
        orgId={orgId}
        orgName={orgName}
        userName={session.name}
        role={session.role}
        isOfflineMode={isOfflineMode}
      />
      <main className="flex-1 min-w-0">{children}</main>
    </div>
  );
}
