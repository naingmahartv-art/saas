'use client';

import React, { useState, useEffect } from 'react';
import NavBar from '@/components/NavBar';
import Link from 'next/link';

export default function AdminResourcesPage() {
  const [resources, setResources] = useState([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [msg, setMsg] = useState({ text: '', type: '' });

  // Form state
  const [editingId, setEditingId] = useState(null);
  const [form, setForm] = useState({
    title: '',
    type: 'tutorial', // 'exe' | 'tutorial'
    version: '1.0.4',
    url: '',
    description: '',
  });

  useEffect(() => {
    fetchResources();
  }, []);

  async function fetchResources() {
    setLoading(true);
    try {
      const res = await fetch('/api/admin/resources');
      const data = await res.json();
      if (data.resources) {
        setResources(data.resources);
      }
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  function handleEdit(item) {
    setEditingId(item.id);
    setForm({
      title: item.title || '',
      type: item.type || 'tutorial',
      version: item.version || '1.0.0',
      url: item.url || '',
      description: item.description || '',
    });
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  function handleReset() {
    setEditingId(null);
    setForm({
      title: '',
      type: 'tutorial',
      version: '1.0.4',
      url: '',
      description: '',
    });
    setMsg({ text: '', type: '' });
  }

  async function handleSubmit(e) {
    e.preventDefault();
    if (!form.url.trim() || !form.title.trim()) {
      setMsg({ text: 'Please fill in both Title and URL.', type: 'error' });
      return;
    }

    setSaving(true);
    setMsg({ text: '', type: '' });

    try {
      const payload = {
        id: editingId,
        ...form,
      };

      const res = await fetch('/api/admin/resources', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || 'Failed to save resource');
      }

      setMsg({
        text: editingId ? 'Resource updated successfully!' : 'New resource added successfully!',
        type: 'success',
      });

      handleReset();
      fetchResources();
    } catch (err) {
      setMsg({ text: err.message, type: 'error' });
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete(id, title) {
    if (!confirm(`Are you sure you want to delete "${title}"?`)) return;

    try {
      const res = await fetch(`/api/admin/resources?id=${encodeURIComponent(id)}`, {
        method: 'DELETE',
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Failed to delete');
      setMsg({ text: 'Resource deleted.', type: 'success' });
      fetchResources();
    } catch (err) {
      setMsg({ text: err.message, type: 'error' });
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <NavBar title="Super Admin Panel" />

      <main className="max-w-5xl mx-auto px-6 py-8 space-y-8">
        {/* Header Breadcrumb & Title */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 text-xs text-gray-500 mb-1">
              <Link href="/admin" className="hover:text-indigo-600">Admin Dashboard</Link>
              <span>/</span>
              <span className="text-gray-900 font-medium">EXE & Tutorial Manager</span>
            </div>
            <h1 className="text-2xl font-bold text-gray-900">
              EXE Downloads & Tutorial Videos Admin Panel
            </h1>
            <p className="text-xs text-gray-500 mt-1">
              Upload and update video URLs, desktop app installer EXE URLs, version tags, and descriptions for the main app website.
            </p>
          </div>

          <Link href="/admin" className="btn-secondary self-start text-xs">
            ← Back to Admin
          </Link>
        </div>

        {/* Status Message Alert */}
        {msg.text && (
          <div
            className={`p-4 rounded-xl text-sm border flex items-center justify-between ${
              msg.type === 'error'
                ? 'bg-red-50 text-red-700 border-red-200'
                : 'bg-emerald-50 text-emerald-800 border-emerald-200'
            }`}
          >
            <span>{msg.text}</span>
            <button type="button" onClick={() => setMsg({ text: '', type: '' })} className="text-xs opacity-60 hover:opacity-100">
              ✕
            </button>
          </div>
        )}

        {/* Add / Edit Form Card */}
        <div className="bg-white rounded-2xl border border-gray-200 p-6 shadow-sm">
          <div className="flex items-center justify-between border-b border-gray-100 pb-4 mb-6">
            <h2 className="text-base font-bold text-gray-900 flex items-center gap-2">
              <span>{editingId ? '✏️ Edit Resource' : '➕ Add New Resource / Video'}</span>
            </h2>
            {editingId && (
              <button
                type="button"
                onClick={handleReset}
                className="text-xs text-gray-500 hover:text-gray-800 bg-gray-100 px-3 py-1.5 rounded-lg transition"
              >
                Cancel Editing
              </button>
            )}
          </div>

          <form onSubmit={handleSubmit} className="space-y-5">
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              {/* Resource Type */}
              <div>
                <label className="block text-xs font-semibold text-gray-700 mb-1">
                  Resource Type <span className="text-red-500">*</span>
                </label>
                <select
                  value={form.type}
                  onChange={(e) => setForm({ ...form, type: e.target.value })}
                  className="w-full px-3.5 py-2 text-sm border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:outline-none bg-white"
                >
                  <option value="tutorial">🎬 Tutorial Video</option>
                  <option value="exe">📦 Desktop EXE Installer</option>
                </select>
              </div>

              {/* Title / Name */}
              <div className="sm:col-span-2">
                <label className="block text-xs font-semibold text-gray-700 mb-1">
                  Title / Name <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  placeholder="e.g. SaaS Platform Setup 1.0.4.exe or 1. Basic Usage Guide"
                  value={form.title}
                  onChange={(e) => setForm({ ...form, title: e.target.value })}
                  className="w-full px-3.5 py-2 text-sm border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:outline-none"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              {/* URL (Video / EXE URL) */}
              <div className="sm:col-span-2">
                <label className="block text-xs font-semibold text-gray-700 mb-1">
                  URL (Video or EXE URL) <span className="text-red-500">*</span>
                </label>
                <input
                  type="url"
                  required
                  placeholder="https://firebasestorage.googleapis.com/... or https://..."
                  value={form.url}
                  onChange={(e) => setForm({ ...form, url: e.target.value })}
                  className="w-full px-3.5 py-2 text-sm font-mono border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:outline-none"
                />
              </div>

              {/* Version */}
              <div>
                <label className="block text-xs font-semibold text-gray-700 mb-1">
                  Version <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  placeholder="e.g. 1.0.4"
                  value={form.version}
                  onChange={(e) => setForm({ ...form, version: e.target.value })}
                  className="w-full px-3.5 py-2 text-sm border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:outline-none"
                />
              </div>
            </div>

            {/* Description */}
            <div>
              <label className="block text-xs font-semibold text-gray-700 mb-1">
                Description
              </label>
              <textarea
                rows={2}
                placeholder="Enter detailed description of what is in this video or installer update..."
                value={form.description}
                onChange={(e) => setForm({ ...form, description: e.target.value })}
                className="w-full px-3.5 py-2 text-sm border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:outline-none"
              />
            </div>

            {/* Submit Buttons */}
            <div className="flex items-center gap-3 pt-2">
              <button
                type="submit"
                disabled={saving}
                className="px-6 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-semibold rounded-xl shadow-md transition disabled:opacity-50 flex items-center gap-2"
              >
                {saving ? (
                  <>
                    <span className="w-3.5 h-3.5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                    Saving...
                  </>
                ) : editingId ? (
                  'Update Resource'
                ) : (
                  'Save Resource'
                )}
              </button>

              {editingId && (
                <button
                  type="button"
                  onClick={handleReset}
                  className="px-4 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 text-xs font-semibold rounded-xl transition"
                >
                  Cancel
                </button>
              )}
            </div>
          </form>
        </div>

        {/* Resource List Table */}
        <div className="bg-white rounded-2xl border border-gray-200 overflow-hidden shadow-sm">
          <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
            <h2 className="text-base font-bold text-gray-900">
              Active Resources ({resources.length})
            </h2>
            <button
              onClick={fetchResources}
              className="text-xs text-indigo-600 hover:text-indigo-800 font-medium"
            >
              🔄 Refresh List
            </button>
          </div>

          {loading ? (
            <div className="p-8 text-center text-sm text-gray-500">
              Loading resources...
            </div>
          ) : resources.length === 0 ? (
            <div className="p-8 text-center text-sm text-gray-400">
              No resources added yet. Use the form above to add your first EXE or Tutorial Video link.
            </div>
          ) : (
            <div className="divide-y divide-gray-100">
              {resources.map((item) => (
                <div key={item.id} className="p-5 flex flex-col md:flex-row md:items-center justify-between gap-4 hover:bg-slate-50/60 transition">
                  <div className="space-y-1 max-w-2xl">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span
                        className={`text-[10px] font-bold px-2 py-0.5 rounded-md uppercase tracking-wider ${
                          item.type === 'exe'
                            ? 'bg-purple-100 text-purple-700 border border-purple-200'
                            : 'bg-blue-100 text-blue-700 border border-blue-200'
                        }`}
                      >
                        {item.type === 'exe' ? '📦 EXE Installer' : '🎬 Tutorial Video'}
                      </span>
                      <span className="text-xs font-semibold bg-gray-100 text-gray-700 px-2 py-0.5 rounded-md">
                        v{item.version}
                      </span>
                      <h3 className="font-bold text-sm text-gray-900">{item.title}</h3>
                    </div>

                    {item.description && (
                      <p className="text-xs text-gray-500 line-clamp-2">{item.description}</p>
                    )}

                    <div className="text-[11px] font-mono text-gray-400 truncate max-w-xl">
                      {item.url}
                    </div>
                  </div>

                  <div className="flex items-center gap-2 shrink-0">
                    <a
                      href={item.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="px-3 py-1.5 text-xs bg-slate-100 hover:bg-slate-200 text-gray-700 rounded-lg transition font-medium"
                    >
                      🔗 Open URL
                    </a>
                    <button
                      onClick={() => handleEdit(item)}
                      className="px-3 py-1.5 text-xs bg-indigo-50 hover:bg-indigo-100 text-indigo-700 rounded-lg transition font-medium"
                    >
                      ✏️ Edit
                    </button>
                    <button
                      onClick={() => handleDelete(item.id, item.title)}
                      className="px-3 py-1.5 text-xs bg-red-50 hover:bg-red-100 text-red-600 rounded-lg transition font-medium"
                    >
                      Delete
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </main>
    </div>
  );
}
