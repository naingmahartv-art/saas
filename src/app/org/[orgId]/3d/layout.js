import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgDoc } from '@/lib/db/firestore.js';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';

export default async function ThreeDLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  const orgSnap = await orgDoc(orgId).get();
  if (!orgSnap.exists) redirect('/login');

  return <div className="min-h-screen bg-gray-50">{children}</div>;
}
