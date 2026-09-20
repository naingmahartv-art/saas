import { orgDoc, orgRatesDoc, orgRestrictionDoc, orgAgentsCol } from '@/lib/db/firestore.js';
import { getActiveSession } from '@/lib/auth/permissions.js';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import SettingsPanel from './SettingsPanel.js';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';

export const dynamic = 'force-dynamic';

export default async function SettingsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  let orgSnap = null;
  let activeSession = null;
  let ratesSnap = null;
  let limitsSnap = null;
  let agentsSnap = null;

  try {
    const fetchPromise = Promise.all([
      orgDoc(orgId).get(),
      getActiveSession(orgId),
      orgRatesDoc(orgId).get(),
      orgRestrictionDoc(orgId, 'limits').get(),
      orgAgentsCol(orgId).orderBy('agentName', 'asc').get(),
    ]);
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const [oSnap, aSession, rSnap, lSnap, agSnap] = await Promise.race([
      fetchPromise,
      timeoutPromise,
    ]);
    orgSnap = oSnap;
    activeSession = aSession;
    ratesSnap = rSnap;
    limitsSnap = lSnap;
    agentsSnap = agSnap;
  } catch {
    // Offline fallback
  }

  const agents = agentsSnap?.docs ? agentsSnap.docs.map(doc => ({ id: doc.id, ...doc.data() })) : [];

  const orgData = orgSnap?.exists ? orgSnap.data() : null;
  const initialOperatingMode = orgData?.operatingMode || (orgData?.isOfflineMode ? 'offline' : 'online');
  const initialIsOfflineMode = Boolean(orgData?.isOfflineMode || orgData?.operatingMode === 'offline');

  const onCount = activeSession?.onCount ?? null;
  // Hot/not-buy numbers live as array fields on the active session's own
  // document (folded in per the Firestore data model) — already available
  // from getActiveSession, no extra query needed.
  const hotNumbersList = (activeSession?.hotNumbers || []).map(num => ({ id: num, num, onCount, orgId }));
  const notBuyNumbersList = (activeSession?.notBuyNumbers || []).map(num => ({ id: num, num, onCount, orgId }));

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-8">
      <SettingsPanel
        orgId={orgId}
        onCount={onCount}
        initialRates={ratesSnap?.exists ? ratesSnap.data() : null}
        initialLimits={limitsSnap?.exists ? limitsSnap.data() : null}
        initialHotNumbers={hotNumbersList}
        initialNotBuyNumbers={notBuyNumbersList}
        initialAgents={agents}
        initialOperatingMode={initialOperatingMode}
        initialIsOfflineMode={initialIsOfflineMode}
      />
    </div>
  );
}
