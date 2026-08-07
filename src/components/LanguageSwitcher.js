'use client';
import { useI18n } from '@/lib/i18n/index.js';

const LANGS = [
  { code: 'my', label: 'မြန်မာ', flag: '🇲🇲' },
  { code: 'en', label: 'EN', flag: '🇬🇧' },
  { code: 'th', label: 'ไทย', flag: '🇹🇭' },
];

export default function LanguageSwitcher() {
  const { locale, changeLocale } = useI18n();

  return (
    <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
      {LANGS.map((l) => (
        <button
          key={l.code}
          type="button"
          onClick={() => changeLocale(l.code)}
          title={l.label}
          style={{
            padding: '3px 7px',
            borderRadius: '6px',
            border: `1.5px solid ${locale === l.code ? '#6366f1' : '#d1d5db'}`,
            background: locale === l.code ? '#eef2ff' : 'transparent',
            cursor: 'pointer',
            fontSize: '11px',
            fontWeight: locale === l.code ? 700 : 400,
            color: locale === l.code ? '#4f46e5' : '#6b7280',
            lineHeight: 1.4,
            transition: 'all 0.15s',
          }}
        >
          {l.flag} {l.label}
        </button>
      ))}
    </div>
  );
}
