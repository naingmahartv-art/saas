'use client';
import { useState, useEffect, useCallback } from 'react';
import BuyEntry from './BuyEntry.js';
import LedgerHistory from '../ledger/LedgerHistory.js';
import SessionPicker from '../ledger/SessionPicker.js';
import ReportsModal from '../ledger/ReportsModal.js';
import useLedgerShortcuts from '@/lib/ledger/useLedgerShortcuts.js';
import useLiveSession from '@/lib/ledger/useLiveSession.js';
import { matchesCombo } from '@/lib/ledger/shortcuts.js';

export default function BuyWorkspace({
  orgId,
  activeSession,
  agents,
  rate,
  limit,
  notBuyNumbers: initialNotBuyNumbers,
  hotNumbers: initialHotNumbers,
  luckyNumber: initialLuckyNumber,
  machines,
  canWrite,
}) {
  const [totals, setTotals] = useState({});
  const [buyTotals, setBuyTotals] = useState({});
  const [luckyNumber, setLuckyNumber] = useState(initialLuckyNumber);
  const [hotNumbers, setHotNumbers] = useState(initialHotNumbers);
  const [notBuyNumbers, setNotBuyNumbers] = useState(initialNotBuyNumbers);
  const [editingVoucher, setEditingVoucher] = useState(null);
  const [refreshSignal, setRefreshSignal] = useState(0);
  const [isHistoryOpen, setIsHistoryOpen] = useState(false);
  const [isReportsOpen, setIsReportsOpen] = useState(false);
  const [isSessionPickerOpen, setIsSessionPickerOpen] = useState(true);
  const { shortcuts, replaceSlash, replaceAsterisk } = useLedgerShortcuts();

  const refreshTotals = useCallback(async () => {
    if (!activeSession) return;
    try {
      const res = await fetch(
        `/api/org/${orgId}/ledger/totals?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}`
      );
      const data = await res.json();
      setTotals(data.totals || {});
      setBuyTotals(data.buyTotals || {});
    } catch {
      // keep last known totals on failure
    }
  }, [orgId, activeSession]);

  useEffect(() => {
    refreshTotals();
  }, [refreshTotals]);

  const live = useLiveSession(orgId, activeSession?.id);
  useEffect(() => {
    if (!live) return;
    setTotals(live.totals || {});
    if (live.buyTotals) setBuyTotals(live.buyTotals);
    setLuckyNumber(live.luckyNumber ?? null);
    setHotNumbers(live.hotNumbers || []);
    setNotBuyNumbers(live.notBuyNumbers || []);
  }, [live]);

  const applyOptimisticBuyTotals = useCallback((buyItems) => {
    setBuyTotals(prev => {
      const next = { ...prev };
      for (const item of buyItems) {
        const amt = parseFloat(item.amount) || 0;
        next[item.num] = (next[item.num] || 0) + amt;
      }
      return next;
    });
  }, []);

  useEffect(() => {
    function handleKeyDown(e) {
      if (shortcuts && matchesCombo(e, shortcuts.history)) {
        e.preventDefault();
        setIsHistoryOpen(open => !open);
      } else if (e.key === 'Escape' && isHistoryOpen) {
        setIsHistoryOpen(false);
      }
    }
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isHistoryOpen, shortcuts]);

  return (
    <div className="w-full px-3 py-3">
      <BuyEntry
        orgId={orgId}
        activeSession={activeSession}
        agents={agents}
        rate={rate}
        limit={limit}
        notBuyNumbers={notBuyNumbers}
        hotNumbers={hotNumbers}
        luckyNumber={luckyNumber}
        totals={totals}
        buyTotals={buyTotals}
        canWrite={canWrite}
        shortcuts={shortcuts}
        replaceSlash={replaceSlash}
        replaceAsterisk={replaceAsterisk}
        onOptimisticBuySave={applyOptimisticBuyTotals}
        onOpenSessionPicker={() => setIsSessionPickerOpen(true)}
      />

      {isSessionPickerOpen && (
        <SessionPicker
          orgId={orgId}
          activeSession={activeSession}
          machines={machines}
          onClose={() => setIsSessionPickerOpen(false)}
        />
      )}

      {isReportsOpen && (
        <ReportsModal
          orgId={orgId}
          activeSession={activeSession}
          agents={agents}
          onClose={() => setIsReportsOpen(false)}
        />
      )}

      {isHistoryOpen && (
        <div
          className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
          onClick={() => setIsHistoryOpen(false)}
        >
          <div
            className="bg-white rounded-xl shadow-2xl max-w-5xl w-full max-h-[90vh] flex flex-col overflow-hidden border border-gray-200"
            onClick={e => e.stopPropagation()}
          >
            <div className="px-5 py-3 border-b border-gray-100 flex items-center justify-between">
              <h2 className="text-sm font-semibold text-gray-800">Buy Voucher History</h2>
              <button
                type="button"
                onClick={() => setIsHistoryOpen(false)}
                className="text-gray-400 hover:text-gray-600 text-base"
              >
                ✕
              </button>
            </div>
            <div className="flex-1 overflow-y-auto p-4">
              <LedgerHistory
                orgId={orgId}
                activeSession={activeSession}
                refreshSignal={refreshSignal}
                onEditVoucher={v => {
                  setEditingVoucher(v);
                  setIsHistoryOpen(false);
                }}
              />
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
