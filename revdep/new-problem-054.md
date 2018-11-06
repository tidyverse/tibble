# zbank

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      11: as_tibble.matrix(tmp$data) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      12: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      13: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      14: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 44 SKIPPED: 22 FAILED: 1
      1. Error: high level works (@test-zb_stats.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

