'use client';
import { useState, useEffect, useCallback, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';

const SLOT_LABEL_KEY = { '09:00': 'slot0900', '12:00': 'slot1200', '04:00': 'slot0400' };

function csvEscape(value) {
  const s = String(value ?? '');
  return /[",\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
}

function toCsv(rows) {
  return rows.map(row => row.map(csvEscape).join(',')).join('\n');
}

function downloadBlob(blob, filename) {
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

async function shareOrDownload(blob, filename, t, setStatus) {
  try {
    const file = new File([blob], filename, { type: blob.type });
    if (navigator.canShare && navigator.canShare({ files: [file] })) {
      await navigator.share({ files: [file], title: filename });
      return;
    }
  } catch {
    return; // user cancelled the native share sheet
  }
  downloadBlob(blob, filename);
  setStatus(t('reports.downloadedShareHint'));
}

export default function ReportsModal({ orgId, activeSession, agents, onClose }) {
  const { t } = useI18n();
  const [tab, setTab] = useState('agent');
  const [statusMsg, setStatusMsg] = useState('');

  const sessionLabel = activeSession
    ? `${t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`)} · ${activeSession.onDate}`
    : '';
  const dateLabel = activeSession?.onDate || new Date().toISOString().slice(0, 10);

  // --- Report by Agent ---
  const [selectedAgentId, setSelectedAgentId] = useState('');
  const [agentSlips, setAgentSlips] = useState([]);
  const [agentLoading, setAgentLoading] = useState(false);
  const selectedAgent = agents.find(a => a.id === selectedAgentId);

  const loadAgentReport = useCallback(async (agentName) => {
    if (!agentName) { setAgentSlips([]); return; }
    setAgentLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger?agentName=${encodeURIComponent(agentName)}`);
      const data = await res.json();
      setAgentSlips(data.slips || []);
    } catch {
      setAgentSlips([]);
    } finally {
      setAgentLoading(false);
    }
  }, [orgId]);

  useEffect(() => {
    if (tab === 'agent' && selectedAgent) loadAgentReport(selectedAgent.agentName);
  }, [tab, selectedAgent, loadAgentReport]);

  const agentGrandTotal = useMemo(
    () => agentSlips.reduce((sum, s) => sum + (s.amount || 0), 0),
    [agentSlips]
  );

  // --- Summary Report ---
  const [summarySlips, setSummarySlips] = useState([]);
  const [summaryLoading, setSummaryLoading] = useState(false);

  const loadSummary = useCallback(async () => {
    setSummaryLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger`);
      const data = await res.json();
      setSummarySlips(data.slips || []);
    } catch {
      setSummarySlips([]);
    } finally {
      setSummaryLoading(false);
    }
  }, [orgId]);

  useEffect(() => {
    if (tab === 'summary') loadSummary();
  }, [tab, loadSummary]);

  const summaryByAgent = useMemo(() => {
    const map = new Map();
    for (const s of summarySlips) {
      const list = map.get(s.agentName) || [];
      list.push(s);
      map.set(s.agentName, list);
    }
    return [...map.entries()]
      .map(([agentName, slips]) => ({
        agentName,
        slips,
        subtotal: slips.reduce((sum, s) => sum + (s.amount || 0), 0),
      }))
      .sort((a, b) => a.agentName.localeCompare(b.agentName));
  }, [summarySlips]);

  const summaryGrandTotal = useMemo(
    () => summaryByAgent.reduce((sum, a) => sum + a.subtotal, 0),
    [summaryByAgent]
  );

  // --- Win / Payout Report ---
  const [payoutData, setPayoutData] = useState(null);
  const [payoutLoading, setPayoutLoading] = useState(false);

  const loadPayout = useCallback(async () => {
    if (!activeSession) return;
    setPayoutLoading(true);
    try {
      const res = await fetch(
        `/api/org/${orgId}/results?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}&onDate=${activeSession.onDate}`
      );
      const data = await res.json();
      setPayoutData(data);
    } catch {
      setPayoutData(null);
    } finally {
      setPayoutLoading(false);
    }
  }, [orgId, activeSession]);

  useEffect(() => {
    if (tab === 'payout') loadPayout();
  }, [tab, loadPayout]);

  // --- Export builders ---
  function exportAgentCsv() {
    if (!selectedAgent || agentSlips.length === 0) return;
    const rows = [[t('reports.srNoCol'), t('reports.dateTimeCol'), t('reports.numberCol'), t('reports.amountCol')]];
    for (const slip of agentSlips) {
      const when = new Date(slip.createdAt).toLocaleString();
      for (const d of slip.details || []) {
        rows.push([slip.srNo, when, d.num1, d.value]);
      }
    }
    rows.push(['', '', t('reports.grandTotalLabel'), agentGrandTotal]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'csv'));
  }

  function buildAgentPdfBlob() {
    const sections = agentSlips.map(slip => ({
      heading: `${t('reports.srNoCol')} ${slip.srNo} — ${new Date(slip.createdAt).toLocaleString()}`,
      head: [[t('reports.numberCol'), t('reports.amountCol')]],
      rows: (slip.details || []).map(d => [d.num1, d.value.toLocaleString()]),
    }));
    sections.push({ head: [[t('reports.grandTotalLabel')]], rows: [[agentGrandTotal.toLocaleString()]] });
    return buildReportPdf({
      title: `${t('reports.tabAgent')} — ${selectedAgent?.agentName || ''}`,
      subtitle: sessionLabel,
      sections,
    });
  }

  function exportAgentPdf() {
    if (!selectedAgent || agentSlips.length === 0) return;
    downloadBlob(buildAgentPdfBlob(), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'pdf'));
  }

  function shareAgentPdf() {
    if (!selectedAgent || agentSlips.length === 0) return;
    shareOrDownload(buildAgentPdfBlob(), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'pdf'), t, setStatusMsg);
  }

  function exportSummaryCsv() {
    if (summaryByAgent.length === 0) return;
    const rows = [[t('reports.agentCol'), t('reports.srNoCol'), t('reports.amountCol')]];
    for (const group of summaryByAgent) {
      for (const s of group.slips) rows.push([group.agentName, s.srNo, s.amount]);
      rows.push([group.agentName, t('reports.subtotalLabel'), group.subtotal]);
    }
    rows.push(['', t('reports.grandTotalLabel'), summaryGrandTotal]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName('summary', dateLabel, 'csv'));
  }

  function buildSummaryPdfBlob() {
    const sections = summaryByAgent.map(group => ({
      heading: group.agentName,
      head: [[t('reports.srNoCol'), t('reports.amountCol')]],
      rows: [
        ...group.slips.map(s => [s.srNo, s.amount.toLocaleString()]),
        [t('reports.subtotalLabel'), group.subtotal.toLocaleString()],
      ],
    }));
    sections.push({ head: [[t('reports.grandTotalLabel')]], rows: [[summaryGrandTotal.toLocaleString()]] });
    return buildReportPdf({ title: t('reports.tabSummary'), subtitle: sessionLabel, sections });
  }

  function exportSummaryPdf() {
    if (summaryByAgent.length === 0) return;
    downloadBlob(buildSummaryPdfBlob(), reportFileName('summary', dateLabel, 'pdf'));
  }

  function shareSummaryPdf() {
    if (summaryByAgent.length === 0) return;
    shareOrDownload(buildSummaryPdfBlob(), reportFileName('summary', dateLabel, 'pdf'), t, setStatusMsg);
  }

  function exportPayoutCsv() {
    if (!payoutData || !payoutData.luckyNo) return;
    const rows = [[t('reports.agentCol'), t('reports.totalBetCol'), t('reports.winnerBetCol'), t('reports.payoutCol'), t('reports.netCol')]];
    for (const a of payoutData.perAgent) rows.push([a.agentName, a.totalBet, a.winnerBet, a.payout, a.net]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName('payout', dateLabel, 'csv'));
  }

  function buildPayoutPdfBlob() {
    return buildReportPdf({
      title: t('reports.tabPayout'),
      subtitle: `${sessionLabel} — ${t('results.luckyNumber')}: ${payoutData.luckyNo}`,
      sections: [
        {
          head: [[t('results.totalBet'), t('results.totalPayout'), t('results.profit')]],
          rows: [[payoutData.totalBet.toLocaleString(), payoutData.totalPayout.toLocaleString(), payoutData.profit.toLocaleString()]],
        },
        {
          heading: t('results.perAgent'),
          head: [[t('reports.agentCol'), t('reports.totalBetCol'), t('reports.winnerBetCol'), t('reports.payoutCol'), t('reports.netCol')]],
          rows: payoutData.perAgent.map(a => [a.agentName, a.totalBet.toLocaleString(), a.winnerBet.toLocaleString(), a.payout.toLocaleString(), a.net.toLocaleString()]),
        },
      ],
    });
  }

  function exportPayoutPdf() {
    if (!payoutData || !payoutData.luckyNo) return;
    downloadBlob(buildPayoutPdfBlob(), reportFileName('payout', dateLabel, 'pdf'));
  }

  function sharePayoutPdf() {
    if (!payoutData || !payoutData.luckyNo) return;
    shareOrDownload(buildPayoutPdfBlob(), reportFileName('payout', dateLabel, 'pdf'), t, setStatusMsg);
  }

  const TABS = [
    { key: 'agent', label: t('reports.tabAgent') },
    { key: 'summary', label: t('reports.tabSummary') },
    { key: 'payout', label: t('reports.tabPayout') },
  ];

  return (
    <div
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-xl shadow-2xl max-w-4xl w-full max-h-[90vh] flex flex-col overflow-hidden border border-gray-200"
        onClick={e => e.stopPropagation()}
      >
        <div className="px-5 py-3 border-b border-gray-100 flex items-center justify-between gap-2">
          <div className="flex items-center gap-1">
            {TABS.map(tb => (
              <button
                key={tb.key}
                type="button"
                onClick={() => setTab(tb.key)}
                className={`px-3 py-1.5 text-sm font-medium rounded-lg transition ${
                  tab === tb.key ? 'bg-indigo-600 text-white' : 'text-gray-600 hover:bg-gray-100'
                }`}
              >
                {tb.label}
              </button>
            ))}
          </div>
          <button
            type="button"
            onClick={onClose}
            className="text-gray-400 hover:text-gray-600 text-lg font-bold px-1.5 py-0.5 hover:bg-gray-100 rounded transition"
            aria-label={t('common.close')}
          >
            ✕
          </button>
        </div>

        {statusMsg && (
          <p className="text-sm text-indigo-700 bg-indigo-50 px-5 py-2 cursor-pointer" onClick={() => setStatusMsg('')}>
            {statusMsg}
          </p>
        )}

        <div className="overflow-y-auto flex-1 p-5">
          {tab === 'agent' && (
            <div>
              <div className="flex flex-wrap items-center gap-2 mb-4">
                <select
                  value={selectedAgentId}
                  onChange={e => setSelectedAgentId(e.target.value)}
                  className="px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-gray-50"
                >
                  <option value="">{t('ledger.selectAgentPlaceholder')}</option>
                  {agents.map(a => (
                    <option key={a.id} value={a.id}>{a.agentName}</option>
                  ))}
                </select>
                {selectedAgent && agentSlips.length > 0 && (
                  <div className="flex items-center gap-2 ml-auto">
                    <button type="button" onClick={exportAgentCsv} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('ledger.exportCsv')}</button>
                    <button type="button" onClick={exportAgentPdf} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('reports.exportPdf')}</button>
                    <button type="button" onClick={shareAgentPdf} className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition">{t('ledger.shareMessage')}</button>
                  </div>
                )}
              </div>

              {!selectedAgent ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.selectAgentPrompt')}</p>
              ) : agentLoading ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('common.loading')}</p>
              ) : agentSlips.length === 0 ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.noVouchers')}</p>
              ) : (
                <div className="space-y-4">
                  {agentSlips.map(slip => (
                    <div key={slip.id} className="border border-gray-200 rounded-lg overflow-hidden">
                      <div className="bg-gray-50 px-3 py-2 flex items-center justify-between text-sm">
                        <span className="font-semibold text-gray-800">{t('reports.srNoCol')} {slip.srNo}</span>
                        <span className="text-gray-500">{new Date(slip.createdAt).toLocaleString()}</span>
                      </div>
                      <table className="w-full text-sm">
                        <thead>
                          <tr className="text-xs text-gray-500 uppercase tracking-wide border-b border-gray-100">
                            <th className="text-left px-3 py-1.5 font-medium">{t('reports.numberCol')}</th>
                            <th className="text-right px-3 py-1.5 font-medium">{t('reports.amountCol')}</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-50">
                          {(slip.details || []).map((d, i) => (
                            <tr key={i}>
                              <td className="px-3 py-1 font-mono">{d.num1}</td>
                              <td className="px-3 py-1 text-right font-mono">{d.value.toLocaleString()}</td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                      <div className="px-3 py-1.5 bg-gray-50 text-right text-sm font-semibold text-gray-800">
                        {t('reports.subtotalLabel')}: {slip.amount.toLocaleString()}
                      </div>
                    </div>
                  ))}
                  <div className="text-right text-base font-bold text-indigo-700 pt-2">
                    {t('reports.grandTotalLabel')}: {agentGrandTotal.toLocaleString()}
                  </div>
                </div>
              )}
            </div>
          )}

          {tab === 'summary' && (
            <div>
              <div className="flex items-center justify-end gap-2 mb-4">
                {summaryByAgent.length > 0 && (
                  <>
                    <button type="button" onClick={exportSummaryCsv} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('ledger.exportCsv')}</button>
                    <button type="button" onClick={exportSummaryPdf} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('reports.exportPdf')}</button>
                    <button type="button" onClick={shareSummaryPdf} className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition">{t('ledger.shareMessage')}</button>
                  </>
                )}
              </div>

              {summaryLoading ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('common.loading')}</p>
              ) : summaryByAgent.length === 0 ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.noVouchers')}</p>
              ) : (
                <div className="space-y-4">
                  {summaryByAgent.map(group => (
                    <div key={group.agentName} className="border border-gray-200 rounded-lg overflow-hidden">
                      <div className="bg-gray-50 px-3 py-2 text-sm font-semibold text-gray-800">{group.agentName}</div>
                      <table className="w-full text-sm">
                        <thead>
                          <tr className="text-xs text-gray-500 uppercase tracking-wide border-b border-gray-100">
                            <th className="text-left px-3 py-1.5 font-medium">{t('reports.srNoCol')}</th>
                            <th className="text-right px-3 py-1.5 font-medium">{t('reports.amountCol')}</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-50">
                          {group.slips.map(s => (
                            <tr key={s.id}>
                              <td className="px-3 py-1 font-mono">{s.srNo}</td>
                              <td className="px-3 py-1 text-right font-mono">{s.amount.toLocaleString()}</td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                      <div className="px-3 py-1.5 bg-gray-50 text-right text-sm font-semibold text-gray-800">
                        {t('reports.subtotalLabel')}: {group.subtotal.toLocaleString()}
                      </div>
                    </div>
                  ))}
                  <div className="text-right text-base font-bold text-indigo-700 pt-2">
                    {t('reports.grandTotalLabel')}: {summaryGrandTotal.toLocaleString()}
                  </div>
                </div>
              )}
            </div>
          )}

          {tab === 'payout' && (
            <div>
              <div className="flex items-center justify-end gap-2 mb-4">
                {payoutData?.luckyNo && (
                  <>
                    <button type="button" onClick={exportPayoutCsv} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('ledger.exportCsv')}</button>
                    <button type="button" onClick={exportPayoutPdf} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('reports.exportPdf')}</button>
                    <button type="button" onClick={sharePayoutPdf} className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition">{t('ledger.shareMessage')}</button>
                  </>
                )}
              </div>

              {payoutLoading ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('common.loading')}</p>
              ) : !payoutData?.luckyNo ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.noLuckyNumberSet')}</p>
              ) : (
                <div>
                  <div className="grid grid-cols-3 gap-3 mb-5">
                    <div className="bg-indigo-50 rounded-lg p-3 text-center">
                      <p className="text-xs text-indigo-500 font-medium">{t('results.totalBet')}</p>
                      <p className="text-lg font-bold text-indigo-900">{payoutData.totalBet.toLocaleString()}</p>
                    </div>
                    <div className="bg-red-50 rounded-lg p-3 text-center">
                      <p className="text-xs text-red-500 font-medium">{t('results.totalPayout')}</p>
                      <p className="text-lg font-bold text-red-900">{payoutData.totalPayout.toLocaleString()}</p>
                    </div>
                    <div className="bg-green-50 rounded-lg p-3 text-center">
                      <p className="text-xs text-green-500 font-medium">{t('results.profit')}</p>
                      <p className="text-lg font-bold text-green-900">{payoutData.profit.toLocaleString()}</p>
                    </div>
                  </div>
                  <table className="w-full text-sm border border-collapse border-gray-200">
                    <thead>
                      <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
                        <th className="text-left px-3 py-2 border border-gray-200 font-medium">{t('reports.agentCol')}</th>
                        <th className="text-right px-3 py-2 border border-gray-200 font-medium">{t('reports.totalBetCol')}</th>
                        <th className="text-right px-3 py-2 border border-gray-200 font-medium">{t('reports.winnerBetCol')}</th>
                        <th className="text-right px-3 py-2 border border-gray-200 font-medium">{t('reports.payoutCol')}</th>
                        <th className="text-right px-3 py-2 border border-gray-200 font-medium">{t('reports.netCol')}</th>
                      </tr>
                    </thead>
                    <tbody>
                      {payoutData.perAgent.map(a => (
                        <tr key={a.agentName}>
                          <td className="px-3 py-1.5 border border-gray-200">{a.agentName}</td>
                          <td className="px-3 py-1.5 text-right font-mono border border-gray-200">{a.totalBet.toLocaleString()}</td>
                          <td className="px-3 py-1.5 text-right font-mono border border-gray-200">{a.winnerBet.toLocaleString()}</td>
                          <td className="px-3 py-1.5 text-right font-mono border border-gray-200">{a.payout.toLocaleString()}</td>
                          <td className="px-3 py-1.5 text-right font-mono border border-gray-200">{a.net.toLocaleString()}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
