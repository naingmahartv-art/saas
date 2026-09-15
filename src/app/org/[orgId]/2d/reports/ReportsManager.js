'use client';
import React, { useState, useEffect, useCallback, useMemo, Fragment } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { buildReportPdf, reportFileName } from '@/lib/reports/buildPdf.js';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';

function getTokenItemsForSlip(slip, luckyNo) {
  if (slip.tokens && slip.tokens.length > 0) {
    return slip.tokens.map((tokText) => {
      const { entries } = parseNumberExpression(tokText, { maxEntries: MAX_ENTRIES });
      const amount = entries ? entries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0) : 0;
      const matchingEntries = (luckyNo && entries)
        ? entries.filter((e) => String(e.num).padStart(2, '0') === String(luckyNo).padStart(2, '0'))
        : [];
      const winAmount = matchingEntries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0);
      const isWinner = winAmount > 0;
      return { tokText, amount, winAmount, isWinner };
    });
  }
  if (slip.details && slip.details.length > 0) {
    return slip.details.map((d) => {
      const num = String(d.num1).padStart(2, '0');
      const isWinner = Boolean(luckyNo && num === String(luckyNo).padStart(2, '0'));
      const val = parseFloat(d.value) || 0;
      const winAmount = isWinner ? val : 0;
      return { tokText: num, amount: val, winAmount, isWinner };
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

const MONTH_NAMES = [
  { value: '01', label: 'January (Jan)' },
  { value: '02', label: 'February (Feb)' },
  { value: '03', label: 'March (Mar)' },
  { value: '04', label: 'April (Apr)' },
  { value: '05', label: 'May (May)' },
  { value: '06', label: 'June (Jun)' },
  { value: '07', label: 'July (Jul)' },
  { value: '08', label: 'August (Aug)' },
  { value: '09', label: 'September (Sep)' },
  { value: '10', label: 'October (Oct)' },
  { value: '11', label: 'November (Nov)' },
  { value: '12', label: 'December (Dec)' },
];

function getDayDates(dayStr) {
  return { from: dayStr, to: dayStr };
}

function getWeekDates(type = 'thisWeek') {
  const today = new Date();
  const dayOfWeek = today.getDay(); // 0 = Sun, 1 = Mon ... 5 = Fri
  const distToMon = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
  const offset = type === 'lastWeek' ? -7 : 0;
  const mon = new Date(today);
  mon.setDate(today.getDate() + distToMon + offset);
  const sun = new Date(mon);
  sun.setDate(mon.getDate() + 6);
  return { from: mon.toISOString().slice(0, 10), to: sun.toISOString().slice(0, 10) };
}

function getMonthDates(year, monthStr) {
  const y = parseInt(year, 10) || new Date().getFullYear();
  const m = parseInt(monthStr, 10) || (new Date().getMonth() + 1);
  const firstDay = `${y}-${String(m).padStart(2, '0')}-01`;
  const lastDayDate = new Date(y, m, 0);
  const lastDay = `${y}-${String(m).padStart(2, '0')}-${String(lastDayDate.getDate()).padStart(2, '0')}`;
  return { from: firstDay, to: lastDay };
}

export default function ReportsManager({ orgId, initialAgents = [] }) {
  const { t } = useI18n();

  const today = new Date();
  const todayStr = today.toISOString().slice(0, 10);
  const currentMonthStr = String(today.getMonth() + 1).padStart(2, '0');
  const currentYear = today.getFullYear();

  const [periodType, setPeriodType] = useState('daily'); // 'daily' | 'weekly' | 'monthly' | 'custom'
  const [selectedDay, setSelectedDay] = useState(todayStr);
  const [weekType, setWeekType] = useState('thisWeek');
  const [selectedMonth, setSelectedMonth] = useState(currentMonthStr);
  const [selectedYear, setSelectedYear] = useState(currentYear);
  const [dates, setDates] = useState(() => getDayDates(todayStr));

  const [selectedAgent, setSelectedAgent] = useState('');
  const [selectedSlot, setSelectedSlot] = useState(''); // '' | '12:00' | '04:00' | '09:00'
  const [activeTab, setActiveTab] = useState('summary'); // 'summary' | 'matrix' | 'byAgent' | 'details'

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
    async (fromDate, toDate, agent, slot) => {
      setLoading(true);
      try {
        let url = `/api/org/${orgId}/reports/range?startDate=${fromDate}&endDate=${toDate}`;
        if (agent) url += `&agentName=${encodeURIComponent(agent)}`;
        if (slot) url += `&ampm=${encodeURIComponent(slot)}`;
        const res = await fetch(url);
        const text = await res.text();
        let data = {};
        try { data = JSON.parse(text); } catch { data = { slips: [] }; }
        setReportSlips(data.slips || []);
      } catch {
        setReportSlips([]);
      } finally {
        setLoading(false);
      }
    },
    [orgId]
  );

  // Sync date ranges when user changes periodType or day/week/month selections
  useEffect(() => {
    let newDates = dates;
    if (periodType === 'daily') {
      newDates = getDayDates(selectedDay);
    } else if (periodType === 'weekly') {
      newDates = getWeekDates(weekType);
    } else if (periodType === 'monthly') {
      newDates = getMonthDates(selectedYear, selectedMonth);
    }
    setDates(newDates);
    loadReportData(newDates.from, newDates.to, selectedAgent, selectedSlot);
  }, [periodType, selectedDay, weekType, selectedMonth, selectedYear, selectedAgent, selectedSlot, loadReportData]);

  function handleCustomDateChange(field, val) {
    const next = { ...dates, [field]: val };
    setDates(next);
    loadReportData(next.from, next.to, selectedAgent, selectedSlot);
  }

  function handleDayShift(offsetDays) {
    const d = new Date(selectedDay);
    d.setDate(d.getDate() + offsetDays);
    const newDay = d.toISOString().slice(0, 10);
    setSelectedDay(newDay);
  }

  // --- Processed Data ---
  const detailedRows = useMemo(() => {
    return reportSlips
      .map((s) => {
        const isBuy = Boolean(s.isBuyVoucher || s.voucherType === 'buy' || s.agentId === 'buy_offload');
        const rawAmount = parseFloat(s.amount) || 0;
        const ag = agentMapLookup.get(s.agentName) || agentMapLookup.get(s.agentId);
        const sComms = s.agentCommissions || {};
        const sRates = s.agentRates || {};
        const comRate =
          ag && sComms[ag.id] !== undefined && sComms[ag.id] !== null && sComms[ag.id] !== ''
            ? parseFloat(sComms[ag.id])
            : (ag?.commission ?? (isBuy ? 16 : 0));
        const comAmt = rawAmount * (comRate / 100);

        const lAmount = s.luckyNo
          ? getTokenItemsForSlip(s, s.luckyNo)
              .filter((item) => item.isWinner)
              .reduce((sum, item) => sum + item.winAmount, 0)
          : 0;

        const rate =
          ag && sRates[ag.id] !== undefined && sRates[ag.id] !== null && sRates[ag.id] !== ''
            ? parseFloat(sRates[ag.id])
            : (ag?.rate || s.rate || 80);
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
          id: s.id || `${s.srNo}_${s.createdAt}`,
          srNo: s.srNo,
          agentName: s.agentName || (isBuy ? 'Buy Offload' : 'Unknown'),
          onDate: s.onDate,
          ampm: s.ampm,
          createdAt: s.createdAt,
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
          details: getTokenItemsForSlip(s, s.luckyNo).map((item) => ({
            num1: item.tokText,
            value: item.amount,
          })),
        };
      })
      .sort((a, b) => (a.srNo || 0) - (b.srNo || 0));
  }, [reportSlips, agentMapLookup]);

  // --- Format 2: Date Range Matrix Aggregation (12:00, 04:00) ---
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
          type: r.isBuy ? 'B' : 'S',
        });
      }

      const dayEntry = dateMap.get(date);
      const rawAmpm = String(r.ampm || '').toLowerCase();
      const slot = rawAmpm.includes('12') || rawAmpm.includes('am') ? 'm12' : 'm04';

      dayEntry[slot].amount += r.rawAmount;
      dayEntry[slot].lucky += r.lAmount;
      dayEntry[slot].winPayout += r.winPayout;
      dayEntry[slot].comAmt += r.comAmt;
      dayEntry[slot].net += r.balanceTotal;
      dayEntry[slot].hasData = true;

      dayEntry.totalNet = dayEntry.m12.net + dayEntry.m04.net;
      if (!r.isBuy) dayEntry.type = 'S';
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

  // --- Format 1 Report Data (Name | Amount | Lucky | Total | Type) ---
  const summaryReportData = useMemo(() => {
    const map = new Map();

    for (const r of detailedRows) {
      const key = `${r.agentName}_${r.isBuy ? 'B' : 'S'}`;
      const group = map.get(key) || {
        agentName: r.agentName,
        isBuy: r.isBuy,
        type: r.isBuy ? 'B' : 'S',
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
      group.sAmount += r.rawAmount;
      group.comAmt += r.comAmt;
      group.lAmount += r.lAmount;
      group.rate = r.rate;
      group.winPayout += r.winPayout;
      group.balanceTotal += r.balanceTotal;
      group.cRate = r.comRate;

      map.set(key, group);
    }

    const allRows = [...map.values()].sort((a, b) => {
      if (a.isBuy !== b.isBuy) return a.isBuy ? 1 : -1;
      return a.agentName.localeCompare(b.agentName);
    });

    const grandTotals = allRows.reduce(
      (acc, r) => ({
        sAmount: acc.sAmount + r.sAmount,
        lAmount: acc.lAmount + r.lAmount,
        balanceTotal: acc.balanceTotal + r.balanceTotal,
      }),
      { sAmount: 0, lAmount: 0, balanceTotal: 0 }
    );

    return {
      rows: allRows,
      grandTotals,
    };
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
    if (tabName === 'summary') {
      const dateLabel = dates.from === dates.to ? dates.from : `${dates.from} ~ ${dates.to}`;
      rows.push([`Period Report (${dateLabel})`]);
      rows.push(['Name', 'Amount', 'Lucky', 'Total', 'Type']);
      for (const r of summaryReportData.rows) {
        rows.push([r.agentName, fmt2(r.sAmount), r.lAmount > 0 ? r.lAmount : '', fmt2(r.balanceTotal), r.type]);
      }
      rows.push(['', fmt2(summaryReportData.grandTotals.sAmount), summaryReportData.grandTotals.lAmount > 0 ? summaryReportData.grandTotals.lAmount : '', fmt2(summaryReportData.grandTotals.balanceTotal), '']);
    } else if (tabName === 'matrix') {
      rows.push(['Date', 'Agent', '12:00 Amount', '12:00 Lucky', '12:00 Net', '04:00 Amount', '04:00 Lucky', '04:00 Net', 'Total Net', 'Type']);
      for (const ag of matrixData) {
        for (const d of ag.dates) {
          rows.push([
            d.date,
            ag.agentName,
            d.m12.hasData && d.m12.amount ? fmt2(d.m12.amount) : '',
            d.m12.hasData && d.m12.lucky > 0 ? d.m12.lucky : '',
            d.m12.hasData ? fmt2(d.m12.net) : '',
            d.m04.hasData && d.m04.amount ? fmt2(d.m04.amount) : '',
            d.m04.hasData && d.m04.lucky > 0 ? d.m04.lucky : '',
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

    if (tabName === 'summary') {
      const dateLabel = dates.from === dates.to ? dates.from : `${dates.from} to ${dates.to}`;
      title = `Period Report (${dateLabel})`;
      head = [['Name', 'Amount', 'Lucky', 'Total', 'Type']];
      for (const r of summaryReportData.rows) {
        bodyRows.push([
          r.agentName,
          fmt2(r.sAmount),
          r.lAmount > 0 ? String(r.lAmount) : '',
          fmt2(r.balanceTotal),
          r.type || 'S',
        ]);
      }
      bodyRows.push([
        '',
        fmt2(summaryReportData.grandTotals.sAmount),
        summaryReportData.grandTotals.lAmount > 0 ? String(summaryReportData.grandTotals.lAmount) : '',
        fmt2(summaryReportData.grandTotals.balanceTotal),
        '',
      ]);
    } else if (tabName === 'matrix') {
      title = 'Period Matrix Report (12:00 & 04:00)';
      head = [['Date', 'Agent', '12:00 Net', '04:00 Net', 'Total Net', 'Type']];
      for (const ag of matrixData) {
        for (const d of ag.dates) {
          bodyRows.push([
            d.date,
            ag.agentName,
            d.m12.hasData ? fmt2(d.m12.net) : '-',
            d.m04.hasData ? fmt2(d.m04.net) : '-',
            fmt2(d.totalNet),
            d.type,
          ]);
        }
      }
      bodyRows.push(['', 'Grand Total', '', '', fmt2(matrixGrandTotal), '']);
    } else if (tabName === 'byAgent') {
      title = 'Agent Breakdown Report';
      head = [['AgentName', 'Vouchers', 'Sale Amount', 'Com Amt', 'L Amount', 'Win Payout', 'Com + L', 'Balance Total']];
      bodyRows = byAgentGroups.map((g) => [g.agentName, String(g.voucherCount), fmt2(g.saleAmount), fmt2(g.comAmt), String(g.lAmount), fmt2(g.winPayout), fmt2(g.comPlusL), fmt2(g.balanceTotal)]);
      bodyRows.push(['Total', String(totals.vouchers), fmt2(totals.saleAmount), fmt2(totals.comAmt), String(totals.lAmount), fmt2(totals.winPayout), fmt2(totals.comPlusL), fmt2(totals.balanceTotal)]);
    } else {
      title = 'Detailed Slip Logs Report';
      head = [['SrNo', 'AgentName', 'Sale Amount', 'Com Rate', 'Com Amt', 'L Amount', '*', 'Rate', '=', 'Win Payout', 'Com + L', 'Balance Total']];
      bodyRows = detailedRows.map((r) => [String(r.srNo), r.agentName, fmt2(r.saleAmount), String(r.comRate), fmt2(r.comAmt), String(r.lAmount), '*', String(r.rate), '=', fmt2(r.winPayout), fmt2(r.comPlusL), fmt2(r.balanceTotal)]);
    }

    const dateRangeLabel = `${dates.from} to ${dates.to}`;
    const pdfBlob = buildReportPdf({
      title,
      subtitle: `Date Range: ${dateRangeLabel}`,
      sections: [{ head, rows: bodyRows }],
      orientation: 'portrait',
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
              Select Day, Week, or Month to inspect session settlements and summary totals
            </p>
          </div>

          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={() => exportCsv(activeTab)}
              className="px-3.5 py-1.5 text-xs font-semibold bg-slate-800 text-slate-200 border border-slate-700 rounded-lg hover:bg-slate-700 hover:text-white transition cursor-pointer"
            >
              Export CSV
            </button>
            <button
              type="button"
              onClick={() => exportPdf(activeTab)}
              className="px-3.5 py-1.5 text-xs font-semibold bg-indigo-600 text-white rounded-lg hover:bg-indigo-500 shadow transition cursor-pointer"
            >
              Export PDF
            </button>
          </div>
        </div>

        {/* Date Selection Filter Toolbar */}
        <div className="flex flex-wrap items-center gap-3 pt-3 border-t border-slate-800 text-sm">
          {/* Preset Mode Buttons */}
          <div className="flex items-center bg-slate-800 p-1 rounded-xl border border-slate-700">
            <button
              type="button"
              onClick={() => setPeriodType('daily')}
              className={`px-3 py-1.5 text-xs font-bold rounded-lg transition cursor-pointer ${
                periodType === 'daily' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              📅 Day
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('weekly')}
              className={`px-3 py-1.5 text-xs font-bold rounded-lg transition cursor-pointer ${
                periodType === 'weekly' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              📅 Week
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('monthly')}
              className={`px-3 py-1.5 text-xs font-bold rounded-lg transition cursor-pointer ${
                periodType === 'monthly' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              🗓️ Month
            </button>
            <button
              type="button"
              onClick={() => setPeriodType('custom')}
              className={`px-3 py-1.5 text-xs font-bold rounded-lg transition cursor-pointer ${
                periodType === 'custom' ? 'bg-indigo-600 text-white shadow' : 'text-slate-300 hover:text-white'
              }`}
            >
              ✏️ Custom
            </button>
          </div>

          {/* Conditional Date Selection Controls Based on Mode */}
          {periodType === 'daily' && (
            <div className="flex items-center gap-1.5 bg-slate-800/90 px-3 py-1.5 rounded-xl border border-slate-700">
              <button
                type="button"
                onClick={() => handleDayShift(-1)}
                className="px-2 py-0.5 text-xs bg-slate-700 hover:bg-slate-600 text-slate-200 rounded cursor-pointer font-bold"
                title="Previous Day"
              >
                ◀ Prev
              </button>
              <input
                type="date"
                value={selectedDay}
                onChange={(e) => setSelectedDay(e.target.value)}
                className="px-2.5 py-1 text-xs bg-slate-900 border border-slate-600 rounded-md text-white font-mono focus:outline-none focus:border-indigo-500 font-bold"
              />
              <button
                type="button"
                onClick={() => setSelectedDay(todayStr)}
                className="px-2 py-0.5 text-xs bg-indigo-600/80 hover:bg-indigo-600 text-white rounded cursor-pointer font-semibold"
              >
                Today
              </button>
              <button
                type="button"
                onClick={() => handleDayShift(1)}
                className="px-2 py-0.5 text-xs bg-slate-700 hover:bg-slate-600 text-slate-200 rounded cursor-pointer font-bold"
                title="Next Day"
              >
                Next ▶
              </button>
            </div>
          )}

          {periodType === 'weekly' && (
            <div className="flex items-center gap-2 bg-slate-800/90 px-3 py-1.5 rounded-xl border border-slate-700">
              <button
                type="button"
                onClick={() => setWeekType('thisWeek')}
                className={`px-2.5 py-1 text-xs font-bold rounded cursor-pointer ${
                  weekType === 'thisWeek' ? 'bg-indigo-600 text-white' : 'bg-slate-700 text-slate-300 hover:bg-slate-600'
                }`}
              >
                This Week (Mon-Sun)
              </button>
              <button
                type="button"
                onClick={() => setWeekType('lastWeek')}
                className={`px-2.5 py-1 text-xs font-bold rounded cursor-pointer ${
                  weekType === 'lastWeek' ? 'bg-indigo-600 text-white' : 'bg-slate-700 text-slate-300 hover:bg-slate-600'
                }`}
              >
                Last Week
              </button>
              <span className="text-xs font-mono text-slate-300 ml-1">
                {dates.from} ~ {dates.to}
              </span>
            </div>
          )}

          {periodType === 'monthly' && (
            <div className="flex items-center gap-2 bg-slate-800/90 px-3 py-1.5 rounded-xl border border-slate-700">
              <span className="text-xs font-medium text-slate-400">Month:</span>
              <select
                value={selectedMonth}
                onChange={(e) => setSelectedMonth(e.target.value)}
                className="px-2.5 py-1 text-xs bg-slate-900 border border-slate-600 rounded-md text-white font-bold focus:outline-none focus:border-indigo-500"
              >
                {MONTH_NAMES.map((m) => (
                  <option key={m.value} value={m.value}>
                    {m.label}
                  </option>
                ))}
              </select>

              <span className="text-xs font-medium text-slate-400">Year:</span>
              <select
                value={selectedYear}
                onChange={(e) => setSelectedYear(parseInt(e.target.value, 10))}
                className="px-2.5 py-1 text-xs bg-slate-900 border border-slate-600 rounded-md text-white font-mono font-bold focus:outline-none focus:border-indigo-500"
              >
                {[currentYear, currentYear - 1, currentYear - 2].map((y) => (
                  <option key={y} value={y}>
                    {y}
                  </option>
                ))}
              </select>
              <span className="text-xs font-mono text-slate-400 ml-1">
                ({dates.from} ~ {dates.to})
              </span>
            </div>
          )}

          {periodType === 'custom' && (
            <div className="flex items-center gap-2 bg-slate-800/80 px-3 py-1.5 rounded-xl border border-slate-700">
              <span className="text-xs font-medium text-slate-400">From:</span>
              <input
                type="date"
                value={dates.from}
                onChange={(e) => handleCustomDateChange('from', e.target.value)}
                className="px-2 py-1 text-xs bg-slate-900 border border-slate-700 rounded-md text-white font-mono focus:outline-none focus:border-indigo-500"
              />
              <span className="text-xs font-medium text-slate-400">To:</span>
              <input
                type="date"
                value={dates.to}
                onChange={(e) => handleCustomDateChange('to', e.target.value)}
                className="px-2 py-1 text-xs bg-slate-900 border border-slate-700 rounded-md text-white font-mono focus:outline-none focus:border-indigo-500"
              />
            </div>
          )}

          {/* Session Slot Filter & Agent Filter */}
          <div className="flex flex-wrap items-center gap-2.5 ml-auto">
            <div className="flex items-center gap-1.5">
              <span className="text-xs font-medium text-slate-400">Slot:</span>
              <select
                value={selectedSlot}
                onChange={(e) => {
                  const val = e.target.value;
                  setSelectedSlot(val);
                  loadReportData(dates.from, dates.to, selectedAgent, val);
                }}
                className="px-3 py-1.5 text-xs border border-slate-700 bg-slate-800 text-white rounded-xl focus:outline-none focus:border-indigo-500 font-semibold"
              >
                <option value="">🌅 All Sessions</option>
                <option value="12:00">☀️ 12:00 PM</option>
                <option value="04:00">🌆 04:30 PM</option>
                <option value="09:00">🌅 09:30 AM</option>
              </select>
            </div>

            <div className="flex items-center gap-1.5">
              <span className="text-xs font-medium text-slate-400">Agent:</span>
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
            onClick={() => setActiveTab('summary')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition cursor-pointer ${
              activeTab === 'summary'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            📋 Report (Format 1)
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('matrix')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition cursor-pointer ${
              activeTab === 'matrix'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            📊 Report (Format 2)
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('byAgent')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition cursor-pointer ${
              activeTab === 'byAgent'
                ? 'border-indigo-600 text-indigo-600 bg-white rounded-t-xl shadow-sm'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            👤 Agent Breakdown
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('details')}
            className={`px-4 py-2.5 text-xs font-bold uppercase tracking-wider border-b-2 transition cursor-pointer ${
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
              {/* TAB 1: FORMAT 1 REPORT (Matching Screenshot Design) */}
              {activeTab === 'summary' && (
                <div className="max-w-4xl mx-auto space-y-6">
                  <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 sm:p-8 shadow-xs space-y-4 font-sans">
                    {/* Header matching screenshot: Period Report (date range) on left, X Vouchers on right */}
                    <div className="flex flex-wrap items-center justify-between gap-4 pb-1">
                      <h2 className="text-base font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
                        Period Report ({dates.from} ~ {dates.to})
                      </h2>
                      <div className="text-xs font-semibold text-slate-500 dark:text-slate-400">
                        {detailedRows.length} Vouchers
                      </div>
                    </div>

                    {/* Table matching screenshot */}
                    <div className="overflow-x-auto">
                      <table className="w-full text-xs text-left border-collapse">
                        <thead>
                          <tr className="border-t border-b border-slate-900 dark:border-slate-100 text-slate-900 dark:text-slate-100 font-bold text-xs">
                            <th className="py-3 px-4 text-left w-1/4">Name</th>
                            <th className="py-3 px-4 text-right w-1/4">Amount</th>
                            <th className="py-3 px-4 text-right w-1/5">Lucky</th>
                            <th className="py-3 px-4 text-right w-1/4">Total</th>
                            <th className="py-3 px-4 text-center w-12">Type</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-100 dark:divide-slate-800/60 text-xs">
                          {summaryReportData.rows.length === 0 ? (
                            <tr>
                              <td colSpan={5} className="py-8 text-center text-slate-400">
                                No records found for selected period
                              </td>
                            </tr>
                          ) : (
                            summaryReportData.rows.map((r, idx) => (
                              <tr key={`${r.agentName}_${idx}`} className="hover:bg-slate-50 dark:hover:bg-slate-800/40 transition">
                                <td className="py-2.5 px-4 font-semibold text-slate-900 dark:text-slate-100">
                                  {r.agentName}
                                </td>
                                <td className="py-2.5 px-4 text-right font-mono font-bold text-slate-900 dark:text-slate-100">
                                  {fmt2(r.sAmount)}
                                </td>
                                <td className="py-2.5 px-4 text-right font-mono text-slate-800 dark:text-slate-200">
                                  {r.lAmount > 0 ? fmt2(r.lAmount) : ''}
                                </td>
                                <td className={`py-2.5 px-4 text-right font-mono font-bold ${r.balanceTotal < 0 ? 'text-rose-600 dark:text-rose-400' : 'text-slate-900 dark:text-slate-100'}`}>
                                  {fmt2(r.balanceTotal)}
                                </td>
                                <td className="py-2.5 px-4 text-center font-semibold text-slate-600 dark:text-slate-400">
                                  {r.type || (r.isBuy ? 'B' : 'S')}
                                </td>
                              </tr>
                            ))
                          )}

                          {/* Grand Total Row with double underline */}
                          <tr className="border-t border-slate-900 dark:border-slate-100 font-extrabold text-sm">
                            <td className="py-4 px-4"></td>
                            <td className="py-4 px-4 text-right font-mono font-black text-slate-900 dark:text-slate-100">
                              {fmt2(summaryReportData.grandTotals.sAmount)}
                            </td>
                            <td className="py-4 px-4 text-right font-mono font-black text-slate-900 dark:text-slate-100">
                              {summaryReportData.grandTotals.lAmount > 0 ? fmt2(summaryReportData.grandTotals.lAmount) : ''}
                            </td>
                            <td className="py-4 px-4 text-right">
                              <span className={`inline-block font-mono font-black text-base border-b-4 border-double pb-0.5 ${
                                summaryReportData.grandTotals.balanceTotal < 0
                                  ? 'text-rose-600 border-rose-600 dark:text-rose-400 dark:border-rose-400'
                                  : 'text-slate-900 border-slate-900 dark:text-slate-100 dark:border-slate-100'
                              }`}>
                                {fmt2(summaryReportData.grandTotals.balanceTotal)}
                              </span>
                            </td>
                            <td className="py-4 px-4"></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              )}

              {/* TAB 2: FORMAT 2 REPORT (Matching Screenshot Design - 12:00 and 04:00) */}
              {activeTab === 'matrix' && (
                <div className="max-w-5xl mx-auto space-y-6 font-sans">
                  <div className="bg-white border border-slate-900 rounded-sm overflow-x-auto shadow-xs">
                    <table className="w-full text-xs text-left border-collapse min-w-[750px]">
                      <thead>
                        {/* Tier 1 Header */}
                        <tr className="border-t border-b border-slate-900 bg-slate-50 font-bold text-slate-900 text-center">
                          <th rowSpan={2} className="border-r border-slate-300 py-2.5 px-3 w-28 text-left">
                            Date
                          </th>
                          <th colSpan={3} className="border-r border-slate-300 py-1.5 px-2">
                            12:00
                          </th>
                          <th colSpan={3} className="border-r border-slate-300 py-1.5 px-2">
                            04:00
                          </th>
                          <th rowSpan={2} className="border-r border-slate-300 py-2.5 px-3 text-right w-28">
                            Total
                          </th>
                          <th rowSpan={2} className="py-2.5 px-2 text-center w-8"></th>
                        </tr>
                        {/* Tier 2 Header */}
                        <tr className="border-b border-slate-900 bg-slate-50 font-bold text-slate-800 text-xs">
                          {/* 12:00 */}
                          <th className="border-r border-slate-200 py-1 px-2 text-right">Amount</th>
                          <th className="border-r border-slate-200 py-1 px-2 text-right">Lucky</th>
                          <th className="border-r border-slate-300 py-1 px-2 text-right"></th>

                          {/* 04:00 */}
                          <th className="border-r border-slate-200 py-1 px-2 text-right">Amount</th>
                          <th className="border-r border-slate-200 py-1 px-2 text-right">Lucky</th>
                          <th className="border-r border-slate-300 py-1 px-2 text-right"></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-200">
                        {matrixData.length === 0 ? (
                          <tr>
                            <td colSpan={9} className="py-8 text-center text-slate-400">
                              No records found for selected period
                            </td>
                          </tr>
                        ) : (
                          matrixData.map((agentGroup) => (
                            <React.Fragment key={agentGroup.agentName}>
                              {/* Agent Header Banner */}
                              <tr className="bg-slate-100/70 border-t border-b border-slate-300 font-bold text-slate-900">
                                <td colSpan={9} className="py-1.5 px-3">
                                  Name : <span className="ml-2 font-extrabold">{agentGroup.agentName}</span>
                                </td>
                              </tr>

                              {/* Daily Rows */}
                              {agentGroup.dates.map((row) => (
                                <tr key={row.date} className="hover:bg-slate-50 transition">
                                  <td className="py-1.5 px-3 border-r border-slate-200 font-mono text-slate-900">
                                    {row.date}
                                  </td>

                                  {/* 12:00 */}
                                  <td className="py-1.5 px-2 border-r border-slate-200 text-right font-mono text-slate-800">
                                    {row.m12.hasData && row.m12.amount ? fmt2(row.m12.amount) : ''}
                                  </td>
                                  <td className="py-1.5 px-2 border-r border-slate-200 text-right font-mono text-slate-700">
                                    {row.m12.hasData && row.m12.lucky > 0 ? fmt2(row.m12.lucky) : ''}
                                  </td>
                                  <td className={`py-1.5 px-2 border-r border-slate-300 text-right font-mono font-bold ${row.m12.net < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                    {row.m12.hasData ? fmt2(row.m12.net) : ''}
                                  </td>

                                  {/* 04:00 */}
                                  <td className="py-1.5 px-2 border-r border-slate-200 text-right font-mono text-slate-800">
                                    {row.m04.hasData && row.m04.amount ? fmt2(row.m04.amount) : ''}
                                  </td>
                                  <td className="py-1.5 px-2 border-r border-slate-200 text-right font-mono text-slate-700">
                                    {row.m04.hasData && row.m04.lucky > 0 ? fmt2(row.m04.lucky) : ''}
                                  </td>
                                  <td className={`py-1.5 px-2 border-r border-slate-300 text-right font-mono font-bold ${row.m04.net < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                    {row.m04.hasData ? fmt2(row.m04.net) : ''}
                                  </td>

                                  {/* Total */}
                                  <td className={`py-1.5 px-3 border-r border-slate-300 text-right font-mono font-bold ${row.totalNet < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                    {fmt2(row.totalNet)}
                                  </td>
                                  <td className="py-1.5 px-2 text-center text-xs font-semibold text-slate-700">
                                    {row.type || 'S'}
                                  </td>
                                </tr>
                              ))}

                              {/* Agent Total Row */}
                              <tr className="border-t border-b border-slate-300 font-bold text-slate-900 bg-slate-50/50">
                                <td colSpan={7} className="py-2 px-3 text-right">
                                  {agentGroup.agentName} <span className="ml-1">Total:</span>
                                </td>
                                <td className={`py-2 px-3 border-r border-slate-300 text-right font-mono font-black ${agentGroup.agentTotalNet < 0 ? 'text-rose-600' : 'text-slate-900'}`}>
                                  {fmt2(agentGroup.agentTotalNet)}
                                </td>
                                <td className="py-2 px-2"></td>
                              </tr>
                            </React.Fragment>
                          ))
                        )}

                        {/* Overall Grand Total Row with double underline */}
                        {matrixData.length > 0 && (
                          <tr className="bg-white border-t-2 border-slate-900 font-extrabold text-sm text-slate-900">
                            <td colSpan={7} className="py-3 px-3 text-right">
                              Grand Total:
                            </td>
                            <td className="py-3 px-3 text-right">
                              <span className={`inline-block font-mono font-black text-base border-b-4 border-double pb-0.5 ${
                                matrixGrandTotal < 0 ? 'text-rose-600 border-rose-600' : 'text-slate-900 border-slate-900'
                              }`}>
                                {fmt2(matrixGrandTotal)}
                              </span>
                            </td>
                            <td className="py-3 px-2"></td>
                          </tr>
                        )}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}

              {/* TAB 3: AGENT BREAKDOWN */}
              {activeTab === 'byAgent' && (
                <div className="border border-slate-200 rounded-xl overflow-hidden shadow-sm font-mono">
                  <table className="w-full text-xs text-left border-collapse">
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

              {/* TAB 4: SLIP LOGS */}
              {activeTab === 'details' && (
                <div className="border border-slate-200 rounded-xl overflow-x-auto shadow-sm font-mono">
                  <table className="w-full text-xs text-left border-collapse min-w-[850px]">
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
