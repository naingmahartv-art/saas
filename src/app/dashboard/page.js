import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';

// Legacy generic landing route — kept as a pure role router so old links
// (bookmarks, the JWT-only middleware fallback) still land somewhere sane.
export default async function DashboardRedirect() {
  const session = await getSession();
  if (!session) redirect('/login');
  if (session.role === 'super_admin') redirect('/admin');
  if (session.role === 'org_admin') redirect(`/org/${session.orgId}/admin/dashboard`);
  redirect(`/org/${session.orgId}/2d/dashboard`);
}
