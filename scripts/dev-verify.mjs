// Isolated local-sqlite dev server for browser-preview verification only —
// keeps the real Neon Postgres data untouched. Not part of the normal
// dev/build flow.
process.env.DATABASE_DRIVER = 'sqlite';
process.env.SQLITE_DB_PATH = './.verify/local.db';
// Explicitly blanked (not deleted) — Next.js only fills in .env.local values
// for keys that are still undefined, so setting '' here (falsy, so sync.js's
// `if (NEON_DATABASE_URL)` stays off) keeps .env.local's real URL from
// clobbering it. Fully offline, no two-way sync to the real Neon DB.
process.env.NEON_DATABASE_URL = '';

const { spawn } = await import('child_process');
const child = spawn('npx', ['next', 'dev', '-p', '3412'], {
  stdio: 'inherit',
  env: process.env,
  cwd: new URL('..', import.meta.url).pathname,
});
child.on('exit', (code) => process.exit(code ?? 0));
