# purrrlyr

Version: 0.0.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [4] 258 - 358 ==  -99.62
      [5] 360 - 358 ==    2.38
      [6] 225 - 358 == -132.62
      [7] 360 - 358 ==    2.38
      [8] 147 - 358 == -210.92
      [9] 141 - 358 == -216.82
      ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 81 SKIPPED: 0 FAILED: 2
      1. Failure: conditional sliced mapping recycles within groups (@test-dmap.R#32) 
      2. Failure: conditional sliced mapping recycles within groups (@test-dmap.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

