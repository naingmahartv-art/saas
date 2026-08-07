// One-time setup: applies the sync outbox table + triggers to the real Neon
// Postgres database. Run manually — never invoked automatically by the app
// or build pipeline. Requires the updatedAt columns to already exist (run
// `yarn db:push` after updating schema.pg.js, before this script).
//
// Usage: node scripts/setup-pg-sync.js
import { config } from 'dotenv';
config({ path: '.env.local' });

import { Client } from '@neondatabase/serverless';
import fs from 'fs';
import path from 'path';

const sqlPath = path.join(process.cwd(), 'scripts', 'sql', 'pg-sync-triggers.sql');
const sql = fs.readFileSync(sqlPath, 'utf8');

const client = new Client(process.env.NEON_DATABASE_URL);

async function main() {
  await client.connect();
  console.log(`Applying ${sqlPath} to ${new URL(process.env.NEON_DATABASE_URL).hostname}...`);
  await client.query(sql);
  console.log('Done — _sync_outbox table and triggers are in place.');
  await client.end();
}

main().catch((err) => {
  console.error('setup-pg-sync failed:', err);
  process.exit(1);
});
