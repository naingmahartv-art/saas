import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, userDoc } from '@/lib/db/firestore.js';
import { canAccessAdminPanel } from '@/lib/auth/permissions.js';
import SidebarOrgAdmin from '@/components/SidebarOrgAdmin';

export default async function OrgAdminLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessAdminPanel(session.role)) {
    redirect(`/org/${orgId}/2d/ledger`);
  }

  let org = null;
  let me = null;

  try {
    const fetchPromise = Promise.all([orgDoc(orgId).get(), userDoc(session.id).get()]);
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const [orgSnap, meSnap] = await Promise.race([fetchPromise, timeoutPromise]);
    org = orgSnap.exists ? orgSnap.data() : null;
    me = meSnap.exists ? meSnap.data() : null;
    if (org && me?.status === 'suspended') {
      redirect('/suspended');
    }
  } catch {
    // Offline fallback
  }

  const orgName = org?.name || session.orgName || 'Admin Panel';

  return (
    <div className="min-h-screen flex bg-gray-50">
      <SidebarOrgAdmin orgId={orgId} orgName={orgName} userName={session.name} role={session.role} />
      <main className="flex-1 min-w-0">{children}</main>
    </div>
  );
}
