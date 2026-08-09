import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, usersCol } from '@/lib/db/firestore.js';
import UserManager from './UserManager';

export const dynamic = 'force-dynamic';

export default async function OrgUsersPage({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const [orgSnap, usersSnap] = await Promise.all([
    orgDoc(orgId).get(),
    usersCol().where('orgId', '==', orgId).get(),
  ]);
  if (!orgSnap.exists) redirect('/login');

  const orgUsers = usersSnap.docs.map(d => d.data());

  return (
    <div className="max-w-5xl mx-auto px-6 py-8">
      <UserManager orgId={orgId} orgName={orgSnap.data().name} initialUsers={orgUsers} currentUserRole={session.role} />
    </div>
  );
}
