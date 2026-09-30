import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import InfoView from './InfoView.js';

export const dynamic = 'force-dynamic';

export default async function InfoPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  return (
    <div className="w-full min-h-screen bg-slate-50/50 p-2 sm:p-4">
      <InfoView orgId={orgId} />
    </div>
  );
}
