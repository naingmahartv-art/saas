'use client';

import { clearAllLocalLimitsForSession } from './localVoucherDb.js';

/**
 * Clear limit amount keys from localStorage and IndexedDB when session changes.
 * @param {string} [orgId]
 * @param {string} [sessionId]
 */
export async function clearLimitLocalStorage(orgId, sessionId) {
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

    if (orgId && sessionId) {
      await clearAllLocalLimitsForSession(orgId, sessionId);
    }
  } catch (err) {
    console.warn('Error clearing limit storage:', err);
  }
}
