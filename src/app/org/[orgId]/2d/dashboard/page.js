import { redirect } from 'next/navigation';

export default async function OrgDashboard({ params }) {
  const { orgId } = await params;
  redirect(`/org/${orgId}/2d/ledger`);
}
