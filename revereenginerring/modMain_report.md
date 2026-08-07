# modMain Detailed Report

## Purpose
Initializes shared rate and machine/network state.

## Pseudocode

```text
loadRate:
    SELECT * FROM Rate
    store Rate globally

loadMachineIPs:
    SELECT * FROM MachineIP ORDER BY MachineID
    select configured machine
    store MachineID, MinSerial, MaxSerial, and path/network state
    reject missing machine configuration
```

## JavaScript Rewrite
See `modMain.js`. It returns explicit state instead of mutating fixed global memory addresses.

## Uncertainty
The decompiler lost the original `Sub Main` call graph and global variable names.
