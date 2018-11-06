# corrr

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/Rtmptt2trN/R.INSTALLba2c7b3c10a5/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/Rtmptt2trN/R.INSTALLba2c7b3c10a5/purrr/R/map.R:104
      26: -rowname at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

