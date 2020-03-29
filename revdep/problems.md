# autocogs

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/autocogs
* URL: https://github.com/schloerke/autocogs
* BugReports: https://github.com/schloerke/autocogs/issues
* Date/Publication: 2019-02-12 00:03:28 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"autocogs")` for more info

</details>

## Newly broken

*   checking whether package ‘autocogs’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: `data_frame()` is deprecated as of tibble 1.1.0.
    See ‘/home/rstudio/tibble/revdep/checks/autocogs/new/autocogs.Rcheck/00install.out’ for details.
    ```

## In both

*   checking examples ... ERROR
    ```
    ...
    $remove
    character(0)
    
    attr(,"class")
    [1] "cog_spec"
    [1] FALSE
    > 
    > # set up data
    > p <- ggplot2::qplot(Sepal.Length, Sepal.Width, data = iris, geom = c("point", "smooth"))
    > dt <- tibble::data_frame(panel = list(p))
    Warning: `data_frame()` is deprecated as of tibble 1.1.0.
    Please use `tibble()` instead.
    [90mThis warning is displayed once every 8 hours.[39m
    [90mCall `lifecycle::last_warnings()` to see where this warning was generated.[39m
    > 
    > # compute cognostics like normal
    > add_panel_cogs(dt)
    Error in switch(as.character(layer$stat_params$method), loess = "geom_smooth_loess",  : 
      EXPR must be a length 1 vector
    Calls: add_panel_cogs ... get_layer_info -> layer_info -> layer_info.ggplot -> lapply -> FUN
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 15. [39mmagrittr::freduce(value, `_function_list`)
      [90m 17. [39mfunction_list[[k]](value)
      [90m 18. [39mautocogs:::plot_cogs(.)
      [90m 19. [39mautocogs:::get_layer_info(p, keep = keep_layers, ...) [90mrevdep/checks/autocogs/new/autocogs.Rcheck/00_pkg_src/autocogs/R/plot_cogs.R:21:2[39m
      [90m 21. [39mautocogs:::layer_info.ggplot(p, keep = keep, ...) [90mrevdep/checks/autocogs/new/autocogs.Rcheck/00_pkg_src/autocogs/R/layer_info.R:14:2[39m
      [90m 22. [39mbase::lapply(...) [90mrevdep/checks/autocogs/new/autocogs.Rcheck/00_pkg_src/autocogs/R/layer_info.R:36:2[39m
      [90m 23. [39mautocogs:::FUN(X[[i]], ...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 241 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 2 ]
      1. Failure: ggplot2 layers (@test-layers.R#20) 
      2. Error: ggplot2::geom_smooth (@test-plot_cogs.R#246) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘broom’ ‘diptest’ ‘ggplot2’ ‘hexbin’ ‘moments’
      All declared Imports should be used.
    ```

# basket

<details>

* Version: 0.10.1
* Source code: https://github.com/cran/basket
* URL: https://github.com/kaneplusplus/basket
* BugReports: https://github.com/kaneplusplus/basket/issues
* Date/Publication: 2020-03-11 05:40:02 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"basket")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 12. [39mtibble:::`$<-.tbl_df`(...) [90mrevdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:71:2[39m
      [90m 13. [39mtibble:::tbl_subassign(...)
      [90m 14. [39mtibble:::vectbl_recycle_rhs(...)
      [90m 15. [39mbase::tryCatch(...)
      [90m 16. [39mbase:::tryCatchList(expr, classes, parentenv, handlers)
      [90m 17. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 18. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-mcmc.r#74) 
      2. Error: (unknown) (@test-plot.r#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# beadplexr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/beadplexr
* URL: https://gitlab.com/ustervbo/beadplexr
* BugReports: https://gitlab.com/ustervbo/beadplexr/issues
* Date/Publication: 2020-02-05 17:00:02 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"beadplexr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mbase::`$<-`(`*tmp*`, BeadID, value = c("A", "B"))
      [90m 2. [39mtibble:::`$<-.tbl_df`(`*tmp*`, BeadID, value = c("A", "B"))
      [90m 3. [39mtibble:::tbl_subassign(...)
      [90m 4. [39mtibble:::vectbl_recycle_rhs(...)
      [90m 5. [39mbase::tryCatch(...)
      [90m 6. [39mbase:::tryCatchList(expr, classes, parentenv, handlers)
      [90m 7. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 8. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 398 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: ident_bead_pop() works (@test_identify_assay_analyte.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# callr

<details>

* Version: 3.4.3
* Source code: https://github.com/cran/callr
* URL: https://github.com/r-lib/callr#readme
* BugReports: https://github.com/r-lib/callr/issues
* Date/Publication: 2020-03-28 05:50:17 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"callr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: interrupt (@test-r-session.R#119) [39m [31m──────────────────────────────[39m
      res$error is not an S3 object
      
      [31m──[39m [31m2. Failure: interrupt (@test-r-session.R#119) [39m [31m──────────────────────────────[39m
      res$error inherits from `NULL` not `rlib_error`.
      
      [31m──[39m [31m3. Failure: interrupt (@test-r-session.R#120) [39m [31m──────────────────────────────[39m
      res$error$parent$error is not an S3 object
      
      [31m──[39m [31m4. Failure: interrupt (@test-r-session.R#120) [39m [31m──────────────────────────────[39m
      res$error$parent$error inherits from `NULL` not `interrupt`.
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

# casen

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/casen
* URL: https://pachamaltese.github.io/casen/
* BugReports: https://github.com/pachamaltese/casen/issues
* Date/Publication: 2020-03-20 17:40:02 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"casen")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      downloaded 4.8 MB
      
      trying URL 'https://pachamaltese.github.io/casen/data-rds/1990.rds'
      Content type 'application/octet-stream' length 2890424 bytes (2.8 MB)
      ==================================================
      downloaded 2.8 MB
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 7 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 3 ]
      1. Failure: media_agrupada works properly (@test-descriptive_statistics.R#7) 
      2. Failure: mediana_agrupada works properly (@test-descriptive_statistics.R#14) 
      3. Failure: percentiles_agrupados works properly (@test-descriptive_statistics.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘fs’ ‘janitor’ ‘tibble’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 75 marked UTF-8 strings
    ```

# CGPfunctions

<details>

* Version: 0.5.9
* Source code: https://github.com/cran/CGPfunctions
* URL: https://github.com/ibecav/CGPfunctions
* BugReports: https://github.com/ibecav/CGPfunctions/issues
* Date/Publication: 2020-03-06 18:00:10 UTC
* Number of recursive dependencies: 160

Run `revdep_details(,"CGPfunctions")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CGPfunctions-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: chaid_table
    > ### Title: Produce CHAID results tables from a partykit CHAID model
    > ### Aliases: chaid_table
    > 
    > ### ** Examples
    > 
    > library(CGPfunctions)
    > chaid_table(chaidUS)
    Error: Assigned data `min(unlist(nodeapply(chaidobject, ids = all_nodes, FUN = function(n) n$info)[[i]]))` must be compatible with existing data.
    [34mℹ[39m Error occurred for column `adjustedp`.
    [31m✖[39m Lossy cast from `value` <double> to `x` <logical>.
    ```

# concurve

<details>

* Version: 2.3.0
* Source code: https://github.com/cran/concurve
* URL: https://data.lesslikely.com/concurve/, https://github.com/zadchow/concurve, https://lesslikely.com/
* BugReports: https://github.com/zadchow/concurve/issues
* Date/Publication: 2019-12-04 11:20:03 UTC
* Number of recursive dependencies: 113

Run `revdep_details(,"concurve")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    > ### Name: curve_corr
    > ### Title: Computes Consonance Intervals for Correlations
    > ### Aliases: curve_corr
    > 
    > ### ** Examples
    > 
    > 
    > GroupA <- rnorm(50)
    > GroupB <- rnorm(50)
    > joe <- curve_corr(x = GroupA, y = GroupB, alternative = "two.sided", method = "pearson")
    > tibble::tibble(joe[[1]])
    Error: All columns in a tibble must be vectors.
    [31m✖[39m Column `joe[[1]]` is data.frame.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m└─tibble::tibble(joe[[1]])
    [90m 2. [39m  └─tibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
    [90m 3. [39m    └─tibble:::check_valid_col(res, col_names[[j]], j)
    [90m 4. [39m      └─tibble:::check_valid_cols(set_names(list(x), name))
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘compiler’ ‘rlang’
      All declared Imports should be used.
    ```

# convergEU

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/convergEU
* URL: https://local.disia.unifi.it/stefanini/RESEARCH/coneu/tutorial-conv.html
* Date/Publication: 2020-03-13 11:10:05 UTC
* Number of recursive dependencies: 140

Run `revdep_details(,"convergEU")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + 1990,   998,  1250, 332,
    + 1991,  1600,  1350, 802
    + )
    > 
    > # Country ranking according to the indicator higher is the best:
    > res <- country_ranking(myTB,timeName="years")
    Error: `-ord_MS[, -posizTime]` can't be recycled to size 4.
    [31m✖[39m It must be size 4 or 1, not 3.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─convergEU::country_ranking(myTB, timeName = "years")
    [90m  2. [39m│ ├─base::`[<-`(...) [90m00_pkg_src/convergEU/R/country_ranking.R:94:4[39m
    [90m  3. [39m│ └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/convergEU/R/country_ranking.R:94:4[39m
    [90m  4. [39m│   └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
    [90m  5. [39m│     └─tibble:::vectbl_as_new_col_index(j, x, value, j_arg, value_arg)
    [90m  6. [39m│       └─tibble:::vectbl_recycle_rhs_names(names2(value), length(j), value_arg)
    [90m  7. [39m│         ├─base::unname(vec_recycle(set_names(names), n, x_arg = as_label(value_arg)))
    [90m  8. [39m│         └─vctrs::vec_recycle(set_names(names), n, x_arg = as_label(value_arg))
    [90m  9. [39m└─vctrs:::stop_recycle_incompatible_size(...)
    [90m 10. [39
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1703 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 25 ]
      1. Failure: Check the average value (@test_average_clust.R#19) 
      2. Failure: Check the average value (@test_average_clust.R#19) 
      3. Failure: Check the average value (@test_average_clust.R#19) 
      4. Failure: Check the average value (@test_average_clust.R#19) 
      5. Failure: Check the average value (@test_average_clust.R#19) 
      6. Failure: Check the average value (@test_average_clust.R#19) 
      7. Failure: Check the average value (@test_average_clust.R#19) 
      8. Failure: Check the average value (@test_average_clust.R#19) 
      9. Failure: Check the average value (@test_average_clust.R#19) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘formattable’ ‘gridExtra’ ‘kableExtra’ ‘knitr’ ‘magrittr’
      ‘readr’ ‘readxl’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# cutpointr

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-12-18 15:00:08 UTC
* Number of recursive dependencies: 74

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 379 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 11 ]
      1. Failure: Correct cutpoints with example data (@test-cutpointr.R#239) 
      2. Failure: Correct cutpoints with example data (@test-cutpointr.R#240) 
      3. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#563) 
      4. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#564) 
      5. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#570) 
      6. Failure: Results for constrained metrics are equal to results by OptimalCutpoints (@test-cutpointr.R#571) 
      7. Failure: Main metric gets replaced correctly when ties are broken (@test-cutpointr.R#1023) 
      8. Failure: boot_ci works correctly (@test-cutpointr.R#1378) 
      9. Failure: boot_test works correctly (@test-cutpointr.R#1396) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cvms

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/cvms
* URL: https://github.com/ludvigolsen/cvms
* BugReports: https://github.com/ludvigolsen/cvms/issues
* Date/Publication: 2019-12-01 23:10:02 UTC
* Number of recursive dependencies: 115

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1612 | SKIPPED: 12 | WARNINGS: 2 | FAILED: 12 ]
      1. Error: baseline() throws expected errors (@test_baseline.R#1112) 
      2. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#910) 
      3. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#923) 
      4. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#936) 
      5. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#948) 
      6. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#962) 
      7. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#975) 
      8. Failure: multinomial random predictions work with cross_validate_fn() (@test_cross_validate_fn.R#1448) 
      9. Failure: model_verbose reports the correct model functions in validate() (@test_validate.R#512) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# epikit

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/epikit
* URL: https://github.com/R4EPI/epikit, https://r4epis.netlify.com, https://r4epi.github.io/epikit
* BugReports: https://github.com/R4EPI/epikit/issues
* Date/Publication: 2020-03-05 20:40:02 UTC
* Number of recursive dependencies: 69

Run `revdep_details(,"epikit")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: case_fatality_rate_df will add a total row to stratified analysis[39m
      `iris_res` not equal to `iris_n`.
      Incompatible type for column `Species`: x character, y factor
      
      [31m──[39m [31m2. Failure: case_fatality_rate_df will add a total row to stratified analysis[39m
      `iris_res` not equal to `iris_n`.
      Incompatible type for column `Species`: x character, y factor
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 107 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: case_fatality_rate_df will add a total row to stratified analysis (@test-proportion.R#152) 
      2. Failure: case_fatality_rate_df will add a total row to stratified analysis and merge CI (@test-proportion.R#173) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘epidict’
    ```

# evaluator

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/evaluator
* URL: https://evaluator.tidyrisk.org
* BugReports: https://github.com/davidski/evaluator/issues
* Date/Publication: 2019-07-22 15:00:03 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"evaluator")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    Backtrace:
    [90m    [39m█
    [90m 1. [39m└─evaluator::exposure_histogram(result)
    [90m 2. [39m  ├─ggplot2::ggplot(simulation_result, aes(x = .data$ale)) [90m00_pkg_src/evaluator/R/common_graphs.R:173:2[39m
    [90m 3. [39m  └─ggplot2:::ggplot.default(simulation_result, aes(x = .data$ale))
    [90m 4. [39m    ├─ggplot2::fortify(data, ...)
    [90m 5. [39m    └─ggplot2:::fortify.default(data, ...)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m6. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summar[39m
      [[ ]] improper number of subscripts
      
      # Scenario model: openfair_tef_tc_diff_lm
      ══ testthat results  ═══════════════════════════════════════════════════════════
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

# forestmangr

<details>

* Version: 0.9.1
* Source code: https://github.com/cran/forestmangr
* URL: https://github.com/sollano/forestmangr#readme
* BugReports: https://github.com/sollano/forestmangr/issues
* Date/Publication: 2019-01-02 23:10:27 UTC
* Number of recursive dependencies: 124

Run `revdep_details(,"forestmangr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    2: `.key` is deprecated 
    > 
    > # This can also be done directly using "merge_est" as output:
    > nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
    +           mod_start = tab_coef ,
    +           .groups = "strata", 
    +           output = "merge_est", 
    +           est.name = "dh_est" ) %>% 
    +   mutate(
    +   bias = bias_per(y = dh, yhat = dh_est),
    +   rmse = rmse_per(y = dh, yhat = dh_est) ) %>% 
    +   head(15)
    Error in bias_per(y = dh, yhat = dh_est) : object 'dh_est' not found
    Calls: %>% ... as.data.frame -> mutate -> mutate.tbl_df -> mutate_impl -> bias_per
    In addition: Warning messages:
    1: `.key` is deprecated 
    2: unnest() has a new interface. See ?unnest for details.
    Try `df %>% unnest(c(est_n, data_n))`, with `mutate()` if needed 
    3: unnest() has a new interface. See ?unnest for details.
    Try `df %>% unnest(c(dat, est))`, with `mutate()` if needed 
    Execution halted
    ```

# gratia

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/gratia
* URL: https://gavinsimpson.github.io/gratia
* BugReports: https://github.com/gavinsimpson/gratia/issues
* Date/Publication: 2020-01-19 20:20:03 UTC
* Number of recursive dependencies: 111

Run `revdep_details(,"gratia")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > library("testthat")
      > 
      > ## Runs the tests in tests/testthat
      > test_check("gratia")
      Loading required package: gratia
      list()
      [31m──[39m [31m1. Failure: subsetting works for smooth_samples (@test-subsetting.R#23) [39m [31m────[39m
      Names of `attrs` ('names', 'row.names', 'class', 'seed', 'data_names') don't match 'row.names', 'names', 'class', 'seed', 'data_names'
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 519 | SKIPPED: 77 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: subsetting works for smooth_samples (@test-subsetting.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# heemod

<details>

* Version: 0.11.0
* Source code: https://github.com/cran/heemod
* BugReports: https://github.com/pierucci/heemod/issues
* Date/Publication: 2019-10-22 08:40:05 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"heemod")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > define_dsa(
    +   a, 10, 45,
    +   b, .5, 1.5
    + )
    Error: All columns in a tibble must be vectors.
    [31m✖[39m Column `dots[i]` is lazy_dots.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─heemod::define_dsa(a, 10, 45, b, 0.5, 1.5)
    [90m  2. [39m  └─heemod:::define_dsa_(...) [90m00_pkg_src/heemod/R/sensitivity_define.R:47:2[39m
    [90m  3. [39m    ├─base::suppressWarnings(...) [90m00_pkg_src/heemod/R/sensitivity_define.R:68:4[39m
    [90m  4. [39m    │ └─base::withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
    [90m  5. [39m    ├─dplyr::bind_rows(...) [90m00_pkg_src/heemod/R/sensitivity_define.R:69:6[39m
    [90m  6. [39m    │ ├─dplyr:::flatten_bindable(dots_values(...))
    [90m  7. [39m    │ └─rlang::dots_values(...)
    [90m  8. [39m    ├─stats::setNames(tibble::tibble(dots[i]), names(dots)[i])
    [90m  9. [39m    └─tibble::tibble(dots[i])
    [90m 10. [39m      └─tibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
    [90m 11. [39m        └─tibble:::che
    Execution halted
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

* Version: 0.2.2
* Source code: https://github.com/cran/INDperform
* URL: https://github.com/saskiaotto/INDperform
* BugReports: https://github.com/SaskiaAOtto/INDperform/issues
* Date/Publication: 2020-01-09 12:30:14 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"INDperform")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘INDperform-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: merge_models
    > ### Title: Merging two model output tibbles.
    > ### Aliases: merge_models
    > 
    > ### ** Examples
    > 
    > # Using some models of the Baltic Sea demo data:
    > # Merging GAM and GAMM tibbles
    > test_ids <- 47:50 # choose subset
    > gam_tbl <- model_gam_ex[test_ids,]
    > gamm_tbl <- model_gamm(ind_init_ex[test_ids,], filter= gam_tbl$tac)
    Error in model_gamm(ind_init_ex[test_ids, ], filter = gam_tbl$tac) : 
      No IND~pressure GAMM could be fitted! Check if you chose the correct error distribution (default is gaussian()).
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 2. [39mtibble:::`[<-.tbl_df`(`*tmp*`, 4, "condition", value = "x < 0.3")
      [90m 3. [39mtibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
      [90m 4. [39mtibble:::tbl_subassign_row(xj, i, value, value_arg)
      [90m 5. [39mbase::tryCatch(...)
      [90m 6. [39mbase:::tryCatchList(expr, classes, parentenv, handlers)
      [90m 7. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 8. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 544 | SKIPPED: 0 | WARNINGS: 8 | FAILED: 2 ]
      1. Error: (unknown) (@test_model_gamm.R#4) 
      2. Error: (unknown) (@test_scoring.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        data   3.1Mb
        help   1.6Mb
    ```

# janitor

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/janitor
* URL: https://github.com/sfirke/janitor
* BugReports: https://github.com/sfirke/janitor/issues
* Date/Publication: 2020-01-22 19:20:02 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"janitor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # calculates correctly even with totals column and/or row:
    > mtcars %>%
    +   tabyl(am, cyl) %>%
    +   adorn_totals("row") %>%
    +   adorn_percentages()
    Error: Assigned data `name` must be compatible with existing data.
    [34mℹ[39m Error occurred for column `am`.
    [31m✖[39m No common type for `value` <character> and `x` <double>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─mtcars %>% tabyl(am, cyl) %>% adorn_totals("row") %>% adorn_percentages()
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          └─function_list[[i]](value)
    [90m  8. [39m            └─janitor::adorn_totals(., "row")
    [90m  9. [39m              ├─base::`[<-`(`*tmp*`, 1, 1, value = "Total") [90m00_pkg_src/janitor/R/adorn_totals.R:67:6[39m
    [90m 10. [39m              └─tibble:::`[<-.tbl_df`(`*tmp*`, 1, 1, value = "Total") [90m00_pkg_src
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 519 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 12 ]
      1. Error: grouped_df gets ungrouped and succeeds (@test-add-totals.R#122) 
      2. Error: na.rm value works correctly (@test-add-totals.R#129) 
      3. Error: add_totals respects if input was data.frame (@test-add-totals.R#141) 
      4. Error: add_totals respects if input was data_frame (@test-add-totals.R#148) 
      5. Error: works with non-numeric columns mixed in; fill character specification (@test-add-totals.R#192) 
      6. Error: automatically invokes purrr::map when called on a 3-way tabyl (@test-add-totals.R#251) 
      7. Error: deprecated functions adorn_totals_col and adorn_totals_row function as expected (@test-add-totals.R#283) 
      8. Error: (unknown) (@test-adorn-percentages.R#44) 
      9. Error: non-tabyls are treated correctly (@test-adorn-title.R#49) 
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
* Number of recursive dependencies: 68

Run `revdep_details(,"jstor")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("jstor")
      [31m──[39m [31m1. Failure: authors are correct (@test-books.R#117) [39m [31m────────────────────────[39m
      chap_auth[[5, "authors"]] not identical to `correct_authors`.
      names for current but not for target
      Attributes: < target is NULL, current is list >
      Length mismatch: comparison on first 1 components
      Component 1: Cols in y but not x: `c(NA_character_, NA_character_)`. 
      Component 1: Cols in x but not y: `string_name`, `author_number`, `surname`, `suffix`, `given_name`, `prefix`. 
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 251 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: authors are correct (@test-books.R#117) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# mcp

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/mcp
* URL: http://lindeloev.github.io/mcp/, https://github.com/lindeloev/mcp
* BugReports: https://github.com/lindeloev/mcp/issues
* Date/Publication: 2020-01-09 16:30:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"mcp")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ OK: 1696 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 28 ]
      1. Failure: Good priors: int_1, dnorm(3, 10), -0.5 (@test-runs.R#335) 
      2. Failure: Good priors: int_1, dnorm(3, 10), -0.5 (@test-runs.R#335) 
      3. Failure: Good priors: dunif(-100, -90), dnorm(100, 20) T(100, 110) (@test-runs.R#335) 
      4. Failure: Good priors: dunif(-100, -90), dnorm(100, 20) T(100, 110) (@test-runs.R#335) 
      5. Failure: Good priors: dirichlet(1), dirichlet(1) (@test-runs.R#335) 
      6. Failure: Good priors: dirichlet(1), dirichlet(1) (@test-runs.R#335) 
      7. Failure: Good priors: dirichlet(3), dirichlet(2) (@test-runs.R#335) 
      8. Failure: Good priors: dirichlet(3), dirichlet(2) (@test-runs.R#335) 
      9. Failure: Good y:
          y ~ 1, y ~ 1 ~ 1, rel(1) + (1 | id) ~ rel(1) + x, ~1 (@test-runs.R#277) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘bayesplot’ ‘methods’ ‘purrr’
      All declared Imports should be used.
    ```

# metacoder

<details>

* Version: 0.3.3
* Source code: https://github.com/cran/metacoder
* URL: https://grunwaldlab.github.io/metacoder_documentation/
* BugReports: https://github.com/grunwaldlab/metacoder/issues
* Date/Publication: 2019-07-18 06:35:33 UTC
* Number of recursive dependencies: 147

Run `revdep_details(,"metacoder")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `total_counts` not equal to result$total[1].
      names for current but not for target
      
      [31m──[39m [31m3. Failure: Parsing the UNITE general release fasta (@test--parsers_and_write[39m
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 93 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: Summing counts per taxon (@test--calculations.R#103) 
      2. Failure: Summing counts per taxon (@test--calculations.R#126) 
      3. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.R#119) 
      
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

# micropan

<details>

* Version: 2.0
* Source code: https://github.com/cran/micropan
* Date/Publication: 2020-01-19 18:30:06 UTC
* Number of recursive dependencies: 27

Run `revdep_details(,"micropan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data(xmpl.panmat)
    > 
    > # Estimating binomial mixture models
    > binmix.lst <- binomixEstimate(xmpl.panmat, K.range = 3:8)
    binomixEstimate: Fitting 3 component model...
    Error: Assigned data `lst[[1]]` must be compatible with row subscript `i`.
    [31m✖[39m 1 row must be assigned.
    [31m✖[39m Assigned data has 3 rows.
    [34mℹ[39m Only vectors of size 1 are recycled.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m└─micropan::binomixEstimate(xmpl.panmat, K.range = 3:8)
    [90m 2. [39m  ├─base::`[<-`(...) [90m00_pkg_src/micropan/R/binomix.R:132:4[39m
    [90m 3. [39m  └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/micropan/R/binomix.R:132:4[39m
    [90m 4. [39m    └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
    [90m 5. [39m      └─tibble:::vectbl_recycle_rhs(...)
    [90m 6. [39m        └─base::tryCatch(...)
    [90m 7. [39m          └─base:::tryCatchList(expr, classes, parentenv, handlers)
    [90m 8. [39m            └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
    [90m 9. [39m              └─value[[3L]](cond)
    Execution halted
    ```

# modeltests

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/modeltests
* URL: https://github.com/alexpghayes/modeltests
* BugReports: https://github.com/alexpghayes/modeltests/issues
* Date/Publication: 2020-02-29 12:20:21 UTC
* Number of recursive dependencies: 47

Run `revdep_details(,"modeltests")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 14. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 15. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 257 | SKIPPED: 0 | WARNINGS: 25 | FAILED: 7 ]
      1. Error: add_missing = TRUE (@test-augment_data_helper.R#65) 
      2. Failure: add_missing = FALSE, test_newdata = FALSE (@test-check_augment_data_specification.R#34) 
      3. Failure: add_missing = FALSE, test_newdata = FALSE (@test-check_augment_data_specification.R#45) 
      4. Failure: add_missing = FALSE, test_newdata = TRUE (@test-check_augment_data_specification.R#69) 
      5. Failure: add_missing = FALSE, test_newdata = TRUE (@test-check_augment_data_specification.R#80) 
      6. Failure: add_missing = TRUE, test_newdata = TRUE (@test-check_augment_data_specification.R#104) 
      7. Failure: add_missing = TRUE, test_newdata = TRUE (@test-check_augment_data_specification.R#115) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# poio

<details>

* Version: 0.0-3
* Source code: https://github.com/cran/poio
* URL: https://github.com/RL10N/poio
* BugReports: https://github.com/RL10N/poio/issues
* Date/Publication: 2017-01-29 10:16:13
* Number of recursive dependencies: 88

Run `revdep_details(,"poio")` for more info

</details>

## Newly broken

*   checking whether package ‘poio’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: `data_frame()` is deprecated as of tibble 1.1.0.
    See ‘/home/rstudio/tibble/revdep/checks/poio/new/poio.Rcheck/00install.out’ for details.
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ISOcodes’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# portalr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/portalr
* URL: https://weecology.github.io/portalr/, https://github.com/weecology/portalr
* BugReports: https://github.com/weecology/portalr/issues
* Date/Publication: 2020-01-16 15:00:02 UTC
* Number of recursive dependencies: 103

Run `revdep_details(,"portalr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Failure: data generated by level = 'stake' is same (ant colony_presence_ab[39m
      Value hashes to 2194929e3e, not 4639dbfbf3
      
      [31m──[39m [31m4. Failure: data generated by level = 'plot' is same (ant colony_presence_abs[39m
      Value hashes to 255aef31fb, not 60e9306bfc
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: data generated by default setting is same (shrub_cover) (@test-99-regression.R#166) 
      2. Failure: data generated by default setting is same (ant colony_presence_absence) (@test-99-regression.R#177) 
      3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#195) 
      4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#213) 
      
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
* Number of recursive dependencies: 101

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
* Number of recursive dependencies: 40

Run `revdep_details(,"rematch2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Match first occurrence
    > pos <- re_exec(notables, name_rex)
    > pos
    Error: Input must be a vector, not a `rematch_records` object.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─(function (x, ...) ...
    [90m  2. [39m├─tibble:::print.tbl(x)
    [90m  3. [39m│ ├─cli::cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
    [90m  4. [39m│ │ └─base::paste0(..., collapse = "\n")
    [90m  5. [39m│ ├─base::format(x, ..., n = n, width = width, n_extra = n_extra)
    [90m  6. [39m│ └─tibble:::format.tbl(x, ..., n = n, width = width, n_extra = n_extra)
    [90m  7. [39m│   └─tibble::trunc_mat(x, n = n, width = width, n_extra = n_extra)
    [90m  8. [39m│     ├─base::as.data.frame(head(x, n))
    [90m  9. [39m│     ├─utils::head(x, n)
    [90m 10. [39m│     └─utils:::head.data.frame(x, n)
    [90m 11. [39m│       ├─x[seq_len(n), , drop = FALSE]
    [90m 12. [39m│       └─tibble:::`[.tbl_df`(x, seq_len(n), , drop = FALSE)
    [90m 13. [39m│         └─tibble:::tbl_subset_row(xo, i = i, i_arg)
    [90
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      + }
      Loading required package: testthat
      [31m──[39m [31m1. Error: corner cases (@test-exec-all.R#46) [39m [31m───────────────────────────────[39m
      `x` must be a vector, not a `rematch_allrecords` object.
      [1mBacktrace:[22m
      [90m  1. [39mrematch2::re_exec_all(.text <- character(), "")
      [90m 11. [39mvctrs:::stop_scalar_type(...)
      [90m 12. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: corner cases (@test-exec-all.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# RmarineHeatWaves

<details>

* Version: 0.17.0
* Source code: https://github.com/cran/RmarineHeatWaves
* URL: https://github.com/ajsmit/RmarineHeatWaves
* Date/Publication: 2018-06-04 17:43:40 UTC
* Number of recursive dependencies: 71

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
    Error: Assigned data `zoo::na.approx(tDat[59:61, no_NA], maxgap = 1, na.rm = TRUE)` must be compatible with existing data.
    [34mℹ[39m Error occurred for column `doy`.
    [31m✖[39m Can't cast <double[,31]> to <double>.
    Can not decrease dimensions.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m└─RmarineHeatWaves::detect(...)
    [90m 2. [39m  ├─base::`[<-`(...) [90m00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4[39m
    [90m 3. [39m  └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4[39m
    [90m 4. [39m    └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
    [90m 5. [39m      └─tibble:::tbl_subassign_row(xj, i, value, value_arg)
    [90m 6. [39m        └─base::tryCatch(...)
    [90m 7. [39m          └─base:::tryCatchList(expr, classes, parentenv, handlers)
    [90m 8. [39m            └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
    [90m 9. [39m              └─value[[3L]](cond)
    Execution halted
    ```

# rsample

<details>

* Version: 0.0.5
* Source code: https://github.com/cran/rsample
* URL: https://tidymodels.github.io/rsample
* BugReports: https://github.com/tidymodels/rsample/issues
* Date/Publication: 2019-07-12 22:20:11 UTC
* Number of recursive dependencies: 89

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

* Version: 3.0.1
* Source code: https://github.com/cran/RSDA
* URL: http://www.oldemarrodriguez.com
* Date/Publication: 2020-01-21 07:50:31 UTC
* Number of recursive dependencies: 125

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
      object 'warningc' not found
    Calls: <Anonymous> ... head.data.frame -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

# rubias

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/rubias
* Date/Publication: 2019-06-10 15:00:03 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"rubias")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [1] "/tmp/Rtmp0zzaNs/mixfile"
    > 
    > # note that in practice you will probably want to specify
    > # your own directory...
    > 
    > # run the function
    > write_gsi_sim_mixture(chinook_mix, 5, prefix)
    Error: Assigned data `0` must be compatible with existing data.
    [34mℹ[39m Error occurred for column `repunit`.
    [31m✖[39m No common type for `value` <double> and `x` <character>.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m└─rubias::write_gsi_sim_mixture(chinook_mix, 5, prefix)
    [90m 2. [39m  ├─base::`[<-`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m 3. [39m  └─tibble:::`[<-.tbl_df`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m 4. [39m    └─tibble:::tbl_subassign_matrix(x, j, value, j_arg, substitute(value))
    [90m 5. [39m      └─base::tryCatch(...)
    [90m 6. [39m        └─base:::tryCatchList(expr, classes, parentenv, handlers)
    [90m 7. [39m          └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
    [90m 8. [39m            └─value[[3L]](cond)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        libs   9.2Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# SanzCircos

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/SanzCircos
* Date/Publication: 2018-05-04 10:52:54 UTC
* Number of recursive dependencies: 42

Run `revdep_details(,"SanzCircos")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    Warning: `as.tibble()` is deprecated as of tibble 2.0.0.
    Please use `as_tibble()` instead.
    The signature and semantics have changed, see `?as_tibble`.
    [90mThis warning is displayed once every 8 hours.[39m
    [90mCall `lifecycle::last_warnings()` to see where this warning was generated.[39m
    Error: Assigned data `as.character(df[[chromosome_grouping]][i])` must be compatible with existing data.
    [34mℹ[39m Error occurred for column `V2`.
    [31m✖[39m Lossy cast from `value` <character> to `x` <logical>.
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘tidyr’
      All declared Imports should be used.
    ```

# simrel

<details>

* Version: 2.0
* Source code: https://github.com/cran/simrel
* URL: https://simulatr.github.io/simrel/
* BugReports: https://github.com/simulatr/simrel/issues
* Date/Publication: 2019-04-01 18:00:09 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"simrel")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("simrel")
      [31m──[39m [31m1. Error: Prepare Design (@test-utils.R#44) [39m [31m────────────────────────────────[39m
      Can't join on 'q' x 'q' because of incompatible types (list / list)
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_identical(prepare_design(opts), dgn)
      [90m 3. [39mtestthat:::compare.default(act$val, exp$val)
      [90m 5. [39mdplyr:::all.equal.tbl_df(x, y, ...)
      [90m 6. [39mdplyr:::equal_data_frame(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 169 | SKIPPED: 21 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: Prepare Design (@test-utils.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# textrecipes

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/textrecipes
* URL: https://github.com/tidymodels/textrecipes
* BugReports: https://github.com/tidymodels/textrecipes/issues
* Date/Publication: 2020-03-05 05:40:02 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"textrecipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [90mCall `lifecycle::last_warnings()` to see where this warning was generated.[39m
    >   
    > obj <- rec %>%
    +   prep(training = sample_data)
    Error: Names must not be empty.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─rec %>% prep(training = sample_data)
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m│         └─function_list[[k]](value)
    [90m  9. [39m│           ├─recipes::prep(., training = sample_data)
    [90m 10. [39m│           └─recipes:::prep.recipe(., training = sample_data)
    [90m 11. [39m│             ├─recipes::bake(x$steps[[i]], new_data = training)
    [90m 12. [39m│             └─textrecipes:::bake.step_word_embeddings(x$steps[[i]], new_data = training)
    [90m 13. [39m│               └─p
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Error: (unknown) (@test-embeddings.R#99) [39m [31m────────────────────────────────[39m
      Names must not be empty.
      [1mBacktrace:[22m
      [90m  1. [39mrec %>% prep(training = test_data, retain = TRUE)
      [90m 29. [39mvctrs:::validate_unique(names = names)
      [90m 30. [39mvctrs:::stop_names_cannot_be_empty(empty_names)
      [90m 31. [39mvctrs:::stop_names(...)
      [90m 32. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 72 | SKIPPED: 9 | WARNINGS: 5 | FAILED: 1 ]
      1. Error: (unknown) (@test-embeddings.R#99) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidytransit

<details>

* Version: 0.7.0
* Source code: https://github.com/cran/tidytransit
* URL: https://github.com/r-transit/tidytransit
* BugReports: https://github.com/r-transit/tidytransit
* Date/Publication: 2020-03-15 17:30:02 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"tidytransit")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mbase::`[<-`(...)
      [90m 2. [39mtibble:::`[<-.tbl_df`(...)
      [90m 3. [39mtibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
      [90m 4. [39mtibble:::vectbl_recycle_rhs(...)
      [90m 5. [39mbase::tryCatch(...)
      [90m 6. [39mbase:::tryCatchList(expr, classes, parentenv, handlers)
      [90m 7. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 8. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 106 | SKIPPED: 9 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: travel_times from stop with departures from transfer stops (@test-raptor.R#210) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        doc       1.3Mb
        extdata   4.4Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 62 marked UTF-8 strings
    ```

# tidytree

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/tidytree
* URL: https://yulab-smu.github.io/treedata-book/
* BugReports: https://github.com/YuLab-SMU/tidytree/issues
* Date/Publication: 2020-03-12 06:30:02 UTC
* Number of recursive dependencies: 72

Run `revdep_details(,"tidytree")` for more info

</details>

## Newly broken

*   checking whether package ‘tidytree’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: `data_frame()` is deprecated as of tibble 1.1.0.
    See ‘/home/rstudio/tibble/revdep/checks/tidytree/new/tidytree.Rcheck/00install.out’ for details.
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: 'ggtree', 'treeio'
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# viafr

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/viafr
* URL: https://github.com/stefanieschneider/viafr
* BugReports: https://github.com/stefanieschneider/viafr/issues
* Date/Publication: 2019-07-01 11:40:03 UTC
* Number of recursive dependencies: 55

Run `revdep_details(,"viafr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 35. [39mdplyr:::tbl_if_syms(.tbl, .predicate, .env, .include_group_vars = .include_group_vars)
      [90m 39. [39mdplyr:::tbl_if_vars(.tbl, .p, .env, ..., .include_group_vars = .include_group_vars)
      [90m 41. [39mtibble:::`[[.tbl_df`(.tbl, tibble_vars[[i]])
      [90m 42. [39mtibble:::tbl_subset2(x, j = i, j_arg = substitute(i))
      [90m 43. [39mtibble:::vectbl_as_col_location2(...)
      [90m 50. [39mvctrs::vec_as_location2(i, n, names, arg = as_label(j_arg))
      [90m 51. [39mvctrs:::result_get(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 36 | SKIPPED: 0 | WARNINGS: 31 | FAILED: 2 ]
      1. Error: query list (@test_search.R#4) 
      2. Error: valid query (@test_search.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# vip

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/vip
* URL: https://github.com/koalaverse/vip/
* BugReports: https://github.com/koalaverse/vip/issues
* Date/Publication: 2020-01-20 19:20:02 UTC
* Number of recursive dependencies: 182

Run `revdep_details(,"vip")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
       call| expect_identical(current = vis_rss[seq_len(nrow(vis_earth)), 
       call| ]$Importance, target = unname(vis_earth[, "rss", drop = TRUE]))
       diff| names for current but not for target
      ----- FAILED[data]: test_pkg_earth.R<32--35>
       call| expect_identical(current = vis_gcv[seq_len(nrow(vis_earth)), 
       call| ]$Importance, target = unname(vis_earth[, "gcv", drop = TRUE]))
       diff| names for current but not for target
      ----- FAILED[data]: test_pkg_glmnet.R<36--39>
       call| expect_identical(current = vis1$Importance, target = coef(fit1, 
       call| s = min(fit1$lambda))[-1L])
       diff| names for current but not for target
      ----- FAILED[data]: test_pkg_glmnet.R<40--43>
       call| expect_identical(current = vis2$Importance, t
      In addition: There were 50 or more warnings (use warnings() to see the first 50)
      Execution halted
    ```

