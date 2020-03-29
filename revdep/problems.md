# banter

<details>

* Version: 0.9.3
* Source code: https://github.com/cran/banter
* Date/Publication: 2018-07-10 15:20:06 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"banter")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: getBanterModel
    > ### Title: Extract Random Forest Model
    > ### Aliases: getBanterModel
    > 
    > ### ** Examples
    > 
    > data(train.data)
    > # initialize BANTER model with event data
    > bant.mdl <- initBanterModel(train.data$events)
    > # add all detector models
    > bant.mdl <- addBanterDetector(
    +   bant.mdl, train.data$detectors, 
    +   ntree = 50, sampsize = 1, num.cores = 1
    + )
    > # run BANTER event model
    > bant.mdl <- runBanterModel(bant.mdl, ntree = 1000, sampsize = 1)
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 4 whereas the index has size 68.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ranger’
      All declared Imports should be used.
    ```

# basket

<details>

* Version: 0.9.10
* Source code: https://github.com/cran/basket
* URL: https://github.com/kaneplusplus/basket
* BugReports: https://github.com/kaneplusplus/basket/issues
* Date/Publication: 2019-10-23 07:40:02 UTC
* Number of recursive dependencies: 66

Run `revdep_details(,"basket")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: `$<-`(`*tmp*`, "p0", value = c(0.15, 0.15, 0.15, 0.2, 0.15, 0.15)) at /home/rstudio/tibble/revdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:68
      12: `$<-.tbl_df`(`*tmp*`, "p0", value = c(0.15, 0.15, 0.15, 0.2, 0.15, 0.15)) at /home/rstudio/tibble/revdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:68
      13: tbl_subassign(x, i = NULL, as_string(name), list(value)) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:91
      14: tbl_subassign_col(x, j, value) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:336
      15: vec_recycle_rows(value[[jj]], nrow, coalesce2empty(names(j)[[jj]], names(x)[[ji]])) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:455
      16: abort(error_inconsistent_cols(n, col, size, "Existing data")) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:529
      17: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-mcmc.r#35) 
      2. Error: (unknown) (@test-plot.r#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bench

<details>

* Version: 1.0.4
* Source code: https://github.com/cran/bench
* URL: https://github.com/r-lib/bench
* BugReports: https://github.com/r-lib/bench/issues
* Date/Publication: 2019-09-06 08:20:02 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"bench")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bench-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.bench_mark
    > ### Title: Autoplot method for bench_mark objects
    > ### Aliases: autoplot.bench_mark plot.bench_mark
    > 
    > ### ** Examples
    > 
    > dat <- data.frame(x = runif(10000, 1, 1000), y=runif(10000, 1, 1000))
    > 
    > res <- bench::mark(
    +   dat[dat$x > 500, ],
    +   dat[which(dat$x > 500), ],
    +   subset(dat, x > 500))
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 146 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 11 ]
      1. Error: mark: Uses all.equal to check results by default (@test-mark.R#36) 
      2. Error: mark: Can use other functions to check results like identical to check results (@test-mark.R#52) 
      3. Error: mark: works with capabilities('profmem') (@test-mark.R#69) 
      4. Error: mark: works without capabilities('profmem') (@test-mark.R#81) 
      5. Error: mark: Can handle `NULL` results (@test-mark.R#90) 
      6. Error: unnest.bench_mark: does not contain result or memory columns (@test-mark.R#184) 
      7. Error: press: Adds parameters to output (@test-press.R#6) 
      8. Error: press: Outputs status message before evaluating each parameter (@test-press.R#22) 
      9. Error: press: expands the grid if has named parameters (@test-press.R#45) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# comperank

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/comperank
* URL: https://github.com/echasnovski/comperank
* BugReports: https://github.com/echasnovski/comperank/issues
* Date/Publication: 2018-05-30 08:27:55 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"comperank")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "ranking_od": names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 176 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Failure: rate_od works (@test-offense-defense.R#26) 
      2. Failure: rate_od works (@test-offense-defense.R#44) 
      3. Failure: rate_od handles factor `player` (@test-offense-defense.R#68) 
      4. Failure: rate_od handles numeric `player` (@test-offense-defense.R#91) 
      5. Failure: rank_od works (@test-offense-defense.R#114) 
      6. Failure: rank_od works (@test-offense-defense.R#127) 
      7. Failure: rank_od handles factor `player` (@test-offense-defense.R#148) 
      8. Failure: rank_od handles numeric `player` (@test-offense-defense.R#168) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# corrr

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/corrr
* URL: https://github.com/tidymodels/corrr
* BugReports: https://github.com/tidymodels/corrr/issues
* Date/Publication: 2019-07-12 19:00:02 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"corrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Correlation method: 'pearson'
    Missing treated using: 'pairwise.complete.obs'
    
    > 
    > x %>% focus_if(any_greater_than, .6)
    [38;5;246m# A tibble: 6 x 6[39m
      rowname    mpg    cyl   disp     hp     wt
      [3m[38;5;246m<chr>[39m[23m    [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m
    [38;5;250m1[39m drat     0.681 -[31m0[39m[31m.[39m[31m700[39m -[31m0[39m[31m.[39m[31m710[39m -[31m0[39m[31m.[39m[31m449[39m -[31m0[39m[31m.[39m[31m712[39m
    [38;5;250m2[39m qsec     0.419 -[31m0[39m[31m.[39m[31m591[39m -[31m0[39m[31m.[39m[31m434[39m -[31m0[39m[31m.[39m[31m708[39m -[31m0[39m[31m.[39m[31m175[39m
    [38;5;250m3[39m vs       0.664 -[31m0[39m[31m.[39m[31m811[39m -[31m0[39m[31m.[39m[31m710[39m -[31m0[39m[31m.[39m[31m723[39m -[31m0[39m[31m.[39m[31m555[39m
    [38;5;250m4[39m am       0.600 -[31m0[39m[31m.[39m[31m523[39m -[31m0[39m[31m.[39m[31m591[39m -[31m0[39m[31m.[39m[31m243[39m -[31m0[39m[31m.[39m[31m692[39m
    [38;5;250m5[39m gear     0.480 -[31m0[39m[31m.[39m[31m493[39m -[31m0[39m[31m.[39m[31m556[39m -[31m0[39m[31m.[39m[31m126[39m -[31m0[39m[31m.[39m[31m583[39m
    [38;5;250m6[39m carb    -[31m0[39m[31m.[39m[31m551[39m  0.527  0.395  0.750  0.428
    > x %>% focus_if(any_greater_than, .6, mirror = TRUE) %>% network_plot()
    Warning in stats::cmdscale(abs(distance)) :
      only 0 of the first 2 eigenvalues are > 0
    Error in names(x) <- value : 
      'names' attribute [2] must be the same length as the vector [0]
    Calls: %>% ... <Anonymous> -> network_plot -> network_plot.cor_df -> colnames<-
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      25: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 75 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 8 ]
      1. Error: Network plot works (@test-plots.R#8) 
      2. Failure: Rearrange return correct order (@test-rearrange.R#8) 
      3. Failure: Converts to proper structure (@test-rearrange.R#19) 
      4. Error: Shave upper (@test-shave.R#8) 
      5. Error: Shave lower (@test-shave.R#15) 
      6. Error: Shave all (@test-shave.R#22) 
      7. Failure: Converts to proper structure (@test-stretch.R#12) 
      8. Error: remove.dups works (@test-stretch.R#40) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# customsteps

<details>

* Version: 0.7.1.0
* Source code: https://github.com/cran/customsteps
* URL: https://github.com/smaakage85/customsteps
* Date/Publication: 2018-12-03 10:12:42 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"customsteps")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(customsteps)
      > 
      > test_check(package = "customsteps")
      [31m──[39m [31m1. Failure: end-to-end results for center-scale transformation (@test_custom_transfor[39m
      juice(rec_center_scale) not identical to juice(rec_custom).
      Incompatible type for column `a`: x matrix, y numeric
      Incompatible type for column `b`: x matrix, y numeric
      Incompatible type for column `c`: x matrix, y numeric
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 16 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: end-to-end results for center-scale transformation (@test_custom_transformation.R#58) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rlang’ ‘tidyselect’
      All declared Imports should be used.
    ```

# cutpointr

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-09-17 21:30:02 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 378 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 12 ]
      1. Failure: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#11) 
      2. Failure: Correct cutpoints with example data (@test-cutpointr.R#239) 
      3. Failure: Correct cutpoints with example data (@test-cutpointr.R#240) 
      4. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#563) 
      5. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#564) 
      6. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#570) 
      7. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#571) 
      8. Failure: Main metric gets replaced correctly when ties are broken (@test-cutpointr.R#1023) 
      9. Failure: boot_ci works correctly (@test-cutpointr.R#1378) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cvms

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/cvms
* URL: https://github.com/ludvigolsen/cvms
* BugReports: https://github.com/ludvigolsen/cvms/issues
* Date/Publication: 2019-10-03 10:50:02 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 1567 | SKIPPED: 12 | WARNINGS: 0 | FAILED: 14 ]
      1. Failure: multinomial evaluations are correct in baseline() (@test_baseline.R#470) 
      2. Failure: multinomial evaluations are correct in baseline() (@test_baseline.R#769) 
      3. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#910) 
      4. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#923) 
      5. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#936) 
      6. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#948) 
      7. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#962) 
      8. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#975) 
      9. Failure: multinomial random predictions work with cross_validate_fn() (@test_cross_validate_fn.R#1448) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

# describedata

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/describedata
* Date/Publication: 2019-08-02 11:50:02 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"describedata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘describedata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ladder
    > ### Title: Replica of Stata's ladder function
    > ### Aliases: ladder
    > 
    > ### ** Examples
    > 
    > ladder(iris$Sepal.Length)
    Error: Tibble columns must have consistent lengths, only values of length one are recycled:
    ```

# diffdf

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/diffdf
* URL: https://github.com/gowerc/diffdf
* BugReports: https://github.com/gowerc/diffdf/issues
* Date/Publication: 2019-03-12 12:16:21 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"diffdf")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 549 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 19 ]
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

# dplyr

<details>

* Version: 0.8.3
* Source code: https://github.com/cran/dplyr
* URL: http://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr
* BugReports: https://github.com/tidyverse/dplyr/issues
* Date/Publication: 2019-07-04 15:50:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"dplyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: doTryCatch(return(expr), name, parentenv, handler)
      14: tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
      15: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      16: doTryCatch(return(expr), name, parentenv, handler)
      17: force(expr) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/msg.R:313
      18: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 3404 | SKIPPED: 14 | WARNINGS: 6 | FAILED: 1 ]
      1. Error: hybrid rank functions handle NA (#4427) (@test-mutate.r#484) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 30.4Mb
      sub-directories of 1Mb or more:
        libs  27.9Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# drake

<details>

* Version: 7.7.0
* Source code: https://github.com/cran/drake
* URL: https://github.com/ropensci/drake, https://docs.ropensci.org/drake, https://github.com/ropenscilabs/drake-manual
* BugReports: https://github.com/ropensci/drake/issues
* Date/Publication: 2019-10-15 07:40:02 UTC
* Number of recursive dependencies: 137

Run `revdep_details(,"drake")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ OK: 3908 | SKIPPED: 244 | WARNINGS: 0 | FAILED: 45 ]
      1. Failure: cache functions work from various working directories (@test-cache.R#240) 
      2. Failure: cache functions work from various working directories (@test-cache.R#240) 
      3. Failure: 1 grouping level (@test-dsl.R#64) 
      4. Failure: all new crossings (@test-dsl.R#264) 
      5. Failure: 1 new map (@test-dsl.R#278) 
      6. Failure: 2 new maps (@test-dsl.R#292) 
      7. Failure: command symbols are for combine() but the plan has them (@test-dsl.R#326) 
      8. Failure: combine different groups together (@test-dsl.R#357) 
      9. Failure: multiple groups and multiple splits (@test-dsl.R#393) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
      Error while shutting down parallel: unable to terminate some child processes
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in globalVariables(c("test_group", "cores", "test", "elapsed", "is_past",  : 
      could not find function "globalVariables"
    ```

# easyalluvial

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-09-17 05:50:02 UTC
* Number of recursive dependencies: 135

Run `revdep_details(,"easyalluvial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘easyalluvial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_marginal_histograms
    > ### Title: add marginal histograms to alluvial plot
    > ### Aliases: add_marginal_histograms
    > 
    > ### ** Examples
    > 
    > p = alluvial_wide(mtcars2, max_variables = 4)
    Error: Column `mpg` must be length 32 (the number of rows) or one, not 288
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 23 | SKIPPED: 9 | WARNINGS: 3168 | FAILED: 16 ]
      1. Error: alluvial_long (@test_alluvial_long.R#94) 
      2. Error: get_data_space (@test_alluvial_model_response.R#12) 
      3. Error: pdp_methods (@test_alluvial_model_response.R#36) 
      4. Error: alluvial_model_response (@test_alluvial_model_response.R#58) 
      5. Error: alluvial_model_response_caret (@test_alluvial_model_response.R#237) 
      6. Error: params_bin_numeric_pred (@test_alluvial_model_response.R#305) 
      7. Error: n_feats == degree (@test_alluvial_model_response.R#336) 
      8. Error: alluvial_wide (@test_alluvial_wide.R#11) 
      9. Error: manip_bin_numerics (@test_manip.R#27) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# evaluator

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/evaluator
* URL: https://evaluator.tidyrisk.org
* BugReports: https://github.com/davidski/evaluator/issues
* Date/Publication: 2019-07-22 15:00:03 UTC
* Number of recursive dependencies: 136

Run `revdep_details(,"evaluator")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘evaluator-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: exposure_histogram
    > ### Title: Display a histogram of losses for a scenario
    > ### Aliases: exposure_histogram
    > 
    > ### ** Examples
    > 
    > data(mc_simulation_results)
    > result <- mc_simulation_results[[1, "results"]]
    > exposure_histogram(result)
    Error: `data` must be a data frame, or other object coercible by `fortify()`, not a list
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             "mean_tc_exceedance"]] <- NA)) at testthat/test-summarize.R:17
      2: eval(code, test_env)
      
      # Scenario model: openfair_tef_tc_diff_lm
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 128 | SKIPPED: 4 | WARNINGS: 12 | FAILED: 6 ]
      1. Error: SR model works as expected (@test-openfair.R#220) 
      2. Error: Simulation respects maximum ALE (@test-simulate.R#21) 
      3. Failure: Missing mandatory OpenFAIR factors are detected (@test-simulate.R#29) 
      4. Failure: Bad scenario parameters throw an error (@test-simulate.R#36) 
      5. Failure: Multiple simulations deprecates the simulation_count parameters (@test-simulate.R#56) 
      6. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summarize.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# exuber

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/exuber
* URL: https://github.com/kvasilopoulos/exuber
* BugReports: https://github.com/kvasilopoulos/exuber/issues
* Date/Publication: 2019-07-15 09:40:07 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"exuber")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        method        from
        index.default zoo 
      > 
      > test_check("exuber")
      [31m──[39m [31m1. Failure: crit as data (@test-cv.R#4) [39m [31m────────────────────────────────────────────[39m
      `capture.output(print(crit))` threw an error.
      Message: Expected a vector, not a `list/crit` object
      Class:   vctrs_error_scalar_type/vctrs_error/rlang_error/error/condition
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 258 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Failure: crit as data (@test-cv.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        data   2.5Mb
        libs   2.0Mb
    ```

# feasts

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/feasts
* URL: http://feasts.tidyverts.org/
* BugReports: https://github.com/tidyverts/feasts/issues
* Date/Publication: 2019-09-02 14:10:06 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"feasts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     Industry == "Cafes, restaurants and catering services"
    +   ) %>%
    +   model(ARIMA(Turnover ~ pdq(0,1,1) + PDQ(0,1,1))) %>%
    +   gg_arma()
    + }
    
    Attaching package: ‘dplyr’
    
    The following object is masked from ‘package:tsibble’:
    
        id
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: as_tibble.mdl_df(data) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:83
      16: as_tibble(x, ...)
      17: as_tibble.data.frame(x, ...) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:83
      18: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:99
      19: lst_to_tibble(x, .rows, .name_repair, col_lengths(x)) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:121
      20: check_valid_cols(x) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:127
      21: abort(error_column_must_be_vector(names_x[is_xd], classes)) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:152
      22: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 103 | SKIPPED: 0 | WARNINGS: 11 | FAILED: 1 ]
      1. Error: gg_arma() plots (@test-graphics.R#253) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(c(".rows")) : 
      could not find function "globalVariables"
    Error: package ‘fabletools’ could not be loaded
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables(c(".rows")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘tsibble’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error: package ‘fabletools’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in globalVariables(c(".rows")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘tsibble’
    Execution halted
    ```

# fgdr

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/fgdr
* URL: https://github.com/uribo/fgdr
* BugReports: https://github.com/uribo/fgdr/issues
* Date/Publication: 2019-10-11 10:30:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"fgdr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fgdr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read_fgd
    > ### Title: Read and Parse Fundamental Geospatial Data (FGD) file
    > ### Aliases: read_fgd
    > 
    > ### ** Examples
    > 
    > # Administrative Area
    > read_fgd(system.file("extdata/FG-GML-000000-AdmPt-dummy.xml", package = "fgdr"))
    Error in is_null(i) : argument "i" is missing, with no default
    Calls: read_fgd ... [ -> [.sf -> [ -> [.tbl_df -> tbl_subset_row -> is_null
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      argument "i" is missing, with no default
      1: read_fgd(file = system.file("extdata/FG-GML-000000-AdmPt-dummy.xml", package = "fgdr")) at testthat/test-read_fgd.R:4
      2: res[, names(res)[!names(res) %in% attr(res, "sf_column")]] at /home/rstudio/tibble/revdep/checks/fgdr/new/fgdr.Rcheck/00_pkg_src/fgdr/R/read_fdg.R:303
      3: `[.sf`(res, , names(res)[!names(res) %in% attr(res, "sf_column")]) at /home/rstudio/tibble/revdep/checks/fgdr/new/fgdr.Rcheck/00_pkg_src/fgdr/R/read_fdg.R:303
      4: x[i, j, drop = drop]
      5: `[.tbl_df`(x, i, j, drop = drop)
      6: tbl_subset_row(xo, i = i) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:174
      7: is_null(i) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:314
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 39 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Successd on dummies (@test-read_fgd.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# foieGras

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/foieGras
* URL: https://cran.r-project.org/package=foieGras
* BugReports: https://github.com/ianjonsen/foieGras/issues
* Date/Publication: 2019-10-07 22:10:03 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"foieGras")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("foieGras")
      
      pre-filtering data...
      
      fitting SSM...
      [31m──[39m [31m1. Failure: plot completes silently (@test-osar.R#22) [39m [31m──────────────────────[39m
      `plot(r, "hist")` produced warnings.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 37 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: plot completes silently (@test-osar.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.3Mb
      sub-directories of 1Mb or more:
        libs  34.0Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass(Class = "spam", slots = c(entries = "numeric", colindices = "numeric",  : 
      could not find function "setClass"
    ```

# forestmangr

<details>

* Version: 0.9.1
* Source code: https://github.com/cran/forestmangr
* URL: https://github.com/sollano/forestmangr#readme
* BugReports: https://github.com/sollano/forestmangr/issues
* Date/Publication: 2019-01-02 23:10:27 UTC
* Number of recursive dependencies: 113

Run `revdep_details(,"forestmangr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;246m# … with 890 more rows, and 3 more variables: AGE [3m[38;5;246m<dbl>[38;5;246m[23m, VWB [3m[38;5;246m<dbl>[38;5;246m[23m, VWOB [3m[38;5;246m<dbl>[38;5;246m[23m[39m
    > 
    > # Obligatory arguments. Basic informations about the plot.
    > plot_summarise(exfm21, "PLOT", 810)
    Error: Can't use NA as column index in a tibble for assignment.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─forestmangr::plot_summarise(exfm21, "PLOT", 810)
    [90m  2. [39m  └─`%>%`(...) [90m00_pkg_src/forestmangr/R/plot_summarise.R:255:2[39m
    [90m  3. [39m    ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─forestmangr:::`_fseq`(`_lhs`)
    [90m  7. [39m          └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m            └─function_list[[i]](value)
    [90m  9. [39m              └─dplyr::na_if(., 0)
    [90m 10. [39m                ├─base::`[<-`(`*tmp*`, x == y, value = NA)
    [90m 11. [39m                └─tibble:::`[<-.tbl_df`(`*tmp*`, x == y, value = NA)
    [90m 12. [39m                  └─tibble:::tbl_subassign(x, i, j, value)
    [90m 13. [39m             
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    ```

# gtsummary

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/gtsummary
* URL: http://www.danieldsjoberg.com/gtsummary/
* BugReports: https://github.com/ddsjoberg/gtsummary/issues
* Date/Publication: 2019-08-20 21:20:05 UTC
* Number of recursive dependencies: 128

Run `revdep_details(,"gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_n
    > ### Title: Add column with N
    > ### Aliases: add_n
    > 
    > ### ** Examples
    > 
    > tbl_n_ex <-
    +   trial %>%
    +   dplyr::select(trt, age, grade, response) %>%
    +   tbl_summary(by = trt) %>%
    +   add_n()
    Error: Tibble columns must have consistent lengths, only values of length one are recycled:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 150 | SKIPPED: 0 | WARNINGS: 21 | FAILED: 39 ]
      1. Error: (unknown) (@test-add_n.R#3) 
      2. Failure: no errors/warnings with standard use (@test-add_overall.R#5) 
      3. Error: no errors/warnings with standard use (@test-add_overall.R#6) 
      4. Failure: no errors/warnings with missing data (@test-add_overall.R#16) 
      5. Error: no errors/warnings with missing data (@test-add_overall.R#17) 
      6. Failure: add_p creates output without error/warning (@test-add_p.R#4) 
      7. Error: add_p creates output without error/warning (@test-add_p.R#8) 
      8. Failure: add_p works well (@test-add_p.R#30) 
      9. Error: no errors/warnings with standard use after tbl_summary() and add_p() (@test-add_q.R#4) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘gt’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

# healthcareai

<details>

* Version: 2.3.0
* Source code: https://github.com/cran/healthcareai
* URL: http://docs.healthcare.ai
* BugReports: https://github.com/HealthCatalyst/healthcareai-r/issues
* Date/Publication: 2018-12-12 23:50:03 UTC
* Number of recursive dependencies: 116

Run `revdep_details(,"healthcareai")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                 outcome = survived,
    +                 n_levels = 3)
    [1] "Epinephrine" "Ibuprofen"   "Paclitaxel" 
    > 
    > # Identify four drugs likely to make good features and add them to df.
    > # The "fill", "fun", and "missing_fill" arguments are passed to
    > # `pivot`, which allows us to use the total doses of each drug given to the
    > # patient as our new features
    > 
    > new_df <- add_best_levels(d = df,
    +                           longsheet = meds,
    +                           id = patient,
    +                           groups = drug,
    +                           outcome = survived,
    +                           n_levels = 4,
    +                           fill = dose,
    +                           fun = sum,
    +                           missing_fill = 0)
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 4 whereas the index has size 20.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat-5.R’ failed.
    Last 13 lines of output:
      17: withOneRestart(expr, restarts[[1L]])
      18: doWithOneRestart(return(expr), restart)
      19: stop_lossy_cast(x = x, to = to, result = result, locations = locations, details = details, 
             ..., x_arg = x_arg, to_arg = to_arg, message = message, .subclass = .subclass) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:235
      20: stop_vctrs(message, x = x, y = to, to = to, result = result, x_arg = x_arg, to_arg = to_arg, 
             locations = locations, details = details, ..., .subclass = c(.subclass, "vctrs_error_cast_lossy")) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:259
      21: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      22: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: the fundamentals work (@test-cran_only.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setMethod("plot", signature(x = "performance", y = "missing"),  : 
      no existing definition for function ‘plot’
    Error: package or namespace load failed for ‘healthcareai’:
     unable to load R code in package ‘ROCR’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setMethod("plot", signature(x = "performance", y = "missing"),  : 
      no existing definition for function ‘plot’
    Error: unable to load R code in package ‘ROCR’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setMethod("plot", signature(x = "performance", y = "missing"),  : 
      no existing definition for function ‘plot’
    Error: unable to load R code in package ‘ROCR’
    Execution halted
    ```

# heatwaveR

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/heatwaveR
* URL: https://robwschlegel.github.io/heatwaveR/index.html, https://github.com/robwschlegel/heatwaveR
* BugReports: https://github.com/robwschlegel/heatwaveR/issues
* Date/Publication: 2019-09-09 20:30:03 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"heatwaveR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘heatwaveR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: category
    > ### Title: Calculate the categories of events.
    > ### Aliases: category
    > 
    > ### ** Examples
    > 
    > res_WA <- detect_event(ts2clm(sst_WA,
    +                        climatologyPeriod = c("1983-01-01", "2012-12-31")))
    > # Note that the name argument expects a character vector
    > cat_WA <- category(res_WA, name = "WA")
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 5 whereas the index has size 310.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 167 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Error: category() returns the correct tibbles and columns (@test-category.R#6) 
      2. Error: The seasons by hemisphere come out correctly (@test-category.R#14) 
      3. Error: The name argument works correctly (@test-category.R#23) 
      4. Error: y = any existing column (@test-category.R#33) 
      5. Error: season splits work under all circumstances (@test-category.R#42) 
      6. Error: y = any existing column (@test-category.R#55) 
      7. Error: climatology = T causes a list output with the time series category data (@test-category.R#60) 
      8. Error: the different `season` option function as expected (@test-category.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# heemod

<details>

* Version: 0.11.0
* Source code: https://github.com/cran/heemod
* BugReports: https://github.com/pierucci/heemod/issues
* Date/Publication: 2019-10-22 08:40:05 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"heemod")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘heemod-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: define_dsa
    > ### Title: Define a Sensitivity Analysis
    > ### Aliases: define_dsa define_dsa_
    > 
    > ### ** Examples
    > 
    > 
    > define_dsa(
    +   a, 10, 45,
    +   b, .5, 1.5
    + )
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 470 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 12 ]
      1. Error: Same results using 1 core or 2. (@test_parallel.R#7) 
      2. Failure: Parameter evaluation (@test_parameters.R#81) 
      3. Error: we can run construct_part_surv_tib (@test_part_surv.R#298) 
      4. Error: define sensitivity (@test_sensitivity.R#5) 
      5. Error: run sensitivity (@test_sensitivity.R#101) 
      6. Error: discount rate as a parameter works (@test_sensitivity.R#173) 
      7. Error: sensitivity expression inputs (@test_sensitivity.R#236) 
      8. Error: can read multinomial parameters from file (@test_tabular_input.R#110) 
      9. Failure: Bad parameter file input is caught. (@test_tabular_input.R#379) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rgho’
    ```

# INDperform

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/INDperform
* URL: https://github.com/saskiaotto/INDperform
* BugReports: https://github.com/SaskiaAOtto/INDperform/issues
* Date/Publication: 2019-07-13 23:20:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"INDperform")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘INDperform-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clust_sc
    > ### Title: Score-based cluster analysis
    > ### Aliases: clust_sc
    > 
    > ### ** Examples
    > 
    > # Using the Baltic Sea demo data
    > scores_tbl <- scoring(trend_tbl = model_trend_ex,
    +   mod_tbl = all_results_ex, press_type = press_type_ex)
    Warning: `.key` is deprecated
    > scores_mat <- summary_sc(scores_tbl)$scores_matrix
    Warning: `cols` is now required.
    Please use `cols = c(press_spec_sc)`
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 10 whereas the index has size 120.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 461 | SKIPPED: 0 | WARNINGS: 24 | FAILED: 8 ]
      1. Error: (unknown) (@test_clust_sc.R#5) 
      2. Error: (unknown) (@test_dist_sc.R#5) 
      3. Error: (unknown) (@test_dist_sc_group.R#5) 
      4. Error: (unknown) (@test_model_gamm.R#4) 
      5. Error: (unknown) (@test_plot_spiechart.R#5) 
      6. Error: (unknown) (@test_scoring.R#15) 
      7. Error: (unknown) (@test_summary_sc.R#6) 
      8. Error: (unknown) (@test_test_interaction.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lazyeval’
      All declared Imports should be used.
    ```

# inspectdf

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/inspectdf
* URL: https://alastairrushworth.github.io/inspectdf/
* BugReports: http://github.com/alastairrushworth/inspectdf/issues
* Date/Publication: 2019-09-29 17:20:02 UTC
* Number of recursive dependencies: 52

Run `revdep_details(,"inspectdf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Single dataframe summary
    > inspect_types(starwars)
    [38;5;246m# A tibble: 4 x 4[39m
      type        cnt  pcnt col_name 
      [3m[38;5;246m<chr>[39m[23m     [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<list>[39m[23m   
    [38;5;250m1[39m character     7 53.8  [38;5;246m<chr [7]>[39m
    [38;5;250m2[39m list          3 23.1  [38;5;246m<chr [3]>[39m
    [38;5;250m3[39m numeric       2 15.4  [38;5;246m<chr [2]>[39m
    [38;5;250m4[39m integer       1  7.69 [38;5;246m<chr [1]>[39m
    > 
    > # Paired dataframe comparison
    > inspect_types(starwars, starwars[1:20, ])
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 5 whereas the index has size 20.
    Execution halted
    ```

# interactions

<details>

* Version: 1.1.1
* Source code: https://github.com/cran/interactions
* URL: https://interactions.jacob-long.com
* BugReports: https://github.com/jacob-long/interactions/issues
* Date/Publication: 2019-07-05 07:30:23 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"interactions")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Plot interaction effects in regression models
    > ### Aliases: interact_plot
    > 
    > ### ** Examples
    > 
    > # Using a fitted lm model
    > states <- as.data.frame(state.x77)
    > states$HSGrad <- states$`HS Grad`
    > fit <- lm(Income ~ HSGrad + Murder * Illiteracy, data = states)
    > interact_plot(model = fit, pred = Murder, modx = Illiteracy)
    Error: Must extract with a single index.
    [31m✖[39m `j` has the wrong type `symbol`.
    [34mℹ[39m This index must be a position or a name.
    Backtrace:
    [90m 1. [39minteractions::interact_plot(model = fit, pred = Murder, modx = Illiteracy)
    [90m 2. [39minteractions:::plot_mod_continuous(...) [90m00_pkg_src/interactions/R/interact_plot.R:424:2[39m
    [90m 5. [39mtibble:::`[[.tbl_df`(d, pred) [90m00_pkg_src/interactions/R/interact_plot.R:645:2[39m
    [90m 6. [39mtibble:::tbl_subset2(x, j = i)
    [90m 7. [39mvctrs::vec_as_position(j, length(x), names(x), arg = "j")
    [90m 8. [39mvctrs:::maybe_get(...)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 122 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 13 ]
      1. Error: interact_plot works for lm (@test_interact_plot.R#33) 
      2. Error: interact_plot: robust standard errors work (@test_interact_plot.R#60) 
      3. Error: rug plots work (@test_interact_plot.R#70) 
      4. Error: interact_plot works for weighted lm (@test_interact_plot.R#90) 
      5. Error: interact_plot works for lm w/ logical (@test_interact_plot.R#100) 
      6. Error: interact_plot works for lm w/ non-focal character (@test_interact_plot.R#111) 
      7. Error: interact_plot accepts user-specified values and labels (@test_interact_plot.R#118) 
      8. Error: interact_plot terciles modxval/mod2val works (@test_interact_plot.R#140) 
      9. Error: interact_plot linearity.check works (@test_interact_plot.R#151) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'brms', 'rstanarm'
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘quantreg’, ‘brms’, ‘effects’, ‘Hmisc’, ‘rockchalk’, ‘pequod’
    ```

# ipumsr

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/ipumsr
* URL: https://www.ipums.org, https://github.com/mnpopcenter/ipumsr
* BugReports: https://github.com/mnpopcenter/ipumsr/issues
* Date/Publication: 2019-06-04 17:00:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"ipumsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ipumsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lbl_collapse
    > ### Title: Collapse labelled values to labels that already exist
    > ### Aliases: lbl_collapse
    > 
    > ### ** Examples
    > 
    > x <- haven::labelled(
    +   c(10, 10, 11, 20, 30, 99, 30, 10),
    +   c(Yes = 10, `Yes - Logically Assigned` = 11, No = 20, Maybe = 30, NIU = 99)
    + )
    > 
    > lbl_collapse(x, ~(.val %/% 10) * 10)
    Error: Tibble columns must have consistent lengths, only values of length one are recycled:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             new_val = pred_f(.val = .data$old_val, .lbl = .data$old_label), vals_equal = .data$old_val == 
                 .data$new_val) at /home/rstudio/tibble/revdep/checks/ipumsr/new/ipumsr.Rcheck/00_pkg_src/ipumsr/R/lbl_helpers.r:97
      6: tibble_quos(xs[!is_null], .rows, .name_repair) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:143
      7: lst_to_tibble(output, .rows, .name_repair, lengths = lengths) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:220
      8: recycle_columns(x, .rows, lengths) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:128
      9: abort(error_inconsistent_cols(.rows, names(x), lengths, "Requested with `.rows` argument")) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:197
      10: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 212 | SKIPPED: 11 | WARNINGS: 3 | FAILED: 2 ]
      1. Error: lbl_collapse: basic (@test_lbls.r#70) 
      2. Error: lbl_collapse: if recoding to old value it is maintained (even if it's not first) (@test_lbls.r#83) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# janitor

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/janitor
* URL: https://github.com/sfirke/janitor
* BugReports: https://github.com/sfirke/janitor/issues
* Date/Publication: 2019-04-21 04:20:13 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"janitor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘janitor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adorn_ns
    > ### Title: Add underlying Ns to a tabyl displaying percentages.
    > ### Aliases: adorn_ns
    > 
    > ### ** Examples
    > 
    > 
    > mtcars %>%
    +   tabyl(am, cyl) %>%
    +   adorn_percentages("col") %>%
    +   adorn_pct_formatting() %>%
    +   adorn_ns(position = "front")
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 1 whereas the index has size 6.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 320 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 17 ]
      1. Error: (unknown) (@test-add-totals.R#12) 
      2. Error: (unknown) (@test-adorn-crosstab.R#7) 
      3. Error: (unknown) (@test-adorn-ns.R#8) 
      4. Error: (unknown) (@test-adorn-pct-formatting.R#8) 
      5. Error: (unknown) (@test-adorn-percentages.R#8) 
      6. Error: (unknown) (@test-adorn-rounding.R#15) 
      7. Error: (unknown) (@test-adorn-title.R#8) 
      8. Error: (unknown) (@test-crosstab.R#32) 
      9. Error: (unknown) (@test-tabyl-classifiers.R#7) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jstor

<details>

* Version: 0.3.7
* Source code: https://github.com/cran/jstor
* URL: https://github.com/ropensci/jstor, https://ropensci.github.io/jstor/
* BugReports: https://github.com/ropensci/jstor/issues
* Date/Publication: 2019-09-05 02:10:11 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"jstor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jstor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: jst_define_import
    > ### Title: Define an import specification
    > ### Aliases: jst_define_import
    > 
    > ### ** Examples
    > 
    > # articles will be imported via `jst_get_article()` and `jst_get_authors()`
    > jst_define_import(article = c(jst_get_article, jst_get_authors))
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Actual message: "All columns in a tibble must be 1d or 2d objects:\n* Column `bare_funs` is quosures"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 227 | SKIPPED: 4 | WARNINGS: 3 | FAILED: 8 ]
      1. Failure: authors are correct (@test-books.R#117) 
      2. Error: jst_define_import returns correct class (@test-import-spec.R#4) 
      3. Error: jst_define_import validates input (@test-import-spec.R#11) 
      4. Error: jst_define_imports gives correct results (@test-import-spec.R#46) 
      5. Error: subsetting ngrams works (@test-ngram.R#32) 
      6. Error: importing from zip works (@test-zip.R#29) 
      7. Failure: too many arguments for batches throw error (@test-zip.R#56) 
      8. Failure: wrong row selection raises an error (@test-zip.R#68) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jtools

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/jtools
* URL: https://jtools.jacob-long.com
* BugReports: https://github.com/jacob-long/jtools/issues
* Date/Publication: 2019-04-08 21:30:11 UTC
* Number of recursive dependencies: 120

Run `revdep_details(,"jtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: effect_plot
    > 
    > ### ** Examples
    > 
    > # Using a fitted lm model
    > states <- as.data.frame(state.x77)
    > states$HSGrad <- states$`HS Grad`
    > fit <- lm(Income ~ HSGrad + Murder,
    +   data = states)
    > effect_plot(model = fit, pred = Murder)
    Error: Must extract with a single index.
    [31m✖[39m `j` has the wrong type `symbol`.
    [34mℹ[39m This index must be a position or a name.
    Backtrace:
    [90m 1. [39mjtools::effect_plot(model = fit, pred = Murder)
    [90m 2. [39mjtools:::plot_effect_continuous(...) [90m00_pkg_src/jtools/R/effect_plot.R:291:4[39m
    [90m 5. [39mtibble:::`[[.tbl_df`(d, pred) [90m00_pkg_src/jtools/R/effect_plot.R:390:2[39m
    [90m 6. [39mtibble:::tbl_subset2(x, j = i)
    [90m 7. [39mvctrs::vec_as_position(j, length(x), names(x), arg = "j")
    [90m 8. [39mvctrs:::maybe_get(...)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 240 | SKIPPED: 0 | WARNINGS: 29 | FAILED: 37 ]
      1. Error: effect_plot works for lm (@test-effect-plot.R#25) 
      2. Error: effect_plot: robust intervals works (@test-effect-plot.R#37) 
      3. Error: effect_plot: rug plots work (@test-effect-plot.R#45) 
      4. Error: effect_plot: plot.points works (@test-effect-plot.R#59) 
      5. Error: effect_plot: partial residuals work (@test-effect-plot.R#74) 
      6. Error: effect_plot works for weighted lm (@test-effect-plot.R#89) 
      7. Error: effect_plot works for svyglm (@test-effect-plot.R#134) 
      8. Error: effect_plot works for lme4 (@test-effect-plot.R#165) 
      9. Error: effect_plot handles offsets (@test-effect-plot.R#206) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'brms', 'quantreg', 'rstanarm'
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘wec’, ‘quantreg’, ‘brms’, ‘arm’, ‘interactions’, ‘effects’, ‘piecewiseSEM’
    ```

# keyholder

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/keyholder
* URL: https://echasnovski.github.io/keyholder/, https://github.com/echasnovski/keyholder/
* BugReports: https://github.com/echasnovski/keyholder/issues/
* Date/Publication: 2018-12-01 17:10:03 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"keyholder")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `output_1` not identical to `output_ref_1`.
      Objects equal but not identical
      
      [31m──[39m [31m3. Failure: key_by_id works on grouped_df (@test-id.R#108) [39m [31m─────────────────[39m
      `output_3` not identical to `output_ref_3`.
      Objects equal but not identical
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 306 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: add_id works on grouped_df (@test-id.R#46) 
      2. Failure: key_by_id works on grouped_df (@test-id.R#85) 
      3. Failure: key_by_id works on grouped_df (@test-id.R#108) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# metacoder

<details>

* Version: 0.3.3
* Source code: https://github.com/cran/metacoder
* URL: https://grunwaldlab.github.io/metacoder_documentation/
* BugReports: https://github.com/grunwaldlab/metacoder/issues
* Date/Publication: 2019-07-18 06:35:33 UTC
* Number of recursive dependencies: 136

Run `revdep_details(,"metacoder")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      21: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      [31m──[39m [31m4. Failure: Parsing the UNITE general release fasta (@test--parsers_and_write[39m
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 89 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 4 ]
      1. Failure: Summing counts per taxon (@test--calculations.R#103) 
      2. Failure: Summing counts per taxon (@test--calculations.R#126) 
      3. Error: Converting low counts to zero (@test--calculations.R#186) 
      4. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.R#119) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggrepel’ ‘reshape’ ‘svglite’
      All declared Imports should be used.
    ```

# modelsummary

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/modelsummary
* URL: https://github.com/vincentarelbundock/modelsummary
* BugReports: https://github.com/vincentarelbundock/modelsummary/issues
* Date/Publication: 2019-07-15 10:20:03 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"modelsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modelsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: extract
    > ### Title: Extract and combine estimates and goodness-of-fit statistics
    > ###   from several statistical models.
    > ### Aliases: extract
    > 
    > ### ** Examples
    > 
    > library(modelsummary)
    > data(trees)
    > models <- list()
    > models[['Bivariate']] <- lm(Girth ~ Height, data = trees)
    > models[['Multivariate']] <- lm(Girth ~ Height + Volume, data = trees)
    > extract(models)
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 5 whereas the index has size 60.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘gt’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

# MPTmultiverse

<details>

* Version: 0.3-3
* Source code: https://github.com/cran/MPTmultiverse
* URL: https://github.com/mpt-network/MPTmultiverse
* BugReports: https://github.com/mpt-network/MPTmultiverse/issues
* Date/Publication: 2019-08-27 23:30:29 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"MPTmultiverse")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Failure: No-pooling approaches work (@test-mptinr.R#61) 
      2. Failure: No-pooling approaches work (@test-mptinr.R#62) 
      3. Failure: No-pooling approaches work (@test-mptinr.R#63) 
      4. Failure: No-pooling approaches work (@test-mptinr.R#68) 
      5. Failure: No-pooling approaches work (@test-mptinr.R#73) 
      6. Failure: No-pooling approaches work (@test-mptinr.R#78) 
      7. Failure: No-pooling approaches work (@test-mptinr.R#84) 
      8. Failure: No-pooling approaches work (@test-mptinr.R#92) 
      9. Failure: No-pooling approaches work (@test-mptinr.R#107) 
      1. ...
      
      Error: testthat unit tests failed
      In addition: Warning message:
      closing unused connection 4 (<-localhost:11591) 
      Execution halted
    ```

# mudata2

<details>

* Version: 1.0.7
* Source code: https://github.com/cran/mudata2
* URL: https://github.com/paleolimbot/mudata
* BugReports: https://github.com/paleolimbot/mudata/issues
* Date/Publication: 2019-08-29 21:10:02 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"mudata2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
                 list(2), list(3)), class = c("json_column", "list")), c8 = sf::st_as_sfc(c("POINT(0 0)", 
                 "POINT(1 1)", "POINT(2 2)")), c9 = hms::as.hms(1:3)) at testthat/test_types.R:327
      2: tibble_quos(xs[!is_null], .rows, .name_repair) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:143
      3: check_valid_col(res, col_names[[j]], j) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:190
      4: abort(error_column_must_be_vector(name, classes)) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:171
      5: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 952 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 3 ]
      1. Error: mudata_prepare_column and mudata_parse_column are opposites (@test_mudata.io.R#244) 
      2. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test_mudata.io.R#344) 
      3. Error: generate_type_str generates expected output (@test_types.R#327) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# NACHO

<details>

* Version: 0.6.1
* Source code: https://github.com/cran/NACHO
* URL: https://github.com/mcanouil/NACHO, https://mcanouil.github.io/NACHO
* BugReports: https://github.com/mcanouil/NACHO/issues
* Date/Publication: 2019-10-12 07:30:10 UTC
* Number of recursive dependencies: 92

Run `revdep_details(,"NACHO")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: normalise
    > ### Title: (re)Normalise a dataset read from summarise
    > ### Aliases: normalise normalize
    > 
    > ### ** Examples
    > 
    > 
    > data(GSE74821)
    > GSE74821_norm <- normalise(
    +   nacho_object = GSE74821,
    +   housekeeping_norm = TRUE,
    +   normalisation_method = "GEO",
    +   remove_outliers = TRUE
    + )
    [NACHO] Normalising "GSE74821" with new value for parameters:
      - normalisation_method = TRUE
      - remove_outliers = TRUE
    [NACHO] Computing normalisation factors using "GEO" method.
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 4 whereas the index has size 20.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 67 | SKIPPED: 0 | WARNINGS: 20 | FAILED: 11 ]
      1. Error: No POS_E (@test-normalise.R#22) 
      2. Error: genes not null (@test-normalise.R#43) 
      3. Error: predict TRUE (@test-normalise.R#64) 
      4. Error: norm TRUE (@test-normalise.R#85) 
      5. Error: n_comp 2 (@test-normalise.R#127) 
      6. Error: n_comp 10 (@test-normalise.R#148) 
      7. Error: outliers TRUE (@test-normalise.R#169) 
      8. Error: All LoD to zero (@test-normalise.R#209) 
      9. Error: All PC to zero (@test-normalise.R#231) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# olsrr

<details>

* Version: 0.5.2
* Source code: https://github.com/cran/olsrr
* URL: https://olsrr.rsquaredacademy.com/, https://github.com/rsquaredacademy/olsrr
* BugReports: https://github.com/rsquaredacademy/olsrr/issues
* Date/Publication: 2018-11-22 17:30:03 UTC
* Number of recursive dependencies: 167

Run `revdep_details(,"olsrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
             hp    -0.031         0.011       -0.354    -2.724    0.011    -0.055    -0.008 
             wt    -3.801         1.066       -0.617    -3.565    0.001    -5.985    -1.617 
    ----------------------------------------------------------------------------------------
    > 
    > # if model includes interaction terms set iterm to TRUE
    > ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)
    Error: No variables or terms were selected.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─olsrr::ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)
    [90m  2. [39m└─olsrr:::ols_regress.default(mpg ~ disp * wt, data = mtcars, iterm = TRUE) [90m00_pkg_src/olsrr/R/ols-regression.R:68:15[39m
    [90m  3. [39m  └─olsrr:::reg_comp(object, data, conf.level, iterm, title) [90m00_pkg_src/olsrr/R/ols-regression.R:109:2[39m
    [90m  4. [39m    ├─recipes::prep(standardized, training = data) [90m00_pkg_src/olsrr/R/ols-regress_compute.R:54:4[39m
    [90m  5. [39m    └─recipes:::prep.recipe(standardized, training = data)
    [90m  6. [39m      ├─recipes::prep(x$steps[[i]], training = training, info = x$term_info)
    [90m  7. [39m      └─recipes:::prep.step_scale(...)
    [90m  8. [39m        └─recipes::terms_select(x$terms, info = info)
    [90m  9. [39m          └─rlang::with_handlers(...)
    [90m 10. [39m            └─base::tryCatch(...)
    [90m 11. [39m    
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                                        Parameter Estimates                                    
      ----------------------------------------------------------------------------------------
            model      Beta    Std. Error    Std. Beta      t        Sig      lower     upper 
      ----------------------------------------------------------------------------------------
      (Intercept)    52.577         2.286                 22.998    0.000    47.483    57.671 
               x1     1.468         0.121        0.574    12.105    0.000     1.198     1.739 
               x2     0.662         0.046        0.685    14.442    0.000     0.560     0.764 
      ----------------------------------------------------------------------------------------
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 353 | SKIPPED: 24 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: If model includes interaction terms, ols_regress scales and centers
                predictors before computing standardized betas (@test-regress.R#20) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘olsrr’:
     unable to load R code in package ‘car’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘car’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘car’
    Execution halted
    ```

# oppr

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/oppr
* URL: https://prioritizr.github.io/oppr, https://github.com/prioritizr/oppr
* BugReports: https://github.com/prioritizr/oppr/issues
* Date/Publication: 2019-08-10 22:30:07 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"oppr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             ... on average 5.0 major pivots per refactorization.
            The largest [LUSOL v2.2.1.0] fact(B) had 58 NZ entries, 1.1x largest basis.
            The maximum B&B level was 4, 0.1x MIP order, 3 at the optimal solution.
            The constraint matrix inf-norm is 1, with a dynamic range of 10.
            Time to load data was 0.019 seconds, presolve used 0.000 seconds,
             ... 0.001 seconds in simplex solver, in total 0.020 seconds.
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1479 | SKIPPED: 35 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: valid arguments (@test_project_cost_effectiveness.R#27) 
      2. Failure: valid arguments (@test_project_cost_effectiveness.R#36) 
      3. Failure: valid arguments (different number of actions/projects (@test_project_cost_effectiveness.R#63) 
      4. Failure: valid arguments (different number of actions/projects (@test_project_cost_effectiveness.R#69) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘gurobi’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.6Mb
      sub-directories of 1Mb or more:
        libs   9.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in prototype(data = data_frame(), extraInfo = data_frame(), anc_seq = ape::as.DNAbin(character(0)),  : 
      could not find function "prototype"
    Error in prototype(data = data_frame(), extraInfo = data_frame(), anc_seq = ape::as.DNAbin(character(0)),  : 
      could not find function "prototype"
    ```

# palaeoSig

<details>

* Version: 2.0-3
* Source code: https://github.com/cran/palaeoSig
* URL: https://github.com/richardjtelford/palaeoSig
* BugReports: https://github.com/richardjtelford/palaeoSig/issues
* Date/Publication: 2019-06-28 08:00:03 UTC
* Number of recursive dependencies: 106

Run `revdep_details(,"palaeoSig")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘palaeoSig-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: obs.cor
    > ### Title: Weighted correlation between weighted averaging optima and
    > ###   constrained ordination species scores.
    > ### Aliases: obs.cor plot.obscor identify.obscor autoplot.obscor
    > ### Keywords: hplot htest multivariate
    > 
    > ### ** Examples
    > 
    > require(rioja)
    Loading required package: rioja
    This is rioja 0.9-21
    > data(SWAP)
    > data(RLGH)
    > rlgh.obs <- obs.cor(spp = sqrt(SWAP$spec), env = SWAP$pH, fos = sqrt(RLGH$spec))
    Error: Tibble columns must have consistent lengths, only values of length one are recycled:
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘analogue’
    ```

# pmdplyr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/pmdplyr
* URL: https://nickch-k.github.io/pmdplyr, https://github.com/NickCH-K/pmdplyr
* BugReports: https://github.com/NickCH-K/pmdplyr/issues
* Date/Publication: 2019-08-26 09:50:02 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"pmdplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Let's only use nonmissing earnings
    > # And let's say we're only interested in four-year colleges in Colorado
    > # (mutate_cascade + tlag can be very slow so we're working with a smaller sample)
    > Scorecard <- Scorecard %>%
    +   dplyr::filter(
    +     !is.na(earnings_med),
    +     pred_degree_awarded_ipeds == 3,
    +     state_abbr == "CO"
    +   ) %>%
    +   # And declare the panel structure
    +   as_pibble(.i = unitid, .t = year)
    > Scorecard <- Scorecard %>%
    +   # Almost all instances involve a variable being set to a function of a lag of itself
    +   # we don't want to overwrite so let's make another
    +   dplyr::mutate(decay_earnings = earnings_med) %>%
    +   # Now we can cascade
    +   mutate_cascade(
    +     decay_earnings = decay_earnings +
    +       .5 * tlag(decay_earnings, .quick = TRUE)
    +   )
    Error: Lossy cast from `value` <double> to `x` <integer>.
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m5. Failure: Different inexact joins work (@test-inexact_join.R#213) [39m [31m────────[39m
      inexact_anti_join(left, right, var = t, jvar = t2, method = "last") not equal to last_join %>% dplyr::select(-b) %>% dplyr::filter(FALSE).
      Incompatible type for column `t2`: x logical, y numeric
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 296 | SKIPPED: 0 | WARNINGS: 16 | FAILED: 5 ]
      1. Error: inexact_join input failstates (@test-bad_input.R#96) 
      2. Failure: Different inexact joins work (@test-inexact_join.R#162) 
      3. Failure: Different inexact joins work (@test-inexact_join.R#169) 
      4. Failure: Different inexact joins work (@test-inexact_join.R#206) 
      5. Failure: Different inexact joins work (@test-inexact_join.R#213) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error in setOldClass(c("maxLik", "maxim")) : 
      could not find function "setOldClass"
    Error in globalVariables(c(".rows")) : 
      could not find function "globalVariables"
    ```

# PML

<details>

* Version: 1.1
* Source code: https://github.com/cran/PML
* URL: https://github.com/xinyue-L/PML
* BugReports: https://github.com/xinyue-L/PML/issues
* Date/Publication: 2019-09-17 08:00:02 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"PML")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

# PopED

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/PopED
* URL: http://poped.sourceforge.net
* BugReports: https://github.com/andrewhooker/PopED/issues
* Date/Publication: 2018-09-10 09:40:03 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"PopED")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: tryCatchOne(tryCatchList(expr, names[-nh], parentenv, handlers[-nh]), names[nh], 
             parentenv, handlers[[nh]])
      14: doTryCatch(return(expr), name, parentenv, handler)
      15: tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
      16: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      17: doTryCatch(return(expr), name, parentenv, handler)
      18: force(expr) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/msg.R:313
      19: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 181 | SKIPPED: 1 | WARNINGS: 13 | FAILED: 1 ]
      1. Error: Shrinkage evaluation works (@test_evaluate_design.R#227) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# portalr

<details>

* Version: 0.2.7
* Source code: https://github.com/cran/portalr
* URL: https://weecology.github.io/portalr/, https://github.com/weecology/portalr
* BugReports: https://github.com/weecology/portalr/issues
* Date/Publication: 2019-10-04 22:00:02 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"portalr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
      15: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      16: doTryCatch(return(expr), name, parentenv, handler)
      17: force(expr) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/msg.R:313
      18: vec_as_index(j, length(x), names(x), arg = "j") at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:283
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 174 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: data generated by default setting is same (shrub_cover) (@test-99-regression.R#115) 
      2. Error: data generated by default setting is same (ant colony_presence_absence) (@test-99-regression.R#126) 
      3. Error: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#144) 
      4. Error: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#162) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# projects

<details>

* Version: 2.0.0
* Source code: https://github.com/cran/projects
* URL: https://www.github.com/NikKrieger/projects
* Date/Publication: 2019-09-05 16:10:03 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"projects")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    New author's affiliations:
    [38;5;246m# A tibble: 4 x 4[39m
      affiliation_id department_name       institution_name    address              
               [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<chr>[39m[23m                 [3m[38;5;246m<chr>[39m[23m               [3m[38;5;246m<chr>[39m[23m                
    [38;5;250m1[39m              1 Math Dept.            Springfield College 123 College St, Spri…
    [38;5;250m2[39m             42 Art Department        Springfield College 321 University Boule…
    [38;5;250m3[39m              2 Central Intelligence… United States Gove… 888 Classified Dr, W…
    [38;5;250m4[39m              3 Pyrotechnics          ACME                [31mNA[39m                   
    > new_project(title = "Test project 1", current_owner = "Plato", stage = 1)
    [38;5;246m# A tibble: 3 x 7[39m
         id given_names last_name title degree email phone
      [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<chr>[39m[23m       [3m[38;5;246m<chr>[39m[23m     [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<chr>[39m[23m  [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<chr>[39m[23m
    [38;5;250m1[39m    13 Spiro       Agnew     [31mNA[39m    LLB    [31mNA[39m    [31mNA[39m   
    [38;5;250m2[39m   303 Plato       [31mNA[39m        [31mNA[39m    [31mNA[39m     [31mNA[39m    [31mNA[39m   
    [38;5;250m3[39m     1 Condoleezza Rice      [31mNA[39m    [31mNA[39m     [31mNA[39m    [31mNA[39m   
    Error in validate_unique_entry(x = x, table = authors_table, what = "author",  : 
      
    The entry NA matches multiple authors, seen above.
    Calls: new_project ... validate_special_authors -> lapply -> FUN -> validate_unique_entry
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             .subclass = c(.subclass, "vctrs_error_incompatible_type")) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:92
      13: stop_vctrs(message, .subclass = c(.subclass, "vctrs_error_incompatible"), x = x, 
             y = y, details = details, ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:48
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      15: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: Setup works (@test-setup.R#129) 
      2. Failure: Setup works (@test-setup.R#147) 
      3. Failure: Setup works (@test-setup.R#157) 
      4. Error: Setup works (@test-setup.R#183) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# readwritesqlite

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/readwritesqlite
* URL: https://github.com/poissonconsulting/readwritesqlite
* BugReports: https://github.com/poissonconsulting/readwritesqlite/issues
* Date/Publication: 2019-07-23 16:50:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"readwritesqlite")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "geometry": Attributes: < Component "bbox": Attributes: < Length mismatch: comparison on first 1 components > >
      Component "geometry": Attributes: < Component "bbox": 'is.NA' value mismatch: 0 in current 4 in target >
      Component "geometry": Attributes: < Component "class": 1 string mismatch >
      Component "geometry": Attributes: < Component 3: Modes: character, list >
      Component "geometry": Attributes: < Component 3: Lengths: 0, 2 >
      Component "geometry": Attributes: < Component 3: names for current but not for target >
      Component "geometry": Attributes: < Component 3: Attributes: < target is NULL, current is list > >
      ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 443 | SKIPPED: 0 | WARNINGS: 27 | FAILED: 1 ]
      1. Failure: initialized even with no rows of data (@test-write.R#592) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# recipes

<details>

* Version: 0.1.7
* Source code: https://github.com/cran/recipes
* URL: https://github.com/tidymodels/recipes
* BugReports: https://github.com/tidymodels/recipes/issues
* Date/Publication: 2019-09-15 15:10:02 UTC
* Number of recursive dependencies: 106

Run `revdep_details(,"recipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
          Status    Seniority         Home         Time          Age      Marital 
    0.0000000000 0.0000000000 0.0013471037 0.0000000000 0.0000000000 0.0002245173 
         Records          Job     Expenses       Income       Assets         Debt 
    0.0000000000 0.0004490346 0.0000000000 0.0855410867 0.0105523125 0.0040413112 
          Amount        Price 
    0.0000000000 0.0000000000 
    > 
    > set.seed(342)
    > in_training <- sample(1:nrow(credit_data), 2000)
    > 
    > credit_tr <- credit_data[ in_training, ]
    > credit_te <- credit_data[-in_training, ]
    > missing_examples <- c(14, 394, 565)
    > 
    > rec <- recipe(Price ~ ., data = credit_tr)
    > 
    > impute_rec <- rec %>%
    +   step_bagimpute(Status, Home, Marital, Job, Income, Assets, Debt)
    > 
    > imp_models <- prep(impute_rec, training = credit_tr)
    Error: Lossy cast from `value` <double> to `x` <integer>.
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1321 | SKIPPED: 7 | WARNINGS: 30 | FAILED: 24 ]
      1. Error: detect_step function works (@test_basics.R#73) 
      2. Error: bake without newdata (@test_basics.R#117) 
      3. Error: no outcomes (@test_basics.R#127) 
      4. Failure: correct means and std devs (@test_center_scale_norm.R#29) 
      5. Failure: correct means and std devs (@test_center_scale_norm.R#43) 
      6. Failure: correct means and std devs (@test_center_scale_norm.R#49) 
      7. Error: (unknown) (@test_data.frame.R#20) 
      8. Error: is trained? (@test_formula.R#22) 
      9. Error: (unknown) (@test_matrix.R#20) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# REDCapR

<details>

* Version: 0.10.2
* Source code: https://github.com/cran/REDCapR
* URL: https://github.com/OuhscBbmc/REDCapR, http://ouhsc.edu/bbmc/, http://project-redcap.org
* BugReports: https://github.com/OuhscBbmc/REDCapR/issues
* Date/Publication: 2019-09-23 04:30:02 UTC
* Number of recursive dependencies: 115

Run `revdep_details(,"REDCapR")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > # Modeled after the R6 testing structure: https://github.com/wch/R6/blob/master/tests/testthat.R
      > library(testthat)
      > library(REDCapR)
      > 
      > testthat::test_check("REDCapR")
      [31m──[39m [31m1. Failure: validate_no_logical -concern dataset (@test-validate.R#36) [39m [31m─────[39m
      ds$field_index not equal to 2.
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 135 | SKIPPED: 79 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: validate_no_logical -concern dataset (@test-validate.R#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rematch2

<details>

* Version: 2.1.0
* Source code: https://github.com/cran/rematch2
* URL: https://github.com/r-lib/rematch2#readme
* BugReports: https://github.com/r-lib/rematch2/issues
* Date/Publication: 2019-07-11 17:32:41 UTC
* Number of recursive dependencies: 32

Run `revdep_details(,"rematch2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Match first occurrence
    > pos <- re_exec(notables, name_rex)
    > pos
    Error: Expected a vector, not a `rematch_records` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─(function (x, ...) ...
    [90m  2. [39m├─tibble:::print.tbl(x)
    [90m  3. [39m│ ├─tibble:::cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
    [90m  4. [39m│ │ ├─base::cat(paste0(..., "\n"), sep = "")
    [90m  5. [39m│ │ └─base::paste0(..., "\n")
    [90m  6. [39m│ ├─base::format(x, ..., n = n, width = width, n_extra = n_extra)
    [90m  7. [39m│ └─tibble:::format.tbl(x, ..., n = n, width = width, n_extra = n_extra)
    [90m  8. [39m│   └─tibble::trunc_mat(x, n = n, width = width, n_extra = n_extra)
    [90m  9. [39m│     ├─base::as.data.frame(head(x, n))
    [90m 10. [39m│     ├─utils::head(x, n)
    [90m 11. [39m│     └─utils:::head.data.frame(x, n)
    [90m 12. [39m│       ├─x[seq_len(n), , drop = FALSE]
    [90m 13. [39m│       └─tibble:::`[.tbl_df`(x, seq_len(n), , drop = FALSE)
    [90m 14. [39m│      
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m5. Failure: scalar text with capure groups (@test-exec-all.R#92) [39m [31m───────────[39m
      as.data.frame(res) not equal to asdf(...).
      Names: 1 string mismatch
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 65 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 5 ]
      1. Failure: capture groups (@test-all.R#40) 
      2. Failure: scalar text with capure groups (@test-all.R#55) 
      3. Error: corner cases (@test-exec-all.R#46) 
      4. Failure: capture groups (@test-exec-all.R#71) 
      5. Failure: scalar text with capure groups (@test-exec-all.R#92) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# RmarineHeatWaves

<details>

* Version: 0.17.0
* Source code: https://github.com/cran/RmarineHeatWaves
* URL: https://github.com/ajsmit/RmarineHeatWaves
* Date/Publication: 2018-06-04 17:43:40 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"RmarineHeatWaves")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > ts_dat <- make_whole(sst_WA)
    > res <- detect(ts_dat, climatology_start = "1983-01-01",
    +               climatology_end = "2012-12-31")
    Error: Can't cast <double[,31]> to <double>.
    Can not decrease dimensions
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─RmarineHeatWaves::detect(...)
    [90m  2. [39m│ ├─base::`[<-`(...) [90m00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4[39m
    [90m  3. [39m│ └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4[39m
    [90m  4. [39m│   └─tibble:::tbl_subassign(x, i, j, value)
    [90m  5. [39m│     └─tibble:::tbl_subassign_row(xj, i, value)
    [90m  6. [39m│       └─vctrs::`vec_slice<-`(`*tmp*`, i, value = value[[j]])
    [90m  7. [39m├─vctrs:::vec_cast_dispatch(x = x, to = to, x_arg = x_arg, to_arg = to_arg)
    [90m  8. [39m├─vctrs::vec_cast.double(x = x, to = to, x_arg = x_arg, to_arg = to_arg)
    [90m  9. [39m└─vctrs:::vec_cast.double.double(...)
    [90m 10. [39m  └─vctrs:::shape_broadcast(x, to)
    [90m 11. [39m    └─vctrs::stop_incompatible_cast(x, to, details = "Can not decrease dimensions")
    Execution halted
    ```

# rsample

<details>

* Version: 0.0.5
* Source code: https://github.com/cran/rsample
* URL: https://tidymodels.github.io/rsample
* BugReports: https://github.com/tidymodels/rsample/issues
* Date/Publication: 2019-07-12 22:20:11 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"rsample")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ttest$estimate not equal to single_t_res$.estimate.
      names for target but not for current
      
      [31m──[39m [31m3. Failure: Bootstrap estimate of mean is close to estimate of mean from norm[39m
      ttest$estimate not equal to single_bca_res$.estimate.
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 529 | SKIPPED: 0 | WARNINGS: 13 | FAILED: 3 ]
      1. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#53) 
      2. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#63) 
      3. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#73) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# RSDA

<details>

* Version: 3.0
* Source code: https://github.com/cran/RSDA
* URL: http://www.oldemarrodriguez.com
* Date/Publication: 2019-10-22 05:30:02 UTC
* Number of recursive dependencies: 115

Run `revdep_details(,"RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RSDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: VeterinaryData
    > ### Title: Symbolic interval data example
    > ### Aliases: VeterinaryData
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(VeterinaryData)
    > VeterinaryData
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'check_names_df' not found
    Calls: <Anonymous> ... head.data.frame -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

# rubias

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/rubias
* Date/Publication: 2019-06-10 15:00:03 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"rubias")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ###   repunits file
    > ### Aliases: write_gsi_sim_mixture
    > 
    > ### ** Examples
    > 
    > # this writes to file prefix "mixfile" in a temporary directory
    > dd <- tempdir()
    > prefix <- file.path(dd, "mixfile")
    > 
    > # print that
    > prefix
    [1] "/tmp/RtmpnQ9SWs/mixfile"
    > 
    > # note that in practice you will probably want to specify
    > # your own directory...
    > 
    > # run the function
    > write_gsi_sim_mixture(chinook_mix, 5, prefix)
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 186 whereas the index has size 419616.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        libs   4.9Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# ruler

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/ruler
* URL: https://echasnovski.github.io/ruler/, https://github.com/echasnovski/ruler
* BugReports: https://github.com/echasnovski/ruler/issues
* Date/Publication: 2019-05-16 19:30:03 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"ruler")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: vec_size(x) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:525
      7: stop_scalar_type(.Primitive("quote")(function (x, ...) 
         UseMethod("mean")), "x") at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/size.R:72
      8: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:398
      9: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      10: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 299 | SKIPPED: 1 | WARNINGS: 2 | FAILED: 3 ]
      1. Error: bind_exposures works (@test-expose-helpers.R#82) 
      2. Failure: new_pack_info removes names inside `.packs` (@test-exposure.R#118) 
      3. Error: is_exposure works (@test-exposure.R#166) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# SanzCircos

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/SanzCircos
* Date/Publication: 2018-05-04 10:52:54 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"SanzCircos")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SanzCircos-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_circos_links
    > ### Title: make_circos_links
    > ### Aliases: make_circos_links
    > 
    > ### ** Examples
    > 
    > 
    > links_df <- data.frame(chrom = c(rep("chr1", 5), rep("chr2", 5)),
    + band = c(rep("band1", 3), rep("band2", 2), "band1", rep("band2", 4)),
    + link = c(1, 2, 3, 1, 2, 1, 1, 3, 4, 5),
    + start = c(1, 3, 5, 10, 35, 1, 5, 8, 13, 15),
    + end = c(3, 5, 10, 35, 39, 5, 8, 13, 15, 21))
    > 
    > links <- make_circos_links(links_df, "chrom", "band", "link", "start", "end", status = TRUE)
    Error: Lossy cast from `value` <character> to `x` <logical>.
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘tidyr’
      All declared Imports should be used.
    ```

# sclr

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/sclr
* Date/Publication: 2019-10-24 21:30:02 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"sclr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      predict(fit, prot50_low)$prot_l not equal to 0.5.
      names for target but not for current
      
      [31m──[39m [31m3. Failure: protective titre is found correctly (@test-protection.R#16) [39m [31m────[39m
      predict(fit, prot50_high)$prot_u not equal to 0.5.
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 63 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: protective titre is found correctly (@test-protection.R#12) 
      2. Failure: protective titre is found correctly (@test-protection.R#14) 
      3. Failure: protective titre is found correctly (@test-protection.R#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sf

<details>

* Version: 0.8-0
* Source code: https://github.com/cran/sf
* URL: https://github.com/r-spatial/sf/, https://r-spatial.github.io/sf/
* BugReports: https://github.com/r-spatial/sf/issues/
* Date/Publication: 2019-09-17 04:40:03 UTC
* Number of recursive dependencies: 140

Run `revdep_details(,"sf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    2      10   542     3      12    (0,0.1] MULTIPOLYGON (((-81.23989 3...
    > nc$area_cl = cut(nc$AREA, c(0, .1, .12, .15, .25))
    > nc.g <- nc %>% group_by(area_cl)
    > nc.g %>% summarise(mean(AREA))
    Simple feature collection with 4 features and 2 fields
    geometry type:  MULTIPOLYGON
    dimension:      XY
    bbox:           xmin: -84.32385 ymin: 33.88199 xmax: -75.45698 ymax: 36.58965
    epsg (SRID):    4267
    proj4string:    +proj=longlat +datum=NAD27 +no_defs
    [38;5;246m# A tibble: 4 x 3[39m
      area_cl    `mean(AREA)`                                               geometry
      [3m[38;5;246m<fct>[39m[23m             [3m[38;5;246m<dbl>[39m[23m                                     [3m[38;5;246m<MULTIPOLYGON [°]>[39m[23m
    [38;5;250m1[39m (0,0.1]          0.076[4m0[24m (((-77.96073 34.18924, -77.96587 34.24229, -77.97528 …
    [38;5;250m2[39m (0.1,0.12]       0.112  (((-84.29104 35.21054, -84.22594 35.2616, -84.17973 3…
    [38;5;250m3[39m (0.12,0.1…       0.134  (((-76.54427 34.58783, -76.55515 34.61066, -76.53775 …
    [38;5;250m4[39m (0.15,0.2…       0.190  (((-76.64705 34.90633, -76.62562 34.89065, -76.75021 …
    > nc.g %>% summarise(mean(AREA)) %>% plot(col = grey(3:6 / 7))
    Error in is_null(i) : argument "i" is missing, with no default
    Calls: %>% ... [ -> [.sf -> [ -> [.tbl_df -> tbl_subset_row -> is_null
    Execution halted
    ```

*   checking tests ...
    ```
    ...
    < MULTIPOINT (505.9977 -7.081155e-10, 1517.993 -7...
    ---
    > MULTIPOINT (505.9977 0, 1517.993 0, 2529.988 0,...
     ERROR
    Running the tests in ‘tests/dplyr.R’ failed.
    Last 13 lines of output:
      dimension:      XY
      bbox:           xmin: -84.32385 ymin: 33.88199 xmax: -75.45698 ymax: 36.58965
      epsg (SRID):    4267
      proj4string:    +proj=longlat +datum=NAD27 +no_defs
      [38;5;246m# A tibble: 4 x 3[39m
        area_cl    `mean(AREA)`                                               geometry
        [3m[38;5;246m<fct>[39m[23m             [3m[38;5;246m<dbl>[39m[23m                                     [3m[38;5;246m<MULTIPOLYGON [°]>[39m[23m
      [38;5;250m1[39m (0,0.1]          0.076[4m0[24m (((-77.96073 34.18924, -77.96587 34.24229, -77.97528 …
      [38;5;250m2[39m (0.1,0.12]       0.112  (((-84.29104 35.21054, -84.22594 35.2616, -84.17973 3…
      [38;5;250m3[39m (0.12,0.1…       0.134  (((-76.54427 34.58783, -76.55515 34.61066, -76.53775 …
      [38;5;250m4[39m (0.15,0.2…       0.190  (((-76.64705 34.90633, -76.62562 34.89065, -76.75021 …
      > nc.g %>% summarize(mean(AREA)) %>% plot(col = 3:6/7)
      Error in is_null(i) : argument "i" is missing, with no default
      Calls: %>% ... [ -> [.sf -> [ -> [.tbl_df -> tbl_subset_row -> is_null
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 25.7Mb
      sub-directories of 1Mb or more:
        doc     12.0Mb
        libs     9.3Mb
        sqlite   1.5Mb
    ```

# sfdct

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/sfdct
* URL: https://github.com/hypertidy/sfdct
* BugReports: https://github.com/hypertidy/sfdct/issues
* Date/Publication: 2018-03-23 14:35:45 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"sfdct")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfdct-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ct_triangulate
    > ### Title: Constrained Delaunay Triangulation
    > ### Aliases: ct_triangulate ct_triangulate ct_triangulate.POINT
    > ###   ct_triangulate ct_triangulate.MULTIPOINT ct_triangulate
    > ###   ct_triangulate.GEOMETRYCOLLECTION ct_triangulate ct_triangulate.sfg
    > ###   ct_triangulate ct_triangulate.sfc ct_triangulate ct_triangulate.sf
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.5.1, GDAL 2.1.2, PROJ 4.9.3
    > nc <- read_sf(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
    > nc_triangles <- ct_triangulate(nc[, c("NAME", "geometry")])
    Error in is_null(i) : argument "i" is missing, with no default
    Calls: ct_triangulate ... [ -> [.sf -> [ -> [.tbl_df -> tbl_subset_row -> is_null
    Execution halted
    ```

# silicate

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/silicate
* Date/Publication: 2019-10-09 11:30:02 UTC
* Number of recursive dependencies: 137

Run `revdep_details(,"silicate")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             2L)))), class = c("XY", "MULTIPOLYGON", "sfg")), structure(list(`1` = list(`1` = structure(c(0.69, 
         0.8, 1.1, 1.23, 0.69, 0, 0.6, 0.63, 0.3, 0), .Dim = c(5L, 2L)))), class = c("XY", 
         "MULTIPOLYGON", "sfg"))), precision = 0, bbox = c(xmin = 0, ymin = 0, xmax = 1.23, 
         ymax = 1), crs = structure(list(epsg = NA_integer_, proj4string = NA_character_), class = "crs"), n_empty = 0, class = c("sfc_MULTIPOLYGON", 
         "sfc"))), "x") at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/size.R:72
      13: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:398
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      15: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 93 | SKIPPED: 7 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: building sf works (@test-spatial-build.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘geometry’
      All declared Imports should be used.
    ```

# simrel

<details>

* Version: 2.0
* Source code: https://github.com/cran/simrel
* URL: https://simulatr.github.io/simrel/
* BugReports: https://github.com/simulatr/simrel/issues
* Date/Publication: 2019-04-01 18:00:09 UTC
* Number of recursive dependencies: 89

Run `revdep_details(,"simrel")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Can't join on 'q' x 'q' because of incompatible types (list / list)
      1: expect_identical(prepare_design(opts), dgn) at testthat/test-utils.R:44
      2: compare(act$val, exp$val)
      3: compare.default(act$val, exp$val)
      4: all.equal(x, y, ...)
      5: all.equal.tbl_df(x, y, ...)
      6: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 169 | SKIPPED: 21 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: Prepare Design (@test-utils.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# skimr

<details>

* Version: 1.0.7
* Source code: https://github.com/cran/skimr
* URL: https://github.com/ropenscilabs/skimr
* BugReports: https://github.com/ropenscilabs/skimr/issues
* Date/Publication: 2019-06-20 15:10:03 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"skimr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/type2.R:63
      11: stop_incompatible(x, y, x_arg = x_arg, y_arg = y_arg, details = details, ..., message = message, 
             .subclass = c(.subclass, "vctrs_error_incompatible_type")) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:92
      12: stop_vctrs(message, .subclass = c(.subclass, "vctrs_error_incompatible"), x = x, 
             y = y, details = details, ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:48
      13: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      14: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 447 | SKIPPED: 2 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: skim_v returns expected response for logical vectors (@test-skim_v.R#107) 
      2. Error: skim_v returns expected response for logical vectors (@test-skim_v.R#122) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sociome

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/sociome
* BugReports: https://github.com/NikKrieger/sociome/issues
* Date/Publication: 2019-09-16 15:50:02 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"sociome")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 16 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 12 ]
      1. Error: call tibble for geoids is correct (@test_arg_tibble_acs.R#61) 
      2. Error: call tibble for states only is correct (@test_arg_tibble_acs.R#187) 
      3. Error: call tibble for one state and multiple counties is correct (@test_arg_tibble_acs.R#311) 
      4. Error: call tibble for geoids is correct (@test_arg_tibble_decennial1990.R#51) 
      5. Error: call tibble for state only is correct (@test_arg_tibble_decennial1990.R#182) 
      6. Error: call tibble for one state and multiple counties is correct (@test_arg_tibble_decennial1990.R#309) 
      7. Error: call tibble for geoids is correct (@test_arg_tibble_decennial2000.R#51) 
      8. Error: call tibble for state only is correct (@test_arg_tibble_decennial2000.R#182) 
      9. Error: call tibble for one state and multiple counties is correct (@test_arg_tibble_decennial2000.R#309) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

# spbabel

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/spbabel
* URL: https://mdsumner.github.io/spbabel
* BugReports: https://github.com/mdsumner/spbabel/issues
* Date/Publication: 2019-01-08 18:10:10 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"spbabel")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: eval(lhs, parent, parent)
      4: sptable(nc[, 1:4])
      5: nc[, 1:4] at /home/rstudio/tibble/revdep/checks/spbabel/new/spbabel.Rcheck/00_pkg_src/spbabel/R/sptable.r:58
      6: `[.sf`(nc, , 1:4) at /home/rstudio/tibble/revdep/checks/spbabel/new/spbabel.Rcheck/00_pkg_src/spbabel/R/sptable.r:58
      7: x[i, j, drop = drop]
      8: `[.tbl_df`(x, i, j, drop = drop)
      9: tbl_subset_row(xo, i = i) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:174
      10: is_null(i) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/subsetting.R:314
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 86 | SKIPPED: 4 | WARNINGS: 5 | FAILED: 1 ]
      1. Error: recomposition works (@test-sf.R#115) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# srvyr

<details>

* Version: 0.3.6
* Source code: https://github.com/cran/srvyr
* URL: http://gdfe.co/srvyr, https://github.com/gergness/srvyr
* BugReports: https://github.com/gergness/srvyr/issues
* Date/Publication: 2019-10-05 21:00:02 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"srvyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Incompatible type for column `survey_mean_upp`: x numeric, y matrix
      
      [31m──[39m [31m3. Failure: deff and df work for grouped survey total [39m [31m──────────────────────[39m
      `x` not equal to `y`.
      Incompatible type for column `survey_total_low`: x numeric, y matrix
      Incompatible type for column `survey_total_upp`: x numeric, y matrix
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 201 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: deff and df work for grouped survey total 
      2. Failure: deff and df work for grouped survey mean 
      3. Failure: deff and df work for grouped survey total 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suddengains

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/suddengains
* URL: https://github.com/milanwiedemann/suddengains
* BugReports: https://github.com/milanwiedemann/suddengains/issues
* Date/Publication: 2019-10-27 11:20:02 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"suddengains")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: create_byperson
    > 
    > ### ** Examples
    > 
    > # Create byperson data set, selecting the largest gain in case of muliple gains
    > create_byperson(data = sgdata,
    +                 sg_crit1_cutoff = 7,
    +                 id_var_name = "id",
    +                 tx_start_var_name = "bdi_s1",
    +                 tx_end_var_name = "bdi_s12",
    +                 sg_var_list = c("bdi_s1", "bdi_s2", "bdi_s3",
    +                                 "bdi_s4", "bdi_s5", "bdi_s6",
    +                                 "bdi_s7", "bdi_s8", "bdi_s9",
    +                                 "bdi_s10", "bdi_s11", "bdi_s12"),
    +                 sg_measure_name = "bdi",
    +                 multiple_sg_select = "largest")
    First, second, and third sudden gains criteria were applied.
    The critical value for the thrid criterion was adjusted for missingness.
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 22 whereas the index has size 946.
    Execution halted
    ```

# taxa

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/taxa
* URL: https://github.com/ropensci/taxa
* BugReports: https://github.com/ropensci/taxa/issues
* Date/Publication: 2019-01-02 22:40:04 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"taxa")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      names for target but not for current
      
      [31m──[39m [31m3. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers[39m
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 607 | SKIPPED: 2 | WARNINGS: 1 | FAILED: 3 ]
      1. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#52) 
      2. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#56) 
      3. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘lazyeval’ ‘rlang’ ‘tidyr’
      All declared Imports should be used.
    ```

# textrecipes

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/textrecipes
* URL: https://github.com/tidymodels/textrecipes
* BugReports: https://github.com/tidymodels/textrecipes/issues
* Date/Publication: 2019-09-07 11:20:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"textrecipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      [3m[38;5;246m<list>[39m[23m     
    [38;5;250m1[39m [38;5;246m<chr [184]>[39m
    [38;5;250m2[39m [38;5;246m<chr [24]>[39m 
    > 
    > juice(okc_obj) %>% 
    +   slice(2) %>% 
    +   pull(essay0) 
    [[1]]
     [1] "i'm"      "chill"    "and"      "steadi"   "br"       "i'm"     
     [7] "a"        "teacher"  "amp"      "musician" "br"       "i"       
    [13] "like"     "plai"     "outsid"   "dislik"   "school"   "night"   
    [19] "br"       "and"      "i'm"      "veri"     "veri"     "lucki"   
    
    >   
    > tidy(okc_rec, number = 2)
    [38;5;246m# A tibble: 1 x 3[39m
      terms  value id        
      [3m[38;5;246m<chr>[39m[23m  [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<chr>[39m[23m     
    [38;5;250m1[39m essay0 [31mNA[39m    stem_8wQnr
    > tidy(okc_obj, number = 2)
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 79 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 10 ]
      1.  Error: hashing gives double outputs (@test-hashing.R#31) 
      2.  Error: stemming is done correctly (@test-stem.R#32) 
      3.  Error: custom stemmer works (@test-stem.R#55) 
      4.  Error: stopwords are removed correctly (@test-stopwords.R#33) 
      5.  Error: step_tf works as intended (@test-tf.R#47) 
      6.  Error: step_tfidf works as intended (@test-tfidf.R#50) 
      7.  Error: tokenfilter removes words correctly using min_times and max_times (@test-tokenfilter.R#47) 
      8.  Error: tokenization is done correctly (@test-tokenize.R#40) 
      9.  Error: merging is done correctly (@test-tokenmerge.R#38) 
      10. Error: output is not a list (@test-untokenize.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    ```

# tidyr

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/tidyr
* URL: https://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Date/Publication: 2019-09-11 23:00:03 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"tidyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # Generate all combinations with expand():
    > formulas <- list(
    +   formula1 = Sepal.Length ~ Sepal.Width,
    +   formula2 = Sepal.Length ~ Sepal.Width + Petal.Width,
    +   formula3 = Sepal.Length ~ Sepal.Width + Petal.Width + Petal.Length
    + )
    > data <- split(iris, iris$Species)
    > crossing(formula = formulas, data)
    Error: `x` must be a vector, not a `formula` object
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─tidyr::crossing(formula = formulas, data)
    [90m 2. [39m│ └─purrr::map(cols, sorted_unique) [90m00_pkg_src/tidyr/R/expand.R:115:2[39m
    [90m 3. [39m│   └─tidyr:::.f(.x[[i]], ...)
    [90m 4. [39m│     └─vctrs::vec_unique(x) [90m00_pkg_src/tidyr/R/expand.R:126:4[39m
    [90m 5. [39m│       ├─vctrs::vec_slice(x, vec_unique_loc(x))
    [90m 6. [39m│       └─vctrs::vec_unique_loc(x)
    [90m 7. [39m└─vctrs:::stop_scalar_type(...)
    [90m 8. [39m  └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m6. Failure: can drop missing values (@test-pivot-long.R#43) [39m [31m────────────────[39m
      pv$name not equal to c("x", "y").
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 556 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 6 ]
      1. Failure: optionally keep empty rows (@test-chop.R#57) 
      2. Failure: gather throws error for weird objects (@test-gather.R#141) 
      3. Failure: tibble conversion occurs in the `nest.data.frame()` method (@test-nest.R#71) 
      4. Failure: can control name_repair (@test-pack.R#68) 
      5. Failure: can pivot all cols to long (@test-pivot-long.R#8) 
      6. Failure: can drop missing values (@test-pivot-long.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# tidytransit

<details>

* Version: 0.6
* Source code: https://github.com/cran/tidytransit
* URL: https://github.com/r-transit/tidytransit
* BugReports: https://github.com/r-transit/tidytransit
* Date/Publication: 2019-10-14 06:50:02 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"tidytransit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytransit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_stop_geometry
    > ### Title: Make Stops into Simple Features Points
    > ### Aliases: get_stop_geometry
    > 
    > ### ** Examples
    > 
    > data(gtfs_obj)
    > some_stops <- gtfs_obj$stops[sample(nrow(gtfs_obj$stops), 40),]
    > some_stops_sf <- get_stop_geometry(some_stops)
    > plot(some_stops_sf)
    Warning: plotting the first 10 out of 13 attributes; use max.plot = 13 to plot all
    Error in is_null(i) : argument "i" is missing, with no default
    Calls: plot ... [ -> [.sf -> [ -> [.tbl_df -> tbl_subset_row -> is_null
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        doc       1.3Mb
        extdata   4.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘here’ ‘htmltools’ ‘scales’ ‘stringr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 66 marked UTF-8 strings
    ```

# timetk

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/timetk
* URL: https://github.com/business-science/timetk
* BugReports: https://github.com/business-science/timetk/issues
* Date/Publication: 2019-09-25 13:50:02 UTC
* Number of recursive dependencies: 109

Run `revdep_details(,"timetk")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Numeric: lengths (28, 20) differ
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 268 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 8 ]
      1. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#62) 
      2. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#69) 
      3. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#76) 
      4. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#98) 
      5. Failure: tk_make_future_timeseries(predict_every_two) test returns correct format. (@test_tk_make_future_timeseries.R#310) 
      6. Failure: tk_make_future_timeseries(predict_every_three) test returns correct format. (@test_tk_make_future_timeseries.R#349) 
      7. Failure: tk_make_future_timeseries(predict_every_four) test returns correct format. (@test_tk_make_future_timeseries.R#387) 
      8. Failure: tk_make_future_timeseries(predict_random) test returns correct format. (@test_tk_make_future_timeseries.R#431) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# units

<details>

* Version: 0.6-5
* Source code: https://github.com/cran/units
* URL: https://github.com/r-quantities/units/
* BugReports: https://github.com/r-quantities/units/issues/
* Date/Publication: 2019-10-08 11:40:02 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"units")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      All columns in a tibble must be 1d or 2d objects:
      * Column `m` is mixed_units
      1: print(tibble::tibble(m)) at testthat/test_mixed.R:46
      2: tibble::tibble(m)
      3: tibble_quos(xs[!is_null], .rows, .name_repair) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:143
      4: check_valid_col(res, col_names[[j]], j) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/tibble.R:190
      5: abort(error_column_must_be_vector(name, classes)) at /tmp/RtmpSXawci/R.INSTALL5a446c00a12/tibble/R/as_tibble.R:171
      6: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 416 | SKIPPED: 6 | WARNINGS: 13 | FAILED: 1 ]
      1. Error: mixed units work (@test_mixed.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# utile.tables

<details>

* Version: 0.1.7
* Source code: https://github.com/cran/utile.tables
* URL: https://github.com/efinite/utile.tables
* BugReports: https://github.com/efinite/utile.tables/issues
* Date/Publication: 2019-10-19 17:20:02 UTC
* Number of recursive dependencies: 30

Run `revdep_details(,"utile.tables")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;250m1[39m Meal calories 181      134 (74%) 1 [1-1]      0.5899
    > 
    > # Build a table row-by-row
    > build_event_row(
    +   label = 'Age, years',
    +   col = 'age',
    +   fit = coxph(Surv(time, status) ~ age, data = data_lung)
    + ) %>%
    + build_event_row(
    +   label = 'Sex',
    +   col = 'sex',
    +   fit = coxph(Surv(time, status) ~ sex, data = data_lung)
    + ) %>%
    + build_event_row(
    +   label = 'Institution',
    +   col = 'inst',
    +   fit = coxph(Surv(time, status) ~ inst, data = data_lung)
    + )
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 5 whereas the index has size 10.
    Execution halted
    ```

# utile.tools

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/utile.tools
* URL: https://github.com/efinite/utile.tools
* BugReports: https://github.com/efinite/utile.tools/issues
* Date/Publication: 2019-10-19 17:30:02 UTC
* Number of recursive dependencies: 30

Run `revdep_details(,"utile.tools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Survival data
    > data_lung <- lung %>%
    +   as_tibble() %>%
    +   mutate_at(vars(inst, status, sex), as.factor) %>%
    +   mutate(status = case_when(status == 1 ~ 0, status == 2 ~ 1))
    > 
    > tabulate_model(
    +   fit = coxph(Surv(time, status) ~ sex + meal.cal + inst, data = data_lung)
    +  )
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 5 whereas the index has size 105.
    Execution halted
    ```

# vctrs

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/vctrs
* URL: https://github.com/r-lib/vctrs
* BugReports: https://github.com/r-lib/vctrs/issues
* Date/Publication: 2019-07-05 23:00:04 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"vctrs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vctrs)
      > 
      > test_check("vctrs")
      Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
        namespace 'vctrs' 0.2.0 is already loaded, but >= 0.2.0.9001 is required
      Calls: test_check ... getNamespace -> loadNamespace -> namespaceImport -> loadNamespace
      Execution halted
    ```

# xpose

<details>

* Version: 0.4.5
* Source code: https://github.com/cran/xpose
* URL: https://github.com/UUPharmacometrics/xpose
* BugReports: https://github.com/UUPharmacometrics/xpose/issues
* Date/Publication: 2019-10-07 04:50:03 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"xpose")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      31: stop_lossy_cast(x = x, to = to, result = result, locations = locations, details = details, 
             ..., x_arg = x_arg, to_arg = to_arg, message = message, .subclass = .subclass) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:235
      32: stop_vctrs(message, x = x, y = to, to = to, result = result, x_arg = x_arg, to_arg = to_arg, 
             locations = locations, details = details, ..., .subclass = c(.subclass, "vctrs_error_cast_lossy")) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:259
      33: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpUL25eV/R.INSTALL439506e0d7f/vctrs/R/conditions.R:44
      34: signal_abort(cnd)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 519 | SKIPPED: 6 | WARNINGS: 5 | FAILED: 3 ]
      1. Failure: have proper error check for iteration_plot_function prm_vs_iteration (@test-plots.R#63) 
      2. Failure: have proper error check for iteration_plot_function grd_vs_iteration (@test-plots.R#63) 
      3. Error: read_nm_files handles one file with inappropriate format (@test-read_nm_files.R#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

