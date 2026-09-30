'use client';
import { app } from '@/lib/db/firebase-client.js';

let firebaseAnalytics = null;
let isAnalyticsInitialized = false;

/**
 * Initialize Firebase Analytics for Web browsers.
 */
export async function initAnalytics() {
  if (typeof window === 'undefined' || isAnalyticsInitialized) return;
  isAnalyticsInitialized = true;

  try {
    const { getAnalytics, isSupported } = await import('firebase/analytics');
    const supported = await isSupported();
    if (supported && app) {
      firebaseAnalytics = getAnalytics(app);
      console.log('[Analytics] Firebase Analytics initialized.');
    }
  } catch (err) {
    // Analytics optional / blocked by ad blocker
    console.warn('[Analytics] Firebase Analytics init skipped:', err?.message);
  }
}

/**
 * Log custom analytics event.
 * Automatically forwards to Electron Main Process (if in Electron) and/or Firebase Web Analytics.
 */
export function trackEvent(eventName, params = {}) {
  if (typeof window === 'undefined') return;

  // 1. Electron Desktop Bridge
  if (window.electronAPI && typeof window.electronAPI.logAnalyticsEvent === 'function') {
    try {
      window.electronAPI.logAnalyticsEvent(eventName, params);
    } catch (e) {
      console.error('[Analytics] Electron bridge error:', e);
    }
  }

  // 2. Firebase Web Analytics
  if (firebaseAnalytics) {
    import('firebase/analytics').then(({ logEvent }) => {
      try {
        logEvent(firebaseAnalytics, eventName, params);
      } catch (e) {
        // Ignore analytics log failures
      }
    });
  }
}

/**
 * Send error report to Sentry
 */
function sendSentryReport(error, context = 'client_error') {
  const dsn = process.env.NEXT_PUBLIC_SENTRY_DSN || 'https://b90e671e48ccc860ed2012d1e4d84233@o4512156485877760.ingest.us.sentry.io/4512156488105984';
  if (!dsn) return;

  try {
    const url = new URL(dsn);
    const key = url.username;
    const projectId = url.pathname.replace(/^\//, '');
    const endpoint = `https://${url.host}/api/${projectId}/store/`;

    const payload = JSON.stringify({
      event_id: Math.random().toString(36).substring(2) + Date.now().toString(36),
      timestamp: new Date().toISOString(),
      platform: 'javascript',
      level: 'error',
      logger: 'client',
      tags: { context, runtime: typeof window !== 'undefined' && window.electronAPI ? 'electron' : 'browser' },
      message: `${context}: ${error?.message || String(error)}`,
      exception: {
        values: [
          {
            type: error?.name || 'Error',
            value: error?.message || String(error),
            stacktrace: error?.stack ? { frames: [{ filename: 'client.js', function: context }] } : undefined,
          },
        ],
      },
    });

    fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Sentry-Auth': `Sentry sentry_version=7, sentry_client=saas-web/1.0, sentry_key=${key}`,
      },
      body: payload,
    }).catch(() => {});
  } catch (e) {
    // Non-blocking
  }
}

/**
 * Report uncaught error or exception.
 * Forwards to Electron crash logger, Sentry, or Firebase Analytics exception event.
 */
export function reportError(error, context = 'client_error', fatal = false) {
  if (typeof window === 'undefined') return;

  console.error(`[ErrorReport] [${context}]:`, error);

  // 1. Send to Sentry
  sendSentryReport(error, context);

  // 2. Electron Desktop Bridge
  if (window.electronAPI && typeof window.electronAPI.logError === 'function') {
    try {
      window.electronAPI.logError(context, error, fatal);
    } catch (e) {
      console.error('[ErrorReport] Electron error reporting failed:', e);
    }
  }

  // 3. Firebase Web Analytics Exception Event
  if (firebaseAnalytics) {
    import('firebase/analytics').then(({ logEvent }) => {
      try {
        logEvent(firebaseAnalytics, 'exception', {
          description: `${context}: ${error?.message || String(error)}`.substring(0, 150),
          fatal: fatal ? 1 : 0,
        });
      } catch (e) {
        // Ignore
      }
    });
  }
}
