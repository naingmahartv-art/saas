import { orgAgentsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import AgentManager from './AgentManager.js';

export const dynamic = 'force-dynamic';

export default async function AgentsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const snap = await orgAgentsCol(orgId).orderBy('agentName', 'asc').get();
  const agentsList = snap.docs.map(d => d.data());

  return (
    <div className="p-6">
      <AgentManager orgId={orgId} initialAgents={agentsList} />
    </div>
  );
}
