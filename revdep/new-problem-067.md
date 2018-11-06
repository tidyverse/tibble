# BayesMallows

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesMallows-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_constraints
    > ### Title: Generate Constraint Set from Pairwise Comparisons
    > ### Aliases: generate_constraints
    > 
    > ### ** Examples
    > 
    > # Here is an example with the beach preference data.
    > # First, generate the transitive closure.
    > beach_tc <- generate_transitive_closure(beach_preferences)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: as_tibble.matrix(.generate_transitive_closure(cbind(.data$bottom_item, .data$top_item))) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      10: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      11: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      12: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      13: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      14: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      15: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      16: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 75 SKIPPED: 1 FAILED: 1
      1. Error: transitive closure generation works (@test_pairwise_functions.R#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 448-449 (BayesMallowsPackage.Rmd) 
    Error: processing vignette 'BayesMallowsPackage.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

