'use client';

/**
 * Clear limit amount keys from localStorage when session changes.
 * @param {string} [orgId]
 */
export function clearLimitLocalStorage(orgId) {
  if (typeof window === 'undefined' || !window.localStorage) return;
  try {
    const keysToRemove = [];
    for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i);
      if (!key) continue;
      const k = key.toLowerCase();
      if (k.includes('limit')) {
        keysToRemove.push(key);
      }
    }
    for (const key of keysToRemove) {
      localStorage.removeItem(key);
    }
  } catch (err) {
    console.warn('Error clearing limit from localStorage:', err);
  }
}
