const { contextBridge } = require('electron');

contextBridge.exposeInMainWorld('isElectronApp', true);
