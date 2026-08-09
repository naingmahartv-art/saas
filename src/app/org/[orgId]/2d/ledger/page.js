import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgAgentsCol, orgRatesDoc, orgRestrictionDoc, orgMachinesCol } from '@/lib/db/firestore.js';
import { getActiveSession } from '@/lib/auth/permissions.js';
import LedgerWorkspace from './LedgerWorkspace.js';

export const dynamic = 'force-dynamic';

export default async function LedgerPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const [activeSession, agentsSnap, rateSnap, limitSnap, machinesSnap] = await Promise.all([
    getActiveSession(orgId),
    orgAgentsCol(orgId).orderBy('agentName', 'asc').get(),
    orgRatesDoc(orgId).get(),
    orgRestrictionDoc(orgId, 'limits').get(),
    orgMachinesCol(orgId).orderBy('machineId', 'asc').get(),
  ]);

  const agentsList = agentsSnap.docs.map(d => d.data());
  const rateRow = rateSnap.exists ? rateSnap.data() : null;
  const limitRow = limitSnap.exists ? limitSnap.data() : null;
  const machinesList = machinesSnap.docs.map(d => d.data());

  const machines = machinesList.length > 0
    ? machinesList
    : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];

  // Hot/not-buy numbers and the winning number all live as fields on the
  // active session's own document — folded in per the Firestore data model,
  // so no extra queries are needed once we already have `activeSession`.
  const notBuyList = activeSession?.notBuyNumbers || [];
  const hotList = activeSession?.hotNumbers || [];
  const luckyNumber = activeSession?.luckyNumber || null;

  // Cashiers can only create/edit vouchers while a session is active; every
  // other role is unrestricted.
  const canWrite = session.role !== 'cashier' || !!activeSession;

  return (
    <LedgerWorkspace
      orgId={orgId}
      activeSession={activeSession ?? null}
      agents={agentsList}
      rate={rateRow}
      limit={limitRow}
      notBuyNumbers={notBuyList}
      hotNumbers={hotList}
      luckyNumber={luckyNumber}
      machines={machines}
      canWrite={canWrite}
    />
  );
}
