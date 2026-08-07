import { neon } from '@neondatabase/serverless';
import { drizzle as drizzlePg } from 'drizzle-orm/neon-http';
import { pgTable, text, bigint } from 'drizzle-orm/pg-core';
import { getTableName, eq, gt, sql } from 'drizzle-orm';
import * as pgSchema from './schema.pg.js';
import * as sqliteSchema from './schema.sqlite.js';

const SYNC_INTERVAL_MS = 20_000;
const PROBE_TIMEOUT_MS = 4_000;
const BATCH_SIZE = 200;

// Minimal ad-hoc table def for reading the remote outbox — not part of the
// app schema, only used internally here.
const pgOutbox = pgTable('_sync_outbox', {
  id: bigint('id', { mode: 'number' }).primaryKey(),
  tableName: text('table_name').notNull(),
  rowId: text('row_id').notNull(),
  op: text('op').notNull(),
  changedAt: bigint('changed_at', { mode: 'number' }).notNull(),
});

function buildTableMap(schemaModule) {
  const map = {};
  for (const v of Object.values(schemaModule)) {
    if (v && typeof v === 'object' && v[Symbol.for('drizzle:IsDrizzleTable')] === true) {
      map[getTableName(v)] = v;
    }
  }
  return map;
}

const pgTablesByName = buildTableMap(pgSchema);
const sqliteTablesByName = buildTableMap(sqliteSchema);

let sqliteDb = null;
let rawSqlite = null;
let pgDb = null;
let timer = null;
let syncing = false;

const state = { status: 'offline', lastSyncedAt: null, lastError: null };

function withTimeout(promise, ms) {
  return Promise.race([
    promise,
    new Promise((_, reject) => setTimeout(() => reject(new Error('timeout')), ms)),
  ]);
}

async function probeConnectivity() {
  try {
    await withTimeout(pgDb.execute(sql`select 1`), PROBE_TIMEOUT_MS);
    return true;
  } catch {
    return false;
  }
}

// Removes the outbox entry OUR OWN local write (applying a pulled change)
// just created — otherwise a pulled change would get redundantly queued
// straight back up to Postgres on the next push.
function suppressLocalEcho(tableName, rowId) {
  rawSqlite
    .prepare(
      `DELETE FROM _sync_outbox WHERE id = (
         SELECT id FROM _sync_outbox WHERE table_name = ? AND row_id = ? ORDER BY id DESC LIMIT 1
       )`
    )
    .run(tableName, rowId);
}

async function push() {
  const entries = rawSqlite
    .prepare('SELECT * FROM _sync_outbox ORDER BY id ASC LIMIT ?')
    .all(BATCH_SIZE);

  for (const entry of entries) {
    const pgTable = pgTablesByName[entry.table_name];
    const localTable = sqliteTablesByName[entry.table_name];
    if (!pgTable || !localTable) {
      rawSqlite.prepare('DELETE FROM _sync_outbox WHERE id = ?').run(entry.id);
      continue;
    }

    if (entry.op === 'delete') {
      await pgDb.delete(pgTable).where(eq(pgTable.id, entry.row_id));
    } else {
      const rows = await sqliteDb.select().from(localTable).where(eq(localTable.id, entry.row_id));
      if (rows.length === 0) {
        // Row was deleted locally again before this entry got pushed — a
        // later 'delete' outbox entry (if any) will handle it.
        rawSqlite.prepare('DELETE FROM _sync_outbox WHERE id = ?').run(entry.id);
        continue;
      }
      const row = rows[0];
      await pgDb
        .insert(pgTable)
        .values(row)
        .onConflictDoUpdate({
          target: pgTable.id,
          set: row,
          setWhere: sql`${pgTable.updatedAt} < ${row.updatedAt}`,
        });
    }

    rawSqlite.prepare('DELETE FROM _sync_outbox WHERE id = ?').run(entry.id);
  }
}

async function pull() {
  const cursorRow = rawSqlite.prepare('SELECT cursor FROM _sync_state WHERE id = 1').get();
  const cursor = cursorRow ? cursorRow.cursor : 0;

  const entries = await pgDb
    .select()
    .from(pgOutbox)
    .where(gt(pgOutbox.id, cursor))
    .orderBy(pgOutbox.id)
    .limit(BATCH_SIZE);

  for (const entry of entries) {
    const localTable = sqliteTablesByName[entry.tableName];
    const remoteTable = pgTablesByName[entry.tableName];

    if (localTable && remoteTable) {
      if (entry.op === 'delete') {
        await sqliteDb.delete(localTable).where(eq(localTable.id, entry.rowId));
      } else {
        const rows = await pgDb.select().from(remoteTable).where(eq(remoteTable.id, entry.rowId));
        if (rows.length > 0) {
          const row = rows[0];
          await sqliteDb
            .insert(localTable)
            .values(row)
            .onConflictDoUpdate({
              target: localTable.id,
              set: row,
              setWhere: sql`${localTable.updatedAt} < ${row.updatedAt}`,
            });
        }
      }
      suppressLocalEcho(entry.tableName, entry.rowId);
    }

    rawSqlite.prepare('UPDATE _sync_state SET cursor = ? WHERE id = 1').run(entry.id);
  }
}

export async function syncNow() {
  if (!pgDb) return getStatus();
  if (syncing) return getStatus();
  syncing = true;
  try {
    const online = await probeConnectivity();
    if (!online) {
      state.status = 'offline';
      return getStatus();
    }
    state.status = 'syncing';
    await push();
    await pull();
    state.status = 'online';
    state.lastSyncedAt = Date.now();
    state.lastError = null;
  } catch (err) {
    state.status = 'error';
    state.lastError = String(err?.message || err);
  } finally {
    syncing = false;
  }
  return getStatus();
}

export function getStatus() {
  if (!pgDb) {
    return { configured: false, status: 'not_configured', pendingCount: 0, lastSyncedAt: null, lastError: null };
  }
  const pendingCount = rawSqlite
    ? rawSqlite.prepare('SELECT COUNT(*) as c FROM _sync_outbox').get().c
    : 0;
  return {
    configured: true,
    status: state.status,
    pendingCount,
    lastSyncedAt: state.lastSyncedAt,
    lastError: state.lastError,
  };
}

// Starts the background sync loop. No-op (sync stays permanently
// "not configured") if neonUrl isn't set — fully offline use is supported.
export function startSync({ db, raw, neonUrl }) {
  if (!neonUrl) return;
  sqliteDb = db;
  rawSqlite = raw;
  const sql_ = neon(neonUrl);
  pgDb = drizzlePg(sql_, { schema: pgSchema });

  syncNow().catch(() => {});
  timer = setInterval(() => {
    syncNow().catch(() => {});
  }, SYNC_INTERVAL_MS);
  if (timer.unref) timer.unref();
}
