# modGlobal Detailed Report

## Purpose
Shared import and machine-data replacement routines.

## Import flow

```text
Confirm import
Copy A:\\TmpXDB2.Rar into the configured data directory
Extract with Rar.exe
Delete local rows for the machine serial range and active OnCount
Import LG and LGDetail from external MDB
For machine 2 also import LGSale and LGSaleDetail
Show completion/error message
```

Representative operations:

```sql
DELETE FROM LG WHERE SrNo BETWEEN ? AND ? AND OnCount = ?;
DELETE FROM LGDetail WHERE SrNo BETWEEN ? AND ? AND OnCount = ?;
```

## JavaScript Rewrite
See `modGlobal.js`. The rewrite validates source paths, uses a transaction, and requires explicit archive/database adapters before destructive replacement.

## Risks
Hard-coded `A:`, `c:\\Soft\\Lottery`, external MDB files, shell extraction, and deletes before source verification.
