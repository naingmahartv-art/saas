'use client';
import { useState, useRef, useEffect, forwardRef } from 'react';

// Searchable agent text box: types filter a suggestion list by substring
// match on agentName; selecting one (click, or Enter/Tab on the highlighted
// row) resolves to the same agentId the rest of LedgerEntry.js already
// relies on. Typing something that no longer matches the selected agent
// clears agentId again, so Save stays correctly gated on a real selection.
const AgentCombobox = forwardRef(function AgentCombobox({ agents, value, onChange, placeholder, onEnter }, ref) {
  const [query, setQuery] = useState('');
  const [open, setOpen] = useState(false);
  const [highlight, setHighlight] = useState(0);
  const wrapRef = useRef(null);

  useEffect(() => {
    const selected = agents.find(a => a.id === value);
    setQuery(selected?.agentName || '');
  }, [value, agents]);

  const suggestions = query.trim()
    ? agents.filter(a => a.agentName.toLowerCase().startsWith(query.trim().toLowerCase()))
    : agents;

  function selectAgent(agent) {
    onChange(agent.id);
    setQuery(agent.agentName);
    setOpen(false);
  }

  function handleInputChange(e) {
    const v = e.target.value;
    setQuery(v);
    setOpen(true);
    setHighlight(0);
    const selected = agents.find(a => a.id === value);
    if (selected && selected.agentName !== v) onChange('');
  }

  function handleKeyDown(e) {
    if (!open) {
      if (e.key === 'ArrowDown') {
        setOpen(true);
      } else if (e.key === 'Enter') {
        if (onEnter) onEnter();
      }
      return;
    }
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setHighlight(h => Math.min(h + 1, suggestions.length - 1));
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setHighlight(h => Math.max(h - 1, 0));
    } else if (e.key === 'Enter') {
      if (suggestions[highlight]) {
        e.preventDefault();
        selectAgent(suggestions[highlight]);
      }
      if (onEnter) onEnter();
    } else if (e.key === 'Escape') {
      setOpen(false);
    }
  }

  useEffect(() => {
    function onDocMouseDown(e) {
      if (wrapRef.current && !wrapRef.current.contains(e.target)) setOpen(false);
    }
    document.addEventListener('mousedown', onDocMouseDown);
    return () => document.removeEventListener('mousedown', onDocMouseDown);
  }, []);

  return (
    <div ref={wrapRef} className="relative flex-1">
      <input
        ref={ref}
        type="text"
        value={query}
        onChange={handleInputChange}
        onKeyDown={handleKeyDown}
        onFocus={() => setOpen(true)}
        placeholder={placeholder}
        autoComplete="off"
        className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-gray-50"
      />
      {open && suggestions.length > 0 && (
        <div className="absolute left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg max-h-56 overflow-y-auto z-20">
          {suggestions.map((a, i) => (
            <button
              key={a.id}
              type="button"
              onMouseDown={e => e.preventDefault()}
              onClick={() => selectAgent(a)}
              className={`w-full text-left px-3 py-2 text-sm transition ${
                i === highlight ? 'bg-indigo-50 text-indigo-700' : 'hover:bg-gray-50 text-gray-700'
              }`}
            >
              {a.agentName}
            </button>
          ))}
        </div>
      )}
    </div>
  );
});

export default AgentCombobox;
