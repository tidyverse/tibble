# janitor

Version: 1.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: freduce(value, `_function_list`) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/pipe.R:28
      12: withVisible(function_list[[k]](value)) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/freduce.R:20
      13: function_list[[k]](value) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/freduce.R:20
      14: row_to_names(., row_number = 1)
      15: `names<-`(`*tmp*`, value = new_names) at /tmp/RtmpcwuZam/filefdf418b6a3c4/janitor.Rcheck/00_pkg_src/janitor/R/row_to_names.R:24
      16: `names<-.tbl_df`(`*tmp*`, value = new_names) at /tmp/RtmpcwuZam/filefdf418b6a3c4/janitor.Rcheck/00_pkg_src/janitor/R/row_to_names.R:24
      17: check_names_non_na(value) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/tbl-df.r:79
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:235
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 423 SKIPPED: 0 FAILED: 1
      1. Error: row_to_names invalid and semi-valid input checking (@test-row-to-names.R#25) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

