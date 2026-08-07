-- ─── Core SaaS tables ────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS organizations (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  plan TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  created_by TEXT,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'user',
  org_id TEXT REFERENCES organizations(id) ON DELETE CASCADE,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS subscriptions (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  plan TEXT NOT NULL,
  amount INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  created_at BIGINT NOT NULL
);

-- ─── Lottery tables ───────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS machine_config (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  machine_id INTEGER NOT NULL,
  min_serial INTEGER NOT NULL DEFAULT 1,
  max_serial INTEGER NOT NULL DEFAULT 999,
  label TEXT,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lottery_sessions (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  on_count INTEGER NOT NULL,
  ampm TEXT NOT NULL,
  on_date TEXT NOT NULL,
  machine_id INTEGER NOT NULL DEFAULT 1,
  is_active INTEGER NOT NULL DEFAULT 1,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS rates (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num1_rate DOUBLE PRECISION NOT NULL DEFAULT 0,
  num2_rate DOUBLE PRECISION NOT NULL DEFAULT 0,
  updated_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS agents (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  address TEXT,
  phone TEXT,
  commission DOUBLE PRECISION NOT NULL DEFAULT 0,
  rate DOUBLE PRECISION NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lg (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  sr_no INTEGER NOT NULL,
  on_count INTEGER NOT NULL,
  ampm TEXT NOT NULL,
  on_date TEXT NOT NULL,
  machine_id INTEGER NOT NULL DEFAULT 1,
  agent_name TEXT NOT NULL,
  num1 TEXT,
  amount DOUBLE PRECISION NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lg_detail (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  sr_no INTEGER NOT NULL,
  on_count INTEGER NOT NULL,
  ampm TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  num1 TEXT NOT NULL,
  value DOUBLE PRECISION NOT NULL DEFAULT 0,
  post INTEGER NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lg_sale (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  sr_no INTEGER NOT NULL,
  on_count INTEGER NOT NULL,
  ampm TEXT NOT NULL,
  on_date TEXT NOT NULL,
  agent_id TEXT,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lg_sale_detail (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  sr_no INTEGER NOT NULL,
  on_count INTEGER NOT NULL,
  ampm TEXT NOT NULL,
  num TEXT NOT NULL,
  value DOUBLE PRECISION NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS balance (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  amount DOUBLE PRECISION NOT NULL DEFAULT 0,
  on_date TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS receive (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  amount DOUBLE PRECISION NOT NULL DEFAULT 0,
  on_date TEXT NOT NULL,
  on_count INTEGER,
  ampm TEXT,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS lucky_no (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  on_date TEXT NOT NULL,
  ampm TEXT NOT NULL,
  l_no TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

-- ─── Restriction tables ───────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS hot_numbers (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  on_count INTEGER NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS not_buy_numbers (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  on_count INTEGER NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS limits (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  limit_value DOUBLE PRECISION NOT NULL DEFAULT 0,
  updated_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS brade (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  brade_code TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS power (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS a_poo (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS net_khat (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS net_khat_thai (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS part (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  part_digit TEXT NOT NULL,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS small (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  flag TEXT NOT NULL,  -- 'SS' | 'BB' | 'SB' | 'BS'
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sm (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  flag TEXT NOT NULL,  -- 'SS' | 'MM'
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS serie_m (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  pp INTEGER NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS serie_s (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  num TEXT NOT NULL,
  pp INTEGER NOT NULL DEFAULT 0,
  created_at BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS key_config (
  id TEXT PRIMARY KEY,
  org_id TEXT NOT NULL,
  key_value TEXT NOT NULL,
  updated_at BIGINT NOT NULL
);
