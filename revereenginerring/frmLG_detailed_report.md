# frmLG.frm and frmLG.frx Detailed Analysis and JavaScript Rewrite

## 1. Scope and Evidence

This report is based on the supplied `frmLG.frm` decompiler output and its references to `frmLG.frx`.

The file is not normal VB6 source. It contains VB6 designer metadata followed by decompiled x86-like instructions. Names such as `cmdSave_Click`, `txtNum_KeyPress`, and `Form_Load` are reliable event names, but calls such as `[Me+000007F0h]` and procedures named `Proc_4_22_45AA60` are decompiler-level names. Their original VB6 names and some global variable declarations are unavailable.

The JavaScript below is therefore a behavioral rewrite, not a byte-for-byte translation. It preserves the recovered contracts and isolates uncertain legacy operations behind adapters.

## 2. UI Overview

### Form identity

```text
Form name:       frmLG
Caption:         Ledger Entry ( Two Digit )
Client size:     15240 x 9870 twips
ControlBox:      disabled
KeyPreview:      enabled
AutoRedraw:      disabled

External controls:
    Crystal.CrystalReport
    MSFlexGridLib.MSFlexGrid
```

The form is a transaction-entry screen for two-digit lottery ledger/sale data. It has three main visual areas:

```text
LEFT / ENTRY AREA
    Agent/customer selector
    Serial number display
    Amount display
    Number-expression input
    Save, Search, Exit, Check, and report buttons
    Main ledger grid

MIDDLE / SALE OR UPDATE AREA
    Grid1
    Hidden fraBuy frame
    cboSort1 sorting selector
    MSFle detail grid

RIGHT / BUY AREA
    GridBuy
    Current user/name display
    Crystal report controls
```

### Controls and inferred responsibilities

| Control | Type | Evidence-based responsibility |
|---|---|---|
| `txtAgentName` | ComboBox | Select or type an agent name; validated against `AgentThai`. |
| `txtNum` | TextBox | Accept a custom number expression; maximum length 20; keyboard parser is in `txtNum_KeyPress`. |
| `txtSrNo` | Locked TextBox | Display selected/current serial number. |
| `txtAmount` | Locked TextBox | Display calculated amount. |
| `cmdSave` | CommandButton | Save/commit current entry through an internal helper chain. |
| `cmdSearch` | CommandButton | Open the search workflow. Caption explicitly maps to F8. |
| `cmdExit` | CommandButton | Close/unload the form. Caption explicitly maps to F4. |
| `cmdCheck` | CommandButton | Open or activate number-checking logic. |
| `cmdRpt5` | CommandButton | Build temporary agent/sale report data and run `ZLg1.rpt`. |
| `cmdRpt6` | CommandButton | Build temporary sale-detail data and run `ZLg3.rpt`. |
| `Command3` | CommandButton | Prompt for number and count, then build a top-number sales query. Caption is encoded/garbled. |
| `cboSort1` | ComboBox | Select ordering for `MSFle`; list and item data are stored in `frmLG.frx`. |
| `Grid` | MSFlexGrid | Main entry/result grid; supports click, Enter/delete, and right-click context menu. |
| `Grid1` | MSFlexGrid | Secondary ledger/sale display. |
| `GridBuy` | MSFlexGrid | Buy-side display. |
| `MSFle` | MSFlexGrid | Detail/update grid inside hidden `fraBuy`. |
| `fraBuy` | Frame | Initially invisible secondary buy/update panel. |
| `CrystalReport1` | Crystal Report | Embedded report definition/resource at `frmLG.frx:0000`. |
| `CrystalReport4` | Crystal Report | Embedded report definition/resource at `frmLG.frx:0229`. |
| `mnuUpdate` | Hidden menu | Parent of the hidden delete context menu. |
| `mnuDelete` | Menu item | Delete the selected grid entry after confirmation. |

### Visual layout

```text
Top band 1: dark olive/green shape around the entry section
Top band 2: dark olive/green shape around the middle section

Entry section:
    Agent label and combo at approximately y=480
    Serial/amount display at approximately y=900
    Number input at approximately y=1410
    Save/Search buttons at approximately y=1455
    Main grid from approximately y=2025 to y=7590

Bottom actions:
    Exit at x=180
    Report 1 at x=1260
    Report 2 at x=3000
    Garbled/encoded action at x=4380
    Check at y=8400

Right sections:
    Grid1 begins near x=6375
    GridBuy begins near x=10800
```

The captions rendered with the `WinHaka` font are not reliable Unicode text. This is likely an old Burmese/custom code page. Preserve the control identity and keyboard shortcuts rather than translating the garbled captions by guesswork.

## 3. Embedded frmLG.frx Resource Overview

`frmLG.frx` is a binary VB6 form-resource file. The `.frm` references it in these ways:

```text
CrystalReport1.OleObjectBlob = frmLG.frx:0000
cboSort1.List               = frmLG.frx:00F3
cboSort1.ItemData           = frmLG.frx:0138
MSFle.OleObjectBlob         = frmLG.frx:0145
CrystalReport4.OleObjectBlob = frmLG.frx:0229
Grid.OleObjectBlob          = frmLG.frx:031C
Grid1.OleObjectBlob         = frmLG.frx:040A
GridBuy.OleObjectBlob       = frmLG.frx:04F8
```

### What can be concluded

```text
The FRX contains:
    Crystal Reports OLE property streams
    ComboBox list strings and item data
    MSFlexGrid property streams
    Possibly report formatting, column widths, images, and fonts
```

### What cannot safely be concluded

```text
The binary resource does not expose, in this workspace, the exact:
    Grid column captions
    Grid column widths and alignment
    Crystal report formula definitions
    Embedded images
    ComboBox display strings in their original encoding
```

The JavaScript rewrite uses arrays of row objects instead of MSFlexGrid and uses report adapter calls instead of Crystal OLE blobs.

## 4. Recovered Global State

The exact names are not present, but the event code clearly uses state equivalent to the following:

```text
CurrentOnCount       current session/count selected by the user
CurrentAMPM          current AM/PM period
CurrentMachineID     machine identifier
MinSerial            configured first serial number
MaxSerial            configured last serial number
DataPath             database path prefix
CurrentAgentName     selected AgentThai agent
CurrentSerialNo      selected serial number
CurrentAmount        displayed/calculated amount
GroupIndex           small rotating index, visibly reset after reaching 4
CurrentNumberBuffer  txtNum contents / parsed number expression
```

The code also references a VB6 array through `0061A14Ch`. Its indexed values are read with `Left` and `Right` operations, so it likely stores parsed number-group values or number-position values. The exact array type and bounds were lost.

## 5. Event Inventory

### Named UI events

| Event | Decompiled address | Recovered behavior |
|---|---:|---|
| `cmdSave_Click` | `480880` | Calls internal form helpers and refresh/report-like actions. No direct SQL string is visible in this short event body. The actual persistence may be delegated to generated helper procedures. |
| `cboSort1_Click` | `459360` | Calls an internal refresh/sort helper. |
| `cmdCheck_Click` | `4593D0` | Reads the current check/grid state and toggles or refreshes a control, then calls a refresh helper. |
| `cmdRpt6_Click` | `480310` | Deletes `TmpLGDetail`, inserts current-session `LGSaleDetail`, configures `ZLg3.rpt`, displays the report. |
| `txtAgentName_KeyPress` | `48C850` | Enter moves focus/activates the next control. |
| `txtAgentName_LostFocus` | `48C920` | Queries `AgentThai` by `AgentName`; shows `Agent Name Cann't Found!` when no matching record exists; otherwise loads related agent state. |
| `txtNum_KeyPress` | `48CEE0` | Main custom input parser. Accepts digits and special operators, handles space, `*`, `/`, `.`, Enter, expression fragments, indexed groups, and a maximum of 50 parsed entries. |
| `cmdSearch_Click` | `4809A0` | Opens the search workflow through a helper call. |
| `cmdExit_Click` | `459850` | Unloads/removes the current form from the application/forms collection. |
| `mnuDelete_Click` | `489140` | Determines selected row/session, asks for confirmation, deletes matching sale/detail data, updates totals and UI. |
| `Form_Load` | `482B80` | Initializes controls, builds a title/status string containing AM/PM, machine ID, and serial range, sets grid/visibility state, and loads supporting data. |
| `Form_KeyDown` | `482920` | Handles F1, F2, F3, F7, and F11-style shortcuts. It calls save/report/close/search/helper actions depending on the key. |
| `Command3_Click` | `480B10` | Prompts for a number and count; builds a top-sales query from `TmpLGTotalSale`; sorts either by total descending or configured sort number. |
| `cmdRpt5_Click` | `47E1F0` | Builds `TmpLG_Zlg1` from current `LGSale`/`LGSaleDetail`, calculates total amounts, sets report parameters, and runs `ZLg1.rpt`. |
| `Grid_Click` | `487530` | Reads selected row/session values and writes selected values into the form or related grid controls. |
| `Grid_KeyDown` | `4879F0` | Enter advances/selects; Delete asks for confirmation and removes the selected row; updates the current count/position. |
| `Grid_MouseDown` | `488DD0` | On right-click, checks the selected row and displays the hidden update/delete menu. |

### Internal generated procedures

There are 46 additional procedures named `Proc_4_17_*` through `Proc_4_65_*` in the shown inventory. They are not direct VB6 control event names. They appear to implement:

```text
Agent validation and list loading
Serial-number search and validation
Current maximum serial lookup
Sale and sale-detail loading
Temporary report table construction
Lucky-number matching
Number-position matching
Power and Brade restrictions
APoo, NetKhat, Part, SM, Brother rule checks
Temporary sale-total aggregation
Refresh-machine signaling
Profit/balance calculations
Number-format and number-group transformations
```

A safe JavaScript design should expose these as named domain services instead of retaining opaque names.

## 6. txtNum_KeyPress_48CEE0 Detailed Reconstruction

### Accepted character set

The first visible constant is:

```text
0123456789RPBWNFAX+-/*.[]T
```

The handler also treats these key codes specially:

```text
Backspace = 8
Enter     = 13
Space     = 32
Asterisk  = 42
Slash     = 47
Period    = 46
```

Therefore the input language is not a simple numeric field. It accepts digits plus domain markers/operators. The letters probably represent legacy number categories or rule modifiers:

```text
R, P, B, W, N, F, A, X, T
```

Their exact business meanings are not recoverable from this event alone.

### Recovered control flow

```text
ON txtNum_KeyPress(keyAscii)

    allowed = "0123456789RPBWNFAX+-/*.[]T"

    IF keyAscii is not Backspace, Enter, Space,
       and character is not in allowed:
        suppress key
        RETURN

    IF keyAscii is Space:
        invoke helper on current text/state
        compare or process left/right fragments
        possibly split current expression into number groups
        update indexed values
        RETURN

    IF keyAscii is '*':
        suppress the asterisk
        move cursor to end of txtNum
        RETURN

    IF keyAscii is '/':
        suppress slash
        append/process the slash expression
        move cursor to end
        RETURN

    IF keyAscii is '.':
        suppress period
        append "00" to the current field/value
        move cursor to end
        RETURN

    IF keyAscii is Enter:
        invoke the current-entry helper
        IF current number/group is empty:
            do nothing
        ELSE IF parsed group count is already 50:
            display "Too Large.Cann't Add. Please save!!"
            RETURN
        ELSE:
            parse current expression
            for each parsed item:
                calculate/display the corresponding total
                write the item to an indexed control/row
                advance a rotating sub-index
            IF rotating sub-index reaches 4:
                increment current OnCount/session value
                reset sub-index to 0
            clear/suppress Enter as required
        RETURN

    otherwise:
        accept the key and continue editing
END
```

### Strongly supported details from the instructions

The assembly visibly proves these behaviors:

```text
1. Invalid characters are suppressed.
2. Space invokes a special path rather than normal text entry.
3. Asterisk, slash, and period are intercepted and suppressed.
4. Period causes a "00" concatenation.
5. Enter invokes a validation/helper path.
6. A 50-entry boundary produces:
       Too Large.Cann't Add. Please save!!
7. Parsed values are assigned to indexed controls.
8. A small index advances and resets at 4.
9. A session/count value is incremented when that index wraps.
10. Number totals are read and combined with a decimal/base amount.
```

### Important uncertainty

The decompiler has erased the original expression grammar. It is not safe to claim that `R`, `P`, `B`, or other letters have a particular domain meaning without the original VB6 source, database schema, or observed test data. The JavaScript parser therefore keeps those letters as tokens and delegates their semantic expansion to `expandLegacyToken`.

## 7. cmdSave_Click_480880 Detailed Reconstruction

The visible body is short:

```text
call helper at Me + &H718
call helper at Me + &H73C
call helper at Me + &H7F0
obtain a form/control object at Me + &H304
invoke a method/property on that object
return
```

No SQL literal is present in this event body. This is significant: the earlier broad description that `cmdSave_Click` directly inserts LG/LGDetail is not proven by this event alone. The likely design is delegated persistence, where one or more helper calls perform validation, update grids, and save data.

A conservative rewrite is:

```text
function cmdSave_Click() {
    validate current form state
    commit current parsed ledger entry through the repository adapter
    refresh dependent grids and totals
    update report/UI controls
}
```

The generated procedures elsewhere clearly contain sale/report SQL, but their call graph to this event cannot be reconstructed reliably from COM vtable offsets alone. The JavaScript implementation therefore requires `repository.saveLedgerEntry` and `ui.refreshAfterSave` adapters.

## 8. Other Event and Button Logic

### `Form_Load`

```text
initialize the form and common control state
reset current small index and selected row markers
read current AMPM/session values
build a status/title string similar to:
    <time> (<current count>) -> MachineID : <id> ... Serial [<min> To <max>]
configure grid visibility and selection
load supporting data and agent lists
```

### `Form_KeyDown`

The visible comparisons include key codes `&H70`, `&H71`, `&H72`, `&H73`, `&H77`, and `&H7B`, corresponding to F1, F2, F3, F4, F8, and F12 in common VB6 key-code usage. The exact branch-to-button mapping is partially obscured by helper offsets, but the intent is keyboard-first navigation.

```text
F1  -> save or commit
F2  -> report/helper action
F3  -> focus/next entry action
F4  -> exit
F8  -> search
F12 -> check or auxiliary action
```

### `txtAgentName_LostFocus`

```text
agentName = trim(txtAgentName.Text)
if agentName is empty:
    return
rows = database.query(
    "SELECT * FROM AGENTTHAI WHERE AgentName='" + agentName + "'"
)
if rows is empty:
    show "Agent Name Cann't Found!"
    clear/reset agent-dependent controls
else:
    load the matching agent state and continue
```

The original code concatenates SQL strings. The JavaScript rewrite uses parameterized queries.

### `cmdRpt6_Click`

Recovered SQL intent:

```sql
DELETE FROM TmpLGDetail;
INSERT INTO TmpLGDetail
SELECT * FROM LGSaleDetail
WHERE OnCount = currentOnCount
  AND AMPM = currentAMPM;
```

Then it configures a Crystal report path ending in:

```text
\Reports\ZLg3.rpt
```

### `cmdRpt5_Click`

Recovered steps:

```text
DELETE FROM TmpLG_Zlg1
INSERT current-session LGSale rows into TmpLG_Zlg1
query grouped LGSaleDetail totals by SrNo, AgentID, and Num
update TmpLG_Zlg1.TotalAmount
set report parameter/title values
run \Reports\ZLg1.rpt
```

### `Command3_Click`

```text
ask user: "Enter the number!"
ask user: "Enter the Count!"
set current count context
if sort mode is Top:
    query positive totals ordered by profit descending, then Num1
else:
    query positive totals ordered by SortNo, then numeric Num1
show the resulting data in the grid/report area
```

Recovered query forms include:

```sql
SELECT Num1,
       (TotalSale - (TotalPur + Balance)) AS Total
FROM TmpLGTotalSale
WHERE (TotalSale - (TotalPur + Balance)) > 0
ORDER BY (TotalSale - TotalPur) DESC, Num1;
```

and:

```sql
SELECT Num1,
       (TotalSale - (TotalPur + Balance)) AS Total
FROM TmpLGTotalSale
WHERE (TotalSale - (TotalPur + Balance)) > 0
ORDER BY SortNo, Val(Num1);
```

### `cboSort1_Click`

```text
read selected sort mode
rebuild/reorder the secondary grid
refresh dependent totals
```

### `Grid_Click`

```text
read selected row and current OnCount/AMPM
copy row values into selected/current form fields
update serial, number, amount, and group state
```

### `Grid_KeyDown`

```text
if Enter:
    move through grid or select current row
if Delete:
    ask "Are you sure to Delete ?"
    if confirmed:
        delete selected row through the same deletion path
        refresh grid and totals
```

### `Grid_MouseDown`

```text
if right mouse button:
    read current row
    if row is valid:
        show hidden mnuUpdate/mnuDelete menu at cursor position
```

### `mnuDelete_Click`

Recovered deletion pattern:

```text
read selected row's Num, SrNo, OnCount, and AMPM
if selected item is a special/empty row:
    use alternate cleanup path
else:
    ask "Are you sure to Delete ?"
    if confirmed:
        DELETE FROM LGSale
          WHERE SrNo = selectedSrNo
            AND OnCount = currentOnCount
            AND AMPM = currentAMPM;

        DELETE FROM LGSaleDetail
          WHERE SrNo = selectedSrNo
            AND OnCount = currentOnCount
            AND AMPM = currentAMPM;

        recompute totals
        reload grids
```

The exact deletion predicates may include AgentName, Num, or MachineID in branches. The JavaScript adapter receives all available keys and builds a parameterized predicate.

### `cmdSearch_Click`

```text
open search form/workflow
return selected record
load serial/amount/agent fields
refresh the ledger view
```

### `cmdCheck_Click`

```text
open or refresh number-checking workflow
pass current number/session/agent context
refresh the visible check state
```

### `cmdExit_Click`

```text
close/unload frmLG
return to the maintenance/navigation form
```

## 9. Database Tables and Queries Seen in frmLG

```text
AgentThai
Brade
POWER / Power
APoo
NetKhat
NetKhat_Thai
Part
SM
Brother
LGSale
LGSaleDetail
LG
LGDetail
TmpLGDetail
TmpLG_Zlg1
TmpLGTotalSale
TmpLuckyCustomer
TmpSerialNo
LuckyNo
NumPosition
MachineIP
```

The form performs or delegates these categories of operations:

```text
Agent lookup
Current-session sale loading
Grouped sale-detail totals
Temporary report staging
Lucky-number marking
Serial-number and number-position lookup
Machine refresh notification
Sale/detail deletion
Balance and profit aggregation
Restriction checks for Brade, Power, APoo, NetKhat,
Part, SM, and Brother rules
```

## 10. JavaScript Rewrite Design

### Design decisions

```text
1. Separate pure parsing/calculation from UI events.
2. Use parameterized repository methods instead of SQL concatenation.
3. Replace MSFlexGrid with arrays of row objects.
4. Replace Crystal OLE calls with a report adapter.
5. Keep legacy token semantics injectable until verified.
6. Preserve the 50-entry limit and four-position wrap behavior.
7. Make keyboard actions explicit and testable.
```

### JavaScript usage

```js
import { createFrmLGController } from './frmLG_core.js';

const controller = createFrmLGController({
  database: repositoryAdapter,
  reports: reportAdapter,
  ui: uiAdapter,
  config: {
    maxEntries: 50,
    groupWidth: 4
  }
});

controller.formLoad();
controller.txtNumKeyPress({ key: '1' });
controller.txtNumKeyPress({ key: '2' });
controller.txtNumKeyPress({ key: 'Enter' });
```

The full implementation is in [frmLG_core.js](frmLG_core.js).

## 11. Testing Recommendations

The legacy application has no visible automated tests in this workspace. The JavaScript rewrite should at minimum test:

```text
Input filtering:
    accept digits and legacy letters
    reject unrelated characters
    preserve Backspace

Special keys:
    period expands to 00 behavior
    slash and asterisk are intercepted
    Enter commits
    Space invokes expression processing

Limits:
    49 entries accepted
    50th boundary matches legacy behavior
    overflow returns the exact warning

Grouping:
    group index advances 0 -> 1 -> 2 -> 3 -> 0
    OnCount increments when the group wraps

Agent:
    empty agent is ignored
    known agent loads
    unknown agent produces the legacy warning

Save/delete:
    save calls repository adapter
    delete requires confirmation
    delete refreshes all affected grids

Reports:
    ZLg1 staging receives current session
    ZLg3 staging receives current session and AMPM
    report path is passed to the report adapter
```

## 12. Final Accuracy Boundary

The report can state with high confidence that frmLG is a two-digit ledger/sale-entry form with custom number-expression parsing, agent validation, session/machine context, grid editing, deletion, temporary report staging, and Crystal Reports integration.

The exact meanings of the custom letters and the exact database writes performed by helper calls cannot be proven from decompiled vtable offsets alone. Those parts are intentionally represented as named JavaScript extension points instead of silently inventing business rules.
