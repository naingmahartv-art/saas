# Release Notes - SaaS Platform v1.4.1

**Release Date:** September 28, 2026  
**Build Artifacts:** `SaaS-Platform-Setup-1.4.1.exe` (Windows x64)

---

## 🛠️ Fixes & Improvements in v1.4.1

### 1. 🐛 Electron Desktop Startup Crash Fix (`./telemetry` module not found)
- **Problem**: When launching the packaged v1.4.0 desktop installer, Electron main process threw an uncaught exception `Error: Cannot find module './telemetry'` because `telemetry.js` was omitted from the `app.asar` archive.
- **Resolution**: Updated `build.files` inside `electron-app/package.json` to explicitly bundle `telemetry.js` into the packaged application resources.
- **Impact**: Clean, reliable application launch without main process bootstrap failures.

### 2. 📦 Version Bump
- Synchronized package versions across the root web app and desktop shell to `v1.4.1`.

---

# Release Notes - SaaS Platform v1.4.0

**Release Date:** September 27, 2026  
**Build Artifacts:** `SaaS-Platform-Setup-1.4.0.exe` (Windows x64)

---

## 🌟 Highlights & Features in v1.4.0

### 1. ⚖️ Switchable Mixed Ledger Grid (Classic vs Mixed 00–99 View)
- Added inline toggle switch `[ 🛒 Classic | ⚖️ Mixed ]` directly inside the Ledger Center panel header.
- **Mixed Ledger Mode**: Displays clean, net existing amounts for each number `00`–`99` (`Sale - Buy`), supporting positive amounts, zero, and negative values.
- Sortable by `Num`, `Net Amount`, `Sale`, and `Buy` with dedicated summary statistics (`Top Net Liability`, `Total Sale`, `Total Buy`, `Total Net`).
- Full CSV export support for mixed ledger data.

### 2. ⚡ Offline-First 5-Store IndexedDB Architecture & UUID Idempotency
- Upgraded local storage engine to IndexedDB Schema v5 with dedicated stores for `vouchers`, `sessions`, `limits`, `agents`, and `machines`.
- Implemented client-generated UUID (`lid`) with atomic server `srNo` allocation, eliminating duplicate counts and sync race conditions.

### 3. 🎯 2D Buy Page & Exceeded Limit Shortcuts
- Fixed and enhanced keyboard shortcuts (`Alt+1`, `Alt+2`, `Alt+3`, `Alt+4`, `Alt+5`) and clickable header sorting in the Exceeded Limit table.
- Cleaned up user interface and removed unnecessary manual guide buttons on the Buy page.

---

## 📦 Download & Installation

* **Windows Installer**: `electron-app/dist/SaaS-Platform-Setup-1.4.0.exe`
* **Architecture**: Windows x64 (NSIS one-click installer)
