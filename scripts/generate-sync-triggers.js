// Generates the outbox-capture + updatedAt-bump trigger SQL for both
// dialects, from the table list in schema.pg.js. Run manually whenever a
// table is added/removed — not part of the normal build.
//
// Usage:
//   node scripts/generate-sync-triggers.js --sqlite-out=<path> --pg-out=<path>

import { getTableName } from 'drizzle-orm';
import fs from 'fs';
import * as pgSchema from '../src/lib/db/schema.pg.js';

const tableNames = Object.values(pgSchema)
  .filter((v) => v && typeof v === 'object' && v[Symbol.for('drizzle:IsDrizzleTable')] === true)
  .map((t) => getTableName(t));

function sqliteSql() {
  const chunks = [];

  chunks.push(`CREATE TABLE _sync_outbox (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  table_name TEXT NOT NULL,
  row_id TEXT NOT NULL,
  op TEXT NOT NULL,
  changed_at INTEGER NOT NULL
)`);

  chunks.push(`CREATE TABLE _sync_state (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  cursor INTEGER NOT NULL DEFAULT 0
)`);

  chunks.push(`INSERT INTO _sync_state (id, cursor) VALUES (1, 0)`);

  for (const t of tableNames) {
    chunks.push(`CREATE TRIGGER trg_${t}_outbox_ins AFTER INSERT ON ${t} BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('${t}', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END`);

    // Outbox capture and the updated_at bump are combined into ONE trigger.
    // SQLite triggers can't reassign NEW.* directly, so bumping updated_at
    // needs a nested UPDATE — recursive_triggers=OFF (SQLite's default,
    // unchanged here) suppresses that nested UPDATE from re-firing THIS
    // SAME trigger, but it would still cascade into a *separate* trigger on
    // the same event if one existed, so this must not be split into two.
    chunks.push(`CREATE TRIGGER trg_${t}_outbox_upd AFTER UPDATE ON ${t} BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('${t}', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE ${t} SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END`);

    chunks.push(`CREATE TRIGGER trg_${t}_outbox_del AFTER DELETE ON ${t} BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('${t}', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END`);
  }

  return chunks.join('\n--> statement-breakpoint\n') + ';\n';
}

function pgSql() {
  const chunks = [];

  chunks.push(`CREATE TABLE IF NOT EXISTS _sync_outbox (
  id BIGSERIAL PRIMARY KEY,
  table_name TEXT NOT NULL,
  row_id TEXT NOT NULL,
  op TEXT NOT NULL,
  changed_at BIGINT NOT NULL
)`);

  chunks.push(`CREATE OR REPLACE FUNCTION sync_outbox_capture() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES (TG_TABLE_NAME, OLD.id, 'delete', (extract(epoch from now()) * 1000)::bigint);
    RETURN OLD;
  ELSE
    INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES (TG_TABLE_NAME, NEW.id, lower(TG_OP), (extract(epoch from now()) * 1000)::bigint);
    RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql`);

  // Postgres BEFORE UPDATE triggers can reassign NEW.* directly, so bumping
  // updated_at needs no follow-up statement or recursion guard.
  chunks.push(`CREATE OR REPLACE FUNCTION bump_updated_at() RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = (extract(epoch from now()) * 1000)::bigint;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql`);

  for (const t of tableNames) {
    chunks.push(`DROP TRIGGER IF EXISTS trg_${t}_outbox ON ${t}`);
    chunks.push(`CREATE TRIGGER trg_${t}_outbox AFTER INSERT OR UPDATE OR DELETE ON ${t} FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture()`);
    chunks.push(`DROP TRIGGER IF EXISTS trg_${t}_bump_updated ON ${t}`);
    chunks.push(`CREATE TRIGGER trg_${t}_bump_updated BEFORE UPDATE ON ${t} FOR EACH ROW EXECUTE FUNCTION bump_updated_at()`);
  }

  return chunks.join(';\n\n') + ';\n';
}

function arg(name) {
  const found = process.argv.find((a) => a.startsWith(`--${name}=`));
  return found ? found.slice(name.length + 3) : null;
}

const sqliteOut = arg('sqlite-out');
const pgOut = arg('pg-out');

if (!sqliteOut && !pgOut) {
  console.error('Usage: node scripts/generate-sync-triggers.js --sqlite-out=<path> --pg-out=<path>');
  process.exit(1);
}

if (sqliteOut) {
  fs.writeFileSync(sqliteOut, sqliteSql());
  console.log(`Wrote SQLite trigger SQL (${tableNames.length} tables) to ${sqliteOut}`);
}
if (pgOut) {
  fs.mkdirSync(pgOut.split('/').slice(0, -1).join('/'), { recursive: true });
  fs.writeFileSync(pgOut, pgSql());
  console.log(`Wrote Postgres trigger SQL (${tableNames.length} tables) to ${pgOut}`);
}
