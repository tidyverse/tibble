# xgboost

Version: 0.71.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xgboost-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: xgb.plot.multi.trees
    > ### Title: Project all trees on one tree and plot it
    > ### Aliases: xgb.plot.multi.trees
    > 
    > ### ** Examples
    > 
    > 
    > data(agaricus.train, package='xgboost')
    > 
    > bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 15,
    +                eta = 1, nthread = 2, nrounds = 30, objective = "binary:logistic",
    +                min_child_weight = 50, verbose = 0)
    > 
    > p <- xgb.plot.multi.trees(model = bst, features_keep = 3)
    Error: Columns 1, 2, 3, 4, 5, … (and 14 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      12: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      13: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      14: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 542 SKIPPED: 3 FAILED: 1
      1. Error: xgb.plot.multi.trees works with and without feature names (@test_helpers.R#295) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

