# frmLGEnt UI and Action Report

## File
- `revereenginerring/frmLGEnt.frm`

## Purpose
This report documents the user interface layout and event/action logic for the VB6 form `frmLGEnt`, including the major controls, hidden workflow panels, and keyboard shortcuts.

---

## 1. Form structure

### Main visible areas
- **Top header area**
  - `txtAgentName` — agent selection / input field
  - `cboSort` — primary sort dropdown
  - `cboSort1` — secondary sort dropdown
  - `cmdRefresh` — refresh button
  - `cmdRoundFormat` — Buy Now / round format button

- **Primary entry block**
  - `txtNum` — main number-expression input
  - `txtAmount` — output amount field
  - `txtSrNo` — serial number display
  - `txtRate` — rate input
  - `txtCom` — commission input
  - `Text1`, `Text2`, `Text3`, `Text4` — summary / status fields
  - `lblLimit`, `lblPercent`, `lblMaxPaid` — limit and total indicators

- **Main grids**
  - `Grid` — primary sale/ledger grid
  - `Grid1` — secondary data/result grid
  - `GridSort` — sort output grid

- **Action buttons**
  - Primary: `cmdSave`, `cmdSearch`, `cmdExit`
  - Validation / checking: `cmdCheck`, `cmdCheck_Agent`, `cmdClear`, `cmdRefresh`
  - Sale actions: `cmdSold`, `cmdNotBuy`, `cmdHot`, `cmdRoundFormat`, `cmdLucky`, `cmdLimit`, `cmdAdv`
  - Reports: `cmdReport2`, `cmdReport5`, `cmdRpt6`, `cmdFindSrNo`

- **Hidden frames / modal overlays**
  - `fraChecking` — number-checking workflow
  - `fraBuy` — buy/update workflow
  - `fraCheck_Agent` — agent validation workflow

---

## 2. Hidden workflow panels

### `fraChecking`

- Visible only when checking workflow is active.
- Controls:
  - `Checking_txtNum` — number input used for checking
  - `Checking_txtAmount1` — result/amount display
  - `Checking_Grid` — after-sale result grid
  - `Checking_Grid1` — before-sale result grid
  - `Check1` — Buy Now checkbox
  - `cmdClear` — clear check inputs
  - `Checking_lblCount` — count summary label

### `fraBuy`

- Contains the buy/update form and grid used after sale logic.
- Controls:
  - `txtName` — description or label for current buy session
  - `GridBuy` — buy flow grid
  - Hidden `chkCurrentSaleNum` — current sale toggle

### `fraCheck_Agent`

- Contains the agent-specific validation panel.
- Controls:
  - `txtAgent_Num` — agent number input
  - `Agent_Grid` — result grid for agent check
  - `cmdAgent_Clear` — clear agent search
  - Labels showing before-sale/agent status

---

## 3. Key input controls and events

### Component-level detail
This section lists the main controls in `frmLGEnt`, their UI role, and the VB events attached to each.

- `txtAgentName` (ComboBox)
  - Visible
  - Caption: none
  - Purpose: agent selection/input
  - Events: `KeyPress`, `LostFocus`
  - Function: validate agent name, populate agent state, refresh form

- `txtNum` (TextBox)
  - Visible
  - Caption: none
  - Purpose: number expression entry
  - Events: `Change`, `KeyPress`
  - Function: parse sale number strings, compute amount, validate input

- `txtRate` (TextBox)
  - Visible
  - Caption: none
  - Purpose: rate input
  - Events: `KeyPress`, `LostFocus`
  - Function: enforce numeric input, recalculate dependent values

- `txtCom` (TextBox)
  - Visible
  - Caption: none
  - Purpose: commission input
  - Events: `KeyPress`, `LostFocus`
  - Function: enforce numeric input, validate commission values

- `txtAmount` (TextBox)
  - Visible
  - Caption: none
  - Purpose: show computed amount
  - Events: none detected
  - Function: display calculated sale amount for current input

- `txtSrNo` (TextBox)
  - Visible
  - Caption: none
  - Purpose: serial number display
  - Events: none detected
  - Function: show the current serial/receipt number

- `Text1` / `Text2` / `Text3` / `Text4` (TextBox)
  - `Text1` visible, summary display
  - `Text2` hidden, helper result value
  - `Text3` visible, `Change` event
  - `Text4` visible, `KeyPress` and `LostFocus`
  - Purpose: status, calculation, and hidden helper values

- `txtAgent_Num` (TextBox)
  - Visible
  - Caption: none
  - Purpose: agent lookup in agent-check panel
  - Events: `KeyPress`

- `txtEditNum` (TextBox)
  - Hidden
  - Caption: none
  - Purpose: helper edit field for internal input changes
  - Events: `KeyPress`, `LostFocus`

- `txtName` (TextBox)
  - Visible
  - Caption: none
  - Purpose: buy panel description or name label
  - Events: `KeyPress`

- `txtFormula1`, `txtBalance` (TextBox)
  - Visible
  - Purpose: summary formula and balance display
  - Events: none detected

- `lblLimit`, `lblPercent`, `lblMaxPaid` (Label)
  - Visible
  - Purpose: limit, percent, max-paid status indicators
  - Events: none detected

- `cboSort` / `cboSort1` (ComboBox)
  - Visible
  - Purpose: sort mode selection
  - Events: `Click`

- `cmdSave` (CommandButton)
  - Visible
  - Caption: `&Save ( F1 )`
  - Events: `Click`
  - Function: main save/commit action

- `cmdSearch` (CommandButton)
  - Visible
  - Caption: `S&earch ( F8 )`
  - Events: `Click`
  - Function: open search workflow

- `cmdExit` (CommandButton)
  - Visible
  - Caption: `E&xit ( F4 )`
  - Events: `Click`
  - Function: close form/app

- `cmdCheck` (CommandButton)
  - Visible
  - Caption: `Checking Num?`
  - Events: `Click`
  - Function: open/check number workflow

- `cmdCheck_Agent` (CommandButton)
  - Visible
  - Caption: `Checking Agent !`
  - Events: `Click`
  - Function: open agent validation workflow

- `cmdClear` (CommandButton)
  - Visible
  - Caption: `&Clear`
  - Events: `Click`
  - Function: clear checking workflow inputs

- `cmdRefresh` (CommandButton)
  - Visible
  - Caption: none
  - Events: `Click`
  - Function: refresh current state and grid data

- `cmdSold` (CommandButton)
  - Visible
  - Caption: `.. okdY a&&mif;NyD; pm&&if;`
  - Events: `Click`
  - Function: mark sale as sold / activate buy mode

- `cmdNotBuy` (CommandButton)
  - Visible
  - Caption: `&NotSale`
  - Events: `Click`
  - Function: mark current entry not sold

- `cmdHot` (CommandButton)
  - Visible
  - Caption: `&Hot`
  - Events: `Click`
  - Function: set hot number status

- `cmdLucky` (CommandButton)
  - Visible
  - Caption: `Luc&ky`
  - Events: `Click`
  - Function: apply lucky-number logic

- `cmdLimit` (CommandButton)
  - Visible
  - Caption: `&Limit`
  - Events: `Click`
  - Function: validate limits and update warnings

- `cmdAdv` (CommandButton)
  - Visible
  - Caption: `&Adv`
  - Events: `Click`
  - Function: open advanced mode or filter

- `cmdRoundFormat` (CommandButton)
  - Visible
  - Caption: `Buy Now!`
  - Events: `Click`
  - Function: prepare immediate buy workflow

- `Command1` / `Command2` (CommandButton)
  - Visible
  - `Command1` caption: `&Buy`
  - `Command2` caption: none
  - Events: `Click`
  - Function: auxiliary buy or helper actions

- `cmdReport2`, `cmdReport5`, `cmdRpt6`, `cmdFindSrNo` (CommandButton)
  - Visible
  - Events: `Click`
  - Function: run report workflows and summaries

- `Check1` (CheckBox)
  - Visible
  - Caption: `Buy Now!`
  - Events: `Click`
  - Function: toggle buy-now state in checking panel

- `chkCurrentSaleNum` (CheckBox)
  - Hidden
  - Events: `Click`
  - Function: additional current sale toggle in buy panel

- `chkRefresh` (CheckBox)
  - Hidden
  - Caption: `Auto Refresh`
  - Events: `Click`
  - Function: auto-refresh mode toggle

- `Grid`, `Grid1`, `GridSort`, `GridBuy`, `Checking_Grid`, `Checking_Grid1`, `Agent_Grid` (MSFlexGrid)
  - Visible as grid panels
  - Events: `Grid_Click`, `Grid_KeyDown`, `Grid_MouseDown`
  - Function: display rows, select entries, delete rows, show details

- `fraChecking`, `fraBuy`, `fraCheck_Agent` (Frame)
  - Hidden by default
  - Function: modal workflow containers for check, buy, and agent actions

- `Timer1`, `Checking_Timer1`, `Timer_NotSale` (Timer)
  - Visible
  - Events: `Timer`
  - Function: periodic refresh and workflow polling

- `mnuDelete` (Menu)
  - Caption: `&Delete`
  - Events: `Click`
  - Function: delete selected grid row

---

### `txtAgentName`
- Event: `txtAgentName_KeyPress`
  - likely filters input and handles Enter to validate immediately.
- Event: `txtAgentName_LostFocus`
  - validates agent name when focus leaves the field.
  - clears invalid agent and refreshes state.

### `txtNum`
- Event: `txtNum_Change`
  - parses number expression input.
  - updates amount, totals, and internal sale state.
- Event: `txtNum_KeyPress`
  - restricts allowed characters.
  - likely handles Enter for next action.

### `txtRate`
- Event: `txtRate_KeyPress`
  - numeric input enforcement.
- Event: `txtRate_LostFocus`
  - validate rate and recalculate dependent values.

### `txtCom`
- Event: `txtCom_KeyPress`
  - numeric input enforcement.
- Event: `txtCom_LostFocus`
  - validate commission and refresh calculations.

### `Text4`
- Event: `Text4_KeyPress`
  - likely numeric control or auxiliary input.
- Event: `Text4_LostFocus`
  - validate and commit hidden helper values.

### Other number inputs
- `Checking_txtNum_KeyPress` — number checking entry inside `fraChecking`.
- `txtAgent_Num_KeyPress` — agent lookup input inside `fraCheck_Agent`.
- `txtEditNum_KeyPress` / `txtEditNum_LostFocus` — hidden helper editing input.

---

## 4. Button actions and primary logic

### `cmdSave` (`cmdSave_Click`)
- Validates current input.
- Requires valid `txtAgentName`.
- Parses `txtNum` number expression.
- Checks duplicate number/serial and limit rules.
- Validates rate and commission.
- Saves ledger and sale details.
- Refreshes grids and totals.

### `cmdSearch` (`cmdSearch_Click`)
- Opens search workflow.
- Likely searches existing sale/ledger rows.
- Updates form state when an item is selected.

### `cmdExit` (`cmdExit_Click`)
- Closes the form or application.

### `cmdCheck` (`cmdCheck_Click`)
- Opens `fraChecking`.
- Toggles checking mode.
- Refreshes before/after sale grid data.

### `cmdCheck_Agent` (`cmdCheck_Agent_Click`)
- Opens agent validation panel.
- Looks up agent sales and status by `txtAgent_Num`.

### `cmdSold` (`cmdSold_Click`)
- Marks selected number sold.
- Likely moves the form into buy/update flow.

### `cmdNotBuy` (`cmdNotBuy_Click`)
- Marks the current entry as not sold.

### `cmdHot` (`cmdHot_Click`)
- Applies “hot” status to the current number.

### `cmdLucky` (`cmdLucky_Click`)
- Applies lucky-number logic to the current entry.

### `cmdLimit` (`cmdLimit_Click`)
- Runs limit validation.
- Updates limit warning and status labels.

### `cmdAdv` (`cmdAdv_Click`)
- Opens advanced mode or advanced filters.

### `cmdRoundFormat` (`cmdRoundFormat_Click`)
- Prepares the current entry for immediate buy.
- Likely reformats numbers or toggles buy mode.

### `cmdReport2` (`cmdReport2_Click`)
- Generates serial/number report.

### `cmdReport5` (`cmdReport5_Click`)
- Stages an agent-oriented report.
- Runs `ZLg1` style report.

### `cmdRpt6` (`cmdRpt6_Click`)
- Stages current-session detail.
- Runs `ZLg3` style report.

### `cmdFindSrNo` (`cmdFindSrNo_Click`)
- Finds and reports by serial number.

### `cmdClear` (`cmdClear_Click`)
- Clears active checking inputs.

### `cmdRefresh` (`cmdRefresh_Click`)
- Refreshes current data and grid state.

### `mnuDelete` (`mnuDelete_Click`)
- Deletes the selected row from the main grid after confirmation.

---

## 5. Grid behavior

### `Grid`
- `Grid_Click` — selects a row and populates form fields.
- `Grid_KeyDown` — handles Enter and Delete on grid rows.
- `Grid_MouseDown` — right-click opens delete menu.

### Other grid controls
- `Grid1` — secondary display or detailed lookup.
- `GridSort` — sort results.
- `Checking_Grid` / `Checking_Grid1` — checking workflow grids.
- `Agent_Grid` — agent check results.
- `GridBuy` — buy workflow grid.

---

## 6. Keyboard shortcuts
- `F1` — Save
- `F4` — Exit
- `F8` — Search
- `F12` — Checking
- `F2` — Report 5 / agent report
- `F3` — Report 6 / session report
- Labels indicate additional function keys for other modes:
  - `F5`, `F6`, `F7`, `F10`, `F11`

---

## 7. Timers
- `Timer1` — periodic updates for main form logic.
- `Checking_Timer1` — periodic updates for the checking workflow.
- `Timer_NotSale` — timer for not-sale logic or state refresh.

---

## 8. Important implementation notes
- The form uses `KeyPreview = True`.
- Hidden frames are used as modal overlays.
- The UI appears to be a sales/lottery ledger entry system.
- The report is based on the decompiled form metadata and event handler references.
- Exact internal formula and database persistence logic are not fully visible from designer metadata alone.
