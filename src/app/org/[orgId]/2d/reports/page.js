import { getSession } from '@/lib/auth/session.js';
import { orgAgentsCol } from '@/lib/db/firestore.js';
import ReportsManager from './ReportsManager.js';

export default async function ReportsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  const isElectron = process.env.NEXT_PUBLIC_APP_MODE === 'electron' || process.env.APP_MODE === 'electron';
  if (isElectron) {
    redirect(`/org/${orgId}/2d/ledger`);
  }

  let agentsList = [];
  try {
    const agentsSnap = await orgAgentsCol(orgId).orderBy('agentName').get();
    agentsList = agentsSnap.docs.map(d => ({ id: d.id, ...d.data() }));
  } catch {
    agentsList = [];
  }

  return (
    <ReportsManager
      orgId={orgId}
      initialAgents={agentsList}
    />
  );
}
