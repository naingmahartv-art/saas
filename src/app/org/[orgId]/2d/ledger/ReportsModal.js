'use client';
import { useState, useEffect, useCallback, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';

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

function getTokenItemsForSlip(slip, luckyNo) {
  if (slip.tokens && slip.tokens.length > 0) {
    return slip.tokens.map(tokText => {
      const { entries } = parseNumberExpression(tokText, { maxEntries: MAX_ENTRIES });
      const amount = entries ? entries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0) : 0;
      const isWinner = Boolean(
        luckyNo &&
          entries?.some(e => String(e.num).padStart(2, '0') === String(luckyNo).padStart(2, '0'))
      );
      return { tokText, amount, isWinner };
    });
  }
  if (slip.details && slip.details.length > 0) {
    return slip.details.map(d => {
      const num = String(d.num1).padStart(2, '0');
      const isWinner = Boolean(luckyNo && num === String(luckyNo).padStart(2, '0'));
      return { tokText: num, amount: d.value, isWinner };
    });
  }
  return [];
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

const fmt2 = n => Number(n || 0).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });

const PDF_EN = {
  srNo: 'SrNo',
  dateTime: 'Date / Time',
  number: 'Number',
  amount: 'Amount',
  subtotal: 'Subtotal',
  grandTotal: 'Grand Total',
  agent: 'AgentName',
  totalBet: 'Total Bet',
  winnerBet: 'Winner Bet',
  payout: 'Payout',
  net: 'Net',
  totalPayout: 'Total Payout',
  profit: 'Profit',
  perAgent: 'Per Agent Breakdown',
  saleAmount: 'Sale Amount',
  comRate: 'Com Rate',
  comAmt: 'Com Amt',
  lAmount: 'L Amount',
  rate: 'Rate',
  winPayout: 'Win Payout',
  comPlusL: 'Com + L Amount',
  balanceTotal: 'Balance Total',
  total: 'Total',
  agentReport: 'Report by Agent',
  summaryReport: 'Summary Report',
  payoutReport: 'Win / Payout Report',
  allAgentReport: 'All Agent Report',
  luckyNumber: 'Lucky Number',
};

export default function ReportsModal({ orgId, activeSession, agents, onClose, initialTab = 'allAgent' }) {
  const { t } = useI18n();
  const [tab, setTab] = useState(initialTab);
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

    if (activeSession) {
      try {
        const res = await fetch(
          `/api/org/${orgId}/results?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}&onDate=${activeSession.onDate}`
        );
        const data = await res.json();
        setPayoutData(data);
      } catch {}
    }
  }, [orgId, activeSession]);

  useEffect(() => {
    if (tab === 'agent' && selectedAgent) loadAgentReport(selectedAgent.agentName);
  }, [tab, selectedAgent, loadAgentReport]);

  const sortedAgentSlips = useMemo(
    () => [...agentSlips].sort((a, b) => (a.srNo || a.createdAt || 0) - (b.srNo || b.createdAt || 0)),
    [agentSlips]
  );

  const agentGrandTotal = useMemo(
    () => sortedAgentSlips.reduce((sum, s) => sum + (s.amount || 0), 0),
    [sortedAgentSlips]
  );

  // --- Summary Report ---
  const [summarySlips, setSummarySlips] = useState([]);
  const [summaryLoading, setSummaryLoading] = useState(false);

  const loadSummary = useCallback(async () => {
    setSummaryLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger?sort=asc`);
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
    const parseSr = s => parseInt(String(s?.srNo ?? '').replace(/[^0-9]/g, ''), 10) || 0;
    const map = new Map();

    const sortedSlips = [...summarySlips].sort((a, b) => parseSr(a) - parseSr(b));
    for (const s of sortedSlips) {
      const list = map.get(s.agentName) || [];
      list.push(s);
      map.set(s.agentName, list);
    }
    return [...map.entries()]
      .map(([agentName, slips]) => ({
        agentName,
        slips: [...slips].sort((a, b) => parseSr(a) - parseSr(b)),
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

  // --- All Agent Report ---
  const [allAgentSlips, setAllAgentSlips] = useState([]);
  const [allAgentLoading, setAllAgentLoading] = useState(false);

  const loadAllAgentData = useCallback(async () => {
    setAllAgentLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger`);
      const data = await res.json();
      setAllAgentSlips(data.slips || []);
    } catch {
      setAllAgentSlips([]);
    } finally {
      setAllAgentLoading(false);
    }

    if (activeSession && !payoutData) {
      try {
        const res = await fetch(
          `/api/org/${orgId}/results?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}&onDate=${activeSession.onDate}`
        );
        const data = await res.json();
        setPayoutData(data);
      } catch {
        // ignore
      }
    }
  }, [orgId, activeSession, payoutData]);

  useEffect(() => {
    if (tab === 'allAgent') loadAllAgentData();
  }, [tab, loadAllAgentData]);

  const agentMap = useMemo(() => {
    const map = new Map();
    for (const a of agents) {
      if (a.agentName) map.set(a.agentName, a);
      if (a.id) map.set(a.id, a);
    }
    return map;
  }, [agents]);

  const luckyNo = payoutData?.luckyNo || activeSession?.luckyNo || null;

  const allAgentRows = useMemo(() => {
    return allAgentSlips.map(s => {
      const saleAmount = s.amount || 0;
      const ag = agentMap.get(s.agentName) || agentMap.get(s.agentId);
      const comRate = ag?.commission ?? 0;
      const comAmt = saleAmount * (comRate / 100);

      const lAmount = luckyNo
        ? getTokenItemsForSlip(s, luckyNo)
            .filter(item => item.isWinner)
            .reduce((sum, item) => sum + item.amount, 0)
        : 0;

      const rate = ag?.rate || activeSession?.rate || 80;
      const winPayout = lAmount * rate;
      const comPlusL = comAmt + winPayout;
      const balanceTotal = saleAmount - comPlusL;

      return {
        srNo: s.srNo,
        agentName: s.agentName,
        saleAmount,
        comRate,
        comAmt,
        lAmount,
        rate,
        winPayout,
        comPlusL,
        balanceTotal,
      };
    }).sort((a, b) => (a.srNo || 0) - (b.srNo || 0));
  }, [allAgentSlips, agentMap, luckyNo, activeSession]);

  const allAgentTotals = useMemo(() => {
    return allAgentRows.reduce(
      (acc, r) => ({
        saleAmount: acc.saleAmount + r.saleAmount,
        comAmt: acc.comAmt + r.comAmt,
        lAmount: acc.lAmount + r.lAmount,
        winPayout: acc.winPayout + r.winPayout,
        comPlusL: acc.comPlusL + r.comPlusL,
        balanceTotal: acc.balanceTotal + r.balanceTotal,
      }),
      { saleAmount: 0, comAmt: 0, lAmount: 0, winPayout: 0, comPlusL: 0, balanceTotal: 0 }
    );
  }, [allAgentRows]);

  // --- Export builders ---
  function exportAgentCsv() {
    if (!selectedAgent || sortedAgentSlips.length === 0) return;
    const rows = [[`Customer Name : ${selectedAgent.agentName}`, dateLabel]];
    for (const slip of sortedAgentSlips) {
      const when = new Date(slip.createdAt).toLocaleString();
      rows.push([`Accept SrNo# : ${slip.srNo}`, when]);
      rows.push(['Num#', 'Amount']);
      const tokenItems = getTokenItemsForSlip(slip, luckyNo);
      for (const t of tokenItems) {
        rows.push([t.isWinner ? `${t.tokText} (WIN)` : t.tokText, t.amount]);
      }
      rows.push(['Subtotal', slip.amount]);
      rows.push([]);
    }
    rows.push(['Grand Total Amount', agentGrandTotal]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'csv'));
  }

  function buildAgentPdfBlob() {
    const sections = sortedAgentSlips.map(slip => {
      const tokenItems = getTokenItemsForSlip(slip, luckyNo);
      return {
        heading: `Accept SrNo# : ${slip.srNo}   ${new Date(slip.createdAt).toLocaleString()}`,
        head: [['Num#', 'Amount']],
        rows: [
          ...tokenItems.map(t => [t.isWinner ? `${t.tokText} (WIN)` : t.tokText, t.amount.toLocaleString()]),
          ['Subtotal', slip.amount.toLocaleString()],
        ],
      };
    });

    sections.push({
      head: [['Grand Total Amount']],
      rows: [[agentGrandTotal.toLocaleString()]],
    });

    return buildReportPdf({
      title: `Customer Name : ${selectedAgent?.agentName || ''}`,
      subtitle: sessionLabel,
      sections,
    });
  }

  function exportAgentPdf() {
    if (!selectedAgent || sortedAgentSlips.length === 0) return;
    downloadBlob(buildAgentPdfBlob(), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'pdf'));
  }

  function shareAgentPdf() {
    if (!selectedAgent || sortedAgentSlips.length === 0) return;
    shareOrDownload(buildAgentPdfBlob(), reportFileName(`agent-${selectedAgent.agentName}`, dateLabel, 'pdf'), t, setStatusMsg);
  }

  function exportSummaryCsv() {
    if (summaryByAgent.length === 0) return;
    const rows = [[t('reports.agentCol'), t('reports.srNoCol'), t('reports.amountCol')]];
    for (const group of summaryByAgent) {
      const sorted = [...group.slips].sort((a, b) => (Number(a.srNo) || 0) - (Number(b.srNo) || 0));
      for (const s of sorted) rows.push([group.agentName, s.srNo, s.amount]);
      rows.push([group.agentName, t('reports.subtotalLabel'), group.subtotal]);
    }
    rows.push(['', t('reports.grandTotalLabel'), summaryGrandTotal]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName('summary', dateLabel, 'csv'));
  }

  function buildSummaryPdfBlob() {
    const sections = summaryByAgent.map(group => {
      const sorted = [...group.slips].sort((a, b) => (Number(a.srNo) || 0) - (Number(b.srNo) || 0));
      return {
        heading: group.agentName,
        head: [[PDF_EN.srNo, PDF_EN.amount]],
        rows: [
          ...sorted.map(s => [s.srNo, s.amount.toLocaleString()]),
          [PDF_EN.subtotal, group.subtotal.toLocaleString()],
        ],
      };
    });
    sections.push({ head: [[PDF_EN.grandTotal]], rows: [[summaryGrandTotal.toLocaleString()]] });
    return buildReportPdf({ title: PDF_EN.summaryReport, subtitle: sessionLabel, sections });
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
      title: PDF_EN.payoutReport,
      subtitle: `${sessionLabel} — ${PDF_EN.luckyNumber}: ${payoutData.luckyNo}`,
      sections: [
        {
          head: [[PDF_EN.totalBet, PDF_EN.totalPayout, PDF_EN.profit]],
          rows: [[payoutData.totalBet.toLocaleString(), payoutData.totalPayout.toLocaleString(), payoutData.profit.toLocaleString()]],
        },
        {
          heading: PDF_EN.perAgent,
          head: [[PDF_EN.agent, PDF_EN.totalBet, PDF_EN.winnerBet, PDF_EN.payout, PDF_EN.net]],
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

  function exportAllAgentCsv() {
    if (allAgentRows.length === 0) return;
    const rows = [[
      t('reports.srNoCol'),
      t('reports.agentCol'),
      t('reports.saleAmountCol'),
      t('reports.comRateCol'),
      t('reports.comAmtCol'),
      t('reports.lAmountCol'),
      '*',
      t('reports.rateCol'),
      '=',
      t('reports.winPayoutCol'),
      t('reports.comPlusLCol'),
      t('reports.balanceTotalCol'),
    ]];
    for (const r of allAgentRows) {
      rows.push([
        r.srNo,
        r.agentName,
        fmt2(r.saleAmount),
        r.comRate,
        fmt2(r.comAmt),
        r.lAmount,
        '*',
        r.rate,
        '=',
        fmt2(r.winPayout),
        fmt2(r.comPlusL),
        fmt2(r.balanceTotal),
      ]);
    }
    rows.push([
      t('common.total'),
      '',
      fmt2(allAgentTotals.saleAmount),
      '',
      fmt2(allAgentTotals.comAmt),
      allAgentTotals.lAmount,
      '',
      '',
      '',
      fmt2(allAgentTotals.winPayout),
      fmt2(allAgentTotals.comPlusL),
      fmt2(allAgentTotals.balanceTotal),
    ]);
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName('all-agent', dateLabel, 'csv'));
  }

  function buildAllAgentPdfBlob() {
    const head = [[
      PDF_EN.srNo,
      PDF_EN.agent,
      PDF_EN.saleAmount,
      PDF_EN.comRate,
      PDF_EN.comAmt,
      PDF_EN.lAmount,
      '*',
      PDF_EN.rate,
      '=',
      PDF_EN.winPayout,
      PDF_EN.comPlusL,
      PDF_EN.balanceTotal,
    ]];

    const bodyRows = allAgentRows.map(r => [
      String(r.srNo),
      r.agentName,
      fmt2(r.saleAmount),
      String(r.comRate),
      fmt2(r.comAmt),
      String(r.lAmount),
      '*',
      String(r.rate),
      '=',
      fmt2(r.winPayout),
      fmt2(r.comPlusL),
      fmt2(r.balanceTotal),
    ]);

    bodyRows.push([
      PDF_EN.total,
      '',
      fmt2(allAgentTotals.saleAmount),
      '',
      fmt2(allAgentTotals.comAmt),
      String(allAgentTotals.lAmount),
      '',
      '',
      '',
      fmt2(allAgentTotals.winPayout),
      fmt2(allAgentTotals.comPlusL),
      fmt2(allAgentTotals.balanceTotal),
    ]);

    return buildReportPdf({
      title: PDF_EN.allAgentReport,
      subtitle: `Date : ${dateLabel}${sessionLabel ? ` · ${sessionLabel}` : ''}`,
      sections: [{ head, rows: bodyRows }],
      orientation: 'landscape',
    });
  }

  function exportAllAgentPdf() {
    if (allAgentRows.length === 0) return;
    downloadBlob(buildAllAgentPdfBlob(), reportFileName('all-agent', dateLabel, 'pdf'));
  }

  function shareAllAgentPdf() {
    if (allAgentRows.length === 0) return;
    shareOrDownload(buildAllAgentPdfBlob(), reportFileName('all-agent', dateLabel, 'pdf'), t, setStatusMsg);
  }

  const isSaleModal = tab === 'agent' || tab === 'summary' || initialTab === 'agent' || initialTab === 'summary';
  const TABS = [
    { key: 'payout', label: t('reports.tabPayout') },
    ...(isSaleModal ? [] : [{ key: 'allAgent', label: t('reports.tabAllAgent') }]),
  ];

  return (
    <div
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-xl shadow-2xl max-w-6xl w-full max-h-[90vh] flex flex-col overflow-hidden border border-gray-200"
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
            <div className="space-y-5">
              {/* Agent Selection Header & Quick Agent Pills */}
              <div className="bg-slate-50 border border-slate-200 rounded-xl p-4 shadow-sm space-y-3">
                <div className="flex flex-wrap items-center justify-between gap-3">
                  <div className="flex items-center gap-3 flex-1 min-w-[260px]">
                    <label className="text-xs font-bold uppercase tracking-wider text-slate-500 whitespace-nowrap">
                      👤 Select Agent:
                    </label>
                    <select
                      value={selectedAgentId}
                      onChange={e => setSelectedAgentId(e.target.value)}
                      className="flex-1 max-w-md px-3.5 py-2 text-sm font-semibold border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white text-slate-800 shadow-sm transition"
                    >
                      <option value="">-- {t('ledger.selectAgentPlaceholder')} --</option>
                      {agents.map(a => (
                        <option key={a.id} value={a.id}>{a.agentName}</option>
                      ))}
                    </select>
                  </div>

                  {selectedAgent && agentSlips.length > 0 && (
                    <div className="flex items-center gap-2">
                      <button
                        type="button"
                        onClick={exportAgentCsv}
                        className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-100 shadow-sm transition"
                      >
                        📥 {t('ledger.exportCsv')}
                      </button>
                      <button
                        type="button"
                        onClick={exportAgentPdf}
                        className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-indigo-700 bg-indigo-50 border border-indigo-200 rounded-lg hover:bg-indigo-100 shadow-sm transition"
                      >
                        📄 {t('reports.exportPdf')}
                      </button>
                      <button
                        type="button"
                        onClick={shareAgentPdf}
                        className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-white bg-indigo-600 rounded-lg hover:bg-indigo-700 shadow transition"
                      >
                        💬 {t('ledger.shareMessage')}
                      </button>
                    </div>
                  )}
                </div>

                {/* Quick Agent Selection Pills */}
                {agents.length > 0 && (
                  <div className="flex items-center gap-1.5 overflow-x-auto pt-1 pb-0.5">
                    <span className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider shrink-0 mr-1">Quick:</span>
                    {agents.slice(0, 10).map(a => (
                      <button
                        key={a.id}
                        type="button"
                        onClick={() => setSelectedAgentId(a.id)}
                        className={`px-2.5 py-1 text-xs font-medium rounded-full transition whitespace-nowrap ${
                          selectedAgentId === a.id
                            ? 'bg-indigo-600 text-white font-semibold shadow-sm'
                            : 'bg-white text-slate-600 border border-slate-200 hover:bg-slate-100'
                        }`}
                      >
                        {a.agentName}
                      </button>
                    ))}
                  </div>
                )}
              </div>

              {!selectedAgent ? (
                <div className="text-center py-16 bg-slate-50 border border-dashed border-slate-300 rounded-xl">
                  <span className="text-4xl">👤</span>
                  <p className="mt-2 text-sm font-semibold text-slate-600">{t('reports.selectAgentPrompt')}</p>
                </div>
              ) : agentLoading ? (
                <div className="text-center py-16">
                  <div className="inline-block animate-spin rounded-full h-8 w-8 border-4 border-indigo-500 border-t-transparent"></div>
                  <p className="mt-2 text-xs font-medium text-slate-400">{t('common.loading')}</p>
                </div>
              ) : sortedAgentSlips.length === 0 ? (
                <div className="text-center py-16 bg-slate-50 border border-dashed border-slate-300 rounded-xl">
                  <span className="text-4xl">📄</span>
                  <p className="mt-2 text-sm font-semibold text-slate-600">{t('reports.noVouchers')}</p>
                </div>
              ) : (
                <div className="space-y-6">
                  {/* Summary Dashboard Cards for Selected Agent */}
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                    <div className="bg-white border border-slate-200 rounded-xl p-3.5 shadow-sm">
                      <p className="text-xs font-semibold text-slate-500 uppercase tracking-wider">Total Vouchers</p>
                      <p className="text-xl font-bold text-slate-900 mt-1">{sortedAgentSlips.length}</p>
                    </div>
                    <div className="bg-indigo-50/50 border border-indigo-100 rounded-xl p-3.5 shadow-sm">
                      <p className="text-xs font-semibold text-indigo-600 uppercase tracking-wider">Total Sales</p>
                      <p className="text-xl font-bold text-indigo-950 mt-1">{agentGrandTotal.toLocaleString()} <span className="text-xs text-indigo-500 font-normal">MMK</span></p>
                    </div>
                    <div className="bg-amber-50/50 border border-amber-100 rounded-xl p-3.5 shadow-sm">
                      <p className="text-xs font-semibold text-amber-700 uppercase tracking-wider">Commission ({selectedAgent?.commission ?? 0}%)</p>
                      <p className="text-xl font-bold text-amber-950 mt-1">
                        {(agentGrandTotal * ((selectedAgent?.commission ?? 0) / 100)).toLocaleString()} <span className="text-xs text-amber-600 font-normal">MMK</span>
                      </p>
                    </div>
                    <div className="bg-emerald-50/50 border border-emerald-100 rounded-xl p-3.5 shadow-sm">
                      <p className="text-xs font-semibold text-emerald-700 uppercase tracking-wider">Lucky Number</p>
                      <p className="text-xl font-bold text-emerald-950 mt-1">
                        {luckyNo ? (
                          <span className="inline-flex items-center gap-1 bg-emerald-600 text-white px-2 py-0.5 rounded text-base font-mono">
                            🎯 {luckyNo}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-400 font-normal italic">Not Set</span>
                        )}
                      </p>
                    </div>
                  </div>

                  {/* Printable Thermal Receipt Container */}
                  <div className="max-w-2xl mx-auto bg-white p-6 rounded-xl border border-slate-300 shadow-md font-mono text-sm space-y-6">
                    {/* Customer Header Banner */}
                    <div className="flex flex-wrap justify-between items-center pb-3 border-b-2 border-slate-900 gap-2">
                      <div>
                        <span className="text-xs text-slate-500 font-sans font-semibold uppercase tracking-wider block">Customer / Agent:</span>
                        <span className="font-extrabold text-slate-900 text-lg">{selectedAgent.agentName}</span>
                      </div>
                      <div className="text-right">
                        <span className="text-xs text-slate-500 font-sans font-semibold uppercase tracking-wider block">Date:</span>
                        <span className="font-bold text-slate-800">{dateLabel}</span>
                      </div>
                    </div>

                    {/* Vouchers List */}
                    <div className="space-y-6">
                      {sortedAgentSlips.map(slip => {
                        const tokenItems = getTokenItemsForSlip(slip, luckyNo);
                        const hasWinner = tokenItems.some(i => i.isWinner);
                        return (
                          <div
                            key={slip.id}
                            className={`rounded-lg p-3 border transition ${
                              hasWinner ? 'bg-amber-50/30 border-amber-300 shadow-sm' : 'bg-slate-50/50 border-slate-200'
                            }`}
                          >
                            {/* Accept SrNo Header */}
                            <div className="flex items-center justify-between text-xs pb-2 border-b border-slate-200 mb-2">
                              <div className="flex items-center gap-2">
                                <span className="bg-slate-800 text-white font-bold px-2 py-0.5 rounded text-xs">
                                  SrNo# {slip.srNo}
                                </span>
                                {hasWinner && (
                                  <span className="bg-red-600 text-white font-bold px-1.5 py-0.5 rounded text-[10px] uppercase tracking-wider animate-pulse">
                                    🏆 WINNER
                                  </span>
                                )}
                              </div>
                              <div className="text-slate-500 font-sans text-[11px]">
                                {new Date(slip.createdAt).toLocaleDateString()} · {new Date(slip.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                              </div>
                            </div>

                            {/* Token Table */}
                            <table className="w-full text-sm">
                              <thead>
                                <tr className="border-b border-slate-300 text-xs text-slate-600 font-bold uppercase tracking-wider">
                                  <th className="text-left py-1">Num#</th>
                                  <th className="text-right py-1">Amount</th>
                                </tr>
                              </thead>
                              <tbody className="divide-y divide-slate-100">
                                {tokenItems.map((item, idx) => (
                                  <tr key={idx} className={item.isWinner ? 'bg-amber-100/70 font-black text-red-700' : ''}>
                                    <td className="py-1.5 font-bold flex items-center gap-1.5">
                                      {item.tokText}
                                      {item.isWinner && <span className="text-xs">🏆</span>}
                                    </td>
                                    <td className="py-1.5 text-right font-bold">
                                      {item.amount.toLocaleString()}
                                    </td>
                                  </tr>
                                ))}
                              </tbody>
                            </table>

                            {/* Subtotal */}
                            <div className="flex justify-between items-center text-xs font-extrabold pt-2 mt-1 border-t border-slate-300 text-slate-900">
                              <span className="font-sans text-slate-500">Subtotal:</span>
                              <span className="text-sm font-bold">{slip.amount.toLocaleString()} MMK</span>
                            </div>
                          </div>
                        );
                      })}
                    </div>

                    {/* Grand Total Box */}
                    <div className="border-2 border-slate-900 rounded-lg p-4 bg-slate-900 text-white space-y-2">
                      <div className="flex justify-between items-center text-base font-extrabold">
                        <span>GRAND TOTAL AMOUNT:</span>
                        <span className="text-xl text-amber-400 font-mono">{agentGrandTotal.toLocaleString()} MMK</span>
                      </div>
                      <div className="flex justify-between items-center text-xs text-slate-300 pt-2 border-t border-slate-700 font-sans">
                        <span>Commission ({selectedAgent?.commission ?? 0}%):</span>
                        <span className="font-mono text-slate-200">
                          - {(agentGrandTotal * ((selectedAgent?.commission ?? 0) / 100)).toLocaleString()} MMK
                        </span>
                      </div>
                    </div>
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
                          {[...group.slips].sort((a, b) => (parseInt(String(a?.srNo ?? '').replace(/[^0-9]/g, ''), 10) || 0) - (parseInt(String(b?.srNo ?? '').replace(/[^0-9]/g, ''), 10) || 0)).map(s => (
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

          {tab === 'allAgent' && (
            <div>
              <div className="flex items-center justify-between gap-2 mb-4">
                <div className="text-sm font-semibold text-gray-700">
                  Date : {dateLabel}
                </div>
                {allAgentRows.length > 0 && (
                  <div className="flex items-center gap-2 ml-auto">
                    <button type="button" onClick={exportAllAgentCsv} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('ledger.exportCsv')}</button>
                    <button type="button" onClick={exportAllAgentPdf} className="text-xs text-gray-500 hover:text-gray-700 font-medium px-2 py-1 rounded hover:bg-gray-100 transition">{t('reports.exportPdf')}</button>
                    <button type="button" onClick={shareAllAgentPdf} className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition">{t('ledger.shareMessage')}</button>
                  </div>
                )}
              </div>

              {allAgentLoading ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('common.loading')}</p>
              ) : allAgentRows.length === 0 ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.noVouchers')}</p>
              ) : (
                <div className="border border-gray-200 rounded-lg overflow-x-auto">
                  <table className="w-full text-xs text-left border-collapse min-w-[750px]">
                    <thead>
                      <tr className="bg-gray-100 text-gray-800 font-semibold border-b border-gray-300">
                        <th className="px-2.5 py-2 border-r border-gray-200 text-center">{t('reports.srNoCol')}</th>
                        <th className="px-2.5 py-2 border-r border-gray-200">{t('reports.agentCol')}</th>
                        <th className="px-2.5 py-2 border-r border-gray-200 text-right">{t('reports.saleAmountCol')}</th>
                        <th className="px-2.5 py-2 border-r border-gray-200 text-center">{t('reports.comRateCol')}</th>
                        <th className="px-2.5 py-2 border-r border-gray-200 text-right">{t('reports.comAmtCol')}</th>
                        <th className="px-2 py-2 text-right">{t('reports.lAmountCol')}</th>
                        <th className="px-1 py-2 text-center text-gray-400 font-normal">*</th>
                        <th className="px-2 py-2 text-center">{t('reports.rateCol')}</th>
                        <th className="px-1 py-2 text-center text-gray-400 font-normal">=</th>
                        <th className="px-2.5 py-2 border-r border-gray-200 text-right">{t('reports.winPayoutCol')}</th>
                        <th className="px-2.5 py-2 border-r border-gray-200 text-right">{t('reports.comPlusLCol')}</th>
                        <th className="px-2.5 py-2 text-right">{t('reports.balanceTotalCol')}</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-200 bg-white font-mono">
                      {allAgentRows.map((r, i) => (
                        <tr key={i} className="hover:bg-gray-50 transition">
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-center">{r.srNo}</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 font-sans font-medium text-gray-800">{r.agentName}</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-right">{fmt2(r.saleAmount)}</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-center font-sans">{r.comRate}</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-right">{fmt2(r.comAmt)}</td>
                          <td className="px-2 py-1.5 text-right">{r.lAmount}</td>
                          <td className="px-1 py-1.5 text-center text-gray-400 font-sans">*</td>
                          <td className="px-2 py-1.5 text-center font-sans">{r.rate}</td>
                          <td className="px-1 py-1.5 text-center text-gray-400 font-sans">=</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-right">{fmt2(r.winPayout)}</td>
                          <td className="px-2.5 py-1.5 border-r border-gray-200 text-right">{fmt2(r.comPlusL)}</td>
                          <td className={`px-2.5 py-1.5 text-right font-bold ${r.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                            {fmt2(r.balanceTotal)}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                    <tfoot>
                      <tr className="bg-gray-100 font-bold text-gray-800 border-t-2 border-gray-300">
                        <td colSpan={2} className="px-2.5 py-2 border-r border-gray-200 text-center font-sans">{t('common.total')}</td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(allAgentTotals.saleAmount)}</td>
                        <td className="px-2.5 py-2 border-r border-gray-200"></td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(allAgentTotals.comAmt)}</td>
                        <td className="px-2 py-2 text-right font-mono">{allAgentTotals.lAmount}</td>
                        <td className="px-1 py-2"></td>
                        <td className="px-2 py-2"></td>
                        <td className="px-1 py-2"></td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(allAgentTotals.winPayout)}</td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(allAgentTotals.comPlusL)}</td>
                        <td className={`px-2.5 py-2 text-right font-mono ${allAgentTotals.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                          {fmt2(allAgentTotals.balanceTotal)}
                        </td>
                      </tr>
                    </tfoot>
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
