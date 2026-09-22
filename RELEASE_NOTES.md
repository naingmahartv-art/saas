# Release Notes - SaaS Platform v1.2.9

**Release Date:** September 22, 2026  
**Build Artifacts:** `SaaS-Platform-Setup-1.2.9.exe` (Windows x64)

---

## 🌟 Highlights & Fixes in v1.2.9

### 🐛 Bug Fixes & Stability Improvements
1. **Fixed `deleteLocalVoucher is not defined` ReferenceError in Queue Drain**:
   - Resolved runtime exception during offline queue background drain when synchronizing deleted voucher actions (`drainQueue` in `voucherQueue.js`).
   - Restored missing `deleteLocalVoucher` named import from `localVoucherDb.js`.

---

## 📦 Download & Installation

* **Windows Installer**: `electron-app/dist/SaaS-Platform-Setup-1.2.9.exe`
* **Architecture**: Windows x64 (NSIS one-click installer)

