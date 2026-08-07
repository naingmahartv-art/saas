# lblLuckyAgent_Click_56E500 Detailed Report

## Actual location
The label handler is in `frmMaintenance.frm`, not in `frmLuckyNo.frm`.

## Click flow

```text
User clicks lblLuckyAgent
    -> frmMaintenance.lblLuckyAgent_Click
    -> late-bound helper opens/activates the Lucky Agent report action
    -> generated report helper clears/configures Crystal Report
    -> report path is applicationPath + "\\Reports\\Lagent.rpt"
    -> selection formula is OnDate='<global current date>'
    -> Crystal report is shown
    -> maintenance context/form is closed or returned
```

## Important finding
`lblLuckyAgent_Click` itself does not execute SQL and does not populate a temporary table. It forwards to a generated helper. The report-producing helper uses the existing report data source.

## Recovered report values

```text
Report: \\Reports\\Lagent.rpt
Selection formula: OnDate='<global date>'
Viewer mode: modal-like Crystal viewer
Legacy numeric viewer arguments: 67 and 17
```

The global date is stored at a decompiler-only address and must be supplied explicitly in JavaScript.

## Related but separate Lucky Customer flow
Other routines stage `TmpLuckyCustomer` from `LGDetail` using LuckyNo, OnCount, AMPM, and Post. That is not the direct `Lagent.rpt` click path and should not be merged with it without confirming the original UI behavior.

## JavaScript Rewrite
See `lblLuckyAgent.js`.

## Uncertainty
The original child form name and exact meaning of Crystal numeric arguments cannot be recovered from the handler because the decompiler replaced COM properties with vtable offsets.
