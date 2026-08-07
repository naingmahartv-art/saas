const fs = require('fs');
const path = require('path');

const PROJECT_DIR = path.join(__dirname, '..', '..');
const STANDALONE_DIR = path.join(PROJECT_DIR, '.next', 'standalone');
const STATIC_DIR = path.join(PROJECT_DIR, '.next', 'static');
const PUBLIC_DIR = path.join(PROJECT_DIR, 'public');
const SQLITE_MIGRATIONS_DIR = path.join(PROJECT_DIR, 'drizzle', 'sqlite');
const ROOT_BETTER_SQLITE3 = path.join(PROJECT_DIR, 'node_modules', 'better-sqlite3');
const OUT_DIR = path.join(__dirname, '..', 'app-bundle');

if (!fs.existsSync(STANDALONE_DIR)) {
  console.error('Missing .next/standalone — run "yarn build" (or "npm run build") in the project root first.');
  process.exit(1);
}

fs.rmSync(OUT_DIR, { recursive: true, force: true });
fs.cpSync(STANDALONE_DIR, OUT_DIR, { recursive: true });
fs.mkdirSync(path.join(OUT_DIR, '.next'), { recursive: true });
fs.cpSync(STATIC_DIR, path.join(OUT_DIR, '.next', 'static'), { recursive: true });

if (fs.existsSync(PUBLIC_DIR)) {
  fs.cpSync(PUBLIC_DIR, path.join(OUT_DIR, 'public'), { recursive: true });
}

if (!fs.existsSync(SQLITE_MIGRATIONS_DIR)) {
  console.error('Missing drizzle/sqlite — run "yarn db:generate:sqlite" in the project root first.');
  process.exit(1);
}
fs.cpSync(SQLITE_MIGRATIONS_DIR, path.join(OUT_DIR, 'drizzle', 'sqlite'), { recursive: true });

// Next's `output: 'standalone'` file tracer only copies the compiled .node
// binary + JS glue for better-sqlite3, not its C++ source/binding.gyp — so
// there's nothing for a native rebuild to compile against Electron's ABI.
// Replace the stripped copy with the full package from the root project's
// own node_modules (left untouched itself) before rebuild-native.js runs.
const bundledBetterSqlite3 = path.join(OUT_DIR, 'node_modules', 'better-sqlite3');
if (fs.existsSync(ROOT_BETTER_SQLITE3)) {
  fs.rmSync(bundledBetterSqlite3, { recursive: true, force: true });
  fs.cpSync(ROOT_BETTER_SQLITE3, bundledBetterSqlite3, { recursive: true });
}

console.log('app-bundle ready at', OUT_DIR);
