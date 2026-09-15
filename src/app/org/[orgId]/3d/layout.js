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

  try {
    const fetchPromise = orgDoc(orgId).get();
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const orgSnap = await Promise.race([fetchPromise, timeoutPromise]);
    if (orgSnap && !orgSnap.exists) redirect('/login');
  } catch {
    // Offline fallback
  }

  return <div className="min-h-screen bg-gray-50">{children}</div>;
}
