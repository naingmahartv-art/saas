'use client';

import React, { useState } from 'react';
import Link from 'next/link';

const SHORTCUT_TABLE = [
  { key: 'F1 / Save', desc: 'Save Slip (ဘောင်ချာ သိမ်းမည်)' },
  { key: 'F2 / Agent', desc: 'Focus Agent Field (ကိုယ်စားလှယ် ကွက်သို့ သွားမည်)' },
  { key: 'F3 / Number', desc: 'Focus Number Field (နံပါတ် ကွက်သို့ သွားမည်)' },
  { key: 'F4 / Check', desc: 'Check Number Status (နံပါတ် စစ်ဆေးမည်)' },
  { key: 'F5 / Agent Check', desc: 'Check Agent Bets (ကိုယ်စားလှယ် စစ်ဆေးမည်)' },
  { key: 'F8 / History', desc: 'Open History / Search (မှတ်တမ်း ရှာဖွေမည်)' },
];

export default function TutorialView({ initialExeList, initialVideos }) {
  const [activeTab, setActiveTab] = useState('all');
  const [exeList] = useState(initialExeList || []);
  const [videos] = useState(initialVideos || []);

  const latestExe = exeList[0] || {};
  const downloadUrl = latestExe.url || '#';

  const filteredVideos = activeTab === 'all'
    ? videos
    : videos.filter(v => v.id === Number(activeTab));

  return (
    <div className="min-h-screen bg-slate-900 text-slate-100 font-sans selection:bg-indigo-500 selection:text-white">
      {/* Background glowing effects */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none z-0">
        <div className="absolute -top-40 -left-40 w-96 h-96 bg-indigo-600/20 rounded-full blur-3xl" />
        <div className="absolute top-1/3 -right-40 w-96 h-96 bg-purple-600/20 rounded-full blur-3xl" />
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
            <Link href="/" className="hover:text-white transition">Home</Link>
            <Link href="/tutorial" className="text-indigo-400 font-semibold flex items-center gap-1.5">
              <span>📚</span> Tutorials
            </Link>
            <a href={downloadUrl} className="hover:text-indigo-400 transition flex items-center gap-1">
              <span>💻</span> Download EXE
            </a>
          </nav>

          <div className="flex items-center gap-3">
            <a
              href={downloadUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="hidden sm:inline-flex items-center gap-2 text-xs px-3.5 py-2 bg-emerald-500 hover:bg-emerald-600 text-slate-950 font-semibold rounded-lg shadow-md shadow-emerald-500/20 transition active:scale-95"
            >
              <span>📥</span> Download Setup.exe
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
        <section className="text-center space-y-6 max-w-3xl mx-auto">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-indigo-500/10 border border-indigo-500/20 text-indigo-400 text-xs font-semibold">
            <span>📹</span> Video Tutorials & User Guides
          </div>
          <h1 className="text-3xl sm:text-5xl font-extrabold text-white tracking-tight leading-tight">
            Learn How to Use <br className="hidden sm:block" />
            <span className="bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
              SaaS Platform 2D/3D
            </span>
          </h1>
          <p className="text-slate-400 text-base sm:text-lg leading-relaxed">
            Watch our step-by-step video tutorials below to master session setup, fast entry shortcuts, limit calculations, and CSV clipboard imports.
          </p>
          <p className="text-indigo-300/90 text-sm font-medium">
            အောက်ပါ ဗီဒီယို သင်ခန်းစာများကို ကြည့်ရှု၍ ထိုးစာရင်း ထည့်သွင်းခြင်း၊ ကီးဘုတ် ဖြတ်လမ်းများ အသုံးပြုခြင်းနှင့် CSV Import ပြုလုပ်ခြင်းများကို လွယ်ကူစွာ လေ့လာနိုင်ပါသည်။
          </p>

          <div className="pt-2 flex flex-wrap items-center justify-center gap-4">
            <a
              href={downloadUrl}
              className="px-6 py-3 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-500 hover:to-purple-500 text-white font-semibold text-sm rounded-xl shadow-lg shadow-indigo-500/25 transition transform hover:-translate-y-0.5 flex items-center gap-2"
            >
              <span>📥</span> Download Windows App (.exe)
            </a>
            <a
              href="#videos"
              className="px-6 py-3 bg-slate-800 hover:bg-slate-700 text-slate-200 font-semibold text-sm rounded-xl border border-slate-700 transition flex items-center gap-2"
            >
              <span>🎬</span> Watch Tutorials
            </a>
          </div>
        </section>

        {/* Video Tutorial Section */}
        <section id="videos" className="space-y-8 scroll-mt-24">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-slate-800 pb-4">
            <div>
              <h2 className="text-2xl font-bold text-white flex items-center gap-2">
                <span>🎥</span> Video Lessons (သင်ခန်းစာ ဗီဒီယိုများ)
              </h2>
              <p className="text-slate-400 text-xs sm:text-sm mt-1">
                Click any lesson tab or scroll down to watch the full screen recording tutorials.
              </p>
            </div>

            {/* Filter Tabs */}
            <div className="flex items-center gap-2 bg-slate-800/80 p-1 rounded-xl border border-slate-700/80 text-xs">
              <button
                type="button"
                onClick={() => setActiveTab('all')}
                className={`px-3 py-1.5 rounded-lg font-medium transition ${activeTab === 'all' ? 'bg-indigo-600 text-white' : 'text-slate-400 hover:text-white'}`}
              >
                All ({videos.length})
              </button>
              {videos.map(v => (
                <button
                  key={v.id}
                  type="button"
                  onClick={() => setActiveTab(String(v.id))}
                  className={`px-3 py-1.5 rounded-lg font-medium transition ${activeTab === String(v.id) ? 'bg-indigo-600 text-white' : 'text-slate-400 hover:text-white'}`}
                >
                  Lesson {v.id}
                </button>
              ))}
            </div>
          </div>

          {/* Videos Grid */}
          <div className="space-y-12">
            {filteredVideos.map((video) => (
              <div
                key={video.id}
                className="bg-slate-800/60 rounded-2xl border border-slate-700/70 p-6 shadow-xl space-y-6 hover:border-slate-600 transition"
              >
                <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4 border-b border-slate-700/50 pb-4">
                  <div>
                    <h3 className="text-xl font-bold text-white">{video.title}</h3>
                    <p className="text-slate-300 text-sm mt-1">{video.subtitle}</p>
                    {video.mySubtitle && <p className="text-indigo-300/80 text-xs mt-1 font-medium">{video.mySubtitle}</p>}
                  </div>
                  <div className="flex flex-wrap items-center gap-2">
                    {video.tags && video.tags.map(tag => (
                      <span key={tag} className="text-xs px-2.5 py-1 bg-indigo-500/10 border border-indigo-500/20 text-indigo-300 rounded-full font-medium">
                        {tag}
                      </span>
                    ))}
                  </div>
                </div>

                {/* Video Player */}
                <div className="relative aspect-video rounded-xl overflow-hidden bg-black border border-slate-700 shadow-2xl group">
                  <video
                    controls
                    preload="metadata"
                    poster=""
                    className="w-full h-full object-contain"
                  >
                    <source src={video.videoUrl} type="video/mp4" />
                    Your browser does not support playing video.
                  </video>
                </div>

                {/* Video Key Highlights */}
                {video.highlights && video.highlights.length > 0 && (
                  <div className="bg-slate-900/60 rounded-xl p-4 border border-slate-800">
                    <h4 className="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2 flex items-center gap-1.5">
                      <span>✨</span> What you will learn in this video:
                    </h4>
                    <ul className="grid sm:grid-cols-2 gap-2 text-xs text-slate-300">
                      {video.highlights.map((item, idx) => (
                        <li key={idx} className="flex items-start gap-2">
                          <span className="text-indigo-400 font-bold">✓</span>
                          <span>{item}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
              </div>
            ))}
          </div>
        </section>

        {/* Shortcuts Reference Section */}
        <section className="bg-slate-800/40 rounded-2xl border border-slate-700/60 p-8 space-y-6">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="text-xl font-bold text-white flex items-center gap-2">
                <span>⌨️</span> Keyboard Shortcuts Reference (ကီးဘုတ် ဖြတ်လမ်းများ)
              </h3>
              <p className="text-slate-400 text-xs sm:text-sm mt-1">
                Fast keyboard shortcuts to speed up daily voucher entry operations.
              </p>
            </div>
            <Link
              href="/login"
              className="text-xs text-indigo-400 hover:text-indigo-300 font-medium underline"
            >
              Try in App →
            </Link>
          </div>

          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {SHORTCUT_TABLE.map((sc, i) => (
              <div key={i} className="bg-slate-900/80 p-4 rounded-xl border border-slate-700/80 flex items-center justify-between">
                <span className="text-xs font-mono font-bold text-indigo-400 bg-indigo-500/10 px-2.5 py-1 rounded border border-indigo-500/20">
                  {sc.key}
                </span>
                <span className="text-xs text-slate-300 text-right font-medium">
                  {sc.desc}
                </span>
              </div>
            ))}
          </div>
        </section>

        {/* All EXE Downloads List Section */}
        <section id="downloads" className="space-y-6">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-slate-800 pb-4">
            <div>
              <h2 className="text-2xl font-bold text-white flex items-center gap-2">
                <span>📦</span> All Desktop App Downloads (EXE Installers)
              </h2>
              <p className="text-slate-400 text-xs sm:text-sm mt-1">
                Official Windows Desktop setup installers. Click any button below to download direct setup files:
              </p>
            </div>
            <span className="text-xs px-3 py-1 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 font-semibold rounded-full self-start">
              {exeList.length} Installers Available
            </span>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {exeList.map((exe) => (
              <div
                key={exe.id}
                className="bg-slate-800/60 rounded-2xl border border-slate-700/80 p-6 space-y-4 hover:border-indigo-500/50 transition flex flex-col justify-between"
              >
                <div className="space-y-2">
                  <div className="flex items-center justify-between gap-2 flex-wrap">
                    <span className="text-xs font-bold px-2.5 py-1 bg-indigo-500/20 text-indigo-300 rounded-lg border border-indigo-500/30">
                      Version {exe.version || '1.0.0'}
                    </span>
                    {exe.updatedAt && (
                      <span className="text-[11px] text-slate-400">
                        Updated {new Date(exe.updatedAt).toLocaleDateString()}
                      </span>
                    )}
                  </div>
                  <h3 className="text-base font-bold text-white">{exe.title}</h3>
                  <p className="text-xs text-slate-300 leading-relaxed">
                    {exe.description || 'Windows Standalone Desktop App Setup file.'}
                  </p>
                </div>

                <div className="pt-2">
                  <a
                    href={exe.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-full px-5 py-3 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold text-xs rounded-xl shadow-lg shadow-emerald-500/20 transition flex items-center justify-center gap-2"
                  >
                    <span>📥</span> Download {exe.title || `Setup v${exe.version}.exe`}
                  </a>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Download App CTA Card */}
        <section className="bg-gradient-to-r from-indigo-900/80 via-purple-900/80 to-slate-900 rounded-3xl p-8 sm:p-12 border border-indigo-500/30 text-center space-y-6 relative overflow-hidden shadow-2xl">
          <div className="absolute top-0 right-0 w-64 h-64 bg-indigo-500/10 rounded-full blur-2xl" />
          <h2 className="text-2xl sm:text-4xl font-bold text-white tracking-tight">
            Ready to Start Managing Your Shop?
          </h2>
          <p className="text-slate-300 text-sm sm:text-base max-w-xl mx-auto">
            Download the official Windows Desktop Application setup file or sign in directly from your web browser.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 pt-2">
            <a
              href={downloadUrl}
              className="w-full sm:w-auto px-8 py-3.5 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold text-sm rounded-xl shadow-lg shadow-emerald-500/20 transition transform hover:-translate-y-0.5 flex items-center justify-center gap-2"
            >
              <span>📥</span> Download Desktop Setup.exe
            </a>
            <Link
              href="/login"
              className="w-full sm:w-auto px-8 py-3.5 bg-white/10 hover:bg-white/20 text-white font-semibold text-sm rounded-xl border border-white/20 transition flex items-center justify-center gap-2"
            >
              <span>🌐</span> Sign In via Web Browser
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
