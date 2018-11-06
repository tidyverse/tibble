# simTool

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     6 rnorm     5            2 rng      0.738  
     7 rnorm     5            2 median   0.487  
     8 rnorm     5            2 length   5      
     9 rnorm    10            1 rng     -2.21   
    10 rnorm    10            1 rng      1.51   
    11 rnorm    10            1 median   0.492  
    12 rnorm    10            1 length  10      
    13 rnorm    10            2 rng     -1.99   
    14 rnorm    10            2 rng      0.919  
    15 rnorm    10            2 median   0.00922
    16 rnorm    10            2 length  10      
    Number of data generating functions: 2
    Number of analyzing procedures: 3
    Number of replications: 2
    Estimated replications per hour: 6105739
    Start of the simulation: 2018-11-06 03:51:49
    End of the simulation: 2018-11-06 03:51:49
    > eval_tibbles(dg, pg,rep = 2, post_analyze = purrr::compose(tibble::as_tibble, t))
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 37 SKIPPED: 0 FAILED: 9
      1. Error: Unnamed vector combined to one column (@test_bind_or_combine.R#4) 
      2. Error: Matrix is converted to tibble (@test_bind_or_combine.R#15) 
      3. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      4. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      5. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      6. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      7. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      8. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      9. Error: (unknown) (@test_eval_tibbles.R#300) 
      
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
    
    Quitting from lines 179-189 (simTool.Rmd) 
    Error: processing vignette 'simTool.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 995 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

