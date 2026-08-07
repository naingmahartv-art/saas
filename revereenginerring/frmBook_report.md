# frmBook Detailed Report

## Purpose
Loads an existing ledger booking by serial number, displays its number/amount details, and supports customer/commission entry.

## Events

```text
Form_Load:
    initialize booking state and focus

Form_KeyDown:
    handle save/navigation/close shortcuts

txtCom_KeyPress:
    accept numeric commission input
    Enter advances focus

txtCom_LostFocus:
    normalize commission values
    recalculate booking commission totals

txtCustomer_KeyPress:
    handle Enter and navigation

txtCustomer_LostFocus:
    query AgentThai by AgentName
    load matching customer or show AgentName Not Found

cmdSearch_Click:
    open booking search

cmdCustomer_Click:
    select customer and copy it into the form

cmdSave_Click:
    validate customer, serial, and commission values
    save the booking

cmdClose_Click:
    unload the form
```

## Important SQL

```sql
SELECT * FROM LG
WHERE SrNo = ? AND OnCount = ? AND AMPM = ?;

SELECT AgentName AS Name, Num1, Value AS TAmount
FROM LGDetail
WHERE SrNo = ? AND OnCount = ? AND AMPM = ?;

SELECT Max(SrNo) AS MaxNo FROM LG
WHERE OnCount = ? AND AMPM = ? AND MachineID = ?;
```

Deletion removes the matching `LGDetail` rows before the `LG` header.

## JavaScript Rewrite
See `frmBook.js`. Database access is injected and all query values are parameters.

## Uncertainty
The decompiler hides the exact commission formula and original keyboard shortcut mapping.
