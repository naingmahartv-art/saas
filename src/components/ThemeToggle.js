'use client';
import useTheme from '@/lib/theme/useTheme.js';

export default function ThemeToggle({ collapsed = false, className = '' }) {
  const { isDark, toggleTheme } = useTheme();

  return (
    <button
      type="button"
      onClick={toggleTheme}
      title={collapsed ? (isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode') : undefined}
      className={`flex items-center gap-2 px-2.5 py-1.5 rounded-lg text-xs font-medium border transition-colors cursor-pointer ${
        isDark
          ? 'bg-slate-800 border-slate-700 text-amber-300 hover:bg-slate-700'
          : 'bg-slate-100 border-slate-200 text-slate-700 hover:bg-slate-200'
      } ${collapsed ? 'justify-center w-full px-0' : ''} ${className}`}
    >
      <span className="text-sm shrink-0">{isDark ? '🌙' : '☀️'}</span>
      {!collapsed && <span>{isDark ? 'Dark Mode' : 'Light Mode'}</span>}
    </button>
  );
}
