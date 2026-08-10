'use client';
import { useState, useEffect, useCallback, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';

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
  agentReport: 'Period Report by Agent',
  summaryReport: 'Period Summary Report',
  detailsReport: 'Period Details Report',
  vouchersCount: 'Total Vouchers',
};

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
  const [activeTab, setActiveTab] = useState('byAgent'); // 'byAgent' | 'summary' | 'details'

  const [loading, setLoading] = useState(false);
  const [reportSlips, setReportSlips] = useState([]);

  const agentMap = useMemo(() => {
    const map = new Map();
    for (const a of initialAgents) {
      if (a.agentName) map.set(a.agentName, a);
      if (a.id) map.set(a.id, a);
    }
    return map;
  }, [initialAgents]);

  const loadReportData = useCallback(async (fromDate, toDate, agent) => {
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
  }, [orgId]);

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
    return reportSlips.map(s => {
      const saleAmount = s.amount || 0;
      const ag = agentMap.get(s.agentName) || agentMap.get(s.agentId);
      const comRate = ag?.commission ?? 0;
      const comAmt = saleAmount * (comRate / 100);

      const lAmount = s.luckyNo
        ? (s.details || [])
            .filter(d => String(d.num1) === String(s.luckyNo))
            .reduce((sum, d) => sum + (d.value || 0), 0)
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
        createdAt: s.createdAt,
        saleAmount,
        comRate,
        comAmt,
        lAmount,
        rate,
        winPayout,
        comPlusL,
        balanceTotal,
        details: s.details || [],
      };
    }).sort((a, b) => (a.srNo || 0) - (b.srNo || 0));
  }, [reportSlips, agentMap]);

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
    if (tabName === 'byAgent') {
      rows.push([
        PDF_EN.agent,
        PDF_EN.vouchersCount,
        PDF_EN.saleAmount,
        PDF_EN.comAmt,
        PDF_EN.lAmount,
        PDF_EN.winPayout,
        PDF_EN.comPlusL,
        PDF_EN.balanceTotal,
      ]);
      for (const g of byAgentGroups) {
        rows.push([
          g.agentName,
          g.voucherCount,
          fmt2(g.saleAmount),
          fmt2(g.comAmt),
          g.lAmount,
          fmt2(g.winPayout),
          fmt2(g.comPlusL),
          fmt2(g.balanceTotal),
        ]);
      }
      rows.push([
        PDF_EN.total,
        totals.vouchers,
        fmt2(totals.saleAmount),
        fmt2(totals.comAmt),
        totals.lAmount,
        fmt2(totals.winPayout),
        fmt2(totals.comPlusL),
        fmt2(totals.balanceTotal),
      ]);
    } else {
      rows.push([
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
      ]);
      for (const r of detailedRows) {
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
        PDF_EN.total,
        '',
        fmt2(totals.saleAmount),
        '',
        fmt2(totals.comAmt),
        totals.lAmount,
        '',
        '',
        '',
        fmt2(totals.winPayout),
        fmt2(totals.comPlusL),
        fmt2(totals.balanceTotal),
      ]);
    }

    const dateRangeLabel = `${dates.from}_to_${dates.to}`;
    downloadBlob(new Blob([toCsv(rows)], { type: 'text/csv;charset=utf-8;' }), reportFileName(`report-${tabName}`, dateRangeLabel, 'csv'));
  }

  function exportPdf(tabName) {
    let title = PDF_EN.allAgentReport;
    let head = [];
    let bodyRows = [];

    if (tabName === 'byAgent') {
      title = PDF_EN.agentReport;
      head = [[
        PDF_EN.agent,
        PDF_EN.vouchersCount,
        PDF_EN.saleAmount,
        PDF_EN.comAmt,
        PDF_EN.lAmount,
        PDF_EN.winPayout,
        PDF_EN.comPlusL,
        PDF_EN.balanceTotal,
      ]];
      bodyRows = byAgentGroups.map(g => [
        g.agentName,
        String(g.voucherCount),
        fmt2(g.saleAmount),
        fmt2(g.comAmt),
        String(g.lAmount),
        fmt2(g.winPayout),
        fmt2(g.comPlusL),
        fmt2(g.balanceTotal),
      ]);
      bodyRows.push([
        PDF_EN.total,
        String(totals.vouchers),
        fmt2(totals.saleAmount),
        fmt2(totals.comAmt),
        String(totals.lAmount),
        fmt2(totals.winPayout),
        fmt2(totals.comPlusL),
        fmt2(totals.balanceTotal),
      ]);
    } else {
      title = tabName === 'summary' ? PDF_EN.summaryReport : PDF_EN.detailsReport;
      head = [[
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
      bodyRows = detailedRows.map(r => [
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
        fmt2(totals.saleAmount),
        '',
        fmt2(totals.comAmt),
        String(totals.lAmount),
        '',
        '',
        '',
        fmt2(totals.winPayout),
        fmt2(totals.comPlusL),
        fmt2(totals.balanceTotal),
      ]);
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
    <div className="p-6 max-w-7xl mx-auto space-y-6">
      {/* Header & Controls */}
      <div className="bg-white p-5 rounded-xl border border-gray-200 shadow-sm space-y-4">
        <div className="flex flex-wrap items-center justify-between gap-4">
          <div>
            <h1 className="text-xl font-bold text-gray-900">{t('reports.title')}</h1>
            <p className="text-xs text-gray-500">{t('reports.period')}: {dates.from} ~ {dates.to}</p>
          </div>

          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={() => exportCsv(activeTab)}
              className="px-3 py-1.5 text-xs font-medium border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition"
            >
              Export CSV
            </button>
            <button
              type="button"
              onClick={() => exportPdf(activeTab)}
              className="px-3 py-1.5 text-xs font-medium bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition"
            >
              Export PDF
            </button>
          </div>
        </div>

        {/* Filter Toolbar */}
        <div className="flex flex-wrap items-center gap-3 pt-2 border-t border-gray-100 text-sm">
          {/* Period Preset Buttons */}
          <div className="flex items-center bg-gray-100 p-1 rounded-lg">
            <button
              type="button"
              onClick={() => setPeriodType('weekly')}
              className={`px-3 py-1 text-xs font-medium rounded-md transition ${
                periodType === 'weekly' ? 'bg-white text-indigo-700 shadow-sm' : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {t('reports.weekly')}
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('monthly')}
              className={`px-3 py-1 text-xs font-medium rounded-md transition ${
                periodType === 'monthly' ? 'bg-white text-indigo-700 shadow-sm' : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {t('reports.monthly')}
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('custom')}
              className={`px-3 py-1 text-xs font-medium rounded-md transition ${
                periodType === 'custom' ? 'bg-white text-indigo-700 shadow-sm' : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {t('reports.customRange')}
            </button>
          </div>

          {/* Date Pickers */}
          <div className="flex items-center gap-2">
            <label className="text-xs text-gray-500">{t('reports.fromDate')}:</label>
            <input
              type="date"
              value={dates.from}
              disabled={periodType !== 'custom'}
              onChange={e => handleCustomDateChange('from', e.target.value)}
              className="px-2.5 py-1 text-xs border border-gray-300 rounded-md disabled:bg-gray-50 text-gray-800"
            />
            <label className="text-xs text-gray-500">{t('reports.toDate')}:</label>
            <input
              type="date"
              value={dates.to}
              disabled={periodType !== 'custom'}
              onChange={e => handleCustomDateChange('to', e.target.value)}
              className="px-2.5 py-1 text-xs border border-gray-300 rounded-md disabled:bg-gray-50 text-gray-800"
            />
          </div>

          {/* Agent Filter */}
          <div className="flex items-center gap-2 ml-auto">
            <label className="text-xs text-gray-500">{t('reports.filterAgent')}:</label>
            <select
              value={selectedAgent}
              onChange={e => setSelectedAgent(e.target.value)}
              className="px-2.5 py-1 text-xs border border-gray-300 rounded-md bg-white text-gray-800"
            >
              <option value="">{t('reports.allAgents')}</option>
              {initialAgents.map(a => (
                <option key={a.id || a.agentName} value={a.agentName}>
                  {a.agentName}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>

      {/* Overview Stat Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm">
          <p className="text-xs font-medium text-gray-500">{t('reports.saleAmountCol')}</p>
          <p className="text-xl font-bold text-gray-900 mt-1">{fmt2(totals.saleAmount)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm">
          <p className="text-xs font-medium text-gray-500">{t('reports.comAmtCol')}</p>
          <p className="text-xl font-bold text-indigo-600 mt-1">{fmt2(totals.comAmt)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm">
          <p className="text-xs font-medium text-gray-500">{t('reports.winPayoutCol')}</p>
          <p className="text-xl font-bold text-red-600 mt-1">{fmt2(totals.winPayout)}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm">
          <p className="text-xs font-medium text-gray-500">{t('reports.balanceTotalCol')}</p>
          <p className={`text-xl font-bold mt-1 ${totals.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-600'}`}>
            {fmt2(totals.balanceTotal)}
          </p>
        </div>
      </div>

      {/* Sub-tabs & Content */}
      <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
        {/* Navigation Sub-tabs */}
        <div className="flex border-b border-gray-200 bg-gray-50 px-4 pt-3 gap-2">
          <button
            type="button"
            onClick={() => setActiveTab('byAgent')}
            className={`px-4 py-2 text-sm font-medium border-b-2 transition ${
              activeTab === 'byAgent'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-lg'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            {t('reports.byAgentTab')}
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('summary')}
            className={`px-4 py-2 text-sm font-medium border-b-2 transition ${
              activeTab === 'summary'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-lg'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            {t('reports.summaryTab')}
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('details')}
            className={`px-4 py-2 text-sm font-medium border-b-2 transition ${
              activeTab === 'details'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-lg'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            {t('reports.detailsTab')}
          </button>
        </div>

        <div className="p-5">
          {loading ? (
            <p className="text-center text-sm text-gray-400 py-10">{t('common.loading')}</p>
          ) : detailedRows.length === 0 ? (
            <p className="text-center text-sm text-gray-400 py-10">{t('reports.noVouchers')}</p>
          ) : (
            <>
              {/* Tab 1: By Agent */}
              {activeTab === 'byAgent' && (
                <div className="overflow-x-auto">
                  <table className="w-full text-xs text-left border-collapse">
                    <thead>
                      <tr className="bg-gray-100 text-gray-800 font-semibold border-b border-gray-300">
                        <th className="px-3 py-2 border-r border-gray-200">{t('reports.agentCol')}</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-center">Vouchers</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.saleAmountCol')}</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.comAmtCol')}</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.lAmountCol')}</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.winPayoutCol')}</th>
                        <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.comPlusLCol')}</th>
                        <th className="px-3 py-2 text-right">{t('reports.balanceTotalCol')}</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-200 font-mono">
                      {byAgentGroups.map(g => (
                        <tr key={g.agentName} className="hover:bg-gray-50 transition">
                          <td className="px-3 py-2 border-r border-gray-200 font-sans font-semibold text-gray-900">{g.agentName}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-center font-sans">{g.voucherCount}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.saleAmount)}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.comAmt)}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right">{g.lAmount}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.winPayout)}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.comPlusL)}</td>
                          <td className={`px-3 py-2 text-right font-bold ${g.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                            {fmt2(g.balanceTotal)}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                    <tfoot>
                      <tr className="bg-gray-100 font-bold text-gray-900 border-t-2 border-gray-300">
                        <td className="px-3 py-2 border-r border-gray-200 font-sans">{t('common.total')}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-center font-sans">{totals.vouchers}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.saleAmount)}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.comAmt)}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{totals.lAmount}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.winPayout)}</td>
                        <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.comPlusL)}</td>
                        <td className={`px-3 py-2 text-right font-mono ${totals.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                          {fmt2(totals.balanceTotal)}
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              )}

              {/* Tab 2: Summary Report */}
              {activeTab === 'summary' && (
                <div className="space-y-6">
                  <div className="border border-gray-200 rounded-lg overflow-x-auto">
                    <table className="w-full text-xs text-left border-collapse">
                      <thead>
                        <tr className="bg-gray-100 text-gray-800 font-semibold border-b border-gray-300">
                          <th className="px-3 py-2 border-r border-gray-200">{t('reports.agentCol')}</th>
                          <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.saleAmountCol')}</th>
                          <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.comAmtCol')}</th>
                          <th className="px-3 py-2 border-r border-gray-200 text-right">{t('reports.winPayoutCol')}</th>
                          <th className="px-3 py-2 text-right">{t('reports.balanceTotalCol')}</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 font-mono">
                        {byAgentGroups.map(g => (
                          <tr key={g.agentName} className="hover:bg-gray-50 transition">
                            <td className="px-3 py-2 border-r border-gray-200 font-sans font-semibold text-gray-900">{g.agentName}</td>
                            <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.saleAmount)}</td>
                            <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.comAmt)}</td>
                            <td className="px-3 py-2 border-r border-gray-200 text-right">{fmt2(g.winPayout)}</td>
                            <td className={`px-3 py-2 text-right font-bold ${g.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                              {fmt2(g.balanceTotal)}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                      <tfoot>
                        <tr className="bg-gray-100 font-bold text-gray-900 border-t-2 border-gray-300">
                          <td className="px-3 py-2 border-r border-gray-200 font-sans">{t('common.total')}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.saleAmount)}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.comAmt)}</td>
                          <td className="px-3 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.winPayout)}</td>
                          <td className={`px-3 py-2 text-right font-mono ${totals.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                            {fmt2(totals.balanceTotal)}
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </div>
              )}

              {/* Tab 3: Details Report */}
              {activeTab === 'details' && (
                <div className="border border-gray-200 rounded-lg overflow-x-auto">
                  <table className="w-full text-xs text-left border-collapse min-w-[850px]">
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
                      {detailedRows.map((r, i) => (
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
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.saleAmount)}</td>
                        <td className="px-2.5 py-2 border-r border-gray-200"></td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.comAmt)}</td>
                        <td className="px-2 py-2 text-right font-mono">{totals.lAmount}</td>
                        <td className="px-1 py-2"></td>
                        <td className="px-2 py-2"></td>
                        <td className="px-1 py-2"></td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.winPayout)}</td>
                        <td className="px-2.5 py-2 border-r border-gray-200 text-right font-mono">{fmt2(totals.comPlusL)}</td>
                        <td className={`px-2.5 py-2 text-right font-mono ${totals.balanceTotal < 0 ? 'text-red-600' : 'text-emerald-700'}`}>
                          {fmt2(totals.balanceTotal)}
                        </td>
                      </tr>
                    </tfoot>
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
