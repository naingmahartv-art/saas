# frmTwoWeek Detailed Report

## Purpose
Builds weekly/date-range sale and purchase reports, including lucky-customer staging.

## Events

```text
Form_Load:
    initialize dates, counts, and report modes

cboStartCount_Change/cboStartDate_Change:
    recalculate valid range

cboStartCount_KeyDown/cboEndCount_KeyDown:
    validate keyboard input

cmdOk_Click:
    stage requested weekly data
    aggregate sale/purchase amounts
    select report path
    run report

cmdCancel_Click:
    close form
```

## Lucky Customer flow

```sql
SELECT * FROM LuckyNo WHERE OnDate = ? AND AMPM = ?;
DELETE FROM TmpLuckyCustomer;
INSERT INTO TmpLuckyCustomer (SrNo, Num, AgentName, Amount)
SELECT SrNo, Num, AgentName, Value
FROM LGDetail
WHERE Num1 = ? AND OnCount = ? AND AMPM = ? AND Post = Yes
ORDER BY SrNo;
SELECT * FROM TmpLuckyCustomer ORDER BY SrNo;
```

Report paths found include `TotalWeek.rpt`, `TotalWeekP.rpt`, `TotalWeek3.rpt`, `TotalWeek4.rpt`, `TotalWeek6.rpt`, `TotalWeek1.rpt`, `TotalWeek2.rpt`, and `10Days.rpt`.

## Migration warning
The original uses shared temporary tables. The JavaScript rewrite should use a transaction or session key to avoid users overwriting each other's report staging data.

## JavaScript Rewrite
See `frmTwoWeek.js`.
