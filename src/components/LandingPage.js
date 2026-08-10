import React from 'react';
import Link from 'next/link';

const SETUP_DOWNLOAD_URL = "https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FSaaS%20Platform%20Setup%201.0.4.exe?alt=media&token=4ba05faa-bf39-4667-99fc-0d9df8a72958";

const FEATURES = [
  {
    icon: '📊',
    title: 'Agent & Ledger Management',
    myTitle: 'ကိုယ်စားလှယ်နှင့် ထိုးစာရင်း စီမံခန့်ခွဲမှု',
    body: 'Track agents, session sales, commission, payouts, and full voucher entry history per organization in real time.',
  },
  {
    icon: '⚡',
    title: 'Keyboard Shortcuts & Fast Entry',
    myTitle: 'မြန်ဆန်သော ကီးဘုတ် ဖြတ်လမ်းများ',
    body: 'Accelerate entries using F1-F12 keys, custom shortcuts, single/multi token expansions, and quick number checking.',
  },
  {
    icon: '🛡️',
    title: 'Rates, Limits & Restrictions',
    myTitle: 'နှုန်းများ၊ ကန့်သတ်ချက်နှင့် အဝယ်စာရင်း',
    body: 'Configure bet limits, hot numbers, not-buy numbers, and automatically generate real-time "အဝယ်" (Exceed Limit) lists.',
  },
  {
    icon: '📥',
    title: 'CSV & JSON Export/Import',
    myTitle: 'CSV / JSON ထုတ်ယူခြင်းနှင့် တိုက်ရိုက် Import',
    body: 'Export your records to CSV or JSON, copy clean clipboard text, and paste/import CSV data directly into entry slips.',
  },
];

export default function LandingPage() {
  return (
    <div className="min-h-screen bg-slate-900 text-slate-100 font-sans selection:bg-indigo-500 selection:text-white">
      {/* Background Glow Effects */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none z-0">
        <div className="absolute -top-40 -left-40 w-96 h-96 bg-indigo-600/20 rounded-full blur-3xl" />
        <div className="absolute top-1/2 -right-40 w-96 h-96 bg-purple-600/20 rounded-full blur-3xl" />
        <div className="absolute -bottom-40 left-1/3 w-96 h-96 bg-emerald-600/15 rounded-full blur-3xl" />
      </div>

      {/* Header */}
      <header className="relative z-10 border-b border-slate-800/80 backdrop-blur-md bg-slate-900/80 sticky top-0">
        <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-3 group">
            <div className="w-10 h-10 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-xl flex items-center justify-center shadow-lg shadow-indigo-500/20 group-hover:scale-105 transition-transform duration-200">
              <svg className="w-6 h-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
              </svg>
            </div>
            <div>
              <span className="font-bold text-lg text-white tracking-wide">SaaS Platform</span>
              <span className="text-xs text-indigo-400 block font-medium">2D/3D Management</span>
            </div>
          </Link>

          <nav className="hidden md:flex items-center gap-6 text-sm font-medium text-slate-300">
            <Link href="/" className="text-white font-semibold">Home</Link>
            <Link href="/tutorial" className="hover:text-indigo-400 transition flex items-center gap-1.5">
              <span>📚</span> Tutorials
            </Link>
            <a href={SETUP_DOWNLOAD_URL} className="hover:text-indigo-400 transition flex items-center gap-1">
              <span>💻</span> Download v1.0.4
            </a>
          </nav>

          <div className="flex items-center gap-3">
            <a
              href={SETUP_DOWNLOAD_URL}
              target="_blank"
              rel="noopener noreferrer"
              className="hidden sm:inline-flex items-center gap-2 text-xs px-3.5 py-2 bg-emerald-500 hover:bg-emerald-600 text-slate-950 font-semibold rounded-lg shadow-md shadow-emerald-500/20 transition active:scale-95"
            >
              <span>📥</span> Setup 1.0.4.exe
            </a>
            <Link
              href="/login"
              className="text-xs px-4 py-2 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-lg shadow-md shadow-indigo-600/30 transition active:scale-95"
            >
              Sign In
            </Link>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="relative z-10 max-w-6xl mx-auto px-6 py-12 space-y-16">
        {/* Hero Section */}
        <section className="py-12 text-center space-y-6 max-w-3xl mx-auto">
          <div className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-indigo-500/10 border border-indigo-500/20 text-indigo-400 text-xs font-semibold">
            <span>✨</span> Modern Cloud-Hosted 2D/3D Ledger System
          </div>
          <h1 className="text-4xl sm:text-6xl font-extrabold text-white tracking-tight leading-tight">
            Manage Your Shop & Ledger <br className="hidden sm:block" />
            <span className="bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
              Anytime, Anywhere
            </span>
          </h1>
          <p className="text-slate-400 text-base sm:text-lg leading-relaxed">
            Run your shop seamlessly from the browser or official desktop application. Every session, voucher entry, limit calculation, and settlement is saved centrally in real time.
          </p>

          <div className="pt-4 flex flex-wrap items-center justify-center gap-4">
            <a
              href={SETUP_DOWNLOAD_URL}
              className="px-6 py-3.5 bg-gradient-to-r from-emerald-500 to-teal-500 hover:from-emerald-400 hover:to-teal-400 text-slate-950 font-bold text-sm rounded-xl shadow-lg shadow-emerald-500/20 transition transform hover:-translate-y-0.5 flex items-center gap-2"
            >
              <span>📥</span> Download Windows App (Setup 1.0.4.exe)
            </a>
            <Link
              href="/tutorial"
              className="px-6 py-3.5 bg-indigo-600/20 hover:bg-indigo-600/30 text-indigo-300 font-semibold text-sm rounded-xl border border-indigo-500/30 transition flex items-center gap-2"
            >
              <span>🎥</span> Watch Video Tutorials
            </Link>
            <Link
              href="/login"
              className="px-6 py-3.5 bg-slate-800 hover:bg-slate-700 text-slate-200 font-semibold text-sm rounded-xl border border-slate-700 transition"
            >
              Web Sign In
            </Link>
          </div>
        </section>

        {/* Feature Cards Grid */}
        <section className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {FEATURES.map((f, idx) => (
            <div
              key={idx}
              className="bg-slate-800/50 rounded-2xl border border-slate-700/60 p-6 space-y-3 hover:border-indigo-500/50 hover:bg-slate-800/80 transition duration-200 shadow-xl"
            >
              <div className="w-10 h-10 rounded-xl bg-indigo-500/10 border border-indigo-500/20 flex items-center justify-center text-xl">
                {f.icon}
              </div>
              <h3 className="font-bold text-base text-white">{f.title}</h3>
              <p className="text-xs text-indigo-400 font-medium">{f.myTitle}</p>
              <p className="text-xs text-slate-400 leading-relaxed">{f.body}</p>
            </div>
          ))}
        </section>

        {/* Video Tutorial Banner Section */}
        <section className="bg-slate-800/40 rounded-3xl border border-slate-700/80 p-8 sm:p-10 space-y-6">
          <div className="flex flex-col lg:flex-row items-start lg:items-center justify-between gap-6 border-b border-slate-700/60 pb-6">
            <div className="space-y-2">
              <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-purple-500/10 border border-purple-500/20 text-purple-400 text-xs font-semibold">
                <span>📚</span> Video Learning Center
              </div>
              <h2 className="text-2xl sm:text-3xl font-bold text-white">
                Step-by-Step Video Tutorials (သင်ခန်းစာများ)
              </h2>
              <p className="text-slate-400 text-sm max-w-2xl">
                Watch detailed video guides on entry management, custom keyboard shortcuts, limit calculations, and CSV clipboard imports.
              </p>
            </div>

            <Link
              href="/tutorial"
              className="px-5 py-2.5 bg-indigo-600 hover:bg-indigo-500 text-white font-semibold text-xs rounded-xl shadow-lg shadow-indigo-600/20 transition flex items-center gap-2 shrink-0"
            >
              <span>🎬</span> View All Video Tutorials →
            </Link>
          </div>

          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <Link
              href="/tutorial#videos"
              className="group bg-slate-900/80 rounded-2xl border border-slate-700/80 p-5 space-y-3 hover:border-indigo-500 transition"
            >
              <div className="aspect-video bg-black/60 rounded-xl flex items-center justify-center text-3xl group-hover:scale-105 transition-transform border border-slate-800">
                ▶️
              </div>
              <h4 className="font-bold text-sm text-white group-hover:text-indigo-400 transition">
                1. Basic Usage & Entry Guide
              </h4>
              <p className="text-xs text-slate-400">
                Session setup, agent selection, typing numbers, and saving slips.
              </p>
            </Link>

            <Link
              href="/tutorial#videos"
              className="group bg-slate-900/80 rounded-2xl border border-slate-700/80 p-5 space-y-3 hover:border-indigo-500 transition"
            >
              <div className="aspect-video bg-black/60 rounded-xl flex items-center justify-center text-3xl group-hover:scale-105 transition-transform border border-slate-800">
                ⌨️
              </div>
              <h4 className="font-bold text-sm text-white group-hover:text-indigo-400 transition">
                2. Keyboard Shortcuts & History
              </h4>
              <p className="text-xs text-slate-400">
                F1-F12 shortcuts, keybinding customization, and voucher editing.
              </p>
            </Link>

            <Link
              href="/tutorial#videos"
              className="group bg-slate-900/80 rounded-2xl border border-slate-700/80 p-5 space-y-3 hover:border-indigo-500 transition"
            >
              <div className="aspect-video bg-black/60 rounded-xl flex items-center justify-center text-3xl group-hover:scale-105 transition-transform border border-slate-800">
                📥
              </div>
              <h4 className="font-bold text-sm text-white group-hover:text-indigo-400 transition">
                3. Buy List, Export & Import
              </h4>
              <p className="text-xs text-slate-400">
                Managing "အဝယ်", exporting JSON/CSV, and pasting CSV clipboard data.
              </p>
            </Link>

            <Link
              href="/tutorial#videos"
              className="group bg-slate-900/80 rounded-2xl border border-slate-700/80 p-5 space-y-3 hover:border-indigo-500 transition"
            >
              <div className="aspect-video bg-black/60 rounded-xl flex items-center justify-center text-3xl group-hover:scale-105 transition-transform border border-slate-800">
                ⚡
              </div>
              <h4 className="font-bold text-sm text-white group-hover:text-indigo-400 transition">
                4. Advanced Daily Workflow
              </h4>
              <p className="text-xs text-slate-400">
                Full daily workflow from entry, reports, win payouts to settlements.
              </p>
            </Link>
          </div>
        </section>

        {/* Download Section Card */}
        <section className="bg-gradient-to-r from-indigo-950 via-slate-900 to-purple-950 rounded-3xl p-8 sm:p-12 border border-indigo-500/30 text-center space-y-6 shadow-2xl relative overflow-hidden">
          <div className="space-y-2">
            <h2 className="text-2xl sm:text-4xl font-bold text-white">
              Download SaaS Platform Desktop App
            </h2>
            <p className="text-slate-300 text-sm sm:text-base max-w-xl mx-auto">
              Get the standalone Windows installer (v1.0.4) for high-performance offline windowing connected to your organization cloud.
            </p>
          </div>

          <div className="pt-2 flex flex-col sm:flex-row items-center justify-center gap-4">
            <a
              href={SETUP_DOWNLOAD_URL}
              className="w-full sm:w-auto px-8 py-3.5 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold text-sm rounded-xl shadow-lg shadow-emerald-500/20 transition transform hover:-translate-y-0.5 flex items-center justify-center gap-2"
            >
              <span>📥</span> Download SaaS Platform Setup 1.0.4.exe
            </a>
            <Link
              href="/tutorial"
              className="w-full sm:w-auto px-6 py-3.5 bg-white/10 hover:bg-white/20 text-white font-semibold text-sm rounded-xl border border-white/20 transition flex items-center justify-center gap-2"
            >
              <span>📚</span> View Tutorial Guides
            </Link>
          </div>
        </section>
      </main>

      {/* Footer */}
      <footer className="relative z-10 border-t border-slate-800/80 py-8 text-center text-xs text-slate-500">
        <div className="max-w-6xl mx-auto px-6 flex flex-col sm:flex-row items-center justify-between gap-4">
          <div>
            © {new Date().getFullYear()} SaaS Platform 2D/3D. All rights reserved.
          </div>
          <div className="flex items-center gap-4">
            <Link href="/" className="hover:text-slate-300 transition">Home</Link>
            <Link href="/tutorial" className="hover:text-slate-300 transition">Tutorials</Link>
            <Link href="/login" className="hover:text-slate-300 transition">Sign In</Link>
          </div>
        </div>
      </footer>
    </div>
  );
}
