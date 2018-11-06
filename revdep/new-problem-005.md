# breathtestcore

Version: 0.4.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ── 3. Failure: A list of data frames is concatenated, comments are concatenated 
      comment(d) not identical to "A".
      1/1 mismatches
      x[1]: "A\n2 records,  m = 40±10, k =  0.010±0.003, beta = 2.00±0.40,\nGaussian n
      x[1]: oise amplitude = 1, 0% missing"
      y[1]: "A"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 351 SKIPPED: 5 FAILED: 3
      1. Error: Columns without names are renamed (@test_cleanup_data.R#70) 
      2. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#136) 
      3. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#145) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

