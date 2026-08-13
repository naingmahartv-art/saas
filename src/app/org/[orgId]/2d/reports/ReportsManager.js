'use client';
import { useState, useEffect, useCallback, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';

function getTokenItemsForSlip(slip, luckyNo) {
  if (slip.tokens && slip.tokens.length > 0) {
    return slip.tokens.map((tokText) => {
      const { entries } = parseNumberExpression(tokText, { maxEntries: MAX_ENTRIES });
      const amount = entries ? entries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0) : 0;
      const isWinner = Boolean(
        luckyNo &&
          entries?.some((e) => String(e.num).padStart(2, '0') === String(luckyNo).padStart(2, '0'))
      );
      return { tokText, amount, isWinner };
    });
  }
  if (slip.details && slip.details.length > 0) {
    return slip.details.map((d) => {
      const num = String(d.num1).padStart(2, '0');
      const isWinner = Boolean(luckyNo && num === String(luckyNo).padStart(2, '0'));
      return { tokText: num, amount: d.value, isWinner };
    });
  }
  return [];
}

function csvEscape(value) {
  const s = String(value ?? '');
  return /[",\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
}

function toCsv(rows) {
  return rows.map((row) => row.map(csvEscape).join(',')).join('\n');
}

function downloadBlob(blob, filename) {
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

const fmt2 = (n) =>
  Number(n || 0).toLocaleString(undefined, { minimumFractionDigits: 0, maximumFractionDigits: 2 });

function getPredefinedDates(type) {
  const today = new Date();
  const todayStr = today.toISOString().slice(0, 10);

  if (type === 'weekly') {
    const d = new Date();
    d.setDate(d.getDate() - 6);
    return { from: d.toISOString().slice(0, 10), to: todayStr };
  } else if (type === 'monthly') {
    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
    return { from: firstDay.toISOString().slice(0, 10), to: todayStr };
  }
  return { from: todayStr, to: todayStr };
}

export default function ReportsManager({ orgId, initialAgents = [] }) {
  const { t } = useI18n();
  const [periodType, setPeriodType] = useState('weekly'); // 'weekly' | 'monthly' | 'custom'
  const [dates, setDates] = useState(() => getPredefinedDates('weekly'));
  const [selectedAgent, setSelectedAgent] = useState('');
  const [activeTab, setActiveTab] = useState('matrix'); // 'matrix' | 'byAgent' | 'details'

  const [loading, setLoading] = useState(false);
  const [reportSlips, setReportSlips] = useState([]);

  const agentMapLookup = useMemo(() => {
    const map = new Map();
    for (const a of initialAgents) {
      if (a.agentName) map.set(a.agentName, a);
      if (a.id) map.set(a.id, a);
    }
    return map;
  }, [initialAgents]);

  const loadReportData = useCallback(
    async (fromDate, toDate, agent) => {
      setLoading(true);
      try {
        let url = `/api/org/${orgId}/reports/range?startDate=${fromDate}&endDate=${toDate}`;
        if (agent) url += `&agentName=${encodeURIComponent(agent)}`;
        const res = await fetch(url);
        const data = await res.json();
        setReportSlips(data.slips || []);
      } catch {
        setReportSlips([]);
      } finally {
        setLoading(false);
      }
    },
    [orgId]
  );

  useEffect(() => {
    if (periodType !== 'custom') {
      const pDates = getPredefinedDates(periodType);
      setDates(pDates);
      loadReportData(pDates.from, pDates.to, selectedAgent);
    } else {
      loadReportData(dates.from, dates.to, selectedAgent);
    }
  }, [periodType, selectedAgent, loadReportData]);

  function handleCustomDateChange(field, val) {
    const next = { ...dates, [field]: val };
    setDates(next);
    loadReportData(next.from, next.to, selectedAgent);
  }

  // --- Processed Data ---
  const detailedRows = useMemo(() => {
    return reportSlips
      .map((s) => {
        const saleAmount = s.amount || 0;
        const ag = agentMapLookup.get(s.agentName) || agentMapLookup.get(s.agentId);
        const comRate = ag?.commission ?? 0;
        const comAmt = saleAmount * (comRate / 100);

        const lAmount = s.luckyNo
          ? getTokenItemsForSlip(s, s.luckyNo)
              .filter((item) => item.isWinner)
              .reduce((sum, item) => sum + item.amount, 0)
          : 0;

        const rate = ag?.rate || s.rate || 80;
        const winPayout = lAmount * rate;
        const comPlusL = comAmt + winPayout;
        const balanceTotal = saleAmount - comPlusL;

        return {
          id: s.id || `${s.srNo}_${s.createdAt}`,
          srNo: s.srNo,
          agentName: s.agentName,
          onDate: s.onDate,
          ampm: s.ampm,
          createdAt: s.createdAt,
          saleAmount,
          comRate,
          comAmt,
          lAmount,
          rate,
          winPayout,
          comPlusL,
          balanceTotal,
          details: getTokenItemsForSlip(s, s.luckyNo).map((item) => ({
            num1: item.tokText,
            value: item.amount,
          })),
        };
      })
      .sort((a, b) => (a.srNo || 0) - (b.srNo || 0));
  }, [reportSlips, agentMapLookup]);

  // --- Date Range Matrix Aggregation (12:00 and 04:00 sessions only, 09:00 removed) ---
  const matrixData = useMemo(() => {
    const agentMap = new Map();

    for (const r of detailedRows) {
      const agentName = r.agentName || 'Unknown';
      if (!agentMap.has(agentName)) {
        agentMap.set(agentName, new Map());
      }
      const dateMap = agentMap.get(agentName);

      const date = r.onDate || 'Unknown';
      if (!dateMap.has(date)) {
        dateMap.set(date, {
          date,
          m12: { amount: 0, lucky: 0, winPayout: 0, comAmt: 0, net: 0, hasData: false },
          m04: { amount: 0, lucky: 0, winPayout: 0, comAmt: 0, net: 0, hasData: false },
          totalNet: 0,
          type: 'S',
        });
      }

      const dayEntry = dateMap.get(date);
      const rawAmpm = String(r.ampm || '').toLowerCase();
      // Map 12:00 vs 04:00 (09:00 removed per request)
      const slot = rawAmpm.includes('12') || rawAmpm.includes('am') ? 'm12' : 'm04';

      dayEntry[slot].amount += r.saleAmount;
      dayEntry[slot].lucky += r.lAmount;
      dayEntry[slot].winPayout += r.winPayout;
      dayEntry[slot].comAmt += r.comAmt;
      dayEntry[slot].net += r.balanceTotal;
      dayEntry[slot].hasData = true;

      dayEntry.totalNet = dayEntry.m12.net + dayEntry.m04.net;
      dayEntry.type = dayEntry.totalNet < 0 ? 'P' : 'S';
    }

    const result = [];
    for (const [agentName, dateMap] of agentMap.entries()) {
      const datesList = [...dateMap.values()].sort((a, b) => a.date.localeCompare(b.date));
      const agentTotalNet = datesList.reduce((sum, d) => sum + d.totalNet, 0);
      const agentTotalSales = datesList.reduce((sum, d) => sum + d.m12.amount + d.m04.amount, 0);
      const agentTotalWinPayout = datesList.reduce((sum, d) => sum + d.m12.winPayout + d.m04.winPayout, 0);

      result.push({
        agentName,
        dates: datesList,
        agentTotalNet,
        agentTotalSales,
        agentTotalWinPayout,
      });
    }

    return result.sort((a, b) => a.agentName.localeCompare(b.agentName));
  }, [detailedRows]);

  const matrixGrandTotal = useMemo(
    () => matrixData.reduce((sum, a) => sum + a.agentTotalNet, 0),
    [matrixData]
  );

  const byAgentGroups = useMemo(() => {
    const map = new Map();
    for (const r of detailedRows) {
      const group = map.get(r.agentName) || {
        agentName: r.agentName,
        voucherCount: 0,
        saleAmount: 0,
        comAmt: 0,
        lAmount: 0,
        winPayout: 0,
        comPlusL: 0,
        balanceTotal: 0,
        slips: [],
      };
      group.voucherCount += 1;
      group.saleAmount += r.saleAmount;
      group.comAmt += r.comAmt;
      group.lAmount += r.lAmount;
      group.winPayout += r.winPayout;
      group.comPlusL += r.comPlusL;
      group.balanceTotal += r.balanceTotal;
      group.slips.push(r);
      map.set(r.agentName, group);
    }
    return [...map.values()].sort((a, b) => a.agentName.localeCompare(b.agentName));
  }, [detailedRows]);

  const totals = useMemo(() => {
    return detailedRows.reduce(
      (acc, r) => ({
        vouchers: acc.vouchers + 1,
        saleAmount: acc.saleAmount + r.saleAmount,
        comAmt: acc.comAmt + r.comAmt,
        lAmount: acc.lAmount + r.lAmount,
        winPayout: acc.winPayout + r.winPayout,
        comPlusL: acc.comPlusL + r.comPlusL,
        balanceTotal: acc.balanceTotal + r.balanceTotal,
      }),
      { vouchers: 0, saleAmount: 0, comAmt: 0, lAmount: 0, winPayout: 0, comPlusL: 0, balanceTotal: 0 }
    );
  }, [detailedRows]);

  // --- Exports ---
  function exportCsv(tabName) {
    let rows = [];
    if (tabName === 'matrix') {
      rows.push(['Date', 'Agent', '12:00 Amount', '12:00 Lucky', '12:00 Net', '04:00 Amount', '04:00 Lucky', '04:00 Net', 'Total Net', 'Type']);
      for (const ag of matrixData) {
        for (const d of ag.dates) {
          rows.push([
            d.date,
            ag.agentName,
            d.m12.hasData ? fmt2(d.m12.amount) : '',
            d.m12.hasData ? d.m12.lucky || '' : '',
            d.m12.hasData ? fmt2(d.m12.net) : '',
            d.m04.hasData ? fmt2(d.m04.amount) : '',
            d.m04.hasData ? d.m04.lucky || '' : '',
            d.m04.hasData ? fmt2(d.m04.net) : '',
            fmt2(d.totalNet),
            d.type,
          ]);
        }
        rows.push(['', `${ag.agentName} Total`, '', '', '', '', '', '', fmt2(ag.agentTotalNet), '']);
      }
      rows.push(['', 'Grand Total', '', '', '', '', '', '', fmt2(matrixGrandTotal), '']);
    } else if (tabName === 'byAgent') {
      rows.push(['AgentName', 'Vouchers', 'Sale Amount', 'Com Amt', 'L Amount', 'Win Payout', 'Com + L', 'Balance Total']);
      for (const g of byAgentGroups) {
        rows.push([g.agentName, g.voucherCount, fmt2(g.saleAmount), fmt2(g.comAmt), g.lAmount, fmt2(g.winPayout), fmt2(g.comPlusL), fmt2(g.balanceTotal)]);
      }
      rows.push(['Total', totals.vouchers, fmt2(totals.saleAmount), fmt2(totals.comAmt), totals.lAmount, fmt2(totals.winPayout), fmt2(totals.comPlusL), fmt2(totals.balanceTotal)]);
    } else {
      rows.push(['SrNo', 'AgentName', 'Sale Amount', 'Com Rate', 'Com Amt', 'L Amount', '*', 'Rate', '=', 'Win Payout', 'Com + L', 'Balance Total']);
      for (const r of detailedRows) {
        rows.push([r.srNo, r.agentName, fmt2(r.saleAmount), r.comRate, fmt2(r.comAmt), r.lAmount, '*', r.rate, '=', fmt2(r.winPayout), fmt2(r.comPlusL), fmt2(r.balanceTotal)]);
      }
    }

    const dateRangeLabel = `${dates.from}_to_${dates.to}`;
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName(`period-report-${tabName}`, dateRangeLabel, 'csv'));
  }

  function exportPdf(tabName) {
    let title = 'Period Date Range Report';
    let head = [];
    let bodyRows = [];

    if (tabName === 'matrix') {
      title = 'Period Matrix Report (12:00 & 04:00)';
      head = [['Date', 'Agent', '12:00 Amount', '12:00 Net', '04:00 Amount', '04:00 Net', 'Total Net', 'Type']];
      for (const ag of matrixData) {
        for (const d of ag.dates) {
          bodyRows.push([
            d.date,
            ag.agentName,
            d.m12.hasData ? fmt2(d.m12.amount) : '-',
            d.m12.hasData ? fmt2(d.m12.net) : '-',
            d.m04.hasData ? fmt2(d.m04.amount) : '-',
            d.m04.hasData ? fmt2(d.m04.net) : '-',
            fmt2(d.totalNet),
            d.type,
          ]);
        }
        bodyRows.push(['', `${ag.agentName} Total`, '', '', '', '', fmt2(ag.agentTotalNet), '']);
      }
      bodyRows.push(['', 'Grand Total', '', '', '', '', fmt2(matrixGrandTotal), '']);
    } else if (tabName === 'byAgent') {
      title = 'Period Report by Agent';
      head = [['AgentName', 'Vouchers', 'Sale Amount', 'Com Amt', 'L Amount', 'Win Payout', 'Com + L', 'Balance Total']];
      bodyRows = byAgentGroups.map((g) => [g.agentName, String(g.voucherCount), fmt2(g.saleAmount), fmt2(g.comAmt), String(g.lAmount), fmt2(g.winPayout), fmt2(g.comPlusL), fmt2(g.balanceTotal)]);
      bodyRows.push(['Total', String(totals.vouchers), fmt2(totals.saleAmount), fmt2(totals.comAmt), String(totals.lAmount), fmt2(totals.winPayout), fmt2(totals.comPlusL), fmt2(totals.balanceTotal)]);
    } else {
      title = 'Period Details Report';
      head = [['SrNo', 'AgentName', 'Sale Amount', 'Com Rate', 'Com Amt', 'L Amount', '*', 'Rate', '=', 'Win Payout', 'Com + L', 'Balance Total']];
      bodyRows = detailedRows.map((r) => [String(r.srNo), r.agentName, fmt2(r.saleAmount), String(r.comRate), fmt2(r.comAmt), String(r.lAmount), '*', String(r.rate), '=', fmt2(r.winPayout), fmt2(r.comPlusL), fmt2(r.balanceTotal)]);
    }

    const dateRangeLabel = `${dates.from} to ${dates.to}`;
    const pdfBlob = buildReportPdf({
      title,
      subtitle: `Date Range: ${dateRangeLabel}`,
      sections: [{ head, rows: bodyRows }],
      orientation: 'landscape',
    });

    downloadBlob(pdfBlob, reportFileName(`report-${tabName}`, dates.from, 'pdf'));
  }

  return (
    <div className="p-6 max-w-7xl mx-auto space-y-6 font-sans">
      {/* Sleek Header & Date Selection Controls */}
      <div className="bg-slate-900 text-white p-6 rounded-2xl shadow-lg space-y-4">
        <div className="flex flex-wrap items-center justify-between gap-4">
          <div>
            <h1 className="text-2xl font-extrabold tracking-tight text-white flex items-center gap-2">
              <span>📊</span> Date Range Report
            </h1>
            <p className="text-xs text-slate-400 mt-1">
              Select Start Date & End Date to inspect 12:00 & 04:00 session totals by Agent
            </p>
          </div>

          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={() => exportCsv(activeTab)}
              className="px-3.5 py-1.5 text-xs font-semibold bg-slate-800 text-slate-200 border border-slate-700 rounded-lg hover:bg-slate-700 hover:text-white transition"
            >
              Export CSV
            </button>
            <button
              type="button"
              onClick={() => exportPdf(activeTab)}
              className="px-3.5 py-1.5 text-xs font-semibold bg-indigo-600 text-white rounded-lg hover:bg-indigo-500 shadow transition"
            >
              Export PDF
            </button>
          </div>
        </div>

        {/* Date Selection Filter Toolbar */}
        <div className="flex flex-wrap items-center gap-4 pt-3 border-t border-slate-800 text-sm">
          {/* Preset Buttons */}
          <div className="flex items-center bg-slate-800 p-1 rounded-xl border border-slate-700">
            <button
              type="button"
              onClick={() => setPeriodType('weekly')}
              className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition ${
                periodType === 'weekly' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              Weekly
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('monthly')}
              className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition ${
                periodType === 'monthly' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              Monthly
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('custom')}
              className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition ${
                periodType === 'custom' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              Custom Range
            </button>
          </div>

          {/* Date Input Range Controls */}
          <div className="flex items-center gap-2 bg-slate-800/80 px-3 py-1.5 rounded-xl border border-slate-700">
            <span className="text-xs font-medium text-slate-400">Start Date:</span>
            <input
              type="date"
              value={dates.from}
              disabled={periodType !== 'custom'}
              onChange={(e) => handleCustomDateChange('from', e.target.value)}
              className="px-2 py-1 text-xs bg-slate-900 border border-slate-700 rounded-md text-white font-mono focus:outline-none focus:border-indigo-500 disabled:opacity-50"
            />
            <span className="text-xs font-medium text-slate-400">End Date:</span>
            <input
              type="date"
              value={dates.to}
              disabled={periodType !== 'custom'}
              onChange={(e) => handleCustomDateChange('to', e.target.value)}
              className="px-2 py-1 text-xs bg-slate-900 border border-slate-700 rounded-md text-white font-mono focus:outline-none focus:border-indigo-500 disabled:opacity-50"
            />
          </div>

          {/* Agent Dropdown Filter */}
          <div className="flex items-center gap-2 ml-auto">
            <span className="text-xs font-medium text-slate-400">Filter Agent:</span>
            <select
              value={selectedAgent}
              onChange={(e) => setSelectedAgent(e.target.value)}
              className="px-3 py-1.5 text-xs border border-slate-700 bg-slate-800 text-white rounded-xl focus:outline-none focus:border-indigo-500"
            >
              <option value="">All Agents</option>
              {initialAgents.map((a) => (
                <option key={a.id || a.agentName} value={a.agentName}>
                  {a.agentName}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>

      {/* Summary Stat Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm">
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block">Total Sales</span>
          <p className="text-2xl font-black text-slate-900 mt-1 font-mono">{fmt2(totals.saleAmount)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm">
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block">Total Commission</span>
          <p className="text-2xl font-black text-indigo-600 mt-1 font-mono">{fmt2(totals.comAmt)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm">
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block">Total Win Payouts</span>
          <p className="text-2xl font-black text-rose-600 mt-1 font-mono">{fmt2(totals.winPayout)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm">
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block">Net Grand Total</span>
          <p className={`text-2xl font-black mt-1 font-mono ${totals.balanceTotal < 0 ? 'text-rose-600' : 'text-emerald-600'}`}>
            {fmt2(totals.balanceTotal)}
          </p>
        </div>
      </div>

      {/* Sub-tabs Navigation */}
      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="flex border-b border-slate-200 bg-slate-50 px-4 pt-3 gap-2">
          <button
            type="button"
            onClick={() => setActiveTab('matrix')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition ${
              activeTab === 'matrix'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            📋 Date Range Matrix Report
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('byAgent')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition ${
              activeTab === 'byAgent'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            👤 Agent Summary
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('details')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition ${
              activeTab === 'details'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            📄 Slip Logs
          </button>
        </div>

        <div className="p-6">
          {loading ? (
            <p className="text-center text-sm text-slate-400 py-12">Loading report data...</p>
          ) : detailedRows.length === 0 ? (
            <p className="text-center text-sm text-slate-400 py-12">No vouchers found in selected date range.</p>
          ) : (
            <>
              {/* TAB 1: MODERN DATE RANGE MATRIX REPORT (Matching Sample Screenshot) */}
              {activeTab === 'matrix' && (
                <div className="space-y-8">
                  {matrixData.map((agentGroup) => (
                    <div
                      key={agentGroup.agentName}
                      className="bg-white rounded-xl border border-slate-300 shadow-sm overflow-hidden font-mono"
                    >
                      {/* Agent Banner Header */}
                      <div className="bg-slate-100 px-4 py-2.5 border-b border-slate-300 flex justify-between items-center">
                        <div className="flex items-center gap-2">
                          <span className="text-xs font-sans text-slate-500 font-semibold uppercase">Name:</span>
                          <span className="font-extrabold text-slate-900 text-base font-sans">{agentGroup.agentName}</span>
                        </div>
                        <div className="text-xs font-sans font-semibold text-slate-600">
                          Period: <span className="font-mono text-slate-900">{dates.from} ~ {dates.to}</span>
                        </div>
                      </div>

                      {/* Matrix Table */}
                      <div className="overflow-x-auto">
                        <table className="w-full text-xs text-center border-collapse border-b border-slate-200">
                          <thead>
                            {/* Session Header Row */}
                            <tr className="bg-slate-200 text-slate-800 font-bold border-b border-slate-300">
                              <th className="px-3 py-2 border-r border-slate-300 text-left font-sans font-extrabold text-xs">
                                Date
                              </th>
                              <th colSpan={3} className="px-3 py-2 border-r border-slate-300 bg-amber-100/60 text-slate-900">
                                12:00 (AM Session)
                              </th>
                              <th colSpan={3} className="px-3 py-2 border-r border-slate-300 bg-sky-100/60 text-slate-900">
                                04:00 (PM Session)
                              </th>
                              <th colSpan={2} className="px-3 py-2 bg-slate-300 text-slate-900 font-sans font-extrabold">
                                Total / Type
                              </th>
                            </tr>
                            {/* Columns Header Row */}
                            <tr className="bg-slate-50 text-slate-600 text-[11px] font-semibold border-b border-slate-300 uppercase">
                              <th className="px-3 py-1.5 border-r border-slate-300 text-left font-sans">Date</th>
                              <th className="px-3 py-1.5 border-r border-slate-200 text-right bg-amber-50/50">Amount</th>
                              <th className="px-3 py-1.5 border-r border-slate-200 text-right bg-amber-50/50">Lucky</th>
                              <th className="px-3 py-1.5 border-r border-slate-300 text-right bg-amber-50/50">Net</th>
                              <th className="px-3 py-1.5 border-r border-slate-200 text-right bg-sky-50/50">Amount</th>
                              <th className="px-3 py-1.5 border-r border-slate-200 text-right bg-sky-50/50">Lucky</th>
                              <th className="px-3 py-1.5 border-r border-slate-300 text-right bg-sky-50/50">Net</th>
                              <th className="px-4 py-1.5 border-r border-slate-300 text-right font-bold text-slate-800">Net Total</th>
                              <th className="px-2 py-1.5 text-center font-bold">Type</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-slate-200 text-xs">
                            {agentGroup.dates.map((row) => (
                              <tr key={row.date} className="hover:bg-slate-50 transition">
                                <td className="px-3 py-2 text-left font-sans font-medium text-slate-900 border-r border-slate-200">
                                  {row.date}
                                </td>
                                {/* 12:00 Session */}
                                <td className="px-3 py-2 text-right border-r border-slate-200 text-slate-800">
                                  {row.m12.hasData ? fmt2(row.m12.amount) : ''}
                                </td>
                                <td className="px-3 py-2 text-right border-r border-slate-200 text-slate-700">
                                  {row.m12.hasData && row.m12.lucky > 0 ? row.m12.lucky : ''}
                                </td>
                                <td className={`px-3 py-2 text-right border-r border-slate-300 font-bold ${row.m12.net < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                  {row.m12.hasData ? fmt2(row.m12.net) : ''}
                                </td>

                                {/* 04:00 Session */}
                                <td className="px-3 py-2 text-right border-r border-slate-200 text-slate-800">
                                  {row.m04.hasData ? fmt2(row.m04.amount) : ''}
                                </td>
                                <td className="px-3 py-2 text-right border-r border-slate-200 text-slate-700">
                                  {row.m04.hasData && row.m04.lucky > 0 ? row.m04.lucky : ''}
                                </td>
                                <td className={`px-3 py-2 text-right border-r border-slate-300 font-bold ${row.m04.net < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                  {row.m04.hasData ? fmt2(row.m04.net) : ''}
                                </td>

                                {/* Day Net Total */}
                                <td className={`px-4 py-2 text-right border-r border-slate-300 font-extrabold ${row.totalNet < 0 ? 'text-rose-600 font-sans' : 'text-slate-900 font-sans'}`}>
                                  {fmt2(row.totalNet)}
                                </td>
                                {/* Type Tag (S = Sale, P = Payout) */}
                                <td className="px-2 py-2 text-center font-sans font-bold">
                                  <span
                                    className={`inline-block px-1.5 py-0.5 rounded text-[10px] uppercase font-bold ${
                                      row.type === 'P' ? 'bg-rose-100 text-rose-700' : 'bg-emerald-100 text-emerald-700'
                                    }`}
                                  >
                                    {row.type}
                                  </span>
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>

                      {/* Agent Subtotal Footer */}
                      <div className="bg-slate-50 px-4 py-2.5 text-right font-sans font-bold text-sm text-slate-900 border-t border-slate-300 flex justify-between items-center">
                        <span className="text-slate-600 text-xs font-semibold uppercase">{agentGroup.agentName} Total:</span>
                        <span className={`text-base font-mono font-extrabold ${agentGroup.agentTotalNet < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                          {fmt2(agentGroup.agentTotalNet)}
                        </span>
                      </div>
                    </div>
                  ))}

                  {/* Grand Total Card Banner */}
                  <div className="border-2 border-slate-900 rounded-xl p-5 bg-slate-900 text-white flex justify-between items-center shadow-lg font-sans">
                    <div>
                      <span className="text-xs text-slate-400 uppercase tracking-widest font-semibold block">Overall Period Report</span>
                      <span className="text-xl font-extrabold text-white">GRAND TOTAL</span>
                    </div>
                    <div className="text-right">
                      <span className={`text-2xl font-black font-mono tracking-tight underline decoration-double ${matrixGrandTotal < 0 ? 'text-rose-400' : 'text-emerald-400'}`}>
                        {fmt2(matrixGrandTotal)} MMK
                      </span>
                    </div>
                  </div>
                </div>
              )}

              {/* TAB 2: AGENT SUMMARY */}
              {activeTab === 'byAgent' && (
                <div className="border border-slate-200 rounded-xl overflow-hidden shadow-sm">
                  <table className="w-full text-xs text-left border-collapse font-mono">
                    <thead>
                      <tr className="bg-slate-100 text-slate-800 font-semibold border-b border-slate-300 font-sans">
                        <th className="px-3 py-2.5 border-r border-slate-200">{t('reports.agentCol')}</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-center">Vouchers</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-right">{t('reports.saleAmountCol')}</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-right">{t('reports.comAmtCol')}</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-right">{t('reports.lAmountCol')}</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-right">{t('reports.winPayoutCol')}</th>
                        <th className="px-3 py-2.5 border-r border-slate-200 text-right">{t('reports.comPlusLCol')}</th>
                        <th className="px-3 py-2.5 text-right">{t('reports.balanceTotalCol')}</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-200">
                      {byAgentGroups.map((g) => (
                        <tr key={g.agentName} className="hover:bg-slate-50 transition">
                          <td className="px-3 py-2 border-r border-slate-200 font-sans font-semibold text-slate-900">
                            {g.agentName}
                          </td>
                          <td className="px-3 py-2 border-r border-slate-200 text-center font-sans">{g.voucherCount}</td>
                          <td className="px-3 py-2 border-r border-slate-200 text-right">{fmt2(g.saleAmount)}</td>
                          <td className="px-3 py-2 border-r border-slate-200 text-right">{fmt2(g.comAmt)}</td>
                          <td className="px-3 py-2 border-r border-slate-200 text-right">{g.lAmount}</td>
                          <td className="px-3 py-2 border-r border-slate-200 text-right">{fmt2(g.winPayout)}</td>
                          <td className="px-3 py-2 border-r border-slate-200 text-right">{fmt2(g.comPlusL)}</td>
                          <td className={`px-3 py-2 text-right font-bold ${g.balanceTotal < 0 ? 'text-rose-600' : 'text-emerald-700'}`}>
                            {fmt2(g.balanceTotal)}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                    <tfoot>
                      <tr className="bg-slate-100 font-bold text-slate-900 border-t-2 border-slate-300 font-sans">
                        <td className="px-3 py-2.5 border-r border-slate-200">{t('common.total')}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-center font-mono">{totals.vouchers}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-right font-mono">{fmt2(totals.saleAmount)}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-right font-mono">{fmt2(totals.comAmt)}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-right font-mono">{totals.lAmount}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-right font-mono">{fmt2(totals.winPayout)}</td>
                        <td className="px-3 py-2.5 border-r border-slate-200 text-right font-mono">{fmt2(totals.comPlusL)}</td>
                        <td className={`px-3 py-2.5 text-right font-mono ${totals.balanceTotal < 0 ? 'text-rose-600' : 'text-emerald-700'}`}>
                          {fmt2(totals.balanceTotal)}
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              )}

              {/* TAB 3: SLIP LOGS */}
              {activeTab === 'details' && (
                <div className="border border-slate-200 rounded-xl overflow-x-auto shadow-sm">
                  <table className="w-full text-xs text-left border-collapse font-mono min-w-[850px]">
                    <thead>
                      <tr className="bg-slate-100 text-slate-800 font-semibold border-b border-slate-300 font-sans">
                        <th className="px-2.5 py-2 border-r border-slate-200 text-center">{t('reports.srNoCol')}</th>
                        <th className="px-2.5 py-2 border-r border-slate-200">{t('reports.agentCol')}</th>
                        <th className="px-2.5 py-2 border-r border-slate-200 text-right">{t('reports.saleAmountCol')}</th>
                        <th className="px-2.5 py-2 border-r border-slate-200 text-center">{t('reports.comRateCol')}</th>
                        <th className="px-2.5 py-2 border-r border-slate-200 text-right">{t('reports.comAmtCol')}</th>
                        <th className="px-2 py-2 text-right">{t('reports.lAmountCol')}</th>
                        <th className="px-1 py-2 text-center text-slate-400 font-normal">*</th>
                        <th className="px-2 py-2 text-center">{t('reports.rateCol')}</th>
                        <th className="px-1 py-2 text-center text-slate-400 font-normal">=</th>
                        <th className="px-2.5 py-2 border-r border-slate-200 text-right">{t('reports.winPayoutCol')}</th>
                        <th className="px-2.5 py-2 border-r border-slate-200 text-right">{t('reports.comPlusLCol')}</th>
                        <th className="px-2.5 py-2 text-right">{t('reports.balanceTotalCol')}</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-200 bg-white">
                      {detailedRows.map((r, i) => (
                        <tr key={i} className="hover:bg-slate-50 transition">
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-center">{r.srNo}</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 font-sans font-medium text-slate-800">{r.agentName}</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-right">{fmt2(r.saleAmount)}</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-center font-sans">{r.comRate}</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-right">{fmt2(r.comAmt)}</td>
                          <td className="px-2 py-1.5 text-right">{r.lAmount}</td>
                          <td className="px-1 py-1.5 text-center text-slate-400 font-sans">*</td>
                          <td className="px-2 py-1.5 text-center font-sans">{r.rate}</td>
                          <td className="px-1 py-1.5 text-center text-slate-400 font-sans">=</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-right">{fmt2(r.winPayout)}</td>
                          <td className="px-2.5 py-1.5 border-r border-slate-200 text-right">{fmt2(r.comPlusL)}</td>
                          <td className={`px-2.5 py-1.5 text-right font-bold ${r.balanceTotal < 0 ? 'text-rose-600' : 'text-emerald-700'}`}>
                            {fmt2(r.balanceTotal)}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </>
          )}
        </div>
      </div>
    </div>
  );
}
