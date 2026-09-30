'use client';
import { useMemo, useState, Fragment } from 'react';

const NUMBER_TABLE_COLUMNS = 4;

function buildNumberTable(numbersFlat) {
  const groupSize = Math.ceil(numbersFlat.length / NUMBER_TABLE_COLUMNS);
  const groups = Array.from({ length: NUMBER_TABLE_COLUMNS }, (_, g) =>
    numbersFlat.slice(g * groupSize, (g + 1) * groupSize)
  );
  const rows = Math.max(...groups.map(g => g.length), 0);
  return Array.from({ length: rows }, (_, r) => groups.map(g => g[r] ?? null));
}

export default function MixedLedgerGrid({
  totals = {},
  buyTotals = {},
  limitValue = 0,
  isLimitActive = true,
  rateValue = 0,
  hotSet = new Set(),
  notBuySet = new Set(),
  luckyNo = null,
  handleCellClick,
  shortcuts = {},
  formatCombo = (x) => x,
  t = (k) => k,
}) {
  const [gridSortKey, setGridSortKey] = useState('number'); // 'number' | 'net' | 'sale' | 'buy'
  const [gridSortDir, setGridSortDir] = useState('asc');

  function toggleGridSort(key) {
    if (gridSortKey === key) {
      setGridSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setGridSortKey(key);
      setGridSortDir(key === 'number' ? 'asc' : 'desc');
    }
  }

  const allNumbers = useMemo(() => {
    return Array.from({ length: 100 }, (_, i) => String(i).padStart(2, '0'));
  }, []);

  const itemsMap = useMemo(() => {
    const map = {};
    for (let i = 0; i <= 99; i++) {
      const num = String(i).padStart(2, '0');
      const sale = totals?.[num] || 0;
      const buy = buyTotals?.[num] || 0;
      const net = sale - buy;
      const isHot = hotSet.has(num);
      const isNotBuy = notBuySet.has(num);
      const isLucky = luckyNo === num;
      const isOverLimit = isLimitActive && limitValue > 0 && net > limitValue;
      map[num] = {
        num,
        sale,
        buy,
        net,
        isHot,
        isNotBuy,
        isLucky,
        isOverLimit,
      };
    }
    return map;
  }, [totals, buyTotals, hotSet, notBuySet, luckyNo, isLimitActive, limitValue]);

  const sortedNumbers = useMemo(() => {
    const list = [...allNumbers];
    list.sort((a, b) => {
      const itemA = itemsMap[a];
      const itemB = itemsMap[b];
      let cmp = 0;
      if (gridSortKey === 'net') cmp = itemA.net - itemB.net;
      else if (gridSortKey === 'sale') cmp = itemA.sale - itemB.sale;
      else if (gridSortKey === 'buy') cmp = itemA.buy - itemB.buy;
      else cmp = a.localeCompare(b);
      return gridSortDir === 'asc' ? cmp : -cmp;
    });
    return list;
  }, [allNumbers, itemsMap, gridSortKey, gridSortDir]);

  const numberTable = useMemo(() => buildNumberTable(sortedNumbers), [sortedNumbers]);

  const summaryStats = useMemo(() => {
    let totalSale = 0;
    let totalBuy = 0;
    let totalNet = 0;
    let highestLiabilityItem = null;
    let maxNet = -Infinity;

    for (let i = 0; i <= 99; i++) {
      const num = String(i).padStart(2, '0');
      const s = totals?.[num] || 0;
      const b = buyTotals?.[num] || 0;
      const n = s - b;
      totalSale += s;
      totalBuy += b;
      totalNet += n;

      if (n > maxNet) {
        maxNet = n;
        highestLiabilityItem = { num, net: n, sale: s, buy: b };
      }
    }

    const maxLiability =
      highestLiabilityItem && highestLiabilityItem.net > 0
        ? highestLiabilityItem.net * (rateValue || 0)
        : 0;

    return {
      totalSale,
      totalBuy,
      totalNet,
      highestLiabilityItem,
      maxLiability,
    };
  }, [totals, buyTotals, rateValue]);

  function handleExportCsv() {
    const rows = [['Number', 'Net Amount', 'Sale', 'Buy']];
    for (let i = 0; i <= 99; i++) {
      const num = String(i).padStart(2, '0');
      const item = itemsMap[num];
      rows.push([num, item.net, item.sale, item.buy]);
    }
    const csvContent = 'data:text/csv;charset=utf-8,' + rows.map(e => e.join(',')).join('\n');
    const encodedUri = encodeURI(csvContent);
    const link = document.createElement('a');
    link.setAttribute('href', encodedUri);
    link.setAttribute('download', `mixed_ledger_${new Date().toISOString().slice(0, 10)}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }

  return (
    <div className="flex-1 min-h-0 overflow-hidden flex flex-col">
      {/* Controls Bar: Sorts & Export */}
      <div className="flex items-center justify-between mb-2 shrink-0">
        <div className="flex items-center gap-1">
          <span className="text-[10px] text-gray-500 font-semibold uppercase tracking-wider mr-1">Sort:</span>
          <button
            type="button"
            onClick={() => toggleGridSort('number')}
            className={`text-[10px] font-bold px-1.5 py-0.5 rounded transition flex items-center gap-0.5 cursor-pointer ${
              gridSortKey === 'number'
                ? 'bg-indigo-600 text-white shadow-xs'
                : 'text-gray-600 hover:text-gray-900 bg-gray-100 hover:bg-gray-200'
            }`}
            title={`Sort by Number (${shortcuts.sortGridNum ? formatCombo(shortcuts.sortGridNum) : 'Alt+4'})`}
          >
            Num {gridSortKey === 'number' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
          </button>
          <button
            type="button"
            onClick={() => toggleGridSort('net')}
            className={`text-[10px] font-bold px-1.5 py-0.5 rounded transition flex items-center gap-0.5 cursor-pointer ${
              gridSortKey === 'net'
                ? 'bg-purple-600 text-white shadow-xs'
                : 'text-gray-600 hover:text-gray-900 bg-gray-100 hover:bg-gray-200'
            }`}
            title="Sort by Net Existing Amount"
          >
            Net Amount {gridSortKey === 'net' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
          </button>
          <button
            type="button"
            onClick={() => toggleGridSort('sale')}
            className={`text-[10px] font-bold px-1.5 py-0.5 rounded transition flex items-center gap-0.5 cursor-pointer ${
              gridSortKey === 'sale'
                ? 'bg-blue-600 text-white shadow-xs'
                : 'text-gray-600 hover:text-gray-900 bg-gray-100 hover:bg-gray-200'
            }`}
            title="Sort by Gross Sale"
          >
            Sale {gridSortKey === 'sale' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
          </button>
          <button
            type="button"
            onClick={() => toggleGridSort('buy')}
            className={`text-[10px] font-bold px-1.5 py-0.5 rounded transition flex items-center gap-0.5 cursor-pointer ${
              gridSortKey === 'buy'
                ? 'bg-emerald-600 text-white shadow-xs'
                : 'text-gray-600 hover:text-gray-900 bg-gray-100 hover:bg-gray-200'
            }`}
            title="Sort by Buy Offload"
          >
            Buy {gridSortKey === 'buy' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
          </button>
        </div>

        <button
          type="button"
          onClick={handleExportCsv}
          className="text-[10px] px-1.5 py-0.5 bg-indigo-50 border border-indigo-200 text-indigo-700 font-medium rounded hover:bg-indigo-100 transition flex items-center gap-0.5 cursor-pointer"
          title="Export Mixed Ledger CSV"
        >
          <span>📥</span> CSV
        </button>
      </div>

      {/* 4-Column Table Grid matching Classic Layout */}
      <div className="flex-1 min-h-0 overflow-hidden flex flex-col">
        <table className="w-full h-full text-base border border-collapse border-gray-200 table-fixed">
          <colgroup>
            <col className="w-[10%]" />
            <col className="w-[15%]" />
            <col className="w-[10%]" />
            <col className="w-[15%]" />
            <col className="w-[10%]" />
            <col className="w-[15%]" />
            <col className="w-[10%]" />
            <col className="w-[15%]" />
          </colgroup>
          <tbody className="h-full">
            {numberTable.map((row, rowIdx) => (
              <tr key={rowIdx}>
                {row.map((num, colIdx) => {
                  if (num === null) {
                    return <td key={colIdx} colSpan={2} className="border border-gray-200" />;
                  }

                  const item = itemsMap[num] || {
                    num,
                    sale: 0,
                    buy: 0,
                    net: 0,
                    isHot: false,
                    isNotBuy: false,
                    isLucky: false,
                    isOverLimit: false,
                  };

                  const hasValues = item.sale > 0 || item.buy > 0;

                  let cls = 'bg-gray-50 text-gray-600';
                  let amountCls = 'text-gray-700';

                  if (item.isLucky) {
                    cls = 'bg-red-600 text-white';
                    amountCls = 'bg-red-600 text-white';
                  } else if (item.isOverLimit) {
                    cls = 'bg-purple-500 text-white';
                    amountCls = 'bg-purple-500 text-white';
                  } else if (item.net > 0) {
                    cls = 'bg-green-500 text-white';
                    amountCls = 'text-gray-700 font-semibold';
                  } else if (item.net < 0) {
                    cls = 'bg-blue-600 text-white';
                    amountCls = 'text-blue-700 font-bold';
                  } else if (hasValues && item.net === 0) {
                    cls = 'bg-gray-400 text-white';
                    amountCls = 'text-gray-500 font-medium';
                  } else if (item.isNotBuy) {
                    cls = 'bg-gray-300 text-gray-500';
                  } else if (item.isHot) {
                    cls = 'bg-yellow-300 text-yellow-900';
                  }

                  const displayValue = hasValues ? item.net.toLocaleString() : '';

                  return (
                    <Fragment key={colIdx}>
                      {/* Number Cell */}
                      <td
                        onClick={() => handleCellClick?.(num)}
                        title={`[${num}] Net: ${item.net.toLocaleString()} (Sale: ${item.sale.toLocaleString()} | Buy: ${item.buy.toLocaleString()})${
                          item.isLucky ? ' — 🎯' : ''
                        }`}
                        className={`px-0.5 py-0.5 text-xs font-mono font-semibold text-center cursor-pointer hover:opacity-90 transition border border-gray-200 ${cls}`}
                      >
                        {num}
                      </td>

                      {/* Existing Net Amount Cell */}
                      <td
                        className={`px-1 py-0.5 text-xs text-right font-mono whitespace-nowrap border border-gray-200 ${amountCls}`}
                        title={hasValues ? `Sale: ${item.sale.toLocaleString()} | Buy: ${item.buy.toLocaleString()} | Net: ${item.net.toLocaleString()}` : ''}
                      >
                        {displayValue}
                      </td>
                    </Fragment>
                  );
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Bottom stat row for Mixed Ledger */}
      <div className="grid grid-cols-4 gap-1.5 mt-2 shrink-0">
        <div
          className="col-span-1 bg-orange-500 text-white rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate"
          title={
            summaryStats.highestLiabilityItem && summaryStats.highestLiabilityItem.net > 0
              ? `Top Net [${summaryStats.highestLiabilityItem.num}] = ${summaryStats.highestLiabilityItem.net.toLocaleString()} × ${rateValue || 0} = ${summaryStats.maxLiability.toLocaleString()}`
              : ''
          }
        >
          {summaryStats.highestLiabilityItem && summaryStats.highestLiabilityItem.net > 0 ? (
            `Top [${summaryStats.highestLiabilityItem.num}] = ${summaryStats.highestLiabilityItem.net.toLocaleString()}`
          ) : (
            '—'
          )}
        </div>

        <div
          className="col-span-1 bg-blue-100 text-blue-900 rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate"
          title={`Total Gross Sale: ${summaryStats.totalSale.toLocaleString()}`}
        >
          <span className="text-[10px] text-blue-600 font-bold mr-1">Sale:</span>
          {summaryStats.totalSale.toLocaleString()}
        </div>

        <div
          className="col-span-1 bg-emerald-100 text-emerald-900 rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate"
          title={`Total Buy Offload: ${summaryStats.totalBuy.toLocaleString()}`}
        >
          <span className="text-[10px] text-emerald-600 font-bold mr-1">Buy:</span>
          {summaryStats.totalBuy.toLocaleString()}
        </div>

        <div
          className="col-span-1 bg-purple-100 text-purple-900 rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate"
          title={`Total Net Retained: ${summaryStats.totalNet.toLocaleString()}`}
        >
          <span className="text-[10px] text-purple-600 font-bold mr-1">Net:</span>
          {summaryStats.totalNet.toLocaleString()}
        </div>
      </div>
    </div>
  );
}
