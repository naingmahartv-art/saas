# modImExPort Detailed Report

## Purpose
Exports/post-processes machine-specific LG and sale data and loads configuration.

## Export flow

```text
Confirm export
Choose machine/count serial range
Delete matching target rows
Copy LG, LGDetail, LGSale, and LGSaleDetail to temporary MDB
Compress with Rar.exe
Copy archive to A:\
Show success/failure
```

Typical filters:

```sql
DELETE FROM LG WHERE SrNo BETWEEN ? AND ? AND OnCount = ? AND MachineID = ?;
DELETE FROM LGDetail WHERE SrNo BETWEEN ? AND ? AND OnCount = ? AND MachineID = ?;
DELETE FROM LGSale WHERE SrNo BETWEEN ? AND ? AND OnCount = ? AND MachineID = ?;
DELETE FROM LGSaleDetail WHERE SrNo BETWEEN ? AND ? AND OnCount = ? AND MachineID = ?;
```

Configuration helpers read `DataPath` and `Limit`. The old DAO connection includes a database password literal.

## JavaScript Rewrite
See `modImExPort.js`. Archive, file-copy, and external-database operations are injected adapters.
