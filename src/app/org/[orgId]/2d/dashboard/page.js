import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, usersCol, orgSubscriptionsCol } from '@/lib/db/firestore.js';
import DashboardView from './DashboardView';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';

export default async function OrgDashboard({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  const [orgSnap, usersSnap, subSnap] = await Promise.all([
    orgDoc(orgId).get(),
    usersCol().where('orgId', '==', orgId).get(),
    orgSubscriptionsCol(orgId).limit(1).get(),
  ]);
  if (!orgSnap.exists) redirect('/login');

  const org = orgSnap.data();
  const orgUsers = usersSnap.docs.map(d => d.data());
  const sub = subSnap.empty ? null : subSnap.docs[0].data();

  return <DashboardView orgId={orgId} org={org} orgUsers={orgUsers} sub={sub} role={session.role} />;
}
