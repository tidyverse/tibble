# understandBPMN

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    > file_path <- system.file("extdata", "doc.txt", package="understandBPMN")
    > repetition_and_path_log <- create_path_and_repetition_log(file_path)
    Joining, by = "start"
    Joining, by = "start"
    > ## End(Don't show)
    > calculate_metrics(file_path, generate_new_path_log = TRUE)
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:48
      7: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      8: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      9: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      10: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      11: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      12: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      13: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 289 SKIPPED: 0 FAILED: 1
      1. Error: separability (@testMetrics.R#157) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

