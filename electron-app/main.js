const { app, BrowserWindow, dialog, shell } = require('electron');
const { autoUpdater } = require('electron-updater');
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

function loadEmbeddedConfig() {
  const candidates = [
    path.join(APP_BUNDLE_DIR, 'env-config.cjs'),
    path.join(APP_BUNDLE_DIR, 'env-config.json'),
    path.join(APP_BUNDLE_DIR, 'env-config.js'),
  ];
  for (const envPath of candidates) {
    if (fs.existsSync(envPath)) {
      try {
        const loaded = require(envPath);
        if (loaded && Object.keys(loaded).length > 0) {
          console.log(`Loaded ${Object.keys(loaded).length} env variables from ${envPath}`);
          return loaded;
        }
      } catch (e) {
        console.error(`Failed to load env config from ${envPath}:`, e);
      }
    }
  }
  return {};
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
      NEXT_PUBLIC_APP_MODE: 'electron',
      APP_MODE: 'electron',
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
  return `data:text/html,<html><head><style>
    body { display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; font-family: system-ui, -apple-system, sans-serif; background: #0f172a; color: #f8fafc; }
    .card { text-align: center; padding: 40px 48px; background: #1e293b; border-radius: 16px; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.4); border: 1px solid #334155; }
    .spinner { width: 44px; height: 44px; border: 4px solid #334155; border-top-color: #6366f1; border-radius: 50%; animation: spin 0.8s linear infinite; margin: 0 auto 20px; }
    @keyframes spin { to { transform: rotate(360deg); } }
    h2 { margin: 0 0 8px; font-size: 22px; font-weight: 700; color: #ffffff; letter-spacing: -0.02em; }
    p { margin: 0; font-size: 14px; color: #94a3b8; }
  </style></head><body>
    <div class="card">
      <div class="spinner"></div>
      <h2>SaaS Platform</h2>
      <p>Loading SaaS Platform, please wait…</p>
    </div>
  </body></html>`;
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    title: 'SaaS Platform',
    backgroundColor: '#0f172a',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
    },
  });

  // Enable F5 / Ctrl+R to reload the app seamlessly
  mainWindow.webContents.on('before-input-event', (event, input) => {
    if (input.type === 'keyDown' && (input.key === 'F5' || ((input.control || input.meta) && input.key.toLowerCase() === 'r'))) {
      mainWindow.reload();
      event.preventDefault();
    }
  });

  mainWindow.loadURL(loadingHtml());
  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

function setupAutoUpdater() {
  if (!app.isPackaged) return;
  try {
    autoUpdater.autoDownload = true;
    autoUpdater.autoInstallOnAppQuit = true;

    autoUpdater.on('update-available', (info) => {
      console.log('Update available:', info.version);
    });

    autoUpdater.on('update-downloaded', (info) => {
      dialog.showMessageBox({
        type: 'info',
        title: 'Update Ready',
        message: `A new version (${info.version}) of SaaS Platform has been downloaded.`,
        buttons: ['Restart Now', 'Later']
      }).then((result) => {
        if (result.response === 0) {
          autoUpdater.quitAndInstall();
        }
      });
    });

    autoUpdater.on('error', (err) => {
      console.error('Auto-updater error:', err);
    });

    autoUpdater.checkForUpdatesAndNotify().catch((err) => {
      console.error('Failed to check for updates:', err);
    });
  } catch (err) {
    console.error('Auto updater setup failed:', err);
  }
}

app.whenReady().then(async () => {
  createWindow();
  setupAutoUpdater();

  const config = loadEmbeddedConfig();
  const remoteUrl = config.REMOTE_URL || process.env.REMOTE_URL;

  // 1. Try loading Vercel Hosted URL first if configured
  if (remoteUrl) {
    console.log(`Checking connection to remote URL: ${remoteUrl}`);
    const isRemoteOnline = await isServerReady(remoteUrl);
    if (isRemoteOnline) {
      console.log(`Remote Vercel server online. Loading ${remoteUrl}`);
      if (mainWindow) mainWindow.loadURL(remoteUrl);
      
      app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) createWindow();
      });
      return;
    }
    console.warn(`Remote URL ${remoteUrl} unreachable. Falling back to local server.`);
  }

  // 2. Fallback to local standalone server
  if (!fs.existsSync(SERVER_ENTRY)) {
    dialog.showErrorBox(
      'Build missing',
      `Bundled server not found at:\n${SERVER_ENTRY}\n\nRun "yarn build" in the project root, then "yarn prepare-bundle" in electron-app/ before packaging or starting.`
    );
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

  if (mainWindow) mainWindow.loadURL(serverUrl + '/');

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
