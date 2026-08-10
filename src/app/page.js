import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import LandingPage from '@/components/LandingPage';

export default async function Home() {
  const session = await getSession();
  const isElectron = process.env.NEXT_PUBLIC_APP_MODE === 'electron' || process.env.APP_MODE === 'electron';

  if (!session) {
    if (isElectron) redirect('/login');
    return <LandingPage />;
  }

  if (isElectron && session.orgId) {
    redirect(`/org/${session.orgId}/select-app`);
  }

  if (session.role === 'super_admin') redirect('/admin');
  if (session.role === 'org_admin') redirect(`/org/${session.orgId}/admin/dashboard`);
  redirect('/dashboard');
}
