const path = require('path');
const { rebuild } = require('@electron/rebuild');

// Rebuilds native modules (better-sqlite3) inside app-bundle/node_modules
// against Electron's ABI. This is separate from electron-builder's own
// built-in rebuild step, which only touches electron-app's own node_modules
// — never the extraResources app-bundle folder the server actually runs
// from under ELECTRON_RUN_AS_NODE.
function arg(name, fallback) {
  const prefix = `--${name}=`;
  const found = process.argv.find(a => a.startsWith(prefix));
  return found ? found.slice(prefix.length) : fallback;
}

const platform = arg('platform', process.platform);
const arch = arg('arch', process.arch);
const electronVersion = require(path.join(__dirname, '..', 'node_modules', 'electron', 'package.json')).version;
const buildPath = path.join(__dirname, '..', 'app-bundle');

console.log(`Rebuilding native modules in ${buildPath} for electron@${electronVersion} (${platform}/${arch})`);

rebuild({ buildPath, electronVersion, arch, platform, onlyModules: ['better-sqlite3'] })
  .then(() => {
    console.log('Native rebuild complete.');
  })
  .catch(err => {
    console.error('Native rebuild failed:', err);
    process.exit(1);
  });
