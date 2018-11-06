# colorednoise

Version: 1.0.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘colorednoise-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: matrix_model
    > ### Title: Temporally Autocorrelated Matrix Population Models
    > ### Aliases: matrix_model
    > 
    > ### ** Examples
    > 
    > meanMat <- matrix(c(0.55, 0.6, 0.24, 0.4), byrow = TRUE, ncol = 2)
    > sdMat <- matrix(c(0.3, 0.35, 0.05, 0.1), byrow = TRUE, ncol = 2)
    > phiMat <- matrix(c(-0.2, -0.2, 0, 0), byrow = TRUE, ncol = 2)
    > initialPop <- c(100, 100)
    > sim <- matrix_model(list(meanMat, sdMat, phiMat), initialPop, 50)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      14: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 6 SKIPPED: 0 FAILED: 3
      1. Error: colored_multi_rnorm can produce red noise (@test_noise.R#29) 
      2. Error: colored_multi_rnorm can produce blue noise (@test_noise.R#37) 
      3. Error: matrix_model can produce cross-correlated autocorrelated populations with demographic stochasticity (@test_simulations.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

