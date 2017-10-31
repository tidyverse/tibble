# breathtestcore

Version: 0.3.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘breathtestcore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: augment.breathtestfit
    > ### Title: Augmented prediction for breathtest fit
    > ### Aliases: augment.breathtestfit
    > 
    > ### ** Examples
    > 
    > library(broom)
    > # Generate simulated data
    > data = cleanup_data(simulate_breathtest_data(n_records = 3)$data)
    > # Fit using the curves individually
    > fit = nls_fit(data)
    Warning in if (validate) return(NextMethod()) :
      the condition has length > 1 and only the first element will be used
    Error in if (validate) return(NextMethod()) : 
      argument is not interpretable as logical
    Calls: nls_fit ... withVisible -> <Anonymous> -> <Anonymous> -> as_tibble.tbl_df
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 182 SKIPPED: 0 FAILED: 10
      1.  Error: broom/tidy returns a simplified data set with only maes_ghoos t50 (@test_broom.R#5) 
      2.  Error: broom/augment returns predictions (@test_broom.R#15) 
      3.  Error: One-group nlme fit returns valid result (@test_nlme_fit.R#18) 
      4.  Error: Two-group nlme fit returns valid result (@test_nlme_fit.R#37) 
      5.  Error: Nice data return nice result (@test_nls_fit.R#12) 
      6.  Error: Nasty data return results with na (@test_nls_fit.R#24) 
      7.  Error: Single record give valid result after passing through cleanup_data (@test_nls_fit.R#38) 
      8.  Error: Plot layers match expectations (@test_plot_breathtestfit.R#8) 
      9.  Error: Successful nlme fit plots data and fit (@test_plot_breathtestfit.R#28) 
      10. Error: Plot multiple groups (@test_plot_breathtestfit.R#41) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# breathteststan

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: `_fseq`(`_lhs`)
      7: freduce(value, `_function_list`)
      8: withVisible(function_list[[k]](value))
      9: function_list[[k]](value)
      10: tibble::as_tibble(., cf)
      11: as_tibble.tbl_df(., cf)
      
      testthat results ================================================================
      OK: 20 SKIPPED: 0 FAILED: 3
      1. Error: Multiple chains return valid results similar to nlme (@test_stan_fit.R#70) 
      2. Error: Non-gaussian residuals with student_t_df <10 gives result close to nlme (@test_stan_fit.R#94) 
      3. Error: Multiple records per patients return multiple groups (@test_stan_fit.R#128) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 24.7Mb
      sub-directories of 1Mb or more:
        libs  24.5Mb
    ```

# foghorn

Version: 0.4.4

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 38-47 (quick_start.Rmd) 
    Error: processing vignette 'quick_start.Rmd' failed with diagnostics:
    Invalid package name(s): dplyr
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 49 SKIPPED: 0 FAILED: 10
      1.  Failure: output of summary cran results (@test-foghorn.R#176) 
      2.  Failure: output of summary cran results (@test-foghorn.R#178) 
      3.  Failure: output of summary cran results (@test-foghorn.R#189) 
      4.  Failure: output of summary cran results (@test-foghorn.R#201) 
      5.  Failure: output of summary cran results (@test-foghorn.R#213) 
      6.  Failure: output of summary cran results (@test-foghorn.R#226) 
      7.  Failure: output of summary cran results (@test-foghorn.R#233) 
      8.  Failure: output of summary cran results (@test-foghorn.R#239) 
      9.  Failure: output of show cran results (@test-foghorn.R#264) 
      10. Failure: output of show cran results (@test-foghorn.R#266) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# oai

Version: 0.2.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library("oai")
      > 
      > test_check("oai")
      1. Failure: badArgument is triggered (@test-handle_errors.R#28) ----------------
      handle_errors(xml) did not throw an error.
      
      
      testthat results ================================================================
      OK: 137 SKIPPED: 0 FAILED: 1
      1. Failure: badArgument is triggered (@test-handle_errors.R#28) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

