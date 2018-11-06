# tibbletime

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tibbletime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_period
    > ### Title: Change 'tbl_time' periodicity
    > ### Aliases: as_period
    > 
    > ### ** Examples
    > 
    > 
    > # Basic usage ---------------------------------------------------------------
    > 
    > # FB stock prices
    > data(FB)
    > FB <- as_tbl_time(FB, date)
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 32 SKIPPED: 0 FAILED: 21
      1. Error: (unknown) (@test_as_period.R#7) 
      2. Error: (unknown) (@test_ceiling_index.R#7) 
      3. Error: Can coerce tbl_df to tbl_time (@test_coercion.R#23) 
      4. Error: Can coerce data.frame to tbl_time using default method (@test_coercion.R#27) 
      5. Error: Can coerce grouped_df to tbl_time (@test_coercion.R#32) 
      6. Error: Can coerce tbl_time back to tbl_df (@test_coercion.R#40) 
      7. Error: Collapsing works on yearmon (@test_collapse_index.R#34) 
      8. Error: Collapsing works on yearqtr (@test_collapse_index.R#41) 
      9. Error: Collapsing works on hms (@test_collapse_index.R#48) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'tibbletime'
    
    The following object is masked from 'package:stats':
    
        filter
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 29-45 (TT-01-time-based-filtering.Rmd) 
    Error: processing vignette 'TT-01-time-based-filtering.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

