# timetk

Version: 0.1.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### zooreg to tibble: Comparison between as.data.frame() and tk_tbl()
    > data_zooreg <- tk_zooreg(1:8, start = zoo::yearqtr(2000), frequency = 4)
    > 
    > # Dates are character class stored in row names
    > as.data.frame(data_zooreg)
            data_zooreg
    2000 Q1           1
    2000 Q2           2
    2000 Q3           3
    2000 Q4           4
    2001 Q1           5
    2001 Q2           6
    2001 Q3           7
    2001 Q4           8
    > 
    > # Dates are appropriate zoo yearqtr class within the data frame
    > tk_tbl(data_zooreg)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      15: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      16: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      17: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 262 SKIPPED: 0 FAILED: 5
      1. Error: tk_index(decomposed.ts) test returns correct format. (@test_tk_index.R#324) 
      2. Error: zooreg to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#58) 
      3. Error: mts to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#83) 
      4. Error: tseries to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#123) 
      5. Error: forecast::msts to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#132) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

