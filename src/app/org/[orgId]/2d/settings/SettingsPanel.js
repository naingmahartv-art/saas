'use client';
import { useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

export default function SettingsPanel({
  orgId,
  onCount,
  initialRates,
  initialLimits,
  initialHotNumbers,
  initialNotBuyNumbers,
}) {
  const { t } = useI18n();
  const [ratesForm, setRatesForm] = useState({
    num1Rate: initialRates?.num1Rate ?? '',
    num2Rate: initialRates?.num2Rate ?? '',
  });
  const [ratesSaving, setRatesSaving] = useState(false);
  const [ratesMsg, setRatesMsg] = useState('');

  const [limitValue, setLimitValue] = useState(initialLimits?.limitValue ?? 0);
  const [limitSaving, setLimitSaving] = useState(false);
  const [limitMsg, setLimitMsg] = useState('');

  const [hotNumbers, setHotNumbers] = useState(initialHotNumbers || []);
  const [hotInput, setHotInput] = useState('');
  const [hotError, setHotError] = useState('');

  const [notBuyNumbers, setNotBuyNumbers] = useState(initialNotBuyNumbers || []);
  const [notBuyInput, setNotBuyInput] = useState('');
  const [notBuyError, setNotBuyError] = useState('');

  async function saveRates(e) {
    e.preventDefault();
    setRatesSaving(true);
    setRatesMsg('');
    try {
      const res = await fetch(`/api/org/${orgId}/settings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          num1Rate: parseFloat(ratesForm.num1Rate) || 0,
          num2Rate: parseFloat(ratesForm.num2Rate) || 0,
        }),
      });
      const data = await res.json();
      if (!res.ok) {
        setRatesMsg(data.error || t('common.failedToSave'));
        return;
      }
      setRatesForm({ num1Rate: data.rates.num1Rate, num2Rate: data.rates.num2Rate });
      setRatesMsg(t('session.saveSuccess'));
    } catch {
      setRatesMsg(t('common.networkError'));
    } finally {
      setRatesSaving(false);
    }
  }

  async function saveLimit(e) {
    e.preventDefault();
    setLimitSaving(true);
    setLimitMsg('');
    try {
      const res = await fetch(`/api/org/${orgId}/settings/limits`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ limitValue: parseFloat(limitValue) || 0 }),
      });
      const data = await res.json();
      if (!res.ok) {
        setLimitMsg(data.error || t('common.failedToSave'));
        return;
      }
      setLimitMsg(t('session.saveSuccess'));
    } catch {
      setLimitMsg(t('common.networkError'));
    } finally {
      setLimitSaving(false);
    }
  }

  async function addHotNumber(e) {
    e.preventDefault();
    setHotError('');
    if (!/^\d{2}$/.test(hotInput)) {
      setHotError(t('settings.invalid2Digit'));
      return;
    }
    try {
      const res = await fetch(`/api/org/${orgId}/settings/hot-numbers`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ num: hotInput, onCount }),
      });
      const data = await res.json();
      if (!res.ok) {
        setHotError(data.error || t('common.failedToSave'));
        return;
      }
      const list = await fetch(`/api/org/${orgId}/settings/hot-numbers?onCount=${onCount}`).then(r => r.json());
      setHotNumbers(list.hotNumbers || []);
      setHotInput('');
    } catch {
      setHotError(t('common.networkError'));
    }
  }

  async function deleteHotNumber(id) {
    await fetch(`/api/org/${orgId}/settings/hot-numbers`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ id, onCount }),
    });
    setHotNumbers(prev => prev.filter(n => n.id !== id));
  }

  async function addNotBuyNumber(e) {
    e.preventDefault();
    setNotBuyError('');
    if (!/^\d{2}$/.test(notBuyInput)) {
      setNotBuyError(t('settings.invalid2Digit'));
      return;
    }
    try {
      const res = await fetch(`/api/org/${orgId}/settings/not-buy`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ num: notBuyInput, onCount }),
      });
      const data = await res.json();
      if (!res.ok) {
        setNotBuyError(data.error || t('common.failedToSave'));
        return;
      }
      const list = await fetch(`/api/org/${orgId}/settings/not-buy?onCount=${onCount}`).then(r => r.json());
      setNotBuyNumbers(list.notBuyNumbers || []);
      setNotBuyInput('');
    } catch {
      setNotBuyError(t('common.networkError'));
    }
  }

  async function deleteNotBuyNumber(id) {
    await fetch(`/api/org/${orgId}/settings/not-buy`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ id, onCount }),
    });
    setNotBuyNumbers(prev => prev.filter(n => n.id !== id));
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">{t('settings.title')}</h1>
        <p className="text-sm text-gray-500 mt-1">
          {onCount !== null ? t('settings.activeSessionLabel', { n: onCount }) : t('settings.noActiveSession')}
        </p>
      </div>

      {/* Rates */}
      <section className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
        <h2 className="text-base font-semibold text-gray-800 mb-1">{t('settings.payoutRate')}</h2>
        <p className="text-xs text-gray-400 mb-4">{t('settings.configureDesc')}</p>
        <form onSubmit={saveRates} className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">
              {t('settings.payoutRate')}
            </label>
            <input
              type="number"
              step="0.01"
              value={ratesForm.num1Rate}
              onChange={e => setRatesForm(prev => ({ ...prev, num1Rate: e.target.value }))}
              className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              placeholder="0.00"
            />
          </div>
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">{t('settings.rate2')}</label>
            <input
              type="number"
              step="0.01"
              value={ratesForm.num2Rate}
              onChange={e => setRatesForm(prev => ({ ...prev, num2Rate: e.target.value }))}
              className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              placeholder="0.00"
            />
          </div>
          <div className="sm:col-span-2 flex items-center gap-3 pt-1">
            <button
              type="submit"
              disabled={ratesSaving}
              className="bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
            >
              {ratesSaving ? t('common.saving') : t('settings.saveRates')}
            </button>
            {ratesMsg && <p className="text-sm text-gray-500">{ratesMsg}</p>}
          </div>
        </form>
      </section>

      {/* Limits */}
      <section className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
        <h2 className="text-base font-semibold text-gray-800 mb-1">{t('settings.betLimit')}</h2>
        <p className="text-xs text-gray-400 mb-4">{t('settings.noLimitDesc')}</p>
        <form onSubmit={saveLimit} className="flex flex-wrap items-end gap-3">
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">
              {t('settings.maxBetLabel')}
            </label>
            <input
              type="number"
              step="0.01"
              min="0"
              value={limitValue}
              onChange={e => setLimitValue(e.target.value)}
              className="w-48 px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              placeholder="0"
            />
          </div>
          <button
            type="submit"
            disabled={limitSaving}
            className="bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
          >
            {limitSaving ? t('common.saving') : t('settings.saveRates')}
          </button>
          {limitMsg && <p className="text-sm text-gray-500">{limitMsg}</p>}
        </form>
      </section>

      {/* Hot numbers */}
      <section className="bg-yellow-50 rounded-xl border border-yellow-200 p-5 shadow-sm">
        <h2 className="text-base font-semibold text-yellow-900 mb-1">{t('settings.hotNumbers')}</h2>
        <p className="text-xs text-yellow-700 mb-4">
          {t('settings.hotDesc')}{onCount !== null ? t('settings.sessionSuffix', { n: onCount }) : ''}.
        </p>

        {onCount === null ? (
          <p className="text-sm text-yellow-700">{t('settings.noActiveSessionStart')}</p>
        ) : (
          <>
            <form onSubmit={addHotNumber} className="flex items-end gap-3 mb-4">
              <div>
                <label className="block text-xs font-medium text-yellow-800 mb-1">{t('settings.numberLabel')}</label>
                <input
                  type="text"
                  maxLength={2}
                  value={hotInput}
                  onChange={e => setHotInput(e.target.value.replace(/\D/g, ''))}
                  className="w-24 px-3 py-2 text-sm border border-yellow-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"
                  placeholder="00"
                />
              </div>
              <button
                type="submit"
                className="bg-yellow-500 hover:bg-yellow-600 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
              >
                {t('settings.addNumber')}
              </button>
              {hotError && <p className="text-sm text-red-600">{hotError}</p>}
            </form>

            <div className="flex flex-wrap gap-2">
              {hotNumbers.length === 0 && (
                <p className="text-sm text-yellow-700">{t('settings.noHotNumbers')}</p>
              )}
              {hotNumbers.map(n => (
                <span
                  key={n.id}
                  className="inline-flex items-center gap-2 bg-yellow-200 text-yellow-900 text-sm font-medium px-3 py-1.5 rounded-full"
                >
                  {n.num}
                  <button
                    onClick={() => deleteHotNumber(n.id)}
                    className="text-yellow-800 hover:text-red-700 font-bold"
                    aria-label={`${t('settings.removeNumber')} ${n.num}`}
                  >
                    ×
                  </button>
                </span>
              ))}
            </div>
          </>
        )}
      </section>

      {/* Not-buy numbers */}
      <section className="bg-red-50 rounded-xl border border-red-200 p-5 shadow-sm">
        <h2 className="text-base font-semibold text-red-900 mb-1">{t('settings.blockedNumbers')}</h2>
        <p className="text-xs text-red-700 mb-4">
          {t('settings.blockedDesc')}{onCount !== null ? t('settings.sessionSuffix', { n: onCount }) : ''}.
        </p>

        {onCount === null ? (
          <p className="text-sm text-red-700">{t('settings.noActiveSessionStart')}</p>
        ) : (
          <>
            <form onSubmit={addNotBuyNumber} className="flex items-end gap-3 mb-4">
              <div>
                <label className="block text-xs font-medium text-red-800 mb-1">{t('settings.numberLabel')}</label>
                <input
                  type="text"
                  maxLength={2}
                  value={notBuyInput}
                  onChange={e => setNotBuyInput(e.target.value.replace(/\D/g, ''))}
                  className="w-24 px-3 py-2 text-sm border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
                  placeholder="00"
                />
              </div>
              <button
                type="submit"
                className="bg-red-500 hover:bg-red-600 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
              >
                {t('settings.addNumber')}
              </button>
              {notBuyError && <p className="text-sm text-red-700">{notBuyError}</p>}
            </form>

            <div className="flex flex-wrap gap-2">
              {notBuyNumbers.length === 0 && (
                <p className="text-sm text-red-700">{t('settings.noBlockedNumbers')}</p>
              )}
              {notBuyNumbers.map(n => (
                <span
                  key={n.id}
                  className="inline-flex items-center gap-2 bg-red-200 text-red-900 text-sm font-medium px-3 py-1.5 rounded-full"
                >
                  {n.num}
                  <button
                    onClick={() => deleteNotBuyNumber(n.id)}
                    className="text-red-800 hover:text-red-950 font-bold"
                    aria-label={`${t('settings.removeNumber')} ${n.num}`}
                  >
                    ×
                  </button>
                </span>
              ))}
            </div>
          </>
        )}
      </section>
    </div>
  );
}
