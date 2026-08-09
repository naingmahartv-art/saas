import { orgDoc, orgRatesDoc, orgRestrictionDoc } from '@/lib/db/firestore.js';
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

  const [orgSnap, activeSession, ratesSnap, limitsSnap] = await Promise.all([
    orgDoc(orgId).get(),
    getActiveSession(orgId),
    orgRatesDoc(orgId).get(),
    orgRestrictionDoc(orgId, 'limits').get(),
  ]);
  if (!orgSnap.exists) redirect('/login');

  const onCount = activeSession?.onCount ?? null;
  // Hot/not-buy numbers live as array fields on the active session's own
  // document (folded in per the Firestore data model) — already available
  // from getActiveSession, no extra query needed.
  const hotNumbersList = (activeSession?.hotNumbers || []).map(num => ({ id: num, num, onCount, orgId }));
  const notBuyNumbersList = (activeSession?.notBuyNumbers || []).map(num => ({ id: num, num, onCount, orgId }));

  return (
    <div className="max-w-4xl mx-auto px-6 py-8">
      <SettingsPanel
        orgId={orgId}
        onCount={onCount}
        initialRates={ratesSnap.exists ? ratesSnap.data() : null}
        initialLimits={limitsSnap.exists ? limitsSnap.data() : null}
        initialHotNumbers={hotNumbersList}
        initialNotBuyNumbers={notBuyNumbersList}
      />
    </div>
  );
}
