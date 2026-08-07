import fs from 'fs';
import path from 'path';

const FEATURES = [
  {
    title: 'Agent & ledger management',
    body: 'Track agents, sessions, sales, and ledger entries per organization, with full history for every session.',
  },
  {
    title: 'Rates, limits & restrictions',
    body: 'Configure payout rates, per-number bet limits, hot numbers, and restriction lists (brade, power, series) centrally.',
  },
  {
    title: 'Works online or fully offline',
    body: 'Use it in the browser, or install the desktop app and keep working with no internet at all — data syncs automatically once you’re back online.',
  },
  {
    title: 'Multi-organization support',
    body: 'One platform, many shops — role-based access for super admins, org admins, and members.',
  },
];

function fileExists(relativePath) {
  return fs.existsSync(path.join(process.cwd(), 'public', relativePath));
}

export default function LandingPage() {
  const macAvailable = fileExists('downloads/SaaS-Platform-mac-arm64.dmg');
  const winAvailable = fileExists('downloads/SaaS-Platform-win-x64.exe');

  return (
    <div className="min-h-screen">
      <header className="px-6 py-4 flex items-center justify-between max-w-5xl mx-auto">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center">
            <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <span className="font-semibold text-gray-900">SaaS Platform</span>
        </div>
        <a href="/login" className="btn-secondary text-sm py-1.5">Sign in</a>
      </header>

      <main className="max-w-5xl mx-auto px-6">
        <section className="py-16 text-center">
          <h1 className="text-4xl font-bold text-gray-900 tracking-tight">
            Agent & ledger management, online or fully offline
          </h1>
          <p className="mt-4 text-lg text-gray-500 max-w-2xl mx-auto">
            Run your shop from the browser, or install the desktop app and keep working with
            no internet connection — everything syncs automatically once you&rsquo;re back online.
          </p>
          <div className="mt-8 flex items-center justify-center gap-3">
            <a href="/login" className="btn-primary">Sign in to your account</a>
          </div>
        </section>

        <section className="grid sm:grid-cols-2 gap-5 py-8">
          {FEATURES.map((f) => (
            <div key={f.title} className="card">
              <h3 className="font-semibold text-gray-900">{f.title}</h3>
              <p className="mt-1.5 text-sm text-gray-500">{f.body}</p>
            </div>
          ))}
        </section>

        <section className="py-16">
          <div className="card text-center">
            <h2 className="text-xl font-semibold text-gray-900">Download the desktop app</h2>
            <p className="mt-1.5 text-sm text-gray-500">
              A native app that works fully offline and syncs to the cloud automatically.
            </p>
            <div className="mt-6 flex flex-col sm:flex-row items-center justify-center gap-3">
              {macAvailable ? (
                <a href="/downloads/SaaS-Platform-mac-arm64.dmg" className="btn-primary w-full sm:w-auto" download>
                  Download for Mac (Apple Silicon)
                </a>
              ) : (
                <span className="btn-secondary w-full sm:w-auto opacity-50 cursor-not-allowed">
                  Mac — coming soon
                </span>
              )}
              {winAvailable ? (
                <a href="/downloads/SaaS-Platform-win-x64.exe" className="btn-primary w-full sm:w-auto" download>
                  Download for Windows
                </a>
              ) : (
                <span className="btn-secondary w-full sm:w-auto opacity-50 cursor-not-allowed">
                  Windows — coming soon
                </span>
              )}
            </div>
          </div>
        </section>
      </main>

      <footer className="max-w-5xl mx-auto px-6 py-8 text-center text-xs text-gray-400">
        SaaS Platform
      </footer>
    </div>
  );
}
