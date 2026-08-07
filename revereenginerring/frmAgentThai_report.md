# frmAgentThai Detailed Report

## Purpose
CRUD maintenance for AgentThai customer/agent records and Crystal reporting.

## Event pseudocode

```text
Form_Load:
    initialize AgentThai mode and list

cmdNew_Click:
    clear name, address, phone, commission, and rate
    enter insert mode

cmdEdit_Click:
    load selected AgentThai row
    enable editing

cmdSave_Click:
    validate name and numeric fields
    insert or update AgentThai
    refresh list

cmdSearch_Click:
    open/filter agent search

cmdDelete_Click:
    confirm
    DELETE FROM AgentThai WHERE AgentName = ?
    refresh list

cmdReport_Click:
    run \\Reports\\Agent.rpt

cmdCancel_Click/cmdExit_Click:
    cancel edit or unload form

txtName_LostFocus:
    SELECT * FROM AgentThai WHERE AgentName = ?
    if duplicate/existing record:
        show AgentName Aleady Exist.Please retype another AgentName!

numeric KeyPress events:
    allow digits, decimal point, Backspace, and Enter
```

## JavaScript Rewrite
See `frmAgentThai.js`. It uses parameterized CRUD methods and report injection.

## Schema note
The decompiled code inconsistently exposes `Commission` and `Commision`; keep the actual database column name in one adapter mapping.
