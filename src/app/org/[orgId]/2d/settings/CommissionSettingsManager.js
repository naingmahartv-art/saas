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

function getDateRangePreset(type) {
  const today = new Date();
  const todayStr = today.toISOString().slice(0, 10);

  if (type === 'thisWeek') {
    const dayOfWeek = today.getDay(); // 0 = Sun, 1 = Mon ... 5 = Fri
    const distToMon = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
    const mon = new Date(today);
    mon.setDate(today.getDate() + distToMon);
    const fri = new Date(mon);
    fri.setDate(mon.getDate() + 4);
    return { from: mon.toISOString().slice(0, 10), to: fri.toISOString().slice(0, 10) };
  } else if (type === 'lastWeek') {
    const dayOfWeek = today.getDay();
    const distToMon = (dayOfWeek === 0 ? -6 : 1 - dayOfWeek) - 7;
    const mon = new Date(today);
    mon.setDate(today.getDate() + distToMon);
    const sun = new Date(mon);
    sun.setDate(mon.getDate() + 6);
    return { from: mon.toISOString().slice(0, 10), to: sun.toISOString().slice(0, 10) };
  } else if (type === 'thisMonth') {
    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
    return { from: firstDay.toISOString().slice(0, 10), to: todayStr };
  } else if (type === 'lastMonth') {
    const firstDay = new Date(today.getFullYear(), today.getMonth() - 1, 1);
    const lastDay = new Date(today.getFullYear(), today.getMonth(), 0);
    return { from: firstDay.toISOString().slice(0, 10), to: lastDay.toISOString().slice(0, 10) };
  } else if (type === 'all') {
    const past = new Date();
    past.setFullYear(past.getFullYear() - 1);
    return { from: past.toISOString().slice(0, 10), to: todayStr };
  }
  return { from: todayStr, to: todayStr };
}

export default function CommissionSettingsManager({ orgId, agents = [] }) {
  const { t } = useI18n();

  const [datePreset, setDatePreset] = useState('thisWeek');
  const [startDate, setStartDate] = useState(() => getDateRangePreset('thisWeek').from);
  const [endDate, setEndDate] = useState(() => getDateRangePreset('thisWeek').to);

  const [sessions, setSessions] = useState([]);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [statusMsg, setStatusMsg] = useState('');
  const [errorMsg, setErrorMsg] = useState('');

  // Per-agent Quick Fill inputs: { [agentId]: string }
  const [agentQuickAmounts, setAgentQuickAmounts] = useState({});

  // Local state matrix: { [sessionId]: { [agentId]: commissionNumber } }
  const [matrix, setMatrix] = useState({});

  const handlePresetSelect = (preset) => {
    setDatePreset(preset);
    const range = getDateRangePreset(preset);
    setStartDate(range.from);
    setEndDate(range.to);
  };

  const fetchSessions = useCallback(async () => {
    if (!startDate || !endDate) return;
    setLoading(true);
    setErrorMsg('');
    try {
      const res = await fetch(
        `/api/org/${orgId}/settings/session-commissions?startDate=${startDate}&endDate=${endDate}`
      );
      const text = await res.text();
      let data = {};
      try {
        data = JSON.parse(text);
      } catch {
        throw new Error(`Server returned HTML error (${res.status})`);
      }
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
    setStatusMsg(`Applied ${val}% across all filtered sessions for ${agent.agentName}`);
    setTimeout(() => setStatusMsg(''), 4000);
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
    setStatusMsg('Applied default base rates to all agents across all displayed sessions');
    setTimeout(() => setStatusMsg(''), 4000);
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
      try {
        data = JSON.parse(text);
      } catch {
        throw new Error(`Server returned HTML error (${res.status})`);
      }
      if (!res.ok) throw new Error(data.error || 'Failed to save commissions');

      setStatusMsg('🎉 Successfully saved agent session commissions!');
      setTimeout(() => setStatusMsg(''), 4000);
    } catch (err) {
      setErrorMsg(err.message || 'Failed to save commissions');
    } finally {
      setSaving(false);
    }
  }

  return (
    <section className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm space-y-4">
      {/* Section Header */}
      <div className="flex flex-wrap items-center justify-between gap-3 pb-3 border-b border-gray-100">
        <div>
          <h2 className="text-base font-bold text-gray-800 flex items-center gap-2">
            <span>⚙️ Agent Session Commissions & History by Date</span>
          </h2>
          <p className="text-xs text-gray-500 mt-0.5">
            View, edit, and track per-session agent commission percentages by date for settlements.
          </p>
        </div>

        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={handleApplyAllDefaults}
            className="px-3 py-1.5 text-xs font-semibold text-indigo-700 bg-indigo-50 border border-indigo-200 rounded-lg hover:bg-indigo-100 transition shadow-xs cursor-pointer"
            title="Reset displayed sessions to each agent's default profile commission"
          >
            🔄 Reset to Base Rates
          </button>
          <button
            type="button"
            disabled={saving || loading || sessions.length === 0}
            onClick={handleSave}
            className="px-4 py-1.5 text-xs font-bold text-white bg-indigo-600 hover:bg-indigo-700 disabled:opacity-50 rounded-lg shadow-sm transition flex items-center gap-1.5 cursor-pointer"
          >
            {saving ? '⏳ Saving...' : '💾 Save Commissions'}
          </button>
        </div>
      </div>

      {/* Date Filter Presets & Date Inputs */}
      <div className="bg-slate-50 border border-slate-200 rounded-xl p-3 flex flex-wrap items-center justify-between gap-3">
        {/* Presets */}
        <div className="flex items-center gap-1 flex-wrap">
          <span className="text-xs font-bold text-slate-500 mr-1 uppercase tracking-wider">Preset:</span>
          {[
            { id: 'thisWeek', label: '📅 This Week' },
            { id: 'lastWeek', label: '📅 Last Week' },
            { id: 'thisMonth', label: '🗓️ This Month' },
            { id: 'lastMonth', label: '🗓️ Last Month' },
            { id: 'all', label: '📜 All History' },
            { id: 'custom', label: '✏️ Custom' },
          ].map((preset) => (
            <button
              key={preset.id}
              type="button"
              onClick={() => handlePresetSelect(preset.id)}
              className={`px-2.5 py-1 text-xs font-semibold rounded-lg border transition cursor-pointer ${
                datePreset === preset.id
                  ? 'bg-indigo-600 text-white border-indigo-600 shadow-xs'
                  : 'bg-white text-slate-700 border-slate-300 hover:bg-slate-100'
              }`}
            >
              {preset.label}
            </button>
          ))}
        </div>

        {/* Date pickers */}
        <div className="flex items-center gap-1.5 flex-wrap">
          <span className="text-xs font-bold text-slate-600">From:</span>
          <input
            type="date"
            value={startDate}
            onChange={(e) => {
              setStartDate(e.target.value);
              setDatePreset('custom');
            }}
            className="px-2.5 py-1 text-xs font-semibold border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
          />
          <span className="text-xs font-bold text-slate-400">to</span>
          <input
            type="date"
            value={endDate}
            onChange={(e) => {
              setEndDate(e.target.value);
              setDatePreset('custom');
            }}
            className="px-2.5 py-1 text-xs font-semibold border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
          />
          <button
            type="button"
            onClick={fetchSessions}
            className="px-3 py-1 text-xs font-bold text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-100 transition shadow-xs cursor-pointer"
          >
            🔍 Load
          </button>
        </div>
      </div>

      {/* Status Alerts */}
      {statusMsg && (
        <div className="px-4 py-2 bg-emerald-50 border border-emerald-200 text-xs font-semibold text-emerald-800 rounded-lg">
          {statusMsg}
        </div>
      )}
      {errorMsg && (
        <div className="px-4 py-2 bg-rose-50 border border-rose-200 text-xs font-semibold text-rose-700 rounded-lg">
          ⚠️ {errorMsg}
        </div>
      )}

      {/* Commission Matrix / History Table */}
      <div className="border border-slate-200 rounded-xl overflow-hidden bg-white shadow-xs">
        {loading ? (
          <div className="py-16 text-center">
            <div className="inline-block animate-spin text-2xl text-indigo-600 mb-2">⏳</div>
            <p className="text-sm font-semibold text-slate-600">Loading commission history & sessions...</p>
          </div>
        ) : sessions.length === 0 ? (
          <div className="py-12 text-center bg-slate-50 p-4">
            <span className="text-3xl mb-2 block">📅</span>
            <p className="text-sm font-bold text-slate-700">No Sessions Found for Selected Date Range</p>
            <p className="text-xs text-slate-400 mt-1">Select a different date preset or adjust the date pickers above.</p>
          </div>
        ) : agents.length === 0 ? (
          <div className="py-12 text-center bg-slate-50 p-4">
            <span className="text-3xl mb-2 block">👤</span>
            <p className="text-sm font-bold text-slate-700">No Agents Configured</p>
            <p className="text-xs text-slate-400 mt-1">Add agents in Agent Management first.</p>
          </div>
        ) : (
          <div className="w-full overflow-x-auto max-h-[500px] overflow-y-auto">
            <table className="w-full text-left text-xs border-collapse">
              <thead>
                <tr className="bg-slate-100 border-b border-slate-200 text-slate-700 font-bold uppercase tracking-wider text-[11px] sticky top-0 z-30">
                  <th className="px-3 py-2.5 sticky left-0 bg-slate-100 z-40 border-r border-slate-200 min-w-[120px] shadow-xs">
                    Agent Name
                  </th>
                  <th className="px-2 py-2.5 border-r border-slate-200 text-center min-w-[60px] bg-slate-100">
                    Base %
                  </th>
                  {sessions.map((s) => (
                    <th
                      key={s.id}
                      className="px-1.5 py-2 text-center border-r border-slate-200 min-w-[65px] bg-slate-100"
                    >
                      <div className="font-bold text-slate-800 text-[11px]">{formatShortDate(s.onDate)}</div>
                      <div className="text-[10px] font-bold text-indigo-600 mt-0.5">
                        {formatShortSlot(getSlotDisplayLabel(s))}
                      </div>
                    </th>
                  ))}
                  <th className="px-3 py-2.5 text-center min-w-[140px] bg-slate-100">
                    Quick Fill Row
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {agents.map((ag) => {
                  const baseRate = ag.commission ?? 0;
                  return (
                    <tr key={ag.id} className="hover:bg-slate-50 transition">
                      <td className="px-3 py-2 font-bold text-slate-800 sticky left-0 bg-white hover:bg-slate-50 border-r border-slate-200 shadow-xs z-20 text-[12px] truncate max-w-[140px]">
                        {ag.agentName}
                      </td>
                      <td className="px-2 py-2 text-center font-bold text-slate-500 border-r border-slate-200 bg-slate-50/50 text-[11px]">
                        {baseRate}%
                      </td>
                      {sessions.map((s) => {
                        const val = matrix[s.id]?.[ag.id];
                        const displayVal = val !== undefined && val !== null ? val : '';
                        const isCustom = displayVal !== '' && parseFloat(displayVal) !== baseRate;

                        return (
                          <td key={s.id} className="px-1 py-1 text-center border-r border-slate-200 min-w-[65px]">
                            <div className="flex items-center justify-center">
                              <input
                                type="number"
                                step="0.5"
                                min="0"
                                max="100"
                                placeholder={`${baseRate}`}
                                value={displayVal}
                                onChange={(e) => handleCellChange(s.id, ag.id, e.target.value)}
                                className={`w-12 px-1 py-1 text-center text-xs font-bold rounded border transition focus:outline-none focus:ring-1 ${
                                  isCustom
                                    ? 'bg-amber-50 border-amber-400 text-amber-900 focus:ring-amber-500 font-extrabold shadow-xs'
                                    : 'bg-white border-slate-300 text-slate-800 focus:ring-indigo-500'
                                }`}
                              />
                            </div>
                          </td>
                        );
                      })}
                      <td className="px-2 py-1 text-center min-w-[140px]">
                        <div className="flex items-center justify-center gap-1 bg-slate-50 p-1 rounded border border-slate-200">
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
                            className="w-12 px-1 py-0.5 text-xs font-bold text-center border border-slate-300 rounded focus:outline-none focus:ring-1 focus:ring-indigo-500 bg-white"
                          />
                          <button
                            type="button"
                            onClick={() => handleApplyAgentCustom(ag)}
                            className="px-2.5 py-1 text-[11px] font-bold text-white bg-indigo-600 hover:bg-indigo-700 rounded transition shadow-xs whitespace-nowrap cursor-pointer"
                            title={`Apply specified % across all displayed sessions for ${ag.agentName}`}
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

      {/* Helper Legend */}
      <div className="flex flex-wrap items-center justify-between gap-2 text-xs text-slate-500 pt-1">
        <div className="flex items-center gap-3 flex-wrap">
          <span className="flex items-center gap-1.5 font-medium">
            <span className="w-3 h-3 rounded bg-amber-50 border border-amber-400 inline-block"></span>
            Highlighted Amber = Custom Session Override
          </span>
          <span className="flex items-center gap-1.5 font-medium">
            <span className="w-3 h-3 rounded bg-white border border-slate-300 inline-block"></span>
            White / Blank = Base Profile Commission
          </span>
        </div>
        <p className="font-semibold text-slate-600">Total Displayed Sessions: {sessions.length}</p>
      </div>
    </section>
  );
}
