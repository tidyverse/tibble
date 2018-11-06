# prophet

Version: 0.3.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 286 SKIPPED: 0 FAILED: 15
      1. Error: cross_validation (@test_diagnostics.R#20) 
      2. Error: cross_validation_logistic (@test_diagnostics.R#46) 
      3. Error: cross_validation_extra_regressors (@test_diagnostics.R#62) 
      4. Error: cross_validation_default_value_check (@test_diagnostics.R#77) 
      5. Error: performance_metrics (@test_diagnostics.R#87) 
      6. Failure: fit_predict (@test_prophet.R#17) 
      7. Failure: fit_predict_no_seasons (@test_prophet.R#23) 
      8. Failure: fit_predict_no_changepoints (@test_prophet.R#28) 
      9. Failure: fit_predict_changepoint_not_in_history (@test_prophet.R#42) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Loading required package: Rcpp
    code for methods in class "Rcpp_stan_fit4modeld7414d90b6cb_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_stan_fit4modeld7414d90b6cb_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 44-46 (quick_start.Rmd) 
    Error: processing vignette 'quick_start.Rmd' failed with diagnostics:
    Column names `10%`, `90%` must not be duplicated.
    Execution halted
    ```

