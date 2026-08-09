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

export default function UserSettingsPanel() {
  const { t } = useI18n();

  return (
    <div className="space-y-6">
      <h1 className="text-xl font-semibold text-gray-900">{t('account.title')}</h1>
      <ShortcutsSection />
      <ReplacementsSection />
      <PasswordSection />
    </div>
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
