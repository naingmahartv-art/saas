# frmTwo Detailed Report

## Purpose
Dispatches report generation by selected report mode and aggregates weekly temporary totals.

## Form_Load
Populates time choices:

```text
09:00, 12:00, 04:00, Full Day
```

## cmdOk_Click

```text
Read selected report mode
Dispatch to sale, purchase, sale/purchase, one-count,
two-date, or receive report routine
Prepare temporary report data
Open the selected Crystal report
```

## Temporary aggregation

```sql
DELETE FROM TmpTotalWeek1;

INSERT INTO TmpTotalWeek1
(Agent, Amount1, LAmount1, Amount2, LAmount2,
 Amount3, LAmount3, Amount4, LAmount4,
 Amount5, LAmount5, Type1)
SELECT Agent, Sum(Amount1), Sum(LAmount1),
       Sum(Amount2), Sum(LAmount2),
       Sum(Amount3), Sum(LAmount3),
       Sum(Amount4), Sum(LAmount4),
       Sum(Amount5), Sum(LAmount5), Type1
FROM TmpTotalWeek
GROUP BY Agent, Type1;

DELETE FROM TmpTotalWeek;
```

## Other events

```text
cboTime_KeyPress:
    validate time and advance focus
cboStartCount_KeyDown/cboEndCount_KeyDown:
    validate report range
cmdCancel_Click:
    close without running a report
```

Report paths include `TotalWeek.rpt` and `TotalWeekP.rpt`.

## JavaScript Rewrite
See `frmTwo.js`.
