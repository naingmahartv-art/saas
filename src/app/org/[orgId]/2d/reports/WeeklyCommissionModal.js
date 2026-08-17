'use client';
import { useState, useEffect, useCallback } from 'react';
import { useI18n } from '@/lib/i18n';

const SLOT_TIME_LABELS = {
  '09:00': '09:30 AM',
  '12:00': '12:00 PM',
  '04:00': '04:30 PM',
  'AM': '09:30 AM',
  'PM': '12:00 PM',
};

function getSlotDisplayLabel(s) {
  const slotKey = String(s.ampm || s.slot || '').trim();
  if (SLOT_TIME_LABELS[slotKey]) return SLOT_TIME_LABELS[slotKey];

  if (typeof s.onCount === 'number') {
    const idx = s.onCount % 10;
    if (idx === 1) return '09:30 AM';
    if (idx === 2) return '12:00 PM';
    if (idx === 3) return '04:30 PM';
  }
  return slotKey || '12:00 PM';
}

function formatShortDate(dateStr) {
  if (!dateStr) return '';
  const parts = dateStr.split('-');
  if (parts.length === 3) return `${parts[1]}/${parts[2]}`;
  return dateStr;
}

function formatShortSlot(slotStr) {
  return slotStr.replace(' AM', '').replace(' PM', '');
}

export default function WeeklyCommissionModal({ orgId, agents = [], onClose, onSaved }) {
  const { t } = useI18n();

  // Default to Monday - Friday of current week
  const today = new Date();
  const dayOfWeek = today.getDay(); // 0 = Sun, 1 = Mon ... 5 = Fri
  const distToMon = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
  const mon = new Date(today);
  mon.setDate(today.getDate() + distToMon);
  const fri = new Date(mon);
  fri.setDate(mon.getDate() + 4);

  const defaultStart = mon.toISOString().slice(0, 10);
  const defaultEnd = fri.toISOString().slice(0, 10);

  const [startDate, setStartDate] = useState(defaultStart);
  const [endDate, setEndDate] = useState(defaultEnd);
  const [sessions, setSessions] = useState([]);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [statusMsg, setStatusMsg] = useState('');
  const [errorMsg, setErrorMsg] = useState('');

  // Per-agent Quick Fill inputs: { [agentId]: string }
  const [agentQuickAmounts, setAgentQuickAmounts] = useState({});

  // Local state grid: { [sessionId]: { [agentId]: commissionNumber } }
  const [matrix, setMatrix] = useState({});

  const fetchSessions = useCallback(async () => {
    if (!startDate || !endDate) return;
    setLoading(true);
    setErrorMsg('');
    try {
      const res = await fetch(`/api/org/${orgId}/settings/session-commissions?startDate=${startDate}&endDate=${endDate}`);
      const text = await res.text();
      let data = {};
      try { data = JSON.parse(text); } catch { throw new Error(`Server returned HTML error (${res.status})`); }
      if (!res.ok) throw new Error(data.error || 'Failed to fetch sessions');

      const sessList = data.sessions || [];
      setSessions(sessList);

      // Build matrix state
      const initialMatrix = {};
      for (const s of sessList) {
        initialMatrix[s.id] = { ...(s.agentCommissions || {}) };
      }
      setMatrix(initialMatrix);
    } catch (err) {
      setErrorMsg(err.message || 'Failed to load sessions');
    } finally {
      setLoading(false);
    }
  }, [orgId, startDate, endDate]);

  useEffect(() => {
    fetchSessions();
  }, [fetchSessions]);

  function handleCellChange(sessionId, agentId, value) {
    const num = value === '' ? '' : parseFloat(value);
    setMatrix((prev) => ({
      ...prev,
      [sessionId]: {
        ...(prev[sessionId] || {}),
        [agentId]: num,
      },
    }));
  }

  function handleApplyAgentCustom(agent) {
    const valStr = agentQuickAmounts[agent.id];
    const val =
      valStr !== undefined && valStr !== '' && !isNaN(parseFloat(valStr))
        ? parseFloat(valStr)
        : agent.commission ?? 0;

    setMatrix((prev) => {
      const next = { ...prev };
      for (const s of sessions) {
        next[s.id] = {
          ...(next[s.id] || {}),
          [agent.id]: val,
        };
      }
      return next;
    });
    setStatusMsg(`Applied ${val}% across all sessions for ${agent.agentName}`);
  }

  function handleApplyAllDefaults() {
    setMatrix((prev) => {
      const next = { ...prev };
      for (const s of sessions) {
        const sComms = { ...(next[s.id] || {}) };
        for (const ag of agents) {
          sComms[ag.id] = ag.commission ?? 0;
        }
        next[s.id] = sComms;
      }
      return next;
    });
    setStatusMsg('Applied default profile commissions to all agents across all sessions');
  }

  async function handleSave() {
    setSaving(true);
    setStatusMsg('');
    setErrorMsg('');

    try {
      const updates = sessions.map((s) => ({
        sessionId: s.id,
        agentCommissions: matrix[s.id] || {},
      }));

      const res = await fetch(`/api/org/${orgId}/settings/session-commissions`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ updates }),
      });

      const text = await res.text();
      let data = {};
      try { data = JSON.parse(text); } catch { throw new Error(`Server returned HTML error (${res.status})`); }
      if (!res.ok) throw new Error(data.error || 'Failed to save commissions');

      setStatusMsg('🎉 Successfully saved weekly agent commissions!');
      if (onSaved) onSaved();
      setTimeout(() => {
        onClose();
      }, 800);
    } catch (err) {
      setErrorMsg(err.message || 'Failed to save commissions');
    } finally {
      setSaving(false);
    }
  }

  return (
    <div
      className="fixed inset-0 bg-slate-900/80 backdrop-blur-md z-50 flex flex-col p-2 sm:p-3"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-xl shadow-2xl w-full h-full flex flex-col overflow-hidden border border-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Modal Header */}
        <div className="px-4 py-2.5 bg-slate-900 text-white flex items-center justify-between gap-4 shrink-0">
          <div>
            <h2 className="text-base font-bold flex items-center gap-2">
              <span>⚙️ Weekly Agent Commission Matrix Editor</span>
            </h2>
            <p className="text-[11px] text-slate-400 mt-0.5">
              Set or adjust per-session agent commission percentages for weekly Friday settlements.
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="text-slate-400 hover:text-white text-base font-bold px-2 py-0.5 hover:bg-slate-800 rounded transition"
          >
            ✕
          </button>
        </div>

        {/* Top Controls Bar */}
        <div className="px-4 py-2 bg-slate-50 border-b border-slate-200 flex flex-wrap items-center justify-between gap-2 shrink-0">
          <div className="flex flex-wrap items-center gap-2">
            <div className="flex items-center gap-1.5">
              <label className="text-xs font-bold uppercase tracking-wider text-slate-600">📅 Date Range:</label>
              <input
                type="date"
                value={startDate}
                onChange={(e) => setStartDate(e.target.value)}
                className="px-2.5 py-1 text-xs font-semibold border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
              />
              <span className="text-xs font-bold text-slate-400">to</span>
              <input
                type="date"
                value={endDate}
                onChange={(e) => setEndDate(e.target.value)}
                className="px-2.5 py-1 text-xs font-semibold border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
              />
            </div>
          </div>

          <div className="flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={handleApplyAllDefaults}
              className="px-3 py-1 text-xs font-semibold text-indigo-700 bg-indigo-50 border border-indigo-200 rounded-lg hover:bg-indigo-100 transition shadow-xs"
              title="Copy base profile rates to all session cells"
            >
              🔄 Reset All to Base Rates
            </button>
          </div>
        </div>

        {/* Alerts Banner */}
        {statusMsg && (
          <div className="px-4 py-1.5 bg-emerald-50 border-b border-emerald-200 text-xs font-semibold text-emerald-800">
            {statusMsg}
          </div>
        )}
        {errorMsg && (
          <div className="px-4 py-1.5 bg-rose-50 border-b border-rose-200 text-xs font-semibold text-rose-700">
            ⚠️ {errorMsg}
          </div>
        )}

        {/* Matrix Content Body with Compact Cells to Fit 7 Days on Screen */}
        <div className="flex-1 p-3 overflow-hidden flex flex-col">
          {loading ? (
            <div className="py-16 text-center">
              <div className="inline-block animate-spin text-2xl text-indigo-600 mb-2">⏳</div>
              <p className="text-sm font-semibold text-slate-600">Loading sessions & commission matrix...</p>
            </div>
          ) : sessions.length === 0 ? (
            <div className="py-16 text-center bg-slate-50 border-2 border-dashed border-slate-200 rounded-xl">
              <span className="text-3xl mb-2 block">📅</span>
              <p className="text-sm font-bold text-slate-700">No Sessions Found in Selected Date Range</p>
              <p className="text-xs text-slate-400 mt-1">Try selecting a different start or end date above.</p>
            </div>
          ) : agents.length === 0 ? (
            <div className="py-16 text-center bg-slate-50 border-2 border-dashed border-slate-200 rounded-xl">
              <span className="text-3xl mb-2 block">👤</span>
              <p className="text-sm font-bold text-slate-700">No Agents Configured</p>
              <p className="text-xs text-slate-400 mt-1">Add agents in Agent Management first.</p>
            </div>
          ) : (
            <div className="w-full flex-1 overflow-x-auto overflow-y-auto border border-slate-200 rounded-lg shadow-xs bg-white h-full">
              <table className="w-full text-left text-xs border-collapse">
                <thead>
                  <tr className="bg-slate-100 border-b border-slate-200 text-slate-700 font-bold uppercase tracking-wider text-[11px]">
                    <th className="px-2.5 py-2 sticky left-0 bg-slate-100 z-20 border-r border-slate-200 min-w-[100px] shadow-xs">
                      Agent Name
                    </th>
                    <th className="px-1.5 py-2 border-r border-slate-200 text-center min-w-[50px] bg-slate-100">
                      Base
                    </th>
                    {sessions.map((s) => (
                      <th key={s.id} className="px-1 py-1.5 text-center border-r border-slate-200 min-w-[58px] bg-slate-100">
                        <div className="font-bold text-slate-800 text-[11px]">{formatShortDate(s.onDate)}</div>
                        <div className="text-[10px] font-bold text-indigo-600 mt-0.5">
                          {formatShortSlot(getSlotDisplayLabel(s))}
                        </div>
                      </th>
                    ))}
                    <th className="px-2 py-2 text-center min-w-[125px] bg-slate-100">
                      Quick Fill Row
                    </th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-200">
                  {agents.map((ag) => {
                    const baseRate = ag.commission ?? 0;
                    return (
                      <tr key={ag.id} className="hover:bg-slate-50 transition">
                        <td className="px-2.5 py-1.5 font-bold text-slate-800 sticky left-0 bg-white hover:bg-slate-50 border-r border-slate-200 shadow-xs z-10 text-[12px] truncate max-w-[120px]">
                          {ag.agentName}
                        </td>
                        <td className="px-1.5 py-1.5 text-center font-bold text-slate-500 border-r border-slate-200 bg-slate-50/50 text-[11px]">
                          {baseRate}%
                        </td>
                        {sessions.map((s) => {
                          const val = matrix[s.id]?.[ag.id];
                          const displayVal = val !== undefined && val !== null ? val : '';
                          const isCustom = displayVal !== '' && parseFloat(displayVal) !== baseRate;

                          return (
                            <td key={s.id} className="px-1 py-1 text-center border-r border-slate-200 min-w-[58px]">
                              <div className="flex items-center justify-center">
                                <input
                                  type="number"
                                  step="0.5"
                                  min="0"
                                  max="100"
                                  placeholder={`${baseRate}`}
                                  value={displayVal}
                                  onChange={(e) => handleCellChange(s.id, ag.id, e.target.value)}
                                  className={`w-11 px-1 py-0.5 text-center text-xs font-bold rounded border transition focus:outline-none focus:ring-1 ${
                                    isCustom
                                      ? 'bg-amber-50 border-amber-400 text-amber-900 focus:ring-amber-500 font-extrabold shadow-xs'
                                      : 'bg-white border-slate-300 text-slate-800 focus:ring-indigo-500'
                                  }`}
                                />
                              </div>
                            </td>
                          );
                        })}
                        <td className="px-1.5 py-1 text-center min-w-[125px]">
                          <div className="flex items-center justify-center gap-1 bg-slate-50 p-0.5 rounded border border-slate-200">
                            <input
                              type="number"
                              step="0.5"
                              min="0"
                              max="100"
                              placeholder={`${baseRate}`}
                              value={agentQuickAmounts[ag.id] ?? ''}
                              onChange={(e) =>
                                setAgentQuickAmounts((prev) => ({
                                  ...prev,
                                  [ag.id]: e.target.value,
                                }))
                              }
                              className="w-10 px-1 py-0.5 text-xs font-bold text-center border border-slate-300 rounded focus:outline-none focus:ring-1 focus:ring-indigo-500 bg-white"
                            />
                            <button
                              type="button"
                              onClick={() => handleApplyAgentCustom(ag)}
                              className="px-2 py-0.5 text-[10px] font-bold text-white bg-indigo-600 hover:bg-indigo-700 rounded transition shadow-xs whitespace-nowrap"
                              title={`Apply specified % across all sessions for ${ag.agentName}`}
                            >
                              Set All
                            </button>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Footer Actions */}
        <div className="px-4 py-2.5 bg-slate-50 border-t border-slate-200 flex items-center justify-between shrink-0">
          <p className="text-xs text-slate-500 font-medium">
            💡 Highlighted amber inputs indicate custom per-session commission overrides. Blank boxes default to the base rate.
          </p>

          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={onClose}
              className="px-3.5 py-1.5 text-xs font-semibold text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-50 transition"
            >
              Cancel
            </button>
            <button
              type="button"
              disabled={saving || loading || sessions.length === 0}
              onClick={handleSave}
              className="px-4 py-1.5 text-xs font-bold text-white bg-indigo-600 hover:bg-indigo-700 disabled:opacity-50 rounded-lg shadow-md transition flex items-center gap-1.5"
            >
              {saving ? '⏳ Saving...' : '💾 Save Commissions'}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
