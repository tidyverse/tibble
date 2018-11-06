# NLMR

Version: 0.3.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NLMR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nlm_curds
    > ### Title: nlm_curds
    > ### Aliases: nlm_curds
    > 
    > ### ** Examples
    > 
    > 
    > # simulate random curdling
    > (random_curdling <- nlm_curds(curds = c(0.5, 0.3, 0.6),
    +                               recursion_steps = c(32, 6, 2)))
    Error: Columns 1, 2, 3, 4, 5, … (and 1019 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: as_tibble.default(vl) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      4: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      5: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      6: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      7: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      8: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      9: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 76 SKIPPED: 0 FAILED: 2
      1. Error: nlm_curds is a good boy (@test_curds.R#5) 
      2. Error: nlm_curds with wheyed option is functional (@test_curds.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

