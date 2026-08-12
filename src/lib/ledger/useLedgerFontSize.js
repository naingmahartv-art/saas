'use client';
import { useState, useEffect } from 'react';

export default function useLedgerFontSize() {
  const [fontSize, setFontSize] = useState('100');

  useEffect(() => {
    try {
      const stored = localStorage.getItem('user_font_size');
      if (stored) {
        setFontSize(stored);
      }
    } catch {}

    function handleFontSizeChange(e) {
      if (e.detail?.fontSize) {
        setFontSize(String(e.detail.fontSize));
      } else {
        try {
          const stored = localStorage.getItem('user_font_size');
          if (stored) setFontSize(stored);
        } catch {}
      }
    }

    window.addEventListener('ledger_font_size_changed', handleFontSizeChange);
    window.addEventListener('storage', handleFontSizeChange);

    return () => {
      window.removeEventListener('ledger_font_size_changed', handleFontSizeChange);
      window.removeEventListener('storage', handleFontSizeChange);
    };
  }, []);

  return fontSize;
}

export function updateGlobalFontSize(newSize) {
  const sizeStr = String(newSize);
  try {
    localStorage.setItem('user_font_size', sizeStr);
  } catch {}
  if (typeof window !== 'undefined') {
    window.dispatchEvent(new CustomEvent('ledger_font_size_changed', { detail: { fontSize: sizeStr } }));
  }
}
