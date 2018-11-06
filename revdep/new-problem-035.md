# readxl

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `df <- read_excel(test_sheet("missing-v-node-xlsx.xlsx"))` produced messages.
      
      ── 5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64)  ──────
      `... <- NULL` produced messages.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 374 SKIPPED: 0 FAILED: 5
      1. Failure: column_names can anticipate skipping (@test-col-names.R#78) 
      2. Failure: column_names can anticipate skipping (@test-col-names.R#89) 
      3. Failure: we can finally read Ekaterinburg (@test-compatibility.R#27) 
      4. Failure: formula cell with no v node does not cause crash (@test-compatibility.R#53) 
      5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

