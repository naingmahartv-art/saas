import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { systemResourcesCol } from '@/lib/db/firestore.js';
import LandingPage from '@/components/LandingPage';

export const dynamic = 'force-dynamic';

export default async function Home() {
  const session = await getSession();
  const isElectron = process.env.NEXT_PUBLIC_APP_MODE === 'electron' || process.env.APP_MODE === 'electron';

  if (!session) {
    if (isElectron) redirect('/login');

    let resources = [];
    try {
      const snap = await systemResourcesCol().get();
      if (!snap.empty) {
        resources = snap.docs.map(doc => ({ id: doc.id, ...doc.data() }));
      }
    } catch (err) {
      console.error('Server Firestore read error on landing page:', err);
    }

    return <LandingPage initialResources={resources} />;
  }

  if (isElectron && session.orgId) {
    redirect(`/org/${session.orgId}/select-app`);
  }

  if (session.role === 'super_admin') redirect('/admin');
  if (session.role === 'org_admin') redirect(`/org/${session.orgId}/admin/dashboard`);
  redirect('/dashboard');
}
