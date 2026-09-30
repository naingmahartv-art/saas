'use client';
import { useEffect } from 'react';
import { initAnalytics, reportError } from '@/lib/analytics/index.js';

export default function AnalyticsProvider({ children }) {
  useEffect(() => {
    // 1. Initialize Firebase Web Analytics if supported
    initAnalytics();

    // 2. Global Window Error Handler
    const handleWindowError = (event) => {
      reportError(event.error || event.message, 'unhandled_window_error');
    };

    // 3. Global Unhandled Promise Rejection Handler
    const handleRejection = (event) => {
      reportError(event.reason, 'unhandled_promise_rejection');
    };

    window.addEventListener('error', handleWindowError);
    window.addEventListener('unhandledrejection', handleRejection);

    return () => {
      window.removeEventListener('error', handleWindowError);
      window.removeEventListener('unhandledrejection', handleRejection);
    };
  }, []);

  return children;
}
