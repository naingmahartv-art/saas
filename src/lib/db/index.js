import { neon } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';
import * as legacySchema from './schema.pg.js';

// Firestore is now the live datastore for the whole app (see firestore.js).
// This Postgres connection is kept **read-only**, purely so pre-cutover
// ledger history/reports (sessions from before the migration) remain
// queryable — see legacy-reports.js for the cutover-date branch that decides
// whether a given date's data should come from here or from Firestore.
let legacyDb;

export function getLegacyDb() {
  if (!legacyDb) {
    const sql = neon(process.env.NEON_DATABASE_URL);
    legacyDb = drizzle(sql, { schema: legacySchema });
  }
  return legacyDb;
}

export { legacySchema };
