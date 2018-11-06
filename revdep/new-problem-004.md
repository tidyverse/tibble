# beadplexr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(beadplexr)
    > library(magrittr)
    > library(ggplot2)
    > 
    > data("lplex")
    > 
    > lplex[[1]] %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    > 
    > lplex[[1]] %>%
    +   despeckle(.parameters = c("FL6-H", "FL2-H"), .neighbours = 8) %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    Loading required namespace: igraph
    Error: Columns 1, 2, 3, 4, 5, … (and 109 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: as_tibble.matrix(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      16: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      17: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      18: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      19: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      20: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      21: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      22: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 4574 SKIPPED: 1 FAILED: 1
      1. Error: Despeckle works (@test_despeckle.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 140-146 (cba_macsplex_example.Rmd) 
    Error: processing vignette 'cba_macsplex_example.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 249 more) must be named.
    Execution halted
    ```

