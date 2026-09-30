const fs = require('fs');
const path = require('path');
const https = require('https');
const os = require('os');
const { app, ipcMain } = require('electron');

const DEFAULT_SENTRY_DSN = 'https://b90e671e48ccc860ed2012d1e4d84233@o4512156485877760.ingest.us.sentry.io/4512156488105984';
let SentryInstance = null;

/**
 * 1. Initialize Sentry
 */
function initSentry(dsn, environment) {
  const activeDsn = dsn || DEFAULT_SENTRY_DSN;
  if (!activeDsn) return;
  try {
    const Sentry = require('@sentry/electron/main');
    Sentry.init({
      dsn: activeDsn,
      environment: environment || (app.isPackaged ? 'production' : 'development'),
      release: `saas-platform-desktop@${app.getVersion()}`,
    });
    SentryInstance = Sentry;
    console.log('[Telemetry] Sentry initialized with DSN successfully.');
  } catch (err) {
    console.warn('[Telemetry] Sentry init note:', err.message);
  }
}

/**
 * 2. Local File Crash Logger
 * Writes crash stack traces to userData/logs/crashes.log for offline debugging.
 */
function logCrashLocally(type, error) {
  try {
    const logDir = path.join(app.getPath('userData'), 'logs');
    fs.mkdirSync(logDir, { recursive: true });

    const logFile = path.join(logDir, 'crashes.log');
    const timestamp = new Date().toISOString();
    const message = error?.stack || error?.message || String(error);
    const entry = `[${timestamp}] [${type}] [v${app.getVersion()}] [OS: ${process.platform} ${os.release()}]\n${message}\n\n`;

    fs.appendFileSync(logFile, entry, 'utf8');
    console.error(`[Telemetry] Crash logged to ${logFile}`);
  } catch (e) {
    console.error('[Telemetry] Failed to write crash to local file:', e);
  }
}

/**
 * 3. Google Analytics 4 (GA4) / Firebase Analytics Measurement Protocol
 * Sends event & crash telemetry over HTTP directly to GA4 / Firebase.
 */
function trackAnalyticsEvent(eventName, params = {}) {
  const measurementId = process.env.NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID || process.env.GA_MEASUREMENT_ID;
  const apiSecret = process.env.GA4_API_SECRET || process.env.FIREBASE_ANALYTICS_API_SECRET;

  if (!measurementId || !apiSecret) {
    return; // GA4 credentials not configured
  }

  try {
    const payload = JSON.stringify({
      client_id: `desktop-${os.hostname()}-${process.platform}`,
      events: [
        {
          name: eventName,
          params: {
            app_name: 'saas-platform-desktop',
            app_version: app.getVersion(),
            platform: process.platform,
            os_arch: process.arch,
            os_release: os.release(),
            timestamp: new Date().toISOString(),
            ...params,
          },
        },
      ],
    });

    const req = https.request(
      {
        hostname: 'www.google-analytics.com',
        path: `/mp/collect?measurement_id=${encodeURIComponent(measurementId)}&api_secret=${encodeURIComponent(apiSecret)}`,
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Content-Length': Buffer.byteLength(payload),
        },
      },
      (res) => {
        // Event sent
      }
    );

    req.on('error', (err) => {
      // Non-blocking telemetry error
    });
    req.write(payload);
    req.end();
  } catch (e) {
    // Non-blocking
  }
}

/**
 * 4. Main Telemetry Setup
 * Attaches global exception handlers and IPC listeners.
 */
function setupTelemetry(config = {}) {
  const sentryDsn = config.SENTRY_DSN || process.env.SENTRY_DSN || DEFAULT_SENTRY_DSN;
  const environment = config.NODE_ENV || (app.isPackaged ? 'production' : 'development');

  initSentry(sentryDsn, environment);

  // Handle Uncaught Node.js Exceptions
  process.on('uncaughtException', (error) => {
    console.error('[Telemetry] Uncaught Exception in Main Process:', error);
    if (SentryInstance) {
      try { SentryInstance.captureException(error); } catch (e) {}
    }
    logCrashLocally('UNCAUGHT_EXCEPTION_MAIN', error);
    trackAnalyticsEvent('app_exception', {
      fatal: 1,
      error_type: 'uncaughtException',
      message: (error?.message || '').substring(0, 100),
    });
  });

  // Handle Unhandled Promise Rejections
  process.on('unhandledRejection', (reason) => {
    console.error('[Telemetry] Unhandled Rejection in Main Process:', reason);
    if (SentryInstance) {
      try { SentryInstance.captureException(reason instanceof Error ? reason : new Error(String(reason))); } catch (e) {}
    }
    logCrashLocally('UNHANDLED_REJECTION_MAIN', reason);
    trackAnalyticsEvent('app_exception', {
      fatal: 0,
      error_type: 'unhandledRejection',
      message: String(reason || '').substring(0, 100),
    });
  });

  // IPC Listener for Renderer (Next.js UI) Analytics & Crash Reports
  ipcMain.on('telemetry-log-event', (_event, { eventName, params }) => {
    if (eventName) {
      trackAnalyticsEvent(eventName, params);
    }
  });

  ipcMain.on('telemetry-log-error', (_event, { type, error, fatal }) => {
    console.error(`[Telemetry] Error from Renderer [${type}]:`, error);
    if (SentryInstance) {
      try {
        const errObj = typeof error === 'object' && error.message ? new Error(error.message) : new Error(String(error));
        if (error.stack) errObj.stack = error.stack;
        SentryInstance.captureException(errObj);
      } catch (e) {}
    }
    logCrashLocally(`RENDERER_${type || 'ERROR'}`, error);
    trackAnalyticsEvent('app_exception', {
      fatal: fatal ? 1 : 0,
      error_type: type || 'renderer_error',
      message: (error?.message || String(error)).substring(0, 100),
    });
  });

  // Track initial desktop launch event
  trackAnalyticsEvent('desktop_app_launched');
}

module.exports = {
  setupTelemetry,
  trackAnalyticsEvent,
  logCrashLocally,
};
