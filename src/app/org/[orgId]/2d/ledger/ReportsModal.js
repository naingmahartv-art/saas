'use client';
import React, { useState, useEffect, useCallback, useMemo, Fragment } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';
import { getLocalVouchers, getOfflineMode } from '@/lib/ledger/localVoucherDb.js';

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
      const matchingEntries = (luckyNo && entries)
        ? entries.filter(e => String(e.num).padStart(2, '0') === String(luckyNo).padStart(2, '0'))
        : [];
      const winAmount = matchingEntries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0);
      const isWinner = winAmount > 0;
      return { tokText, amount, winAmount, isWinner };
    });
  }
  if (slip.details && slip.details.length > 0) {
    return slip.details.map(d => {
      const num = String(d.num1).padStart(2, '0');
      const isWinner = Boolean(luckyNo && num === String(luckyNo).padStart(2, '0'));
      const val = parseFloat(d.value) || 0;
      const winAmount = isWinner ? val : 0;
      return { tokText: num, amount: val, winAmount, isWinner };
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

export default function ReportsModal({ orgId, activeSession, agents, onClose, initialTab = 'allAgent', isBuyPage = false }) {
  const { t } = useI18n();
  const [tab, setTab] = useState(() => initialTab);
  const [statusMsg, setStatusMsg] = useState('');

  const dateLabel = useMemo(() => {
    const raw = activeSession?.onDate || new Date().toISOString().slice(0, 10);
    const parts = raw.split('-');
    if (parts.length === 3) {
      const year = parts[0];
      const month = parseInt(parts[1], 10);
      const day = parseInt(parts[2], 10);
      return `${month}/${day}/${year}`;
    }
    return raw;
  }, [activeSession]);

  const sessionLabel = activeSession
    ? `${t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`)} · ${activeSession.onDate}`
    : '';

  // --- Report by Agent ---
  const [selectedAgentId, setSelectedAgentId] = useState(() => (isBuyPage ? (agents[0]?.id || 'buy_offload') : (agents[0]?.id || '')));
  const [agentSlips, setAgentSlips] = useState([]);
  const [agentLoading, setAgentLoading] = useState(false);

  const selectedAgent = useMemo(() => {
    if (!selectedAgentId) return null;
    if (selectedAgentId === 'buy_offload') {
      return { id: 'buy_offload', agentName: 'Buy Offload (အဝယ်စာရင်း)', commission: 0 };
    }
    return agents.find(a => a.id === selectedAgentId) || { id: selectedAgentId, agentName: selectedAgentId, commission: 0 };
  }, [selectedAgentId, agents]);

  const selectedAgentCommission = useMemo(() => {
    if (!selectedAgent) return 0;
    const sComms = activeSession?.agentCommissions || {};
    if (sComms[selectedAgent.id] !== undefined && sComms[selectedAgent.id] !== null && sComms[selectedAgent.id] !== '') {
      return parseFloat(sComms[selectedAgent.id]);
    }
    return selectedAgent.commission ?? 0;
  }, [selectedAgent, activeSession]);

  const loadLocalAgentReport = useCallback(async (ag) => {
    try {
      const vType = isBuyPage ? 'buy' : 'sale';
      const all = await getLocalVouchers(orgId, { voucherType: vType });
      const targetDate = activeSession?.onDate;
      const targetAmpm = activeSession?.ampm;
      const targetOnCount = activeSession?.onCount;

      const filtered = all
        .filter(v => {
          if (targetDate && v.onDate && v.onDate !== targetDate) return false;
          if (targetAmpm && v.ampm && v.ampm !== targetAmpm) return false;
          if (targetOnCount && v.onCount && v.onCount !== targetOnCount) return false;
          if (ag.id === 'buy_offload') return v.isBuyVoucher === true || v.agentId === 'buy_offload';
          return v.agentId === ag.id || v.agentName === ag.agentName || v.agentId === ag.agentName;
        })
        .map(v => ({
          id: v.id,
          srNo: v.srNo ?? (v.status === 'pending' ? 'Pending' : '-'),
          agentId: v.agentId,
          agentName: v.agentName || (isBuyPage ? 'Buy Offload' : ag.agentName || v.agentId),
          tokens: v.tokens || [],
          details: v.entries || v.items || [],
          amount: v.amount || 0,
          createdAt: v.createdAt,
          onDate: v.onDate,
          ampm: v.ampm,
          onCount: v.onCount,
        }));
      setAgentSlips(filtered);
    } catch {
      setAgentSlips([]);
    }
  }, [orgId, isBuyPage, activeSession]);

  const loadAgentReport = useCallback(async (ag) => {
    if (!ag) { setAgentSlips([]); return; }
    setAgentLoading(true);

    if (getOfflineMode(orgId)) {
      await loadLocalAgentReport(ag);
      setAgentLoading(false);
      return;
    }

    try {
      let url = `/api/org/${orgId}/ledger?isBuy=${isBuyPage ? 'true' : 'false'}`;
      if (ag.id === 'buy_offload') {
        url += `&agentName=${encodeURIComponent('Buy Offload (အဝယ်စာရင်း)')}`;
      } else if (ag.agentName) {
        url += `&agentName=${encodeURIComponent(ag.agentName)}`;
      } else if (ag.id) {
        url += `&agentId=${encodeURIComponent(ag.id)}`;
      }
      const res = await fetch(url);
      const data = await res.json();
      if (!res.ok) {
        await loadLocalAgentReport(ag);
        return;
      }
      setAgentSlips(data.slips || []);
    } catch {
      await loadLocalAgentReport(ag);
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
  }, [orgId, activeSession, isBuyPage, loadLocalAgentReport]);

  useEffect(() => {
    if (tab === 'agent' && selectedAgent) {
      loadAgentReport(selectedAgent);
    }
  }, [tab, selectedAgent, loadAgentReport]);

  const sortedAgentSlips = useMemo(
    () => [...agentSlips].sort((a, b) => (a.srNo || a.createdAt || 0) - (b.srNo || b.createdAt || 0)),
    [agentSlips]
  );

  const agentGrandTotal = useMemo(
    () => sortedAgentSlips.reduce((sum, s) => sum + (s.amount || 0), 0),
    [sortedAgentSlips]
  );

  const agentTotalBet = useMemo(
    () => sortedAgentSlips.reduce((sum, s) => sum + (s.amount || 0), 0),
    [sortedAgentSlips]
  );

  const agentNetWinLoss = useMemo(() => {
    if (isBuyPage) return null;
    const commAmt = Math.round((agentTotalBet * selectedAgentCommission) / 100);
    const winAmt = 0; // calculated in payout view if lucky number is set
    return {
      bet: agentTotalBet,
      comm: commAmt,
      net: agentTotalBet - commAmt - winAmt,
    };
  }, [isBuyPage, agentTotalBet, selectedAgentCommission]);

  // --- Summary Report ---
  const [summarySlips, setSummarySlips] = useState([]);
  const [summaryLoading, setSummaryLoading] = useState(false);

  const loadLocalSummary = useCallback(async () => {
    try {
      const vType = isBuyPage ? 'buy' : 'sale';
      const all = await getLocalVouchers(orgId, { voucherType: vType });
      const targetDate = activeSession?.onDate;
      const targetAmpm = activeSession?.ampm;
      const targetOnCount = activeSession?.onCount;

      const filtered = all
        .filter(v => {
          if (targetDate && v.onDate && v.onDate !== targetDate) return false;
          if (targetAmpm && v.ampm && v.ampm !== targetAmpm) return false;
          if (targetOnCount && v.onCount && v.onCount !== targetOnCount) return false;
          return true;
        })
        .map(v => ({
          id: v.id,
          srNo: v.srNo ?? (v.status === 'pending' ? 'Pending' : '-'),
          agentId: v.agentId,
          agentName: v.agentName || (isBuyPage ? 'Buy Offload' : v.agentId),
          tokens: v.tokens || [],
          details: v.entries || v.items || [],
          amount: v.amount || 0,
          createdAt: v.createdAt,
          onDate: v.onDate,
          ampm: v.ampm,
          onCount: v.onCount,
        }));
      setSummarySlips(filtered);
    } catch {
      setSummarySlips([]);
    }
  }, [orgId, isBuyPage, activeSession]);

  const loadSummary = useCallback(async () => {
    setSummaryLoading(true);
    if (getOfflineMode(orgId)) {
      await loadLocalSummary();
      setSummaryLoading(false);
      return;
    }
    try {
      const buyFilter = isBuyPage ? '?sort=asc&isBuy=true' : '?sort=asc&isBuy=false';
      const res = await fetch(`/api/org/${orgId}/ledger${buyFilter}`);
      const data = await res.json();
      if (!res.ok) {
        await loadLocalSummary();
        return;
      }
      setSummarySlips(data.slips || []);
    } catch {
      await loadLocalSummary();
    } finally {
      setSummaryLoading(false);
    }
  }, [orgId, isBuyPage, loadLocalSummary]);

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

  // --- All Agent Report (Sale & Buy Settlement) ---
  const [allAgentSlips, setAllAgentSlips] = useState([]);
  const [allAgentLoading, setAllAgentLoading] = useState(false);

  const loadLocalAllAgentData = useCallback(async () => {
    try {
      const all = await getLocalVouchers(orgId);
      const targetDate = activeSession?.onDate;
      const targetAmpm = activeSession?.ampm;
      const targetOnCount = activeSession?.onCount;

      const filtered = all
        .filter(v => {
          if (targetDate && v.onDate && v.onDate !== targetDate) return false;
          if (targetAmpm && v.ampm && v.ampm !== targetAmpm) return false;
          if (targetOnCount && v.onCount && v.onCount !== targetOnCount) return false;
          return true;
        })
        .map(v => ({
          id: v.id,
          srNo: v.srNo ?? (v.status === 'pending' ? 'Pending' : '-'),
          agentId: v.agentId,
          agentName: v.agentName || (v.voucherType === 'buy' || v.isBuyVoucher ? 'Buy Offload' : v.agentId),
          tokens: v.tokens || [],
          details: v.entries || v.items || [],
          amount: v.amount || 0,
          isBuyVoucher: v.voucherType === 'buy' || v.isBuyVoucher === true,
          voucherType: v.voucherType,
          createdAt: v.createdAt,
          onDate: v.onDate,
          ampm: v.ampm,
          onCount: v.onCount,
        }));
      setAllAgentSlips(filtered);
    } catch {
      setAllAgentSlips([]);
    }
  }, [orgId, activeSession]);

  const loadAllAgentData = useCallback(async () => {
    setAllAgentLoading(true);
    if (getOfflineMode(orgId)) {
      await loadLocalAllAgentData();
      setAllAgentLoading(false);
      return;
    }
    try {
      const res = await fetch(`/api/org/${orgId}/ledger?all=true`);
      const data = await res.json();
      if (!res.ok) {
        await loadLocalAllAgentData();
        return;
      }
      setAllAgentSlips(data.slips || []);
    } catch {
      await loadLocalAllAgentData();
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
  }, [orgId, activeSession, payoutData, loadLocalAllAgentData]);

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
      const isBuy = Boolean(s.isBuyVoucher || s.voucherType === 'buy' || s.agentId === 'buy_offload');
      const rawAmount = parseFloat(s.amount) || 0;
      const ag = agentMap.get(s.agentName) || agentMap.get(s.agentId);
      const sComms = activeSession?.agentCommissions || {};
      const comRate =
        ag && sComms[ag.id] !== undefined && sComms[ag.id] !== null && sComms[ag.id] !== ''
          ? parseFloat(sComms[ag.id])
          : (ag?.commission ?? (isBuy ? 16 : 0));
      const comAmt = rawAmount * (comRate / 100);

      const lAmount = luckyNo
        ? getTokenItemsForSlip(s, luckyNo)
            .filter(item => item.isWinner)
            .reduce((sum, item) => sum + item.winAmount, 0)
        : 0;

      const rate = ag?.rate || activeSession?.rate || 80;
      const winPayout = lAmount * rate;

      let displayAmount = rawAmount;
      let balanceTotal = 0;

      if (isBuy) {
        // Buy / Offload: Expense is negative (-rawAmount), Commission & Win Payout are recovered back (+ve)
        displayAmount = -rawAmount;
        balanceTotal = -rawAmount + comAmt + winPayout;
      } else {
        // Sales: Revenue is positive (+rawAmount), Commission & Win Payout are paid out (-ve)
        displayAmount = rawAmount;
        balanceTotal = rawAmount - (comAmt + winPayout);
      }

      const comPlusL = comAmt + winPayout;

      return {
        srNo: s.srNo,
        agentName: s.agentName || (isBuy ? 'Buy Offload' : 'Unknown'),
        isBuy,
        rawAmount,
        saleAmount: displayAmount,
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

  const summaryReportData = useMemo(() => {
    const saleMap = new Map();
    const buyMap = new Map();

    for (const r of allAgentRows) {
      const targetMap = r.isBuy ? buyMap : saleMap;
      const group = targetMap.get(r.agentName) || {
        agentName: r.agentName,
        isBuy: r.isBuy,
        rawAmount: 0,
        sAmount: 0,
        cRate: r.comRate,
        comAmt: 0,
        lAmount: 0,
        rate: r.rate,
        winPayout: 0,
        balanceTotal: 0,
      };

      group.rawAmount += r.rawAmount;
      group.sAmount += r.saleAmount; // Positive for Sale, Negative for Buy
      group.comAmt += r.comAmt;
      group.lAmount += r.lAmount;
      group.rate = r.rate;
      group.winPayout += r.winPayout;
      group.balanceTotal += r.balanceTotal;
      group.cRate = r.comRate;

      targetMap.set(r.agentName, group);
    }

    const saleRows = [...saleMap.values()].sort((a, b) => a.agentName.localeCompare(b.agentName));
    const buyRows = [...buyMap.values()].sort((a, b) => a.agentName.localeCompare(b.agentName));

    const saleTotals = saleRows.reduce(
      (acc, r) => ({
        sAmount: acc.sAmount + r.sAmount,
        lAmount: acc.lAmount + r.lAmount,
        balanceTotal: acc.balanceTotal + r.balanceTotal,
      }),
      { sAmount: 0, lAmount: 0, balanceTotal: 0 }
    );

    const buyTotals = buyRows.reduce(
      (acc, r) => ({
        sAmount: acc.sAmount + r.sAmount,
        lAmount: acc.lAmount + r.lAmount,
        balanceTotal: acc.balanceTotal + r.balanceTotal,
      }),
      { sAmount: 0, lAmount: 0, balanceTotal: 0 }
    );

    const grandTotals = {
      sAmount: saleTotals.sAmount + buyTotals.sAmount,
      lAmount: saleTotals.lAmount + buyTotals.lAmount,
      balanceTotal: saleTotals.balanceTotal + buyTotals.balanceTotal,
    };

    const allRows = [...saleRows, ...buyRows];

    return {
      rows: allRows,
      saleRows,
      saleTotals,
      buyRows,
      buyTotals,
      grandTotals,
    };
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
    if (!payoutData || !payoutData.luckyNo) return null;
    const sections = [
      {
        heading: `${PDF_EN.luckyNumber} : ${payoutData.luckyNo}`,
        head: [[PDF_EN.agent, PDF_EN.totalBet, PDF_EN.winnerBet, PDF_EN.payout, PDF_EN.net]],
        rows: payoutData.perAgent.map(a => [
          a.agentName,
          a.totalBet.toLocaleString(),
          a.winnerBet.toLocaleString(),
          a.payout.toLocaleString(),
          a.net.toLocaleString(),
        ]),
      },
      {
        head: [[PDF_EN.totalBet, PDF_EN.totalPayout, PDF_EN.profit]],
        rows: [[
          payoutData.totalBet.toLocaleString(),
          payoutData.totalPayout.toLocaleString(),
          payoutData.profit.toLocaleString(),
        ]],
      },
    ];
    return buildReportPdf({ title: PDF_EN.payoutReport, subtitle: sessionLabel, sections });
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
    const rows = [];
    rows.push([`Date : ${dateLabel}`]);
    rows.push(['Agent Name', 'S-Amount', 'C-Rate', 'L-Amount', 'Rate', 'Balance Total']);
    rows.push(['Sale Section (အရောင်းစာရင်း)']);
    for (const r of summaryReportData.saleRows) {
      rows.push([r.agentName, fmt2(r.sAmount), r.cRate || '', r.lAmount > 0 ? r.lAmount : '', r.rate || 80, fmt2(r.balanceTotal)]);
    }
    rows.push(['Sale Subtotal', fmt2(summaryReportData.saleTotals.sAmount), '', summaryReportData.saleTotals.lAmount > 0 ? summaryReportData.saleTotals.lAmount : '', '', fmt2(summaryReportData.saleTotals.balanceTotal)]);
    rows.push(['Buy Section (အဝယ်စာရင်း)']);
    for (const r of summaryReportData.buyRows) {
      rows.push([r.agentName, fmt2(r.sAmount), r.cRate || '', r.lAmount > 0 ? r.lAmount : '', r.rate || 80, fmt2(r.balanceTotal)]);
    }
    rows.push(['Buy Subtotal', fmt2(summaryReportData.buyTotals.sAmount), '', summaryReportData.buyTotals.lAmount > 0 ? summaryReportData.buyTotals.lAmount : '', '', fmt2(summaryReportData.buyTotals.balanceTotal)]);
    rows.push(['Grand Total', fmt2(summaryReportData.grandTotals.sAmount), '', summaryReportData.grandTotals.lAmount > 0 ? summaryReportData.grandTotals.lAmount : '', '', fmt2(summaryReportData.grandTotals.balanceTotal)]);

    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName('sales-buy-settlement-report', dateLabel, 'csv'));
  }

  function buildAllAgentPdfBlob() {
    const head = [['Agent Name', 'S-Amount', 'C-Rate', 'L-Amount', 'Rate', 'Balance Total']];
    const bodyRows = [];

    bodyRows.push(['Sale Section (အရောင်းစာရင်း)', '', '', '', '', '']);
    for (const r of summaryReportData.saleRows) {
      bodyRows.push([
        r.agentName,
        fmt2(r.sAmount),
        String(r.cRate || ''),
        r.lAmount > 0 ? String(r.lAmount) : '',
        String(r.rate || 80),
        fmt2(r.balanceTotal),
      ]);
    }
    bodyRows.push([
      'Sale Subtotal',
      fmt2(summaryReportData.saleTotals.sAmount),
      '',
      summaryReportData.saleTotals.lAmount > 0 ? String(summaryReportData.saleTotals.lAmount) : '',
      '',
      fmt2(summaryReportData.saleTotals.balanceTotal),
    ]);

    bodyRows.push(['Buy Section (အဝယ်စာရင်း)', '', '', '', '', '']);
    for (const r of summaryReportData.buyRows) {
      bodyRows.push([
        r.agentName,
        fmt2(r.sAmount),
        String(r.cRate || ''),
        r.lAmount > 0 ? String(r.lAmount) : '',
        String(r.rate || 80),
        fmt2(r.balanceTotal),
      ]);
    }
    bodyRows.push([
      'Buy Subtotal',
      fmt2(summaryReportData.buyTotals.sAmount),
      '',
      summaryReportData.buyTotals.lAmount > 0 ? String(summaryReportData.buyTotals.lAmount) : '',
      '',
      fmt2(summaryReportData.buyTotals.balanceTotal),
    ]);

    bodyRows.push([
      'Grand Total',
      fmt2(summaryReportData.grandTotals.sAmount),
      '',
      summaryReportData.grandTotals.lAmount > 0 ? String(summaryReportData.grandTotals.lAmount) : '0',
      '',
      fmt2(summaryReportData.grandTotals.balanceTotal),
    ]);

    return buildReportPdf({
      title: isBuyPage ? 'Buy Offload Settlement Report' : 'Sales & Settlement Report',
      subtitle: `Date : ${dateLabel}${sessionLabel ? ` · ${sessionLabel}` : ''}`,
      sections: [{ head, rows: bodyRows }],
      orientation: 'landscape',
    });
  }

  function exportAllAgentPdf() {
    downloadBlob(buildAllAgentPdfBlob(), reportFileName('sales-buy-report', dateLabel, 'pdf'));
  }

  function shareAllAgentPdf() {
    shareOrDownload(buildAllAgentPdfBlob(), reportFileName('sales-buy-report', dateLabel, 'pdf'), t, setStatusMsg);
  }

  const isSingleFormat = true;

  const TABS = useMemo(() => {
    if (initialTab === 'agent') {
      return [{ key: 'agent', label: isBuyPage ? 'Buy 1 (Format 1 - By Agent)' : 'Sale 1 (Format 1 - By Agent)' }];
    }
    if (initialTab === 'summary') {
      return [{ key: 'summary', label: isBuyPage ? 'Buy 2 (Format 2 - Summary)' : 'Sale 2 (Format 2 - Summary)' }];
    }
    return [{ key: 'allAgent', label: '📊 Sales & Buy Report' }];
  }, [initialTab, isBuyPage]);

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
          {isSingleFormat ? (
            <div className="flex items-center gap-2">
              <span className="text-base font-bold text-slate-900">
                {TABS[0]?.label}
              </span>
            </div>
          ) : (
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
          )}
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
                      {isBuyPage && <option value="buy_offload">Buy Offload (အဝယ်စာရင်း)</option>}
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
                <div className="flex flex-wrap items-center gap-2 pt-1 pb-0.5">
                  <span className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider shrink-0">Agents:</span>
                  {isBuyPage && (
                    <button
                      type="button"
                      onClick={() => {
                        setTab('agent');
                        setSelectedAgentId('buy_offload');
                      }}
                      className={`px-3 py-1 text-xs font-bold rounded-lg border transition shadow-xs flex items-center gap-1 cursor-pointer ${
                        selectedAgentId === 'buy_offload'
                          ? 'bg-purple-600 text-white border-purple-700 shadow-sm'
                          : 'bg-white text-slate-700 border-slate-200 hover:bg-slate-100'
                      }`}
                    >
                      📦 Buy Offload (အဝယ်စာရင်း)
                    </button>
                  )}
                  {agents.map((a) => (
                    <button
                      key={a.id}
                      type="button"
                      onClick={() => {
                        setTab('agent');
                        setSelectedAgentId(a.id);
                      }}
                      className={`px-2.5 py-1 text-xs font-medium rounded-full transition whitespace-nowrap cursor-pointer ${
                        selectedAgentId === a.id
                          ? 'bg-indigo-600 text-white font-semibold shadow-sm'
                          : 'bg-white text-slate-600 border border-slate-200 hover:bg-slate-100'
                      }`}
                    >
                      {a.agentName}
                    </button>
                  ))}
                </div>
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
                      <p className="text-xs font-semibold text-amber-700 uppercase tracking-wider">Commission ({selectedAgentCommission}%)</p>
                      <p className="text-xl font-bold text-amber-950 mt-1">
                        {(agentGrandTotal * (selectedAgentCommission / 100)).toLocaleString()} <span className="text-xs text-amber-600 font-normal">MMK</span>
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
                        <span>Commission ({selectedAgentCommission}%):</span>
                        <span className="font-mono text-slate-200">
                          - {(agentGrandTotal * (selectedAgentCommission / 100)).toLocaleString()} MMK
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
            <div className="space-y-4">
              <div className="flex items-center justify-between gap-2">
                <div className="text-sm font-bold text-slate-800 font-sans">
                  Date : <span className="font-mono">{dateLabel}</span>
                </div>
                {allAgentRows.length > 0 && (
                  <div className="flex items-center gap-2 ml-auto">
                    <button
                      type="button"
                      onClick={exportAllAgentCsv}
                      className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-100 shadow-sm transition"
                    >
                      📥 {t('ledger.exportCsv')}
                    </button>
                    <button
                      type="button"
                      onClick={exportAllAgentPdf}
                      className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-indigo-700 bg-indigo-50 border border-indigo-200 rounded-lg hover:bg-indigo-100 shadow-sm transition"
                    >
                      📄 {t('reports.exportPdf')}
                    </button>
                    <button
                      type="button"
                      onClick={shareAllAgentPdf}
                      className="inline-flex items-center gap-1 px-3 py-1.5 text-xs font-semibold text-white bg-indigo-600 rounded-lg hover:bg-indigo-700 shadow transition"
                    >
                      📤 {t('ledger.shareMessage')}
                    </button>
                  </div>
                )}
              </div>

              {allAgentLoading ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('common.loading')}</p>
              ) : allAgentRows.length === 0 ? (
                <p className="text-sm text-gray-400 text-center py-10">{t('reports.noVouchers')}</p>
              ) : (
                <div className="max-w-4xl mx-auto space-y-4 font-sans">
                  {/* Clean Simple Table Container */}
                  <div className="bg-white border border-slate-900 rounded-sm overflow-hidden">
                    <table className="w-full text-xs text-left border-collapse">
                      <thead>
                        <tr className="border-b border-slate-900 bg-slate-50 text-slate-900 font-bold text-xs">
                          <th className="px-4 py-2.5 border-r border-slate-300 text-left w-1/4">Agent Name</th>
                          <th className="px-4 py-2.5 border-r border-slate-300 text-right w-1/6">S-Amount</th>
                          <th className="px-3 py-2.5 border-r border-slate-300 text-center w-1/12">C-Rate</th>
                          <th className="px-4 py-2.5 border-r border-slate-300 text-right w-1/6">L-Amount</th>
                          <th className="px-3 py-3.5 border-r border-slate-300 text-center w-1/12">Rate</th>
                          <th className="px-4 py-2.5 text-right w-1/4">Balance Total</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-200 text-xs">
                        {/* --- UPPER SECTION: SALE SECTION (ta&mif; / အရောင်းစာရင်း) --- */}
                        <tr className="bg-slate-100/70 border-b border-slate-300">
                          <td colSpan={6} className="px-4 py-1.5 font-bold text-slate-800 text-xs">
                            အရောင်းစာရင်း
                          </td>
                        </tr>
                        {summaryReportData.saleRows.length === 0 ? (
                          <tr>
                            <td colSpan={6} className="py-4 text-center text-slate-400">
                              No sales records found
                            </td>
                          </tr>
                        ) : (
                          summaryReportData.saleRows.map((r, idx) => (
                            <tr key={`sale_${r.agentName}_${idx}`} className="hover:bg-slate-50 transition">
                              <td className="px-4 py-2 border-r border-slate-200 font-semibold text-slate-900">
                                {r.agentName}
                              </td>
                              <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-bold text-slate-900">
                                {fmt2(r.sAmount)}
                              </td>
                              <td className="px-3 py-2 border-r border-slate-200 text-center font-mono text-slate-700">
                                {r.cRate || ''}
                              </td>
                              <td className="px-4 py-2 border-r border-slate-200 text-right font-mono text-slate-800">
                                {r.lAmount > 0 ? fmt2(r.lAmount) : ''}
                              </td>
                              <td className="px-3 py-2 border-r border-slate-200 text-center font-mono text-slate-700">
                                {r.rate || 80}
                              </td>
                              <td className={`px-4 py-2 text-right font-mono font-bold ${r.balanceTotal < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                {fmt2(r.balanceTotal)}
                              </td>
                            </tr>
                          ))
                        )}

                        {/* SALE SUBTOTAL ROW */}
                        <tr className="bg-slate-50 font-bold border-t border-b border-slate-300 text-slate-900">
                          <td className="px-4 py-2 border-r border-slate-200"></td>
                          <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-black text-slate-900">
                            {fmt2(summaryReportData.saleTotals.sAmount)}
                          </td>
                          <td className="px-3 py-2 border-r border-slate-200 text-center"></td>
                          <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-black text-slate-900">
                            {summaryReportData.saleTotals.lAmount > 0 ? fmt2(summaryReportData.saleTotals.lAmount) : ''}
                          </td>
                          <td className="px-3 py-2 border-r border-slate-200 text-center"></td>
                          <td className={`px-4 py-2 text-right font-mono font-black ${summaryReportData.saleTotals.balanceTotal < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                            {fmt2(summaryReportData.saleTotals.balanceTotal)}
                          </td>
                        </tr>

                        {/* --- LOWER SECTION: BUY SECTION (t0,f / အဝယ်စာရင်း) --- */}
                        <tr className="bg-slate-100/70 border-b border-slate-300">
                          <td colSpan={6} className="px-4 py-1.5 font-bold text-slate-800 text-xs">
                            အဝယ်စာရင်း
                          </td>
                        </tr>
                        {summaryReportData.buyRows.length === 0 ? (
                          <tr>
                            <td colSpan={6} className="py-4 text-center text-slate-400">
                              No buy / offload records found
                            </td>
                          </tr>
                        ) : (
                          summaryReportData.buyRows.map((r, idx) => (
                            <tr key={`buy_${r.agentName}_${idx}`} className="hover:bg-slate-50 transition">
                              <td className="px-4 py-2 border-r border-slate-200 font-semibold text-slate-900">
                                {r.agentName}
                              </td>
                              <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-bold text-rose-600">
                                {fmt2(r.sAmount)}
                              </td>
                              <td className="px-3 py-2 border-r border-slate-200 text-center font-mono text-slate-700">
                                {r.cRate || ''}
                              </td>
                              <td className="px-4 py-2 border-r border-slate-200 text-right font-mono text-slate-800">
                                {r.lAmount > 0 ? fmt2(r.lAmount) : ''}
                              </td>
                              <td className="px-3 py-2 border-r border-slate-200 text-center font-mono text-slate-700">
                                {r.rate || 80}
                              </td>
                              <td className="px-4 py-2 text-right font-mono font-bold text-slate-900">
                                {fmt2(r.balanceTotal)}
                              </td>
                            </tr>
                          ))
                        )}

                        {/* BUY SUBTOTAL ROW */}
                        <tr className="bg-slate-50 font-bold border-t border-b border-slate-300 text-slate-900">
                          <td className="px-4 py-2 border-r border-slate-200"></td>
                          <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-black text-rose-600">
                            {fmt2(summaryReportData.buyTotals.sAmount)}
                          </td>
                          <td className="px-3 py-2 border-r border-slate-200 text-center"></td>
                          <td className="px-4 py-2 border-r border-slate-200 text-right font-mono font-black text-slate-900">
                            {summaryReportData.buyTotals.lAmount > 0 ? fmt2(summaryReportData.buyTotals.lAmount) : ''}
                          </td>
                          <td className="px-3 py-2 border-r border-slate-200 text-center"></td>
                          <td className="px-4 py-2 text-right font-mono font-black text-slate-900">
                            {fmt2(summaryReportData.buyTotals.balanceTotal)}
                          </td>
                        </tr>

                        {/* --- GRAND TOTAL ROW (AT BOTTOM WITH DOUBLE UNDERLINE) --- */}
                        <tr className="bg-white font-extrabold border-t-2 border-slate-900 text-sm">
                          <td className="px-4 py-3 border-r border-slate-200"></td>
                          <td className="px-4 py-3 border-r border-slate-200 text-right font-mono font-black text-base text-slate-900">
                            {fmt2(summaryReportData.grandTotals.sAmount)}
                          </td>
                          <td className="px-3 py-3 border-r border-slate-200 text-center"></td>
                          <td className="px-4 py-3 border-r border-slate-200 text-right font-mono font-black text-base text-slate-900">
                            {summaryReportData.grandTotals.lAmount > 0 ? fmt2(summaryReportData.grandTotals.lAmount) : '0'}
                          </td>
                          <td className="px-3 py-3 border-r border-slate-200 text-center"></td>
                          <td className="px-4 py-3 text-right">
                            <span className={`inline-block font-mono font-black text-base border-b-4 border-double pb-0.5 ${
                              summaryReportData.grandTotals.balanceTotal < 0
                                ? 'text-rose-600 border-rose-600'
                                : 'text-slate-900 border-slate-900'
                            }`}>
                              {fmt2(summaryReportData.grandTotals.balanceTotal)}
                            </span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
