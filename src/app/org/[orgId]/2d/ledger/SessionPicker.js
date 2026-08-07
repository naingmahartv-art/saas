'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useI18n } from '@/lib/i18n/index.js';
import { SLOTS, getCurrentSlotKey, todayStr } from '@/lib/lottery/sessionSlots.js';

const SLOT_LABEL_KEY = { '09:00': 'slot0900', '12:00': 'slot1200', '04:00': 'slot0400' };
const SLOT_RANGE_KEY = { '09:00': 'slot0900Range', '12:00': 'slot1200Range', '04:00': 'slot0400Range' };

export default function SessionPicker({ orgId, activeSession, machines, onClose }) {
  const { t } = useI18n();
  const router = useRouter();
  const [onDate, setOnDate] = useState(activeSession?.onDate ?? todayStr());
  const [ampm, setAmpm] = useState(activeSession?.ampm ?? getCurrentSlotKey());
  const [machineId, setMachineId] = useState(activeSession?.machineId ?? machines[0]?.machineId ?? 1);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  async function handleOk() {
    setSaving(true);
    setError('');
    try {
      const res = await fetch(`/api/org/${orgId}/session`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ampm, onDate, machineId }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || t('session.saveFailed'));
        return;
      }
      router.refresh();
      onClose();
    } catch {
      setError(t('common.networkError'));
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-xl shadow-2xl max-w-md w-full border border-gray-200 overflow-hidden">
        <div className="px-5 py-3 border-b border-gray-100">
          <h2 className="text-sm font-semibold text-gray-800">{t('session.pickTitle')}</h2>
          <p className="text-xs text-gray-500 mt-0.5">{t('session.pickSubtitle')}</p>
        </div>

        <div className="p-5 space-y-4">
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">{t('session.date')}</label>
            <input
              type="date"
              value={onDate}
              onChange={e => setOnDate(e.target.value)}
              className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
            />
          </div>

          <div>
            <label className="block text-xs font-medium text-gray-600 mb-2">{t('session.slot')}</label>
            <div className="grid grid-cols-3 gap-2">
              {SLOTS.map(slot => (
                <button
                  key={slot.key}
                  type="button"
                  onClick={() => setAmpm(slot.key)}
                  className={`py-2.5 px-2 rounded-lg border text-center transition ${
                    ampm === slot.key
                      ? 'border-indigo-500 bg-indigo-50 text-indigo-700'
                      : 'border-gray-200 hover:border-gray-300 text-gray-600'
                  }`}
                >
                  <div className="text-sm font-semibold">{t(`session.${SLOT_LABEL_KEY[slot.key]}`)}</div>
                  <div className="text-[10px] mt-0.5 text-gray-400">{t(`session.${SLOT_RANGE_KEY[slot.key]}`)}</div>
                </button>
              ))}
            </div>
          </div>

          {machines.length > 1 && (
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">{t('session.machine')}</label>
              <select
                value={machineId}
                onChange={e => setMachineId(e.target.value)}
                className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              >
                {machines.map(m => (
                  <option key={m.machineId} value={m.machineId}>
                    {t('session.machineOption', { id: m.machineId, label: m.label ? ` — ${m.label}` : '', min: m.minSerial, max: m.maxSerial })}
                  </option>
                ))}
              </select>
            </div>
          )}

          {error && <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2">{error}</p>}
        </div>

        <div className="px-5 py-3 border-t border-gray-100 flex justify-end gap-2">
          {activeSession && (
            <button
              type="button"
              onClick={onClose}
              disabled={saving}
              className="px-4 py-2 text-sm border border-gray-300 rounded-lg hover:bg-gray-50 transition disabled:opacity-50"
            >
              {t('common.cancel')}
            </button>
          )}
          <button
            type="button"
            onClick={handleOk}
            disabled={saving}
            className="px-4 py-2 text-sm bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white font-medium rounded-lg transition"
          >
            {saving ? t('common.saving') : t('common.confirm')}
          </button>
        </div>
      </div>
    </div>
  );
}
