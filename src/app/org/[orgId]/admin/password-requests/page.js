import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc, orgPasswordResetRequestsCol } from '@/lib/db/firestore.js';
import PasswordRequestsManager from './PasswordRequestsManager.js';

export const dynamic = 'force-dynamic';

export default async function PasswordRequestsPage({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const [orgSnap, requestsSnap] = await Promise.all([
    orgDoc(orgId).get(),
    orgPasswordResetRequestsCol(orgId).orderBy('requestedAt', 'desc').get(),
  ]);
  if (!orgSnap.exists) redirect('/login');

  const requests = requestsSnap.docs.map(d => d.data());

  return (
    <div className="max-w-4xl mx-auto px-6 py-8">
      <PasswordRequestsManager orgId={orgId} initialRequests={requests} />
    </div>
  );
}
