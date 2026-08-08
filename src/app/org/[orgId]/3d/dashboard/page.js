import Link from 'next/link';

export default async function ThreeDDashboardPlaceholder({ params }) {
  const { orgId } = await params;

  return (
    <main className="max-w-2xl mx-auto px-6 py-20 text-center">
      <div className="text-5xl mb-4">🎲</div>
      <h1 className="text-2xl font-bold text-gray-900 mb-2">3D — Coming soon</h1>
      <p className="text-gray-500 text-sm mb-8">The 3D lottery app isn&apos;t built yet. Check back soon.</p>
      <Link href={`/org/${orgId}/select-app`} className="btn-secondary">
        ← Back to app picker
      </Link>
    </main>
  );
}
