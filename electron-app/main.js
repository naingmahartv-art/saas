const { app, BrowserWindow, dialog, shell } = require('electron');
const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');
const http = require('http');
const net = require('net');

// The bundled production build of the Next.js app (see scripts/prepare-bundle.js
// and README.md). Packaged apps read it from Resources/app-bundle; running
// unpacked via `yarn start` reads the local app-bundle/ folder instead.
const APP_BUNDLE_DIR = app.isPackaged
  ? path.join(process.resourcesPath, 'app-bundle')
  : path.join(__dirname, 'app-bundle');
const SERVER_ENTRY = path.join(APP_BUNDLE_DIR, 'server.js');

// Secrets (JWT signing secret) are never baked into the packaged app —
// anyone with the .dmg/.exe could otherwise extract them. Instead they're
// read from a config file the user creates once on their own machine, in
// the standard per-user app-data directory.
const CONFIG_DIR = path.join(app.getPath('userData'), 'config');
const CONFIG_FILE = path.join(CONFIG_DIR, '.env.local');
const REQUIRED_KEYS = ['JWT_SECRET'];

// Local SQLite database file — the app runs fully offline against this, no
// cloud DB credential needed. Lives under userData alongside the config file:
// persistent, per-machine, OS-correct automatically.
const SQLITE_DB_PATH = path.join(app.getPath('userData'), 'data', 'app.db');
const DEFAULT_ADMIN_EMAIL = 'admin@saasplatform.com';
const DEFAULT_ADMIN_PASSWORD = 'Admin@12345';

const PREFERRED_PORT = Number(process.env.SAAS_DESKTOP_PORT) || 3000;
const READY_TIMEOUT_MS = 60_000;

let serverProcess = null;
let mainWindow = null;
let serverUrl = null;

function parseEnvFile(filePath) {
  const result = {};
  const raw = fs.readFileSync(filePath, 'utf8');
  for (const line of raw.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const eq = trimmed.indexOf('=');
    if (eq === -1) continue;
    const key = trimmed.slice(0, eq).trim();
    let value = trimmed.slice(eq + 1).trim();
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1);
    }
    result[key] = value;
  }
  return result;
}

function loadUserConfig() {
  if (!fs.existsSync(CONFIG_FILE)) {
    return { config: null, missing: REQUIRED_KEYS };
  }
  const config = parseEnvFile(CONFIG_FILE);
  const missing = REQUIRED_KEYS.filter(key => !config[key]);
  return { config, missing };
}

function showConfigMissingDialog(missing) {
  fs.mkdirSync(CONFIG_DIR, { recursive: true });
  const template =
    REQUIRED_KEYS.map(key => `${key}=`).join('\n') +
    '\n\n# Optional — enables two-way cloud sync when online. Leave blank to\n' +
    '# run fully offline forever.\nNEON_DATABASE_URL=\n';
  if (!fs.existsSync(CONFIG_FILE)) {
    fs.writeFileSync(CONFIG_FILE, template);
  }
  dialog.showErrorBox(
    'Setup required',
    `Missing configuration: ${missing.join(', ')}.\n\n` +
      `Open this file and fill in the values, then restart the app:\n${CONFIG_FILE}`
  );
  shell.showItemInFolder(CONFIG_FILE);
}

// Always picks a port this process can actually bind, rather than trusting a
// fixed port — dev machines commonly have unrelated services already
// listening on 3000/3001/etc, and checking "does anything respond here"
// would risk loading the WRONG app into the window.
function findFreePort(startPort) {
  return new Promise((resolve, reject) => {
    const server = net.createServer();
    server.unref();
    server.on('error', err => {
      if (err.code === 'EADDRINUSE') {
        resolve(findFreePort(startPort + 1));
      } else {
        reject(err);
      }
    });
    server.listen(startPort, () => {
      const { port } = server.address();
      server.close(() => resolve(port));
    });
  });
}

function isServerReady(url) {
  return new Promise(resolve => {
    const req = http.get(url, res => {
      res.resume();
      resolve(true);
    });
    req.on('error', () => resolve(false));
    req.setTimeout(1500, () => {
      req.destroy();
      resolve(false);
    });
  });
}

async function waitForServer(url) {
  const start = Date.now();
  while (Date.now() - start < READY_TIMEOUT_MS) {
    if (await isServerReady(url)) return true;
    await new Promise(r => setTimeout(r, 500));
  }
  return false;
}

// Runs the bundled Next.js production server (server.js from `next build`
// with output: 'standalone') directly under Electron's own Node runtime via
// ELECTRON_RUN_AS_NODE, so no system Node/npm install is required on the
// target machine at all.
function startServer(port, userConfig) {
  fs.mkdirSync(path.dirname(SQLITE_DB_PATH), { recursive: true });

  serverProcess = spawn(process.execPath, [SERVER_ENTRY], {
    cwd: APP_BUNDLE_DIR,
    env: {
      ...process.env,
      ...userConfig,
      ELECTRON_RUN_AS_NODE: '1',
      NODE_ENV: 'production',
      PORT: String(port),
      DATABASE_DRIVER: 'sqlite',
      SQLITE_DB_PATH,
    },
  });

  serverProcess.stdout.on('data', d => console.log(`[next] ${d}`.toString().trim()));
  serverProcess.stderr.on('data', d => console.error(`[next] ${d}`.toString().trim()));
  serverProcess.on('exit', code => {
    if (code !== 0 && code !== null) {
      console.error(`Next.js server exited with code ${code}`);
    }
  });
}

function loadingHtml() {
  return `data:text/html,<html><body style="display:flex;align-items:center;justify-content:center;height:100vh;margin:0;font-family:sans-serif;background:#f8fafc;color:#334155">
    <div style="text-align:center">
      <div style="font-size:20px;font-weight:600;margin-bottom:8px">SaaS Platform</div>
      <div style="font-size:13px;color:#94a3b8">Starting local server…</div>
    </div>
  </body></html>`;
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    title: 'SaaS Platform',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
    },
  });

  mainWindow.loadURL(loadingHtml());
  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

app.whenReady().then(async () => {
  createWindow();

  if (!fs.existsSync(SERVER_ENTRY)) {
    dialog.showErrorBox(
      'Build missing',
      `Bundled server not found at:\n${SERVER_ENTRY}\n\nRun "yarn build" in the project root, then "yarn prepare-bundle" in electron-app/ before packaging or starting.`
    );
    app.quit();
    return;
  }

  const { config, missing } = loadUserConfig();
  if (missing.length > 0) {
    showConfigMissingDialog(missing);
    app.quit();
    return;
  }

  const isFreshInstall = !fs.existsSync(SQLITE_DB_PATH);

  const port = await findFreePort(PREFERRED_PORT);
  serverUrl = `http://localhost:${port}`;
  startServer(port, config);

  const ready = await waitForServer(serverUrl);
  if (!ready) {
    dialog.showErrorBox(
      'Failed to start',
      `The local server did not respond at ${serverUrl} within ${READY_TIMEOUT_MS / 1000}s. Check the config at:\n${CONFIG_FILE}`
    );
    app.quit();
    return;
  }

  if (mainWindow) mainWindow.loadURL(serverUrl);

  if (isFreshInstall) {
    dialog.showMessageBox(mainWindow, {
      type: 'info',
      title: 'Welcome',
      message: 'Default login created',
      detail: `Email: ${DEFAULT_ADMIN_EMAIL}\nPassword: ${DEFAULT_ADMIN_PASSWORD}\n\nPlease change this password after logging in.`,
    });
  }

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

app.on('before-quit', () => {
  if (serverProcess && !serverProcess.killed) {
    serverProcess.kill();
  }
});
