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

  function toPlainObject(obj) {
    if (!obj) return obj;
    return JSON.parse(
      JSON.stringify(obj, (key, value) => {
        if (value && typeof value === 'object' && ('_seconds' in value || typeof value.toDate === 'function')) {
          return value._seconds ? value._seconds * 1000 : String(value);
        }
        return value;
      })
    );
  }

  const agentsList = toPlainObject(agentsSnap.docs.map(d => d.data())) || [];
  const rateRow = toPlainObject(rateSnap.exists ? rateSnap.data() : null);
  const limitRow = toPlainObject(limitSnap.exists ? limitSnap.data() : null);
  const machinesList = toPlainObject(machinesSnap.docs.map(d => d.data())) || [];

  const machines = machinesList.length > 0
    ? machinesList
    : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];

  const notBuyList = activeSession?.notBuyNumbers || [];
  const hotList = activeSession?.hotNumbers || [];
  const luckyNumber = activeSession?.luckyNumber || null;

  const canWrite = session.role !== 'cashier' || !!activeSession;

  return (
    <LedgerWorkspace
      orgId={orgId}
      activeSession={toPlainObject(activeSession) ?? null}
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
