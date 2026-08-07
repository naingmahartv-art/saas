# frmLGEnt Detailed Report

## Purpose
Primary ledger/sale entry form. It validates agents, rates, numbers, limits, lucky numbers, sale state, and posts LG/LGDetail plus sale tables.

## Event groups

```text
Entry:
    txtNum_Change, txtNum_KeyPress
    txtAgentName_KeyPress, txtAgentName_LostFocus
    txtCom_KeyPress, txtCom_LostFocus
    txtRate_KeyPress, txtRate_LostFocus
    Text3_Change, Text4_KeyPress, Text4_LostFocus

Actions:
    cmdSave, cmdClear, cmdSold, cmdRefresh
    cmdCheck, cmdCheck_Agent, cmdFindSrNo
    cmdLucky, cmdLimit, cmdHot, cmdNotBuy
    cmdRoundFormat, cmdAdv, cmdSearch, cmdExit
    cmdReport2, cmdReport5, cmdRpt6

Grid/timers:
    Grid_Click, Grid_KeyDown, Grid_MouseDown
    Timer1_Timer, Checking_Timer1_Timer

Other:
    cboSort_Click, cboSort1_Click, Check1_Click,
    chkRefresh_Click, chkCurrentSaleNum_Click,
    Command1_Click, Command2_Click, Form_Load,
    Form_Unload, Form_KeyDown, mnuDelete_Click
```

## Core save pseudocode

```text
Validate current OnCount/AMPM
Validate agent exists in AgentThai
Validate rate and commission
Parse number expression
Check duplicate number/serial
Check Limit, Power, Brade, APoo, NetKhat, Part, SM, Brother,
Hot, NotBuy, LuckyNo, and machine serial range
If valid:
    write LG/LGDetail and LGSale/LGSaleDetail
    recalculate totals
    refresh grids
```

## Report actions

```text
cmdReport2:
    aggregate LGDetail and LGSaleDetail into TmpLGTotalSale
    run ZTSale.rpt

cmdReport5:
    stage selected-agent LG rows in TmpLG_Zlg1
    aggregate LGDetail amounts
    run ZLg1.rpt

cmdRpt6:
    stage current-session LGDetail in TmpLGDetail
    run ZLg3.rpt

cmdFindSrNo:
    load LuckyNo and NumPosition
    run ZSrNo.rpt
```

## JavaScript Rewrite
See `frmLGEnt.js`. It separates validation, repository transactions, report staging, and UI updates.

## Uncertainty
Many generated procedures are repeated branches with lost names. Exact formulas must be verified against production database samples.
