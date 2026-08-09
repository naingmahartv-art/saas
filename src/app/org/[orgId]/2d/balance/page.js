import { orgAgentsCol, orgBalanceCol, orgReceiveCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import BalanceManager from './BalanceManager.js';

export const dynamic = 'force-dynamic';

const byDateDesc = (a, b) => (a.onDate < b.onDate ? 1 : a.onDate > b.onDate ? -1 : 0);

export default async function BalancePage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const [agentsSnap, balanceSnap, receiveSnap] = await Promise.all([
    orgAgentsCol(orgId).orderBy('agentName', 'asc').get(),
    orgBalanceCol(orgId).get(),
    orgReceiveCol(orgId).get(),
  ]);

  const agentsList = agentsSnap.docs.map(d => d.data());
  const balances = balanceSnap.docs.map(d => d.data()).sort(byDateDesc);
  const receives = receiveSnap.docs.map(d => d.data()).sort(byDateDesc);

  const netByAgent = {};
  for (const row of balances) {
    netByAgent[row.agentName] = (netByAgent[row.agentName] || 0) + row.amount;
  }
  for (const row of receives) {
    netByAgent[row.agentName] = (netByAgent[row.agentName] || 0) - row.amount;
  }

  return (
    <div className="p-6">
      <BalanceManager
        orgId={orgId}
        initialAgents={agentsList}
        initialBalances={balances}
        initialReceives={receives}
        initialNetByAgent={netByAgent}
      />
    </div>
  );
}
