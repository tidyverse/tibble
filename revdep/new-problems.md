# ggstatsplot

Version: 0.0.9

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      group1 group2 statistic  p.value significance p.value.label
      [3m[38;5;246m<chr>[39m[23m  [3m[38;5;246m<chr>[39m[23m      [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<chr>[39m[23m        
    [38;5;250m1[39m HDHF   HDLF        4.78 1.44[38;5;246me[39m[31m- 5[39m ***          p <= 0.001   
    [38;5;250m2[39m HDHF   LDHF        2.44 4.47[38;5;246me[39m[31m- 2[39m *            p = 0.045    
    [38;5;250m3[39m HDHF   LDLF        8.01 5.45[38;5;246me[39m[31m-13[39m ***          p <= 0.001   
    [38;5;250m4[39m HDLF   LDHF        2.34 4.96[38;5;246me[39m[31m- 2[39m *            p = 0.050    
    [38;5;250m5[39m HDLF   LDLF        3.23 5.05[38;5;246me[39m[31m- 3[39m **           p = 0.005    
    [38;5;250m6[39m LDHF   LDLF        5.57 4.64[38;5;246me[39m[31m- 7[39m ***          p <= 0.001   
    > 
    > # robust
    > ggstatsplot::pairwise_p(
    +   data = bugs_long,
    +   x = key,
    +   y = value,
    +   type = "r",
    +   paired = TRUE,
    +   p.adjust.method = "hommel"
    + )
    Error in .f(.x[[i]], ...) : object 'Group..1' not found
    Calls: <Anonymous> ... <Anonymous> -> vars_rename_eval -> map_if -> map -> .f -> .Call
    Execution halted
    ```

# readxl

Version: 1.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[2]: "a.b..2"
      
      ══ testthat results  ════════════════════════════════════════════════════════════
      OK: 381 SKIPPED: 2 FAILED: 8
      1. Failure: missing column names are populated (@test-col-names.R#56) 
      2. Failure: missing column names are populated (@test-col-names.R#58) 
      3. Failure: column names are de-duplicated (@test-col-names.R#66) 
      4. Failure: column names are de-duplicated (@test-col-names.R#68) 
      5. Failure: .name_repair is passed through to tibble (@test-col-names.R#117) 
      6. Failure: .name_repair is passed through to tibble (@test-col-names.R#119) 
      7. Failure: .name_repair is passed through to tibble (@test-col-names.R#124) 
      8. Failure: .name_repair is passed through to tibble (@test-col-names.R#126) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

