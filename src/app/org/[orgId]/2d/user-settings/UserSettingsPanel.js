'use client';
import { useState, useEffect, useCallback } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import {
  DEFAULT_SHORTCUTS,
  SHORTCUT_ACTIONS,
  formatCombo,
  captureCombo,
  isValidCombo,
  findConflicts,
} from '@/lib/ledger/shortcuts.js';
import { useIsMac } from '@/lib/ledger/useLedgerShortcuts.js';
import { updateGlobalFontSize } from '@/lib/ledger/useLedgerFontSize.js';

import useTheme from '@/lib/theme/useTheme.js';

export default function UserSettingsPanel() {
  const { t } = useI18n();

  return (
    <div className="space-y-6">
      <h1 className="text-xl font-semibold text-gray-900 dark:text-slate-100">{t('account.title')}</h1>
      <ThemeSection />
      <FontSizeSection />
      <ShortcutsSection />
      <ReplacementsSection />
      <PasswordSection />
    </div>
  );
}

function ThemeSection() {
  const { t } = useI18n();
  const { isDark, toggleTheme } = useTheme();

  return (
    <section className="card">
      <div>
        <h2 className="font-semibold text-gray-900 dark:text-slate-100">Theme Preference (Dark / Light Mode)</h2>
        <p className="text-sm text-gray-500 dark:text-slate-400 mt-1">
          Choose between Dark Mode for low light environments or Light Mode for daytime view.
        </p>
      </div>

      <div className="mt-4 flex items-center gap-3">
        <button
          type="button"
          onClick={toggleTheme}
          className={`flex items-center gap-2.5 px-4 py-2 rounded-xl text-sm font-semibold border transition shadow-xs cursor-pointer ${
            isDark
              ? 'bg-slate-800 border-slate-700 text-amber-300 hover:bg-slate-700'
              : 'bg-indigo-50 border-indigo-200 text-indigo-700 hover:bg-indigo-100'
          }`}
        >
          <span className="text-lg">{isDark ? '🌙' : '☀️'}</span>
          <span>{isDark ? 'Dark Mode Active' : 'Light Mode Active'}</span>
        </button>
        <span className="text-xs text-gray-400 dark:text-slate-500">
          Click button to switch theme
        </span>
      </div>
    </section>
  );
}

function FontSizeSection() {
  const { t } = useI18n();
  const [fontSize, setFontSize] = useState('100');
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    try {
      const stored = localStorage.getItem('user_font_size');
      if (stored) {
        setFontSize(stored);
      }
    } catch {}

    fetch('/api/user/shortcuts')
      .then(res => (res.ok ? res.json() : null))
      .then(data => {
        if (data?.fontSize) {
          setFontSize(String(data.fontSize));
          updateGlobalFontSize(String(data.fontSize));
        }
      })
      .finally(() => setLoaded(true));
  }, []);

  function handleScaleChange(newSize) {
    const sizeStr = String(newSize);
    setFontSize(sizeStr);
    updateGlobalFontSize(sizeStr);
  }

  async function save() {
    setSaving(true);
    setMessage('');
    try {
      const res = await fetch('/api/user/shortcuts', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ fontSize }),
      });
      const data = await res.json();
      if (!res.ok) {
        setMessage(t('account.fontSizeSaveFailed') || 'Failed to save font size');
        return;
      }
      if (data.fontSize) {
        handleScaleChange(data.fontSize);
      }
      setMessage(t('account.fontSizeSaved') || 'Font size saved successfully');
      setTimeout(() => setMessage(''), 3000);
    } catch {
      setMessage(t('account.fontSizeSaveFailed') || 'Failed to save font size');
    } finally {
      setSaving(false);
    }
  }

  const presets = [
    { label: t('account.fontSizeSmall') || 'Small (87.5%)', value: '87.5' },
    { label: t('account.fontSizeNormal') || 'Normal (100%)', value: '100' },
    { label: t('account.fontSizeLarge') || 'Large (112.5%)', value: '112.5' },
    { label: t('account.fontSizeExtraLarge') || 'Extra Large (125%)', value: '125' },
  ];

  return (
    <section className="card">
      <div>
        <h2 className="font-semibold text-gray-900">{t('account.fontSizeTitle') || 'Font Size Settings'}</h2>
        <p className="text-sm text-gray-500 mt-1">
          {t('account.fontSizeHint') || 'Adjust the application font size for optimal readability across all screens.'}
        </p>
      </div>

      {/* Preset buttons */}
      <div className="mt-4 flex flex-wrap items-center gap-2">
        {presets.map(p => {
          const active = fontSize === p.value;
          return (
            <button
              key={p.value}
              type="button"
              onClick={() => handleScaleChange(p.value)}
              className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold transition border cursor-pointer ${
                active
                  ? 'bg-indigo-600 text-white border-indigo-600 shadow-sm'
                  : 'bg-white text-gray-700 border-gray-300 hover:bg-gray-50'
              }`}
            >
              {p.label}
            </button>
          );
        })}
      </div>

      {/* Range slider for custom fine-tuning */}
      <div className="mt-5 max-w-md bg-gray-50 border border-gray-200 rounded-xl p-4 space-y-3">
        <div className="flex items-center justify-between text-xs font-medium text-gray-700">
          <span>Fine-tune Font Size:</span>
          <span className="font-mono bg-white px-2 py-0.5 border border-gray-200 rounded text-indigo-700 font-bold">
            {fontSize}%
          </span>
        </div>
        <div className="flex items-center gap-3">
          <span className="text-xs text-gray-400 font-mono">80%</span>
          <input
            type="range"
            min="80"
            max="140"
            step="2.5"
            value={fontSize}
            onChange={e => handleScaleChange(e.target.value)}
            className="flex-1 accent-indigo-600 cursor-pointer h-2 bg-gray-200 rounded-lg"
          />
          <span className="text-xs text-gray-400 font-mono">140%</span>
        </div>

        {/* Live Preview Box */}
        <div className="border border-gray-200 rounded-lg p-3 bg-white space-y-2">
          <div className="flex items-center justify-between text-xs text-gray-500 border-b border-gray-100 pb-1 font-medium">
            <span>Live Screen Preview:</span>
            <span className="text-indigo-600 font-semibold">2D Ledger View</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="bg-purple-600 text-white text-xs px-2 py-0.5 rounded font-mono font-bold">01</span>
            <span className="text-xs font-mono font-semibold text-gray-800">5,000</span>
            <span className="text-gray-300">•</span>
            <span className="bg-emerald-600 text-white text-xs px-2 py-0.5 rounded font-mono font-bold">34</span>
            <span className="text-xs font-mono font-semibold text-gray-800">10,000</span>
            <span className="text-gray-300">•</span>
            <span className="bg-amber-500 text-white text-xs px-1.5 py-0.5 rounded font-mono font-bold">Buy: 2,000</span>
          </div>
          <p className="text-xs text-gray-600 leading-relaxed">
            The font size adjusts dynamically across the entire application including ledger grids, agent lists, and reports.
          </p>
        </div>
      </div>

      <div className="flex items-center gap-3 mt-4">
        <button
          type="button"
          onClick={save}
          disabled={saving || !loaded}
          className="btn-primary text-sm py-1.5 disabled:opacity-50"
        >
          {saving ? (t('common.saving') || 'Saving...') : (t('common.save') || 'Save')}
        </button>
        <button
          type="button"
          onClick={() => handleScaleChange('100')}
          className="text-sm text-gray-500 hover:text-gray-700"
        >
          {t('account.reset') || 'Reset'} (100%)
        </button>
        {message && <span className="text-sm text-gray-600">{message}</span>}
      </div>
    </section>
  );
}

function ShortcutsSection() {
  const { t } = useI18n();
  const isMac = useIsMac();
  const [shortcuts, setShortcuts] = useState(DEFAULT_SHORTCUTS);
  const [listeningAction, setListeningAction] = useState(null);
  const [rowError, setRowError] = useState('');
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    fetch('/api/user/shortcuts')
      .then(res => (res.ok ? res.json() : null))
      .then(data => {
        if (data?.shortcuts) setShortcuts(data.shortcuts);
      })
      .finally(() => setLoaded(true));
  }, []);

  useEffect(() => {
    if (!listeningAction) return;
    function onKeyDown(e) {
      e.preventDefault();
      e.stopPropagation();
      if (e.key === 'Escape') {
        setListeningAction(null);
        setRowError('');
        return;
      }
      const combo = captureCombo(e);
      if (!combo) return; // modifier-only keypress, keep listening
      if (!isValidCombo(combo)) {
        setRowError(t('account.invalidCombo'));
        return;
      }
      const conflicts = findConflicts(shortcuts, combo, listeningAction);
      if (conflicts.length > 0) {
        setRowError(t('account.conflictCombo', { combo: formatCombo(combo, isMac), action: t(`shortcuts.${conflicts[0]}`) }));
        return;
      }
      setShortcuts(prev => ({ ...prev, [listeningAction]: combo }));
      setListeningAction(null);
      setRowError('');
    }
    window.addEventListener('keydown', onKeyDown, true);
    return () => window.removeEventListener('keydown', onKeyDown, true);
  }, [listeningAction, shortcuts, t]);

  function resetRow(action) {
    setShortcuts(prev => ({ ...prev, [action]: DEFAULT_SHORTCUTS[action] }));
  }

  function resetAll() {
    setShortcuts(DEFAULT_SHORTCUTS);
  }

  async function save() {
    setSaving(true);
    setMessage('');
    try {
      const res = await fetch('/api/user/shortcuts', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ shortcuts }),
      });
      const data = await res.json();
      if (!res.ok) {
        setMessage(data.error || t('account.shortcutsSaveFailed'));
        return;
      }
      setShortcuts(data.shortcuts);
      setMessage(t('account.shortcutsSaved'));
    } catch {
      setMessage(t('account.shortcutsSaveFailed'));
    } finally {
      setSaving(false);
    }
  }

  return (
    <section className="card">
      <h2 className="font-semibold text-gray-900">{t('account.shortcutsTitle')}</h2>
      <p className="text-sm text-gray-500 mt-1">{t('account.shortcutsHint')}</p>

      <div className="mt-4 divide-y divide-gray-100">
        {SHORTCUT_ACTIONS.map(action => (
          <div key={action} className="flex items-center justify-between py-2.5 gap-3">
            <span className="text-sm text-gray-700">{t(`shortcuts.${action}`)}</span>
            <div className="flex items-center gap-2 shrink-0">
              {listeningAction === action ? (
                <span className="text-xs font-mono px-2.5 py-1.5 rounded-lg border border-indigo-300 bg-indigo-50 text-indigo-700 animate-pulse">
                  {t('account.listening')}
                </span>
              ) : (
                <span className="text-xs font-mono px-2.5 py-1.5 rounded-lg border border-gray-300 bg-gray-50 text-gray-700 min-w-[4.5rem] text-center">
                  {formatCombo(shortcuts[action], isMac)}
                </span>
              )}
              <button
                type="button"
                onClick={() => { setListeningAction(action); setRowError(''); }}
                className="text-xs font-medium text-indigo-600 hover:text-indigo-800 px-2 py-1"
              >
                {t('account.change')}
              </button>
              <button
                type="button"
                onClick={() => resetRow(action)}
                className="text-xs font-medium text-gray-400 hover:text-gray-600 px-2 py-1"
              >
                {t('account.reset')}
              </button>
            </div>
          </div>
        ))}
      </div>

      {listeningAction && rowError && <p className="text-xs text-red-600 mt-2">{rowError}</p>}

      <div className="flex items-center gap-3 mt-4">
        <button
          type="button"
          onClick={save}
          disabled={saving || !loaded}
          className="btn-primary text-sm py-1.5 disabled:opacity-50"
        >
          {saving ? t('common.saving') : t('account.saveShortcuts')}
        </button>
        <button type="button" onClick={resetAll} className="text-sm text-gray-500 hover:text-gray-700">
          {t('account.resetAll')}
        </button>
        {message && <span className="text-sm text-gray-600">{message}</span>}
      </div>
    </section>
  );
}

function PasswordSection() {
  const { t } = useI18n();
  const [form, setForm] = useState({ currentPassword: '', newPassword: '', confirmPassword: '' });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [saving, setSaving] = useState(false);

  const update = useCallback((field) => (e) => {
    setForm(prev => ({ ...prev, [field]: e.target.value }));
  }, []);

  async function submit(e) {
    e.preventDefault();
    setError('');
    setSuccess('');

    if (form.newPassword.length < 8) {
      setError(t('account.passwordTooShort'));
      return;
    }
    if (form.newPassword !== form.confirmPassword) {
      setError(t('account.passwordMismatch'));
      return;
    }

    setSaving(true);
    try {
      const res = await fetch('/api/user/change-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ currentPassword: form.currentPassword, newPassword: form.newPassword }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || t('common.failedToSave'));
        return;
      }
      setSuccess(t('account.passwordChanged'));
      setForm({ currentPassword: '', newPassword: '', confirmPassword: '' });
    } catch {
      setError(t('common.networkError'));
    } finally {
      setSaving(false);
    }
  }

  return (
    <section className="card">
      <h2 className="font-semibold text-gray-900">{t('account.passwordTitle')}</h2>
      <form onSubmit={submit} className="space-y-3 mt-4 max-w-sm">
        {error && <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2">{error}</p>}
        {success && <p className="text-sm text-green-700 bg-green-50 rounded-lg px-3 py-2">{success}</p>}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">{t('account.currentPassword')}</label>
          <input type="password" required className="input" value={form.currentPassword} onChange={update('currentPassword')} />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">{t('account.newPassword')}</label>
          <input type="password" required minLength={8} className="input" value={form.newPassword} onChange={update('newPassword')} />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">{t('account.confirmPassword')}</label>
          <input type="password" required minLength={8} className="input" value={form.confirmPassword} onChange={update('confirmPassword')} />
        </div>
        <button type="submit" disabled={saving} className="btn-primary text-sm py-1.5 disabled:opacity-50">
          {saving ? t('common.saving') : t('account.changePasswordBtn')}
        </button>
      </form>
    </section>
  );
}

function ReplacementsSection() {
  const { t } = useI18n();
  const [replaceSlash, setReplaceSlash] = useState('P');
  const [replaceAsterisk, setReplaceAsterisk] = useState('R');
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    fetch('/api/user/shortcuts')
      .then(res => (res.ok ? res.json() : null))
      .then(data => {
        if (data) {
          setReplaceSlash(data.replaceSlash ?? 'P');
          setReplaceAsterisk(data.replaceAsterisk ?? 'R');
        }
      })
      .finally(() => setLoaded(true));
  }, []);

  async function save() {
    setSaving(true);
    setMessage('');
    try {
      const res = await fetch('/api/user/shortcuts', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ replaceSlash, replaceAsterisk }),
      });
      const data = await res.json();
      if (!res.ok) {
        setMessage(data.error || 'Failed to save');
        return;
      }
      setReplaceSlash(data.replaceSlash);
      setReplaceAsterisk(data.replaceAsterisk);
      setMessage(t('account.shortcutsSaved') || 'Settings saved successfully');
    } catch {
      setMessage('Failed to save settings');
    } finally {
      setSaving(false);
    }
  }

  return (
    <section className="card">
      <div>
        <h2 className="font-semibold text-gray-900">{t('account.replacementsTitle')}</h2>
        <p className="text-sm text-gray-500 mt-1">
          {t('account.replacementsHint')}
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4 max-w-sm mt-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Convert <span className="font-mono bg-gray-100 px-1 rounded">/</span> to:
          </label>
          <input
            type="text"
            maxLength={1}
            value={replaceSlash}
            onChange={e => setReplaceSlash(e.target.value.toUpperCase())}
            disabled={!loaded}
            placeholder="P"
            className="input font-mono uppercase text-center w-16"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Convert <span className="font-mono bg-gray-100 px-1 rounded">*</span> to:
          </label>
          <input
            type="text"
            maxLength={1}
            value={replaceAsterisk}
            onChange={e => setReplaceAsterisk(e.target.value.toUpperCase())}
            disabled={!loaded}
            placeholder="R"
            className="input font-mono uppercase text-center w-16"
          />
        </div>
      </div>

      <div className="flex items-center gap-3 mt-4">
        <button
          type="button"
          onClick={save}
          disabled={saving || !loaded}
          className="btn-primary text-sm py-1.5 disabled:opacity-50"
        >
          {saving ? t('common.saving') : t('common.save')}
        </button>
        {message && <span className="text-sm text-gray-600">{message}</span>}
      </div>
    </section>
  );
}
