import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, userDoc } from '@/lib/db/firestore.js';
import Sidebar2D from '@/components/Sidebar2D';
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

  const [orgSnap, meSnap] = await Promise.all([orgDoc(orgId).get(), userDoc(session.id).get()]);
  const org = orgSnap.exists ? orgSnap.data() : null;
  if (!org) redirect('/login');
  // Authoritative, always-fresh suspension check — the JWT-carried status
  // middleware checks can be stale for up to 7 days.
  if (meSnap.data()?.status === 'suspended') redirect('/suspended');

  return (
    <div className="min-h-screen flex bg-gray-50 dark:bg-slate-950 dark:text-slate-100">
      <Sidebar2D orgId={orgId} orgName={org.name} userName={session.name} role={session.role} />
      <main className="flex-1 min-w-0">{children}</main>
    </div>
  );
}
