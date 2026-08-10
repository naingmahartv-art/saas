export default function OrgLoading() {
  return (
    <div className="fixed inset-0 bg-[#0f172a] z-50 flex items-center justify-center p-4">
      <div className="bg-[#1e293b] rounded-2xl p-8 shadow-2xl border border-[#334155] text-center max-w-xs w-full">
        <div className="w-12 h-12 bg-indigo-600 rounded-xl mx-auto mb-4 flex items-center justify-center animate-bounce">
          <svg className="w-7 h-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
          </svg>
        </div>
        <div className="w-8 h-8 border-4 border-[#334155] border-t-indigo-500 rounded-full animate-spin mx-auto mb-4" />
        <h3 className="text-lg font-bold text-white mb-1">SaaS Platform</h3>
        <p className="text-xs text-slate-400">Loading workspace data, please wait…</p>
      </div>
    </div>
  );
}
