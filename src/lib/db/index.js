import { neon } from '@neondatabase/serverless';
import { drizzle as drizzlePg } from 'drizzle-orm/neon-http';
import * as schema from './schema.js';

const DRIVER = process.env.DATABASE_DRIVER || 'postgres';

let db;

if (DRIVER === 'sqlite') {
  const fs = await import('fs');
  const path = await import('path');
  const { default: Database } = await import('better-sqlite3');
  const { drizzle: drizzleSqlite } = await import('drizzle-orm/better-sqlite3');
  const { migrate } = await import('drizzle-orm/better-sqlite3/migrator');
  const { seedIfEmpty } = await import('./seed-desktop.js');

  const dbPath = process.env.SQLITE_DB_PATH || './local.db';
  fs.mkdirSync(path.dirname(dbPath), { recursive: true });

  const sqlite = new Database(dbPath);
  sqlite.pragma('journal_mode = WAL');
  sqlite.pragma('foreign_keys = ON');

  db = drizzleSqlite(sqlite, { schema });

  migrate(db, { migrationsFolder: path.join(process.cwd(), 'drizzle', 'sqlite') });
  await seedIfEmpty(db, schema);

  // Two-way sync to Neon is optional — only starts if a cloud DB URL is
  // configured. Fully offline installs (no URL set) work forever with sync
  // simply inactive.
  if (process.env.NEON_DATABASE_URL) {
    const { startSync } = await import('./sync.js');
    startSync({ db, raw: sqlite, neonUrl: process.env.NEON_DATABASE_URL });
  }
} else {
  const sql = neon(process.env.NEON_DATABASE_URL);
  db = drizzlePg(sql, { schema });
}

export { db };

/** Returns the shared Drizzle db instance */
export function getDb() {
  return db;
}

export const PLAN_PRICES = {
  basic: 29,
  advance: 99,
};
