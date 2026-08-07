'use client';
import { useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import { SLOTS, getCurrentSlotKey, todayStr } from '@/lib/lottery/sessionSlots.js';

const SLOT_LABEL_KEY = { '09:00': 'slot0900', '12:00': 'slot1200', '04:00': 'slot0400' };
const SLOT_RANGE_KEY = { '09:00': 'slot0900Range', '12:00': 'slot1200Range', '04:00': 'slot0400Range' };

export default function SessionSetup({ orgId, current, machines }) {
  const { t } = useI18n();
  const [ampm, setAmpm] = useState(current?.ampm ?? getCurrentSlotKey());
  const [onDate, setOnDate] = useState(current?.onDate ?? todayStr());
  const [machineId, setMachineId] = useState(current?.machineId ?? machines[0]?.machineId ?? 1);
  const [active, setActive] = useState(current);
  const [saving, setSaving] = useState(false);
  const [msg, setMsg] = useState('');
  const [msgIsError, setMsgIsError] = useState(false);

  async function handleSave(e) {
    e.preventDefault();
    setSaving(true);
    setMsg('');
    try {
      const res = await fetch(`/api/org/${orgId}/session`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ampm, onDate, machineId }),
      });
      const data = await res.json();
      if (!res.ok) { setMsg(data.error || t('session.saveFailed')); setMsgIsError(true); return; }
      setActive(data.session);
      setMsg(t('session.saveSuccess'));
      setMsgIsError(false);
    } finally {
      setSaving(false);
    }
  }

  const selectedMachine = machines.find(m => m.machineId == machineId) || machines[0];

  return (
    <div className="max-w-2xl mx-auto">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">{t('session.title')}</h1>
        <p className="text-sm text-gray-500 mt-1">{t('session.pickSubtitle')}</p>
      </div>

      {/* Current session banner */}
      {active && (
        <div className="bg-indigo-50 border border-indigo-200 rounded-xl p-4 mb-6">
          <p className="text-xs text-indigo-500 font-medium uppercase tracking-wide mb-1">{t('session.currentSession')}</p>
          <div className="flex flex-wrap gap-4 text-sm font-medium text-indigo-900">
            <span>{t(`session.${SLOT_LABEL_KEY[active.ampm] || 'slot0900'}`)}</span>
            <span>•</span>
            <span>{active.onDate}</span>
            <span>•</span>
            <span>{t('session.machineLabel', { id: active.machineId })}</span>
          </div>
          {selectedMachine && (
            <p className="text-xs text-indigo-400 mt-1">
              {t('session.serialRange', { min: selectedMachine.minSerial, max: selectedMachine.maxSerial })}
            </p>
          )}
        </div>
      )}

      <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-6">
        <form onSubmit={handleSave} className="space-y-5">

          {/* Date */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              {t('session.date')}
            </label>
            <input
              type="date"
              value={onDate}
              onChange={e => setOnDate(e.target.value)}
              required
              className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
            />
          </div>

          {/* Time slot */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              {t('session.slot')}
            </label>
            <div className="grid grid-cols-3 gap-2">
              {SLOTS.map(slot => (
                <button
                  key={slot.key}
                  type="button"
                  onClick={() => setAmpm(slot.key)}
                  className={`py-3 px-3 rounded-lg border text-left transition ${
                    ampm === slot.key
                      ? 'border-indigo-500 bg-indigo-50 text-indigo-700'
                      : 'border-gray-200 hover:border-gray-300 text-gray-600'
                  }`}
                >
                  <div className="text-sm font-medium">{t(`session.${SLOT_LABEL_KEY[slot.key]}`)}</div>
                  <div className="text-xs mt-0.5 text-gray-400">{t(`session.${SLOT_RANGE_KEY[slot.key]}`)}</div>
                </button>
              ))}
            </div>
          </div>

          {/* Machine */}
          {machines.length > 1 && (
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {t('session.machine')}
              </label>
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

          {msg && (
            <p className={`text-sm px-3 py-2 rounded-lg ${
              msgIsError ? 'bg-red-50 text-red-600' : 'bg-green-50 text-green-700'
            }`}>
              {msg}
            </p>
          )}

          <button
            type="submit"
            disabled={saving}
            className="w-full bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white font-medium py-2.5 rounded-lg text-sm transition"
          >
            {saving ? t('common.saving') : t('session.setSession')}
          </button>
        </form>
      </div>
    </div>
  );
}
