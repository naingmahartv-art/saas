'use client';
import { useEffect, useState, useMemo, useCallback, Fragment } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

const SLOT_LABEL_KEY = { '09:00': 'slot0900', '12:00': 'slot1200', '04:00': 'slot0400' };

function csvEscape(value) {
  const s = String(value ?? '');
  return /[",\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
}

function buildCsv(slips) {
  const header = ['Sr No', 'Agent', 'Amount', 'Tokens'];
  const rows = slips.map(s => [s.srNo, s.agentName, s.amount, (s.tokens || []).join(' ')]);
  return [header, ...rows].map(row => row.map(csvEscape).join(',')).join('\n');
}

function buildMessageText(slips, activeSession, t) {
  const lines = [];
  if (activeSession) {
    const slotLabel = t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`);
    lines.push(`${slotLabel} · ${activeSession.onDate}`);
  }
  let total = 0;
  for (const s of slips) {
    total += s.amount;
    const tokens = (s.tokens || []).join(' ');
    lines.push(`#${s.srNo} ${s.agentName} — ${s.amount.toLocaleString()}${tokens ? ` (${tokens})` : ''}`);
  }
  lines.push(`${t('common.total')}: ${total.toLocaleString()}`);
  return lines.join('\n');
}

export default function LedgerHistory({ orgId, activeSession, onEdit, onDeleted, refreshSignal, onClose, canWrite = true }) {
  const { t } = useI18n();
  const [slips, setSlips] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [search, setSearch] = useState('');
  const [sortKey, setSortKey] = useState('srNo');
  const [sortDir, setSortDir] = useState('asc');
  const [expanded, setExpanded] = useState(null);
  const [deletingId, setDeletingId] = useState(null);
  const [statusMsg, setStatusMsg] = useState('');

  const load = useCallback(async () => {
    setLoading(true);
    setError('');
    try {
      const res = await fetch(`/api/org/${orgId}/ledger`);
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || t('common.failedToSave'));
        return;
      }
      setSlips(data.slips || []);
    } catch {
      setError(t('common.networkError'));
    } finally {
      setLoading(false);
    }
  }, [orgId, t]);

  useEffect(() => {
    load();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [load, refreshSignal]);

  function toggleSort(key) {
    if (sortKey === key) {
      setSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setSortKey(key);
      setSortDir('asc');
    }
  }

  const visible = useMemo(() => {
    let list = slips;
    const q = search.trim().toLowerCase();
    if (q) {
      list = list.filter(s =>
        s.agentName?.toLowerCase().includes(q) || String(s.srNo).includes(q)
      );
    }
    return [...list].sort((a, b) => {
      const av = a[sortKey], bv = b[sortKey];
      const cmp = av < bv ? -1 : av > bv ? 1 : 0;
      return sortDir === 'asc' ? cmp : -cmp;
    });
  }, [slips, search, sortKey, sortDir]);

  async function handleDelete(slip) {
    if (!confirm(t('ledger.historyDeleteConfirm', { n: slip.srNo }))) return;
    setDeletingId(slip.id);
    try {
      const qs = new URLSearchParams({ onCount: slip.onCount, ampm: slip.ampm, onDate: slip.onDate }).toString();
      const res = await fetch(`/api/org/${orgId}/ledger/${slip.id}?${qs}`, { method: 'DELETE' });
      if (!res.ok) {
        const data = await res.json();
        setError(data.error || t('common.failedToSave'));
        return;
      }
      setSlips(prev => prev.filter(s => s.id !== slip.id));
      if (expanded === slip.id) setExpanded(null);
      if (onDeleted) onDeleted();
    } catch {
      setError(t('common.networkError'));
    } finally {
      setDeletingId(null);
    }
  }

  function handleSearchKeyDown(e) {
    if (e.key === 'Enter') {
      const q = search.trim();
      if (!q) return;
      const numQuery = parseInt(q, 10);
      let match = null;
      if (!isNaN(numQuery)) {
        match = slips.find(s => s.srNo === numQuery);
      }
      if (!match) {
        match = visible[0];
      }
      if (match) {
        e.preventDefault();
        if (onEdit) onEdit(match);
      }
    }
  }

  function handleExportCsv() {
    if (visible.length === 0) {
      setStatusMsg(t('ledger.nothingToExport'));
      return;
    }
    const csv = buildCsv(visible);
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    const dateLabel = activeSession?.onDate || new Date().toISOString().slice(0, 10);
    a.href = url;
    a.download = `ledger-${dateLabel}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  }

  async function handleShare() {
    if (visible.length === 0) {
      setStatusMsg(t('ledger.nothingToExport'));
      return;
    }
    const text = buildMessageText(visible, activeSession, t);
    if (navigator.share) {
      try {
        await navigator.share({ text });
      } catch {
        // user cancelled the share sheet — not an error
      }
      return;
    }
    try {
      await navigator.clipboard.writeText(text);
      setStatusMsg(t('ledger.copiedToClipboard'));
    } catch {
      setStatusMsg(t('ledger.shareFailed'));
    }
  }

  return (
    <div className="bg-white rounded-xl overflow-hidden">
      <div className="px-5 py-3 border-b border-gray-100 flex flex-wrap items-center justify-between gap-2">
        <span className="text-sm font-semibold text-gray-800">{t('ledger.historyTitle')}</span>
        <div className="flex items-center gap-3">
          <input
            type="text"
            autoFocus
            value={search}
            onChange={e => setSearch(e.target.value)}
            onKeyDown={handleSearchKeyDown}
            placeholder={t('ledger.historySearchPlaceholder')}
            className="px-2.5 py-1.5 text-xs border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 w-40"
          />
          <button
            type="button"
            onClick={load}
            className="text-xs text-gray-500 hover:text-gray-700 font-medium"
          >
            {t('common.update')}
          </button>
          <button
            type="button"
            onClick={handleExportCsv}
            className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition"
          >
            {t('ledger.exportCsv')}
          </button>
          <button
            type="button"
            onClick={handleShare}
            className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition"
          >
            {t('ledger.shareMessage')}
          </button>
          {onClose && (
            <button
              type="button"
              onClick={onClose}
              className="text-gray-400 hover:text-gray-600 text-lg font-bold ml-2 px-1.5 py-0.5 hover:bg-gray-100 rounded transition"
              aria-label={t('common.close')}
            >
              ✕
            </button>
          )}
        </div>
      </div>

      {error && <p className="text-sm text-red-600 bg-red-50 px-5 py-2">{error}</p>}
      {statusMsg && (
        <p
          className="text-sm text-indigo-700 bg-indigo-50 px-5 py-2 cursor-pointer"
          onClick={() => setStatusMsg('')}
        >
          {statusMsg}
        </p>
      )}

      {loading ? (
        <div className="px-5 py-8 text-center text-gray-400 text-sm">{t('common.loading')}</div>
      ) : visible.length === 0 ? (
        <div className="px-5 py-8 text-center text-gray-400 text-sm">{t('ledger.historyNoEntries')}</div>
      ) : (
        <table className="w-full text-sm">
          <thead>
            <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
              <th className="text-left px-5 py-2 font-medium">
                <button type="button" onClick={() => toggleSort('srNo')} className="flex items-center gap-1 hover:text-gray-800 transition">
                  {t('ledger.srNoCol')}
                  {sortKey === 'srNo' && <span>{sortDir === 'asc' ? '▲' : '▼'}</span>}
                </button>
              </th>
              <th className="text-left px-4 py-2 font-medium">
                <button type="button" onClick={() => toggleSort('agentName')} className="flex items-center gap-1 hover:text-gray-800 transition">
                  {t('ledger.agentCol')}
                  {sortKey === 'agentName' && <span>{sortDir === 'asc' ? '▲' : '▼'}</span>}
                </button>
              </th>
              <th className="text-right px-4 py-2 font-medium">
                <button type="button" onClick={() => toggleSort('amount')} className="flex items-center gap-1 ml-auto hover:text-gray-800 transition">
                  {t('ledger.amountCol')}
                  {sortKey === 'amount' && <span>{sortDir === 'asc' ? '▲' : '▼'}</span>}
                </button>
              </th>
              <th className="px-4 py-2"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-50">
            {visible.map(slip => (
              <Fragment key={slip.id}>
                <tr className="hover:bg-gray-50 transition">
                  <td className="px-5 py-2 font-mono text-gray-900">{slip.srNo}</td>
                  <td className="px-4 py-2 text-gray-700">{slip.agentName}</td>
                  <td className="px-4 py-2 text-right text-gray-700">{slip.amount.toLocaleString()}</td>
                  <td className="px-4 py-2 text-right whitespace-nowrap">
                    <button
                      onClick={() => setExpanded(expanded === slip.id ? null : slip.id)}
                      className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition mr-1"
                    >
                      {expanded === slip.id ? t('common.close') : t('ledger.historyDetails')}
                    </button>
                    {canWrite && (
                      <button
                        onClick={() => onEdit && onEdit(slip)}
                        className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition"
                      >
                        {t('ledger.historyEditAction')}
                      </button>
                    )}
                  </td>
                </tr>
                {expanded === slip.id && (
                  <tr>
                    <td colSpan={4} className="px-5 py-3 bg-gray-50">
                      <p className="text-xs font-medium text-gray-500 mb-1.5">{t('ledger.voucherCol')}</p>
                      <div className="flex flex-wrap gap-2">
                        {(slip.tokens || []).map((tok, i) => (
                          <span key={i} className="inline-flex items-center px-2 py-1 rounded bg-white border border-gray-200 text-xs font-mono">
                            {tok}
                          </span>
                        ))}
                      </div>
                    </td>
                  </tr>
                )}
              </Fragment>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
