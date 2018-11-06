# tidypredict

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: parse_model
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > df <- mutate(mtcars, cyl = paste0("cyl", cyl))
    > model <- lm(mpg ~ wt + cyl * disp, offset = am, data = df)
    > parse_model(model)
    Error: Column `value` not found in `.data`
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      41: .data$value at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      42: `$.rlang_data_pronoun`(.data, value) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      43: data_pronoun_get(x, nm) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:375
      44: rlang:::abort_data_pronoun(x) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:386
      45: abort(msg, "rlang_data_pronoun_not_found") at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:390
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 4
      1. Error: Returns a data frame (@test-parsemodel.R#9) 
      2. Error: (unknown) (@test-parsemodel.R#13) 
      3. Error: Individual prediction difference is never above 1e-12 (@test_glm.R#13) 
      4. Error: Predictions within threshold and parsed model results are equal (@test_lm.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 47-50 (glm.Rmd) 
    Error: processing vignette 'glm.Rmd' failed with diagnostics:
    Column `value` not found in `.data`
    Execution halted
    ```

