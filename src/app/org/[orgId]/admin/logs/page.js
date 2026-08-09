import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { usersCol } from '@/lib/db/firestore.js';
import LogsViewer from './LogsViewer';

export const dynamic = 'force-dynamic';

export default async function ActivityLogsPage({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const snap = await usersCol().where('orgId', '==', orgId).get();
  const orgUsers = snap.docs.map(d => ({ id: d.data().id, name: d.data().name }));

  return (
    <div className="max-w-6xl mx-auto px-6 py-8">
      <LogsViewer orgId={orgId} orgUsers={orgUsers} />
    </div>
  );
}
