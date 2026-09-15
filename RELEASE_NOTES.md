# Release Notes — SaaS Platform v1.2.6

**Release Date:** September 1, 2026  
**Build Target:** Windows (`SaaS-Platform-Setup-1.2.6.exe`)

---

## 🚀 What's New & Highlights

### 1. 📊 2D Reports Page Redesign (`/2d/reports`)
- **Report Format 1 (Period Settlement Report)**:
  - Clean, minimalist bordered layout matching official accounting standards.
  - Columns: `Name` | `Amount` | `Lucky` | `Total` | `Type` (`S` / `B`).
  - Clear header with date range and voucher counts.
  - Negative net amounts highlighted in red.
  - Accounting **double-underline** on the final Grand Total settlement.
  - Granular period filtering: **Day** (date picker), **Week**, and **Month** (month dropdown selector).

- **Report Format 2 (Date Range Matrix)**:
  - Grouped by Agent with prominent `Name : <Agent Name>` headers.
  - Displays daily breakdowns for active trading sessions (**12:00** and **04:00**):
    - Sub-columns: `Amount` | `Lucky` | `Net`.
  - Daily Net Total and Slip Type indicator.
  - Subtotal row for each agent (`<Agent Name> Total:`).
  - Summary **Grand Total** with double-underline at the bottom.
  - Integrated per-session commission rates and win-multiplier rates for each agent.
  - Removed `09:00` session columns per requirements.

- **Export Updates**:
  - Full CSV and PDF export support updated for both Format 1 and Format 2 structures.

---

### 2. 📑 2D Ledger (`/2d/ledger`) & Buy Page Reports Modal (`F6`)
- **Two-Section Accounting Format**:
  - **Upper Section (`ta&mif;` / အရောင်းစာရင်း)**: Agent Sales, Commission %, Lucky wins, Multiplier Rate, and Balance Total + Sale Subtotal.
  - **Lower Section (`t0,f` / အဝယ်စာရင်း)**: Offload/Buy entries, Commission recovery, Lucky wins, and Balance Total + Buy Subtotal.
  - Grand settlement total with double-underline.

---

### 3. ⚙️ Agent Session Commissions & Rates Support
- Added support for per-session commission and rate customization for each agent.
- Range report API (`/api/org/[orgId]/reports/range`) and settlement calculations automatically resolve:
  - **Commission**: `session.agentCommissions[agentId]` $\rightarrow$ `agent.commission` $\rightarrow$ default (`16%` for Buy / `0%` for Sales).
  - **Rate**: `session.agentRates[agentId]` $\rightarrow$ `agent.rate` $\rightarrow$ session `rate` $\rightarrow$ default `80`.

---

### 4. ⌨️ Quick Entry Modal Usability
- **`Shift + Tab` Navigation**:
  - Pressing `Shift + Tab` in the **Amount** field returns focus to the **Numbers** field without selecting all text.
  - Cursor is positioned directly at the **end of the existing numbers** for fast appending and editing.
- **`Escape` Key**:
  - Pressing `Escape` in Amount returns focus to the end of Numbers textbox.
- Implemented across both `/2d/ledger` and `/2d/buy` Quick Entry modals.

---

### 5. 📦 Desktop Build & Packaging
- Upgraded desktop shell version to **`1.2.6`**.
- Built standalone Windows installer: `electron-app/dist/SaaS-Platform-Setup-1.2.6.exe`.
