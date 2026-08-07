'use client';
import { useEffect, useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

const pad2 = (n) => String(n).padStart(2, '0');
const GRID_NUMBERS = Array.from({ length: 10 }, (_, tens) =>
  Array.from({ length: 10 }, (_, units) => `${tens}${units}`)
);

function fmt(n) {
  return (n ?? 0).toLocaleString();
}

export default function ResultsPage({ orgId, session }) {
  const { t } = useI18n();
  const { onCount, ampm, onDate } = session;

  const [luckyNo, setLuckyNo] = useState(null);
  const [lNoInput, setLNoInput] = useState('');
  const [luckyLoading, setLuckyLoading] = useState(true);
  const [luckySaving, setLuckySaving] = useState(false);
  const [luckyError, setLuckyError] = useState('');

  const [results, setResults] = useState(null);
  const [calcLoading, setCalcLoading] = useState(false);
  const [calcError, setCalcError] = useState('');

  useEffect(() => {
    let cancelled = false;
    async function loadLucky() {
      setLuckyLoading(true);
      try {
        const res = await fetch(
          `/api/org/${orgId}/lucky?onDate=${encodeURIComponent(onDate)}&ampm=${encodeURIComponent(ampm)}`
        );
        const data = await res.json();
        if (cancelled) return;
        const current = data.luckyNos?.[0] ?? null;
        setLuckyNo(current);
        if (current) setLNoInput(current.lNo);
      } finally {
        if (!cancelled) setLuckyLoading(false);
      }
    }
    loadLucky();
    return () => { cancelled = true; };
  }, [orgId, onDate, ampm]);

  async function handleSetLucky(e) {
    e.preventDefault();
    setLuckyError('');
    if (!/^\d{2}$/.test(lNoInput)) {
      setLuckyError(t('results.enter2Digit'));
      return;
    }
    setLuckySaving(true);
    try {
      const res = await fetch(`/api/org/${orgId}/lucky`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ lNo: lNoInput, onDate, ampm }),
      });
      const data = await res.json();
      if (!res.ok) {
        setLuckyError(data.error || t('common.failedToSave'));
        return;
      }
      setLuckyNo(data.luckyNo);
      setResults(null);
    } finally {
      setLuckySaving(false);
    }
  }

  async function handleCalculate() {
    setCalcError('');
    setCalcLoading(true);
    try {
      const res = await fetch(
        `/api/org/${orgId}/results?onCount=${encodeURIComponent(onCount)}&ampm=${encodeURIComponent(ampm)}&onDate=${encodeURIComponent(onDate)}`
      );
      const data = await res.json();
      if (!res.ok) {
        setCalcError(data.error || t('results.failedToCalculate'));
        return;
      }
      setResults(data);
    } finally {
      setCalcLoading(false);
    }
  }

  const numberByNum = new Map((results?.numberSummary || []).map(n => [n.num, n]));

  return (
    <div className="max-w-6xl mx-auto space-y-4">
      {/* Session info bar */}
      <div className="bg-white rounded-xl border border-gray-200 shadow-sm px-5 py-3 flex flex-wrap items-center gap-3">
        <span className="badge-active">{t('results.roundLabel', { n: onCount })}</span>
        <span className="text-sm font-medium text-gray-900">{ampm}</span>
        <span className="text-gray-400">•</span>
        <span className="text-sm text-gray-700">{onDate}</span>
      </div>

      {/* Lucky number section */}
      <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-5">
        <h2 className="text-base font-semibold text-gray-800 mb-1">
          {t('results.luckyNumberSection')}
        </h2>
        {luckyLoading ? (
          <p className="text-sm text-gray-400">{t('common.loading')}</p>
        ) : (
          <form onSubmit={handleSetLucky} className="flex flex-wrap items-end gap-3 mt-2">
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">{t('results.twoDigitLabel')}</label>
              <input
                type="text"
                inputMode="numeric"
                maxLength={2}
                value={lNoInput}
                onChange={e => setLNoInput(e.target.value.replace(/\D/g, '').slice(0, 2))}
                placeholder="00"
                className="w-24 px-3 py-2 text-lg font-mono text-center border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <button
              type="submit"
              disabled={luckySaving}
              className="bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium px-4 py-2.5 rounded-lg transition"
            >
              {luckySaving ? t('common.saving') : t('results.setLuckyNumber')}
            </button>
            {luckyNo && (
              <div className="ml-2 px-4 py-2 rounded-lg bg-amber-50 border border-amber-200">
                <span className="text-xs text-amber-600 font-medium uppercase tracking-wide mr-2">{t('results.current')}</span>
                <span className="text-lg font-mono font-bold text-amber-700">{luckyNo.lNo}</span>
              </div>
            )}
          </form>
        )}
        {luckyError && (
          <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2 mt-3">{luckyError}</p>
        )}

        <button
          type="button"
          onClick={handleCalculate}
          disabled={!luckyNo || calcLoading}
          className="mt-4 bg-gray-900 hover:bg-gray-800 disabled:opacity-50 text-white text-sm font-medium px-4 py-2.5 rounded-lg transition"
        >
          {calcLoading ? t('results.calculating') : t('results.calculate')}
        </button>
        {calcError && (
          <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2 mt-3">{calcError}</p>
        )}
      </div>

      {/* Results section */}
      {results && (
        <>
          {/* Summary cards */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-5">
              <p className="text-xs text-gray-500 font-medium uppercase tracking-wide mb-1">
                {t('results.totalBet')}
              </p>
              <p className="text-2xl font-bold text-gray-900">{fmt(results.totalBet)}</p>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-5">
              <p className="text-xs text-gray-500 font-medium uppercase tracking-wide mb-1">
                {t('results.totalPayout')}
              </p>
              <p className="text-2xl font-bold text-gray-900">{fmt(results.totalPayout)}</p>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-5">
              <p className="text-xs text-gray-500 font-medium uppercase tracking-wide mb-1">
                {t('results.profit')}
              </p>
              <p className={`text-2xl font-bold ${results.profit >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                {fmt(results.profit)}
              </p>
            </div>
          </div>

          {/* Per-agent table */}
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="px-5 py-3 border-b border-gray-100">
              <span className="text-sm font-semibold text-gray-800">{t('results.perAgent')}</span>
            </div>
            {results.perAgent.length === 0 ? (
              <div className="px-5 py-8 text-center text-gray-400 text-sm">{t('results.noEntries')}</div>
            ) : (
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
                    <th className="text-left px-5 py-2 font-medium">{t('results.agentCol')}</th>
                    <th className="text-right px-4 py-2 font-medium">{t('results.totalBetCol')}</th>
                    <th className="text-right px-4 py-2 font-medium">{t('results.winnerBetCol')}</th>
                    <th className="text-right px-4 py-2 font-medium">{t('results.payoutCol')}</th>
                    <th className="text-right px-5 py-2 font-medium">{t('results.netCol')}</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {results.perAgent.map(a => (
                    <tr key={a.agentName} className="hover:bg-gray-50 transition">
                      <td className="px-5 py-2 font-medium text-gray-900">{a.agentName}</td>
                      <td className="px-4 py-2 text-right text-gray-700">{fmt(a.totalBet)}</td>
                      <td className="px-4 py-2 text-right text-gray-700">{fmt(a.winnerBet)}</td>
                      <td className="px-4 py-2 text-right text-gray-700">{fmt(a.payout)}</td>
                      <td className={`px-5 py-2 text-right font-medium ${a.net >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                        {fmt(a.net)}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>

          {/* Number grid */}
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-4">
            <h2 className="text-sm font-semibold text-gray-800 mb-3">00 – 99</h2>
            <div className="grid grid-cols-10 gap-1">
              {GRID_NUMBERS.flat().map(num => {
                const entry = numberByNum.get(num);
                const isWinner = entry?.isWinner;
                let cls = 'bg-gray-50 text-gray-600 hover:bg-gray-100';
                if (isWinner) cls = 'bg-amber-400 text-amber-950 font-bold hover:bg-amber-500';
                else if (entry?.totalBet > 0) cls = 'bg-indigo-50 text-indigo-700 hover:bg-indigo-100';

                return (
                  <div
                    key={num}
                    title={entry ? `${num}: ${fmt(entry.totalBet)}` : num}
                    className={`aspect-square rounded flex items-center justify-center text-xs font-mono font-medium transition ${cls}`}
                  >
                    {num}
                  </div>
                );
              })}
            </div>
            <div className="flex flex-wrap gap-3 mt-4 text-xs text-gray-500">
              <span className="flex items-center gap-1"><span className="w-3 h-3 rounded bg-amber-400 inline-block" /> {t('results.winnerLegend')}</span>
              <span className="flex items-center gap-1"><span className="w-3 h-3 rounded bg-indigo-50 inline-block" /> {t('results.hasBetsLegend')}</span>
            </div>
          </div>
        </>
      )}
    </div>
  );
}
