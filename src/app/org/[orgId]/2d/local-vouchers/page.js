import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import LocalVouchersManager from './LocalVouchersManager.js';

export const dynamic = 'force-dynamic';

export default async function LocalVouchersPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  // Instant offline rendering — do not block on server Firestore queries
  return (
    <div className="p-4 sm:p-6 max-w-7xl mx-auto">
      <LocalVouchersManager orgId={orgId} />
    </div>
  );
}
