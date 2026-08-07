# frmLuckyNo Detailed Report

## Purpose
Maintains the lucky number for the active date and AM/PM session.

## Events

### Form_Load
```text
Read current date and AMPM from global state
Query LuckyNo for matching date and AMPM
If a row exists:
    Put LNo into txtLuckyNo
```

### cmdSave_Click
```text
Validate lucky number
Delete existing LuckyNo row for current date and AMPM
Insert replacement row with OnDate, AMPM, and LNo
Close the form
```

### txtLuckyNo_KeyPress
```text
If Enter is pressed:
    invoke cmdSave_Click
Otherwise:
    accept numeric editing keys only
```

### cmdClose_Click
```text
Unload frmLuckyNo
```

## JavaScript Rewrite
The matching implementation is in `frmLuckyNo.js`. It uses parameterized queries and a transaction so replacing the lucky number cannot leave duplicate active rows.

## Tables
`LuckyNo(OnDate, AMPM, LNo)`.

## Uncertainty
The original DAO recordset may update instead of explicitly inserting. The rewrite uses explicit delete/insert because that is the recovered behavior and makes the uniqueness rule clear.
