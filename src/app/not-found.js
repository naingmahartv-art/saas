import Link from 'next/link';

export default function NotFound() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-slate-900 text-white p-4">
      <h1 className="text-4xl font-bold mb-2">404</h1>
      <p className="text-gray-400 mb-4">Page Not Found</p>
      <Link href="/" className="px-4 py-2 bg-indigo-600 rounded text-white font-medium hover:bg-indigo-500 transition">
        Go Home
      </Link>
    </div>
  );
}
