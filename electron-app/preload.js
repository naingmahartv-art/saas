const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('isElectronApp', true);
contextBridge.exposeInMainWorld('electronAPI', {
  checkForUpdates: () => ipcRenderer.send('check-for-updates'),
  onUpdateStatus: (callback) => {
    const subscription = (_event, status) => callback(status);
    ipcRenderer.on('update-status', subscription);
    return () => ipcRenderer.removeListener('update-status', subscription);
  },
  quitAndInstall: () => ipcRenderer.send('quit-and-install'),
  logAnalyticsEvent: (eventName, params) => {
    ipcRenderer.send('telemetry-log-event', { eventName, params });
  },
  logError: (type, error, fatal = false) => {
    ipcRenderer.send('telemetry-log-error', {
      type,
      error: typeof error === 'object' ? { message: error.message, stack: error.stack } : String(error),
      fatal,
    });
  },
});
