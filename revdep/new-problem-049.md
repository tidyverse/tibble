# tidyquant

Version: 0.5.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             ... = ...) at /tmp/RtmpfUADyD/file51fe2cb243cc/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_mutate.R:228
      13: tq_transmute_xy_.tbl_df(data = data, x = x, y = y, mutate_fun = mutate_fun, col_rename = col_rename, 
             ... = ...) at /tmp/RtmpfUADyD/file51fe2cb243cc/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:163
      14: check_x_y_valid(data, x, y) at /tmp/RtmpfUADyD/file51fe2cb243cc/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:182
      15: stop(paste0("x = ", x, " not a valid name.")) at /tmp/RtmpfUADyD/file51fe2cb243cc/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:334
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 184 SKIPPED: 1 FAILED: 4
      1. Error: (unknown) (@test_tq_get_compound_getters.R#10) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_ratios.R#16) 
      3. Failure: Test unnest returns correct rows. (@test_tq_get_key_ratios.R#23) 
      4. Error: (unknown) (@test_tq_mutate.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning: Computation failed in `stat_segment_left_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_left_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    additional arguments ignored in warning()
    Warning in bind_rows_(x, .id) :
      Vectorizing 'zoo' elements may not preserve their attributes
    Quitting from lines 183-193 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    object 'value' not found
    Execution halted
    ```

