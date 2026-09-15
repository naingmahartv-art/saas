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

  let agentsList = [];
  let balances = [];
  let receives = [];

  try {
    const fetchPromise = Promise.all([
      orgAgentsCol(orgId).orderBy('agentName', 'asc').get(),
      orgBalanceCol(orgId).get(),
      orgReceiveCol(orgId).get(),
    ]);
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const [agentsSnap, balanceSnap, receiveSnap] = await Promise.race([
      fetchPromise,
      timeoutPromise,
    ]);
    agentsList = agentsSnap.docs.map(d => d.data());
    balances = balanceSnap.docs.map(d => d.data()).sort(byDateDesc);
    receives = receiveSnap.docs.map(d => d.data()).sort(byDateDesc);
  } catch {
    // Offline fallback
  }

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
