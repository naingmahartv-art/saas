'use client';
import { useState, useEffect } from 'react';
import { DEFAULT_SHORTCUTS } from './shortcuts.js';

// Loads the current user's Ledger shortcut overrides once and exposes the
// merged map (falls back to DEFAULT_SHORTCUTS immediately, then updates
// after the fetch resolves, so the keydown handlers always have something).
export default function useLedgerShortcuts() {
  const [prefs, setPrefs] = useState({
    shortcuts: DEFAULT_SHORTCUTS,
    replaceSlash: 'P',
    replaceAsterisk: 'R',
  });

  useEffect(() => {
    let cancelled = false;
    fetch('/api/user/shortcuts')
      .then(res => (res.ok ? res.json() : null))
      .then(data => {
        if (!cancelled) {
          setPrefs({
            shortcuts: data?.shortcuts || DEFAULT_SHORTCUTS,
            replaceSlash: data?.replaceSlash ?? 'P',
            replaceAsterisk: data?.replaceAsterisk ?? 'R',
          });
        }
      })
      .catch(() => {
        // keep defaults on failure
      });
    return () => {
      cancelled = true;
    };
  }, []);

  return prefs;
}

export function useIsMac() {
  const [isMac, setIsMac] = useState(false);
  useEffect(() => {
    setIsMac(/mac/i.test(window.navigator.userAgent || window.navigator.platform || ''));
  }, []);
  return isMac;
}
