'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';

export default function LoginPage() {
  const router = useRouter();
  const [form, setForm] = useState({ email: '', password: '' });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [forgotOpen, setForgotOpen] = useState(false);
  const [forgotEmail, setForgotEmail] = useState('');
  const [forgotMsg, setForgotMsg] = useState('');
  const [forgotLoading, setForgotLoading] = useState(false);

  async function handleForgotSubmit(e) {
    e.preventDefault();
    setForgotLoading(true);
    setForgotMsg('');
    try {
      const res = await fetch('/api/auth/forgot-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: forgotEmail }),
      });
      const data = await res.json();
      setForgotMsg(data.message || 'If that account exists, your organization admin has been notified.');
    } catch {
      setForgotMsg('Something went wrong');
    } finally {
      setForgotLoading(false);
    }
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      const res = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      });
      const data = await res.json();
      if (!res.ok) { setError(data.error || 'Login failed'); return; }
      if (data.role === 'super_admin') router.push('/admin');
      else if (data.role === 'org_admin') router.push(`/org/${data.orgId}/admin/dashboard`);
      else router.push(`/org/${data.orgId}/2d/dashboard`);
    } catch {
      setError('Something went wrong');
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-brand-50 to-white">
      <div className="w-full max-w-sm">
        <div className="text-center mb-8">
          <div className="w-12 h-12 bg-brand-600 rounded-xl mx-auto mb-4 flex items-center justify-center">
            <svg className="w-7 h-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <h1 className="text-2xl font-bold text-gray-900">SaaS Platform</h1>
          <p className="text-gray-500 text-sm mt-1">Sign in to your account</p>
        </div>

        <div className="card">
          <form onSubmit={handleSubmit} className="space-y-4">
            {error && (
              <div className="bg-red-50 border border-red-100 text-red-600 text-sm rounded-lg px-4 py-3">
                {error}
              </div>
            )}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
              <input
                type="email"
                required
                className="input"
                placeholder="you@example.com"
                value={form.email}
                onChange={(e) => setForm({ ...form, email: e.target.value })}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Password</label>
              <input
                type="password"
                required
                className="input"
                placeholder="••••••••"
                value={form.password}
                onChange={(e) => setForm({ ...form, password: e.target.value })}
              />
            </div>
            <button type="submit" disabled={loading} className="btn-primary w-full">
              {loading ? 'Signing in…' : 'Sign in'}
            </button>

            <button
              type="button"
              onClick={() => { setForgotOpen(o => !o); setForgotMsg(''); }}
              className="w-full text-center text-sm text-brand-600 hover:text-brand-700"
            >
              Forgot password?
            </button>

            {forgotOpen && (
              <div className="border-t border-gray-100 pt-4 space-y-2">
                <p className="text-xs text-gray-500">
                  Enter your account email. Your organization admin will be notified and can issue you a new temporary password.
                </p>
                {forgotMsg ? (
                  <p className="text-sm text-green-700 bg-green-50 border border-green-100 rounded-lg px-4 py-3">{forgotMsg}</p>
                ) : (
                  <div className="flex gap-2">
                    <input
                      type="email"
                      required
                      className="input"
                      placeholder="you@example.com"
                      value={forgotEmail}
                      onChange={(e) => setForgotEmail(e.target.value)}
                    />
                    <button
                      type="button"
                      onClick={handleForgotSubmit}
                      disabled={forgotLoading || !forgotEmail}
                      className="btn-secondary shrink-0 disabled:opacity-50"
                    >
                      {forgotLoading ? 'Sending…' : 'Send request'}
                    </button>
                  </div>
                )}
              </div>
            )}
          </form>
        </div>

        <p className="text-center text-xs text-gray-400 mt-6">
          Multi-tenant SaaS Platform — 3-tier access control
        </p>
      </div>
    </div>
  );
}
