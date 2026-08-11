'use client';
import { useState, useMemo } from 'react';

export default function BuyVoucherModal({ orgId, activeSession, exceedList, onClose, onSuccess, canWrite }) {
  const [selectedMap, setSelectedMap] = useState(() => {
    const initial = {};
    for (const item of exceedList) {
      initial[item.num] = true;
    }
    return initial;
  });

  const [buyAmountMap, setBuyAmountMap] = useState(() => {
    const initial = {};
    for (const item of exceedList) {
      initial[item.num] = String(item.excess);
    }
    return initial;
  });

  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState('');

  const allSelected = useMemo(() => {
    return exceedList.length > 0 && exceedList.every(item => selectedMap[item.num]);
  }, [exceedList, selectedMap]);

  function toggleSelectAll() {
    const nextState = !allSelected;
    const nextMap = {};
    for (const item of exceedList) {
      nextMap[item.num] = nextState;
    }
    setSelectedMap(nextMap);
  }

  function toggleItem(num) {
    setSelectedMap(prev => ({ ...prev, [num]: !prev[num] }));
  }

  function handleAmountChange(num, val) {
    const clean = val.replace(/[^0-9]/g, '');
    setBuyAmountMap(prev => ({ ...prev, [num]: clean }));
  }

  const selectedItems = useMemo(() => {
    const list = [];
    for (const item of exceedList) {
      if (selectedMap[item.num]) {
        const amt = parseFloat(buyAmountMap[item.num]) || 0;
        if (amt > 0) {
          list.push({ num: item.num, amount: amt });
        }
      }
    }
    return list;
  }, [exceedList, selectedMap, buyAmountMap]);

  const totalBuyAmount = useMemo(() => {
    return selectedItems.reduce((sum, item) => sum + item.amount, 0);
  }, [selectedItems]);

  async function handleSubmit() {
    setError('');
    if (!canWrite) {
      setError('Read-only session: cannot submit buy voucher');
      return;
    }
    if (!activeSession) {
      setError('No active session');
      return;
    }
    if (selectedItems.length === 0) {
      setError('Please select at least one number with a valid buy amount');
      return;
    }

    setSubmitting(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger/buy-voucher`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          onCount: activeSession.onCount,
          ampm: activeSession.ampm,
          onDate: activeSession.onDate,
          machineId: activeSession.machineId,
          items: selectedItems,
        }),
      });

      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Failed to create Buy Voucher');
        return;
      }

      if (onSuccess) onSuccess(selectedItems);
      onClose();
    } catch {
      setError('Network error: failed to submit buy voucher');
    } finally {
      setSubmitting(false);
    }
  }

  return (
    <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-xl shadow-2xl max-w-lg w-full border border-gray-200 overflow-hidden flex flex-col max-h-[85vh] animate-in fade-in zoom-in duration-150">
        {/* Header */}
        <div className="px-5 py-3.5 border-b border-gray-100 bg-gradient-to-r from-slate-900 via-slate-800 to-indigo-950 text-white flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-lg">🛒</span>
            <div>
              <h3 className="text-sm font-semibold">Buy Voucher / Exceed Offload</h3>
              <p className="text-[11px] text-slate-300">အဝယ်စာရင်း ထုတ်မည် (အပိုထွက်သမျှ လျှော့မည်)</p>
            </div>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="text-slate-400 hover:text-white text-lg font-bold px-2"
          >
            ✕
          </button>
        </div>

        {/* Body — Table */}
        <div className="p-4 flex-1 overflow-y-auto space-y-3">
          <div className="border border-gray-200 rounded-lg overflow-hidden">
            <table className="w-full text-xs text-left border-collapse">
              <thead className="bg-slate-100 text-slate-700 font-semibold border-b border-gray-200">
                <tr>
                  <th className="p-2.5 w-10 text-center">
                    <input
                      type="checkbox"
                      checked={allSelected}
                      onChange={toggleSelectAll}
                      className="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer"
                    />
                  </th>
                  <th className="p-2.5 w-16">Number</th>
                  <th className="p-2.5 text-right">Excess (အပို)</th>
                  <th className="p-2.5 w-32 text-right">Buy Amount (အဝယ်)</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 font-mono">
                {exceedList.map(item => {
                  const isChecked = !!selectedMap[item.num];
                  return (
                    <tr
                      key={item.num}
                      className={`hover:bg-indigo-50/50 transition ${isChecked ? 'bg-white' : 'bg-gray-50/60 opacity-60'}`}
                    >
                      <td className="p-2.5 text-center">
                        <input
                          type="checkbox"
                          checked={isChecked}
                          onChange={() => toggleItem(item.num)}
                          className="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer"
                        />
                      </td>
                      <td className="p-2.5 font-bold text-slate-900">
                        <span className="px-2 py-0.5 rounded bg-slate-100 border border-slate-200">
                          {item.num}
                        </span>
                      </td>
                      <td className="p-2.5 text-right text-purple-700 font-semibold">
                        {item.excess.toLocaleString()}
                      </td>
                      <td className="p-2 text-right">
                        <input
                          type="text"
                          value={buyAmountMap[item.num] ?? ''}
                          onChange={e => handleAmountChange(item.num, e.target.value)}
                          disabled={!isChecked}
                          placeholder="Amount"
                          className="w-full px-2 py-1 text-xs font-mono text-right border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-indigo-500 disabled:bg-gray-100"
                        />
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>

          {error && <p className="text-xs text-red-600 bg-red-50 rounded-lg px-3 py-2 border border-red-200">{error}</p>}
        </div>

        {/* Footer Summary */}
        <div className="px-5 py-3 bg-slate-50 border-t border-gray-200 flex items-center justify-between shrink-0">
          <div className="text-xs font-mono">
            <span className="text-gray-500">Selected: </span>
            <span className="font-bold text-indigo-600">{selectedItems.length}</span>
            <span className="text-gray-400 mx-1.5">|</span>
            <span className="text-gray-500">Total Buy: </span>
            <span className="font-bold text-emerald-600 text-sm">{totalBuyAmount.toLocaleString()}</span>
          </div>

          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={onClose}
              disabled={submitting}
              className="px-3.5 py-2 text-xs font-medium border border-gray-300 rounded-lg hover:bg-gray-100 transition"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={handleSubmit}
              disabled={submitting || selectedItems.length === 0}
              className="px-4 py-2 text-xs font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg transition disabled:opacity-50 flex items-center gap-1.5 shadow-sm"
            >
              {submitting ? 'Creating...' : 'Create Buy Voucher (သိမ်းမည်)'}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
