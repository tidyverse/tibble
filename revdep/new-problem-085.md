# ruler

Version: 0.1.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: `names<-.tbl_df`(`*tmp*`, value = "vs...rule..1") at testthat/test-expose.R:585
      3: abort(error_names_must_have_length(length(value), length(x))) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/tbl-df.r:76
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 305 SKIPPED: 0 FAILED: 7
      1. Error: add_pack_names works (@test-expose-helpers.R#73) 
      2. Failure: expose works (@test-expose.R#159) 
      3. Error: expose works (@test-expose.R#188) 
      4. Error: expose removes obeyers (@test-expose.R#202) 
      5. Error: expose preserves pack names (@test-expose.R#246) 
      6. Error: expose accounts for rule separator (@test-expose.R#264) 
      7. Error: interp_col_pack_out works (@test-expose.R#585) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

