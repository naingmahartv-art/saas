# Release Notes - SaaS Platform v1.2.8

**Release Date:** September 20, 2026  
**Build Artifacts:** `SaaS-Platform-Setup-1.2.8.exe` (Windows x64)

---

## 🌟 Highlights & Major Features

### 1. Dynamic User Roles & Granular Permission Matrix
* **Custom Role Management UI (`/org/[orgId]/admin/roles`)**:
  * Organizations can now define custom roles (e.g. `Auditor`, `Accountant`, `Floor Supervisor`) or customize default templates (`cashier`, `supervisor`, `org_admin`).
  * 10 distinct permission categories with 38 granular capabilities spanning Sale Ledger, Buy Offload, Voucher History, Agent Management, Session Controls, Financial Settlements, Local Storage Queue, and Audit Logs.
* **Real-time API & Middleware Enforcement**:
  * Write endpoints (`/api/org/[orgId]/ledger/*`, `/api/org/[orgId]/agents/*`, etc.) enforce granular permissions dynamically against Firestore custom role definitions.
  * Attempted actions without proper permissions are immediately rejected with `403 Forbidden`.
* **Dynamic Member Assignment**:
  * Resolved user creation validation in `/api/organizations/[orgId]/users` to support assigning any organization-defined custom role.

---

### 2. Finished / Closed Session Voucher Policy
* **Cashier Role (Lower Role)**:
  * Automatically switches to **Strict Read-Only Mode** when a lottery session closes (`isActive: false`).
  * Entry form inputs, touch keypad, and delete buttons are disabled with clear status badge: `Session Closed (Read Only)`.
  * Backend endpoints reject write attempts on finished sessions with `403 Forbidden`.
* **Supervisor & Admin Roles (Upper Roles)**:
  * Retain full historical auditing and override rights on finished sessions.
  * UI displays an amber badge: `Finished Session (Admin Edit)`.

---

### 3. Local Vouchers & Per-Session Offline Sync UI
* **Per-Session Queue Separation (`/org/[orgId]/2d/local-vouchers`)**:
  * Added **Session Selector dropdown** and **Interactive Session Status Pills** to filter local vouchers by specific date and time slot (e.g., `12:00 PM #1`, `04:30 PM #2`).
  * Displays per-session breakdown of Synced (`✓`), Pending (`⏳`), and Failed (`⚠️`) records.
* **Offline-to-Online Auto Reconnection Sync**:
  * Automatic background drain loop syncs pending local vouchers to Firestore in chronological order when network reconnects.
  * Sequential Server Serial Numbers (`srNo`) are automatically assigned and confirmed.

---

## 🐛 Bug Fixes & Stability Improvements

1. **Fixed `luckyNumber is not defined` ReferenceError**:
   - Resolved runtime crash in `2D Ledger` and `Buy Workspace` server page components.
2. **Dynamic Custom Role Validation**:
   - Fixed `Role must be one of: org_admin, supervisor, cashier` error when registering members with newly created custom roles.
3. **App Routing & Middleware for Custom Roles**:
   - Updated `middleware.js` and `canAccessOrgApp` in `permissions.js` to ensure users with custom roles can seamlessly access authorized application sections.
4. **Desktop Auto-Update & Native Engine**:
   - Upgraded desktop shell dependencies and updated release metadata in `latest.yml`.

---

## 🧪 Quality Assurance & Verification Matrix

* **Automated Test Suite**:
  - `scripts/run-all-scenarios.js`: **24 / 24 Scenarios Verified Passed**.
  - Verified online creation, complex shorthand token expansion (`19R100`, `0F300`, `[12]500`), editing, deletion, closed session guards, offline queueing, and reconnection sync.
* **Manual QA Test Plan**:
  - Exported standard human testing test cases in `public/human_testing_test_cases.csv`.

---

## 📦 Download & Installation

* **Windows Installer**: `electron-app/dist/SaaS-Platform-Setup-1.2.8.exe`
* **Size**: 97.5 MB
* **Architecture**: Windows x64 (NSIS one-click installer)
