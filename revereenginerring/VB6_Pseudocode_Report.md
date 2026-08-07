# VB6 Application Pseudocode Report

This report summarizes all `.frm`, `.bas`, and `.vbp` files in the project. The `.frx` files are binary VB6 resources and cannot be represented as source pseudocode.

## Project

### Project.vbp

```text
START APPLICATION
    Run Sub Main
    Initialize database and configuration
    Read Rate settings
    Read MachineIP settings
    Determine machine serial range
    Open login screen
END
```

The project uses VB6, DAO/ADO-style database access, Crystal Reports, MSFlexGrid, MSCOMCT2, registry APIs, and external `Rar.exe`.

## Shared Modules

### modMain.bas

```text
Read Rate table
Store rate globally

Read MachineIP ordered by MachineID
Find current machine
Store MachineID, MinSerial, MaxSerial
If machine is not configured:
    Show warning
    Stop application
```

### modGlobal.bas and modImExPort.bas

```text
IMPORT DATA
    Confirm import
    Copy archive from floppy or network
    Extract temporary database
    Delete existing LG and LGDetail data
    Insert imported records
    Show result

EXPORT DATA
    Create temporary database
    Copy LG, LGDetail, LGSale, and LGSaleDetail
    Compress database with Rar.exe
    Copy archive to removable drive
    Report success or failure

SYNCHRONIZE MACHINES
    Copy databases between local and network paths
    Filter records by MachineID and serial ranges
    Delete old records
    Insert synchronized records
```

### modReg.bas

```text
No active procedures were found.
```

## Forms

### frmAdv.frm

```text
Display help and advanced options
Support registry, sound, and machine-information APIs
Close when Exit is clicked
```

### frmAdvCom.frm

```text
Enter customer commission values
Search AgentThai by customer name
Populate commission grid
Save or close commission entry
```

### frmAgentThai.frm

```text
Load AgentThai records

New:
    Clear fields
    Enter insert mode

Save:
    Insert or update agent name, address, phone,
    commission, and rate

Search/Edit/Delete:
    Find selected agent
    Load or modify data
    Confirm deletion when required

Report:
    Run Crystal agent report
```

### frmBackUpData.frm

```text
Load backup configuration
User selects local or network backup
Copy database files to destination
Display completion or error
```

### frmBalance.frm

```text
Load Balance records
Create, edit, save, or delete balance entries
Update Balance table
Allow searching and reporting
```

### frmBook.frm

```text
Enter booking number and commission information
Search LG records by serial number
Load customer and agent information
Save booking values
Refresh commission grid
```

### frmChecking.frm

```text
Clear TmpChecking table
Accept and parse number expressions
Normalize entered numbers
Calculate totals and counts
Compare values with configured limits
Display warnings
Update grids using timer events
```

### frmComfi.frm

```text
Load KeyConfi values
Edit three configuration characters
Delete old values
Insert new values
```

### frmDeleteFilt.frm

```text
Set or clear the global deletion filter
Close the dialog
```

### frmHot.frm

```text
Load Hot numbers
Accept a new number
Insert number with current OnCount
Limit the list to approximately 20 numbers
Allow selecting and deleting numbers
```

### frmLG.frm

```text
Load current OnCount and ledger data
Load rates, limits, agents, and configuration

When saving:
    Validate number, agent, customer, commission, and amount
    Insert or update LG and LGDetail
    Recalculate totals
    Refresh grid

Provide checking, searching, deletion, and Crystal Reports
```

### frmLGEnt.frm

```text
Initialize sale and ledger entry form
Load agents, rates, limits, and current session

When saving:
    Validate entries
    Write LG, LGDetail, LGSale, and LGSaleDetail
    Recalculate totals

Allow:
    Number checking
    Lucky number, limit, hot number, and not-buy configuration
    Refreshing and clearing entries
    Reports
    Sold-value calculations
    Row editing and deletion
```

### frmLimit.frm

```text
Load Limit value
Accept numeric limit
Save configuration
```

### frmLogin.frm

```text
Enter username and password
Query Login table
If credentials are valid:
    Open main application
Else:
    Show login error
```

### frmLoginAdv.frm

```text
Enter advanced credentials
Query LoginAdvUser
Authenticate user
Open authorized application
```

### frmLuckyNo.frm

```text
Load LuckyNo record
Enter lucky number and date
Validate input
Save lucky number
Allow deletion by date
```

### frmMaintenance.frm

```text
Display main maintenance menu

When user selects a menu item:
    Open ledger, agent, balance, receipt, report, or settings form

For deletion commands:
    Confirm operation
    Delete related LG, LGDetail, LGSale, LGSaleDetail,
    LuckyNo, TotalPLG, and temporary records

For reports:
    Prepare temporary data
    Run Crystal Reports

For backup, import, or export:
    Call shared database transfer routines
```

### frmNil.frm

```text
Query distinct serial numbers and agents for current OnCount
Display choices
Return selected value
```

### frmNotBuy.frm

```text
Load NotBuy numbers
Accept and validate a number
Insert number for current OnCount
Allow grid selection and deletion
```

### frmOnCount.frm

```text
Display available session counts and times
User selects current OnCount
Store selection globally
Return to calling form
```

### frmPreview.frm

```text
Display report and preview types
Return selected report type
```

### frmReceive.frm

```text
Load receipts and balances

Save receipt:
    Insert Receive record
    Increase or update Balance

Delete receipt:
    Confirm deletion
    Reverse Balance amount
    Delete Receive record

Support search and Crystal Reports
```

### frmRefresh.frm

```text
Load refresh configuration
Edit refresh, over, hot-key, and not-sale options
Save configuration
```

### frmRoundFormat.frm

```text
Display serial number, amount, and agent data
Apply buy-side rounding when Buy is clicked
Apply agent-side rounding when Agent is clicked
Show results in grid
```

### frmSearch.frm

```text
Load searchable ledger records
Allow row selection
Return selected record
```

### frmSearch1.frm

```text
Accept start and end dates
Query records in the date range
Display results
Return selected record
```

### frmSearchAgent.frm

```text
Load agent list
Filter by typed agent name
Select an agent from the grid
Return selected agent
```

### frmSerie.frm

```text
Enter serial number and amount
Validate numeric values
Return values to calling form
```

### frmSoundSetting.frm

```text
Display sound settings
Save or apply sound configuration
Close form
```

### frmSrAgent.frm

```text
Load serial-number and agent records
Create, edit, search, or delete selected record
Allow agent and customer selection
Run sragent.rpt report
```

### frmTwo.frm

```text
Select start and end session counts
Build temporary weekly totals
Aggregate positive and negative values
Run TotalWeek.rpt
```

### frmTwoDate.frm

```text
Select report date
Validate date
Build date-based report data
Run report
```

### frmTwoWeek.frm

```text
Select weekly date and count range
Validate range
Aggregate sales, ledger, amount, and lucky-number values
Build TmpTotalWeek data
Run selected weekly report
```

### frmUser1.frm

```text
Create or update advanced-user credentials
Save or cancel
```

### frmUser1Adv.frm

```text
Load advanced user and permission records
Display 17 permission settings
Save username, password, and permissions
Open password editor when requested
```

### frmUserName.frm

```text
Create or update Login username and password
Save or close
```

## Overall Application Flow

```text
START
    Initialize machine, rate, and database settings
    Authenticate user

    Show maintenance menu

    User selects a workflow:
        Enter lottery ledger or sales
        Check number limits
        Manage agents and customers
        Manage balances and receipts
        Configure hot, lucky, limit, and key settings
        Generate reports
        Backup, import, or export data

    During ledger entry:
        Validate number and customer data
        Check limits and restrictions
        Save transaction records
        Recalculate totals

    During deletion:
        Confirm operation
        Remove dependent records
        Recalculate totals

END
```

## Data and Runtime Dependencies

The source refers to database files and runtime components that are not included in the workspace:

- `DataPath.mdb`
- `Super.mdb`
- `TmpXDB2.mdb`
- Crystal Reports `.rpt` files
- Crystal Reports runtime
- MSFlexGrid and MSCOMCT2 OCX controls
- `Rar.exe`
- Floppy drive `A:` and network drives such as `H:` and `K:`
- Hard-coded folders under `C:\soft\Lottery`

The original VB6 procedure names appear to have been lost or altered by decompilation, so some detailed calculations and control behavior remain approximate.
