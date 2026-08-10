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

function findServerDir(dir) {
  if (fs.existsSync(path.join(dir, 'server.js'))) return dir;
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    if (entry.isDirectory()) {
      const found = findServerDir(path.join(dir, entry.name));
      if (found) return found;
    }
  }
  return null;
}

const standaloneSource = findServerDir(STANDALONE_DIR) || STANDALONE_DIR;
console.log('Copying standalone source from:', standaloneSource);

try {
  fs.rmSync(OUT_DIR, { recursive: true, force: true, maxRetries: 5, retryDelay: 200 });
} catch (e) {
  console.warn('Warning removing old app-bundle:', e.message);
}
fs.cpSync(standaloneSource, OUT_DIR, { recursive: true });

fs.mkdirSync(path.join(OUT_DIR, '.next'), { recursive: true });
fs.cpSync(STATIC_DIR, path.join(OUT_DIR, '.next', 'static'), { recursive: true });

if (fs.existsSync(PUBLIC_DIR)) {
  fs.cpSync(PUBLIC_DIR, path.join(OUT_DIR, 'public'), { recursive: true });
}


let dotenv;
try {
  dotenv = require('dotenv');
} catch {
  dotenv = require(path.join(PROJECT_DIR, 'node_modules', 'dotenv'));
}

if (fs.existsSync(SQLITE_MIGRATIONS_DIR)) {
  fs.cpSync(SQLITE_MIGRATIONS_DIR, path.join(OUT_DIR, 'drizzle', 'sqlite'), { recursive: true });
}

const envLocalPath = path.join(PROJECT_DIR, '.env.local');
const envConfig = fs.existsSync(envLocalPath) ? dotenv.parse(fs.readFileSync(envLocalPath)) : {};
const envConfigCjsPath = path.join(OUT_DIR, 'env-config.cjs');
const envConfigContent = `// Auto-generated during build from .env.local\nmodule.exports = ${JSON.stringify(envConfig, null, 2)};\n`;
fs.writeFileSync(envConfigCjsPath, envConfigContent, 'utf8');
console.log('Embedded env config created at', envConfigCjsPath, 'with', Object.keys(envConfig).length, 'keys');




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

