# baystability

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ge_means0 <- fm1$ge_means$ge_means
    > 
    > data(cultivo2008)
    > 
    > fm2 <-
    +  ge_ammi(
    +    .data = cultivo2009
    +    , .y    = y
    +    , .gen  = entry
    +    , .env  = site
    +    , .rep  = rep
    +   )
    > 
    > k        <- fm2$k
    > alphasa  <- fm2$alphas
    > gammasa  <- fm2$gammas
    > 
    > alphas1  <- tibble::as_tibble(fm2$alphas)
    Warning: `as_tibble.matrix()` requires a matrix with column names or a `.name_repair` argument. Using `.name_repair = "unique"`.
    This warning is displayed once per session.
    New names:
    ```

# corrr

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:104
      26: -rowname at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# diffdf

Version: 1.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 551 SKIPPED: 0 FAILED: 17
      1. Failure: Unequal object, checking numbers correct (@test-core.R#186) 
      2. Failure: Unequal object, checking numbers correct (@test-core.R#187) 
      3. Failure: Unequal object, checking numbers correct (@test-core.R#188) 
      4. Failure: Unequal object, checking numbers correct (@test-core.R#189) 
      5. Failure: Unequal object, checking numbers correct (@test-core.R#190) 
      6. Failure: Unequal object, checking numbers correct (@test-core.R#191) 
      7. Failure: Unequal object, checking numbers correct (@test-core.R#192) 
      8. Failure: Unequal object, checking numbers correct (@test-core.R#193) 
      9. Failure: (unknown) (@test-print_output.R#51) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# docxtractr

Version: 0.5.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: docx_extract_tbl
    > 
    > ### ** Examples
    > 
    > doc3 <- read_docx(system.file("examples/data3.docx", package="docxtractr"))
    > docx_extract_tbl(doc3, 3)
    # A tibble: 6 x 2
      Foo   Bar  
      <chr> <chr>
    1 Aa    Bb   
    2 Dd    Ee   
    3 Gg    Hh   
    4 1     2    
    5 Zz    Jj   
    6 Tt    ii   
    > 
    > intracell_whitespace <- read_docx(system.file("examples/preserve.docx", package="docxtractr"))
    > docx_extract_tbl(intracell_whitespace, 2, preserve=FALSE)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# feather

Version: 0.3.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘feather-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read_feather
    > ### Title: Read and write feather files.
    > ### Aliases: read_feather write_feather
    > 
    > ### ** Examples
    > 
    > mtcars2 <- read_feather(feather_example("mtcars.feather"))
    Error: C stack usage  7970884 is too close to the limit
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(feather)
      > 
      > test_check("feather")
      Error: C stack usage  7969300 is too close to the limit
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 15 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# poio

Version: 0.0-3

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Package unavailable to check Rd xrefs: ‘ISOcodes’
    Missing link or links in documentation object 'print.po.Rd':
      ‘[tibble]{print.tbl_df}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

# postal

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(postal)
      > 
      > test_check("postal")
      ── 1. Failure: Extract date works (@test_utils.R#244)  ─────────────────────────
      extract_dates(future_date) %>% as.numeric() is not strictly more than lubridate::today() %>% as.numeric(). Difference: 0
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 108 SKIPPED: 0 FAILED: 1
      1. Failure: Extract date works (@test_utils.R#244) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rcosmo

Version: 1.0.0

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'print.CMBDataFrame.Rd':
      ‘print.tbl_df’
    
    Missing link or links in documentation object 'print.HPDataFrame.Rd':
      ‘print.tbl_df’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

# rsample

Version: 0.0.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          fill
      
      > 
      > test_check(package = "rsample")
      ── 1. Failure: simple rset (@test_rset.R#44)  ──────────────────────────────────
      sort(names(attributes(res2))) not equal to c("class", "names", "row.names").
      Lengths differ: 6 is not 3
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 492 SKIPPED: 0 FAILED: 1
      1. Failure: simple rset (@test_rset.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# Sconify

Version: 1.0.4

## Newly broken

*   checking whether package ‘Sconify’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘flowCore::view’ by ‘tibble::view’ when loading ‘Sconify’
    See ‘/tmp/Rtmp4UPw74/filedfdc768b6714/Sconify.Rcheck/00install.out’ for details.
    ```

# segregation

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: `[[.tbl_df`(total, "M", "est") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval.R:99
      6: NextMethod() at /tmp/RtmpsdzTcT/R.INSTALL264538804ac0/tibble/R/subsetting.R:79
      7: `[[.data.frame`(total, "M", "est")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 157 SKIPPED: 0 FAILED: 6
      1. Error: between + within = total (@test_mutual_total.R#53) 
      2. Error: within estimations are correct (@test_mutual_total.R#68) 
      3. Error: H is correct (@test_mutual_total.R#78) 
      4. Error: zero weights no problem (@test_mutual_total.R#101) 
      5. Error: between + within = total (@test_mutual_within.R#24) 
      6. Error: option wide works (@test_mutual_within.R#63) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simTool

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 45 SKIPPED: 0 FAILED: 12
      1. Failure: Matrix is converted to tibble (@test_bind_or_combine.R#15) 
      2. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      3. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      4. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      5. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      6. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      7. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      8. Error: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#360) 
      9. Error: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#504) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# taxa

Version: 0.3.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      2/2 mismatches
      x[1]: NA
      y[1]: "j"
      
      x[2]: NA
      y[2]: "i"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 598 SKIPPED: 2 FAILED: 2
      1. Failure: New tables and vectors can be made (@test--taxmap.R#684) 
      2. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#56) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidypredict

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    Error in parse_model_lm(model) : There was a parsing error
    Calls: parse_model -> parse_model.lm -> parse_model_lm
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: tidypredict_fit.lm(model) at /tmp/Rtmp4UPw74/filedfd3768b6714/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:18
      24: parse_model(model) at /tmp/Rtmp4UPw74/filedfd3768b6714/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:23
      25: parse_model.lm(model) at /tmp/Rtmp4UPw74/filedfd3768b6714/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:20
      26: parse_model_lm(model) at /tmp/Rtmp4UPw74/filedfd3768b6714/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:26
      27: stop("There was a parsing error") at /tmp/Rtmp4UPw74/filedfd3768b6714/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:120
      
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
    Quitting from lines 47-50 (glm.Rmd) 
    Error: processing vignette 'glm.Rmd' failed with diagnostics:
    There was a parsing error
    Execution halted
    ```

