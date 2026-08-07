import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import LandingPage from '@/components/LandingPage';

export default async function Home() {
  const session = await getSession();
  if (!session) return <LandingPage />;
  if (session.role === 'super_admin') redirect('/admin');
  if (session.role === 'org_admin') redirect(`/org/${session.orgId}/select-app`);
  redirect('/dashboard');
}
