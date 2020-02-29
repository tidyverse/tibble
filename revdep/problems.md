# amt

<details>

* Version: 0.0.7
* Source code: https://github.com/cran/amt
* URL: https://github.com/jmsigner/amt
* Date/Publication: 2019-09-19 10:20:02 UTC
* Number of recursive dependencies: 173

Run `revdep_details(,"amt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > data(amt_fisher)
    > # Add the month
    > amt_fisher %>% mutate(yday = lubridate::yday(t_)) %>%
    + summarize_sampling_rate_many(c("id", "yday"))
    Error: No common type for `..1$ts$min` <table> and `..2$ts$min` <table>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─`%>%`(...)
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m│         └─function_list[[k]](value)
    [90m  9. [39m│           ├─amt::summarize_sampling_rate_many(., c("id", "yday"))
    [90m 10. [39m│           └─amt:::summarize_sampling_rate_many.track_xyt(., c("id", "yday")) [90m00_pkg_src/amt/R/eda_sampling_rate.R:94:2[39m
    [90m 11. [39m│             └─`%>%`(...) [90m00_pkg_src/amt/R/eda_sampling_rate.R:108:2[39m
    [90m 12. [39m│               ├─ba
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘magrittr’
      All declared Imports should be used.
    ```

# basket

<details>

* Version: 0.9.10
* Source code: https://github.com/cran/basket
* URL: https://github.com/kaneplusplus/basket
* BugReports: https://github.com/kaneplusplus/basket/issues
* Date/Publication: 2019-10-23 07:40:02 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"basket")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  7. [39mbase::lapply(ps, function(pt) plot_density(x[[pt]])) [90mrevdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:50:2[39m
      [90m  8. [39mbasket:::FUN(X[[i]], ...)
      [90m 10. [39mbasket:::plot_density.mem(x[[pt]]) [90mrevdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:31:2[39m
      [90m 12. [39mtibble:::`$<-.tbl_df`(...) [90mrevdep/checks/basket/new/basket.Rcheck/00_pkg_src/basket/R/plot.r:68:2[39m
      [90m 13. [39mtibble:::tbl_subassign(x, i = NULL, as_string(name), list(value))
      [90m 14. [39mtibble:::tbl_subassign_col(x, j, value)
      [90m 15. [39mtibble:::vectbl_recycle_rows(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-mcmc.r#35) 
      2. Error: (unknown) (@test-plot.r#12) 
      
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
* Number of recursive dependencies: 127

Run `revdep_details(,"beadplexr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * Size 5126: Existing data
      * Size 2: Column `BeadID`
      [1mBacktrace:[22m
      [90m 1. [39mbase::`$<-`(`*tmp*`, BeadID, value = c("A", "B"))
      [90m 2. [39mtibble:::`$<-.tbl_df`(`*tmp*`, BeadID, value = c("A", "B"))
      [90m 3. [39mtibble:::tbl_subassign(x, i = NULL, as_string(name), list(value))
      [90m 4. [39mtibble:::tbl_subassign_col(x, j, value)
      [90m 5. [39mtibble:::vectbl_recycle_rows(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 398 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: ident_bead_pop() works (@test_identify_assay_analyte.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# breathtestcore

<details>

* Version: 0.4.6
* Source code: https://github.com/cran/breathtestcore
* URL: https://github.com/dmenne/breathtestcore
* BugReports: https://github.com/dmenne/breathtestcore/issues
* Date/Publication: 2018-12-18 09:10:03 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"breathtestcore")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      `i` must have one dimension, not 2.
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_lt(rel_diff(d, cf, "m"), 0.02)
      [90m 4. [39mbreathtestcore:::rel_diff(d, cf, "m")
      [90m 6. [39mtibble:::`[.tbl_df`(cf, cf["parameter"] == parameter, "value")
      [90m 7. [39mtibble:::tbl_subset_row(xo, i = i)
      [90m 8. [39mtibble:::vectbl_as_row_index(i, x)
      [90m 9. [39mvctrs::vec_as_location(i, nr)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 356 | SKIPPED: 5 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Single record give valid result after passing through cleanup_data (@test_nls_fit.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# comperank

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/comperank
* URL: https://github.com/echasnovski/comperank
* BugReports: https://github.com/echasnovski/comperank/issues
* Date/Publication: 2018-05-30 08:27:55 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"comperank")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "ranking_od": names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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

# concurve

<details>

* Version: 2.3.0
* Source code: https://github.com/cran/concurve
* URL: https://data.lesslikely.com/concurve/, https://github.com/zadchow/concurve, https://lesslikely.com/
* BugReports: https://github.com/zadchow/concurve/issues
* Date/Publication: 2019-12-04 11:20:03 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"concurve")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘concurve-Ex.R’ failed
    The error most likely occurred in:
    
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
    Error: All columns in a tibble must be vectors:
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘compiler’ ‘rlang’
      All declared Imports should be used.
    ```

# corrr

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/corrr
* URL: https://github.com/tidymodels/corrr
* BugReports: https://github.com/tidymodels/corrr/issues
* Date/Publication: 2020-02-10 21:50:13 UTC
* Number of recursive dependencies: 108

Run `revdep_details(,"corrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;250m3[39m vs       0.664 -[31m0[39m[31m.[39m[31m811[39m -[31m0[39m[31m.[39m[31m710[39m -[31m0[39m[31m.[39m[31m723[39m -[31m0[39m[31m.[39m[31m555[39m
    [38;5;250m4[39m am       0.600 -[31m0[39m[31m.[39m[31m523[39m -[31m0[39m[31m.[39m[31m591[39m -[31m0[39m[31m.[39m[31m243[39m -[31m0[39m[31m.[39m[31m692[39m
    [38;5;250m5[39m gear     0.480 -[31m0[39m[31m.[39m[31m493[39m -[31m0[39m[31m.[39m[31m556[39m -[31m0[39m[31m.[39m[31m126[39m -[31m0[39m[31m.[39m[31m583[39m
    [38;5;250m6[39m carb    -[31m0[39m[31m.[39m[31m551[39m  0.527  0.395  0.750  0.428
    > x %>% focus_if(any_greater_than, .6, mirror = TRUE) %>% network_plot()
    Error: `j` must be a logical vector.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─x %>% focus_if(any_greater_than, 0.6, mirror = TRUE) %>% network_plot()
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            ├─corrr::network_plot(.)
    [90m 10. [39m            └─corrr:::network_plot.cor_df(.) [90m00_pkg_src/corrr/R/output.R:134:2[39m
    [90m 11. [39m              ├─corrr::as_matrix(rdf, diagonal = 1) [90m00_pkg_src/corrr/R/cor_df.R:188:2[39m
    [90m 12. [39m              └─corrr:::as_matrix.cor_df(rdf, diagonal = 1) [90m00_pkg_sr
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 10. [39mtibble:::tbl_subset_row(xo, i = i)
      [90m 11. [39mtibble:::vectbl_as_row_index(i, x)
      [90m 12. [39mvctrs::vec_as_location(i, nr)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 76 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: Diagonal sets correctly (@test-as_matrix.R#23) 
      2. Error: Network plot works (@test-plots.R#8) 
      3. Error: Rearrange return correct order (@test-rearrange.R#8) 
      4. Failure: Converts to proper structure (@test-rearrange.R#19) 
      5. Failure: Converts to proper structure (@test-stretch.R#12) 
      6. Error: retract works (@test-stretch.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cutpointr

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-12-18 15:00:08 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
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

* Version: 0.3.2
* Source code: https://github.com/cran/cvms
* URL: https://github.com/ludvigolsen/cvms
* BugReports: https://github.com/ludvigolsen/cvms/issues
* Date/Publication: 2019-12-01 23:10:02 UTC
* Number of recursive dependencies: 113

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 1617 | SKIPPED: 12 | WARNINGS: 2 | FAILED: 11 ]
      1. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#910) 
      2. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#923) 
      3. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#936) 
      4. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#948) 
      5. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#962) 
      6. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#975) 
      7. Failure: multinomial random predictions work with cross_validate_fn() (@test_cross_validate_fn.R#1448) 
      8. Failure: model_verbose reports the correct model functions in validate() (@test_validate.R#512) 
      9. Failure: model_verbose reports the correct model functions in validate() (@test_validate.R#523) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# diffdf

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/diffdf
* URL: https://github.com/gowerc/diffdf
* BugReports: https://github.com/gowerc/diffdf/issues
* Date/Publication: 2019-03-12 12:16:21 UTC
* Number of recursive dependencies: 103

Run `revdep_details(,"diffdf")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
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

# dmdScheme

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/dmdScheme
* URL: https://exp-micro-ecol-hub.github.io/dmdScheme/, https://github.com/Exp-Micro-Ecol-Hub/dmdScheme
* BugReports: https://github.com/rkrug/dmdScheme/issues
* Date/Publication: 2020-01-10 17:20:03 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"dmdScheme")` for more info

</details>

## Newly broken

*   checking whether package ‘dmdScheme’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/tibble/revdep/checks/dmdScheme/new/dmdScheme.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dmdScheme’ ...
** package ‘dmdScheme’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location

#############################################
The cache will be in a temporary location and be deleted when you quit R.
It is located at
   /tmp/RtmpQ6XBTS/dmdScheme_25e861a01e82
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/RtmpQ6XBTS/file25e829afa8b7/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Error: package or namespace load failed for ‘dmdScheme’:
 .onAttach failed in attachNamespace() for 'dmdScheme', details:
  call: NULL
  error: No common type for `..1$microcosmVolume` <double> and `..2$microcosmVolume` <character>.
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/home/rstudio/tibble/revdep/checks/dmdScheme/new/dmdScheme.Rcheck/dmdScheme’

```
### CRAN

```
* installing *source* package ‘dmdScheme’ ...
** package ‘dmdScheme’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location

#############################################
The cache will be in a temporary location and be deleted when you quit R.
It is located at
   /tmp/Rtmp8eQ1aN/dmdScheme_1f0034491fb6
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/Rtmp8eQ1aN/file1f007f57244e/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Theme switched to dmdScheme_0.9.5
** testing if installed package can be loaded from final location

#############################################
The cache will be in a temporary location and be deleted when you quit R.
It is located at
   /tmp/Rtmpb4mNQW/dmdScheme_1fe373b33168
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/Rtmpb4mNQW/file1fe3655792f2/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Theme switched to dmdScheme_0.9.5
** testing if installed package keeps a record of temporary installation path
* DONE (dmdScheme)

```
# drake

<details>

* Version: 7.10.0
* Source code: https://github.com/cran/drake
* URL: https://github.com/ropensci/drake, https://docs.ropensci.org/drake, https://books.ropensci.org/drake/
* BugReports: https://github.com/ropensci/drake/issues
* Date/Publication: 2020-02-01 18:40:02 UTC
* Number of recursive dependencies: 146

Run `revdep_details(,"drake")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: basic history (@test-4-history.R#90) [39m [31m──────────────────────────────[39m
      out2$current[out2$target == "small"] not equal to FALSE.
      names for target but not for current
      
      [31m──[39m [31m2. Failure: basic history (@test-4-history.R#99) [39m [31m──────────────────────────────[39m
      is.na(out$hash) not equal to !out$current.
      names for current but not for target
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 3805 | SKIPPED: 430 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: basic history (@test-4-history.R#90) 
      2. Failure: basic history (@test-4-history.R#99) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# egor

<details>

* Version: 0.20.01
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2020-01-27 15:30:08 UTC
* Number of recursive dependencies: 74

Run `revdep_details(,"egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustered_graphs
    > ### Title: Cluster ego-centered networks by a grouping factor
    > ### Aliases: clustered_graphs clustered_graphs.list clustered_graphs.egor
    > ###   clustered_graphs.data.frame
    > ### Keywords: analysis ego-centered network
    > 
    > ### ** Examples
    > 
    > data("egor32")
    > 
    > # Simplify networks to clustered graphs, stored as igraph objects
    > graphs <- clustered_graphs(egor32, "country") 
    Error: `i` must have one dimension, not 2.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      EI-Index: sex
      EI-Index: int_var
      EI-Index: female
      EI-Index: female
      Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: Filtering out empty alter entries using provided network size values: ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 109 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 6 ]
      1. Failure: Methods are working. (@test_clustered_graphs.R#9) 
      2. Failure: Methods are working with partially missing data. (@test_clustered_graphs.R#23) 
      3. Failure: Methods work (properly) with NAs in grouping variable. (@test_clustered_graphs.R#35) 
      4. Error: Methods work (properly) with NAs in grouping variable. (@test_clustered_graphs.R#38) 
      5. Failure: Methods work (properly) with grouping variable being completly NA. (@test_clustered_graphs.R#52) 
      6. Error: Methods work (properly) with grouping variable being completly NA. (@test_clustered_graphs.R#55) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# eph

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/eph
* URL: https://github.com/holatam/eph
* BugReports: https://github.com/rindec/eph/issues
* Date/Publication: 2019-11-26 22:40:02 UTC
* Number of recursive dependencies: 121

Run `revdep_details(,"eph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      binding character and factor vector, coercing into character vector
    Warning in bind_rows_(x, .id) :
      binding character and factor vector, coercing into character vector
    > bases_clasif <- organize_ocupations(base = bases)
    Error: No common type for `..1$value` <character> and `..2$value` <double>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─eph::organize_ocupations(base = bases)
    [90m  2. [39m│ └─`%>%`(...) [90m00_pkg_src/eph/R/organize_ocupations.R:21:2[39m
    [90m  3. [39m│   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m│       └─eph:::`_fseq`(`_lhs`)
    [90m  7. [39m│         └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m│           ├─base::withVisible(function_list[[k]](value))
    [90m  9. [39m│           └─function_list[[k]](value)
    [90m 10. [39m│             └─dplyr::add_row(., value = 99, CATEGORIA = "Ns.Nc")
    [90m 11. [39m│               └─tibble:::rbind_at(.data, df, pos)
    [90m 12. [39m│                 └─vctrs::vec_rbind(old, new)
    [90m 13. [3
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘readr’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 114 marked UTF-8 strings
    ```

# evaluator

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/evaluator
* URL: https://evaluator.tidyrisk.org
* BugReports: https://github.com/davidski/evaluator/issues
* Date/Publication: 2019-07-22 15:00:03 UTC
* Number of recursive dependencies: 135

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
      [31m──[39m [31m6. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summarize[39m
      [[ ]] improper number of subscripts
      
      # Scenario model: openfair_tef_tc_diff_lm
      ══ testthat results  ══════════════════════════════════════════════════════════════
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

# fabletools

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/fabletools
* URL: http://fabletools.tidyverts.org/
* BugReports: https://github.com/tidyverts/fabletools/issues
* Date/Publication: 2020-01-29 09:00:02 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"fabletools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Error: `x` must be a vector, not a `fcdist` object.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─fit %>% forecast(h = "5 years")
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m│         └─function_list[[k]](value)
    [90m  9. [39m│           ├─fabletools::forecast(., h = "5 years")
    [90m 10. [39m│           └─fabletools:::forecast.mdl_df(., h = "5 years") [90m00_pkg_src/fabletools/R/forecast.R:21:2[39m
    [90m 11. [39m│             └─dplyr::mutate_at(...) [90m00_pkg_src/fabletools/R/forecast.R:93:2[39m
    [90m 12. [39m│               ├─dplyr::mutate(.tbl, !!!funs)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m     [39m█
      [90m  1. [39m├─testthat::test_check("fabletools")
      [90m  2. [39m│ └─testthat:::test_package_dir(...)
      [90m  3. [39m│   └─testthat::test_dir(...)
      [90m  4. [39m│     └─testthat::source_test_setup(path, env)
      [90m  5. [39m│       └─testthat::source_dir(path, "^setup.*\\.[rR]$", env = env, wrap = FALSE)
      [90m  6. [39m│         └─base::lapply(files, source_file, env = env, chdir = chdir, wrap = wrap)
      [90m  7. [39m│           └─testthat:::FUN(X[[i]], ...)
      [90m  8. [39m│             └─base::eval(exprs, env)
      [90m  9. [39m│               └─base::eval(exprs, env)
      [90m 10. [39m│                 └─mbl %>% forecast(h = 12) [90msetup-data.R:14:0[39m
      [90m 11. [39m│                   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      [90m 12. [39m│                   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      [90m 13
      Execution halted
    ```

# foieGras

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/foieGras
* URL: https://cran.r-project.org/package=foieGras
* BugReports: https://github.com/ianjonsen/foieGras/issues
* Date/Publication: 2019-10-07 22:10:03 UTC
* Number of recursive dependencies: 100

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
      [31m──[39m [31m1. Failure: plot completes silently (@test-osar.R#22) [39m [31m─────────────────────────[39m
      `plot(r, "hist")` produced warnings.
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 37 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: plot completes silently (@test-osar.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 43.4Mb
      sub-directories of 1Mb or more:
        libs  42.1Mb
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

# ggplot2

<details>

* Version: 3.2.1
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Date/Publication: 2019-08-10 22:30:13 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"ggplot2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(ggplot2)
      > 
      > test_check("ggplot2")
      [31m──[39m [31m1. Failure: as_facets_list() coerces lists (@test-facet-.r#40) [39m [31m────────────────[39m
      `out` not identical to `exp`.
      Component 3: Attributes: < Component "class": Lengths (2, 1) differ (string compare on first 1) >
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 1097 | SKIPPED: 105 | WARNINGS: 1 | FAILED: 1 ]
      1. Failure: as_facets_list() coerces lists (@test-facet-.r#40) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        R     1.7Mb
        doc   3.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘mgcv’ ‘reshape2’ ‘viridisLite’
      All declared Imports should be used.
    ```

# googlesheets4

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/googlesheets4
* URL: https://github.com/tidyverse/googlesheets4
* BugReports: https://github.com/tidyverse/googlesheets4/issues
* Date/Publication: 2019-11-04 21:50:02 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"googlesheets4")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 15. [39mvctrs::vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 16. [39mvctrs::stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 17. [39mvctrs:::stop_incompatible(...)
      [90m 18. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 187 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: can shim a single side (@test-utils-sheet-geometry.R#38) 
      2. Error: can shim two opposing sides (@test-utils-sheet-geometry.R#49) 
      3. Error: can shim on two perpendicular sides (@test-utils-sheet-geometry.R#56) 
      4. Error: can shim three sides (@test-utils-sheet-geometry.R#67) 
      5. Error: can shim four sides (@test-utils-sheet-geometry.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gratia

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/gratia
* URL: https://gavinsimpson.github.io/gratia
* BugReports: https://github.com/gavinsimpson/gratia/issues
* Date/Publication: 2020-01-19 20:20:03 UTC
* Number of recursive dependencies: 108

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
      [31m──[39m [31m1. Failure: subsetting works for smooth_samples (@test-subsetting.R#23) [39m [31m───────[39m
      Names of `attrs` ('names', 'row.names', 'class', 'seed', 'data_names') don't match 'row.names', 'names', 'class', 'seed', 'data_names'
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 519 | SKIPPED: 77 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: subsetting works for smooth_samples (@test-subsetting.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# haven

<details>

* Version: 2.2.0
* Source code: https://github.com/cran/haven
* URL: http://haven.tidyverse.org, https://github.com/tidyverse/haven, https://github.com/WizardMac/ReadStat
* BugReports: https://github.com/tidyverse/haven/issues
* Date/Publication: 2019-11-08 06:20:22 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"haven")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'read_dta.Rd':
      ‘name-repair’
    
    Missing link or links in documentation object 'read_sas.Rd':
      ‘name-repair’
    
    Missing link or links in documentation object 'read_spss.Rd':
      ‘name-repair’
    
    Missing link or links in documentation object 'read_xpt.Rd':
      ‘name-repair’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        libs   5.5Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# healthcareai

<details>

* Version: 2.4.0
* Source code: https://github.com/cran/healthcareai
* URL: http://docs.healthcare.ai
* BugReports: https://github.com/HealthCatalyst/healthcareai-r/issues
* Date/Publication: 2020-02-28 18:00:05 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"healthcareai")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: evaluate evaluate.predicted_df evaluate.model_list
    > 
    > ### ** Examples
    > 
    > models <- machine_learn(pima_diabetes[1:40, ],
    +                        patient_id,
    +                        outcome = diabetes,
    +                        models = c("XGB", "RF"),
    +                        tune = FALSE,
    +                        n_folds = 3)
    Training new data prep recipe...
    
    Variable(s) ignored in prep_data won't be used to tune models: patient_id
    
    diabetes looks categorical, so training classification algorithms.
    
    After data processing, models are being trained on 12 features with 40 observations.
    Based on n_folds = 3 and hyperparameter settings, the following number of models will be trained: 3 xgb's and 3 rf's 
    
    Training at fixed values: eXtreme Gradient Boosting
    Training at fixed values: Random Forest
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat-5.R’ failed.
    Last 13 lines of output:
      healthcareai version 2.4.0
      Please visit https://docs.healthcare.ai for full documentation and vignettes. Join the community at https://healthcare-ai.slack.com
      [31m──[39m [31m1. Error: the fundamentals work (@test-cran_only.R#4) [39m [31m─────────────────────────[39m
      `goal` must be a vector, not a primitive function.
      [1mBacktrace:[22m
      [90m  1. [39mhealthcareai::machine_learn(...)
      [90m 25. [39mvctrs:::stop_scalar_type(...)
      [90m 26. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: the fundamentals work (@test-cran_only.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

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
    Error: All columns in a tibble must be vectors:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 85

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
      [1mBacktrace:[22m
      [90m  1. [39mbase::`[<-`(`*tmp*`, 4, "condition", value = "x < 0.3")
      [90m  8. [39mvctrs:::vec_ptype2.character.default(...)
      [90m  9. [39mvctrs::vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 10. [39mvctrs::stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 11. [39mvctrs:::stop_incompatible(...)
      [90m 12. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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

# ipmisc

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/ipmisc
* URL: https://indrajeetpatil.github.io/ipmisc/, https://github.com/IndrajeetPatil/ipmisc
* BugReports: https://github.com/IndrajeetPatil/ipmisc/issues
* Date/Publication: 2020-02-09 12:50:02 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"ipmisc")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      names for target but not for current
      
      [31m──[39m [31m4. Failure: bartlett_message is working (@test-helper_messages.R#115) [39m [31m─────────[39m
      df$statistic not equal to 7.951755.
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 45 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: normality_message is working (@test-helper_messages.R#23) 
      2. Failure: bartlett_message is working (@test-helper_messages.R#59) 
      3. Failure: bartlett_message is working (@test-helper_messages.R#86) 
      4. Failure: bartlett_message is working (@test-helper_messages.R#115) 
      
      Error: testthat unit tests failed
      Execution halted
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
    > 
    > # calculates correctly even with totals column and/or row:
    > mtcars %>%
    +   tabyl(am, cyl) %>%
    +   adorn_totals("row") %>%
    +   adorn_percentages()
    Error: No common type for `value` <character> and `x` <double>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─mtcars %>% tabyl(am, cyl) %>% adorn_totals("row") %>% adorn_percentages()
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         └─function_list[[i]](value)
    [90m  8. [39m│           └─janitor::adorn_totals(., "row")
    [90m  9. [39m│             ├─base::`[<-`(`*tmp*`, 1, 1, value = "Total") [90m00_pkg_src/janitor/R/adorn_totals.R:67:6[39m
    [90m 10. [39m│             └─tibble:::`[<-.tbl_df`(`*tmp*`, 1, 1, value = "Total") [90m00_pkg_src/janitor/R/adorn_totals.R:67:6[39m
    [90m 11. [39m│               └─tibble:::tbl_subassign(x, i
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Failure: authors are correct (@test-books.R#117) [39m [31m───────────────────────────[39m
      chap_auth[[5, "authors"]] not identical to `correct_authors`.
      names for current but not for target
      Attributes: < target is NULL, current is list >
      Length mismatch: comparison on first 1 components
      Component 1: Cols in y but not x: `c(NA_character_, NA_character_)`. 
      Component 1: Cols in x but not y: `suffix`, `string_name`, `surname`, `given_name`, `author_number`, `prefix`. 
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 251 | SKIPPED: 4 | WARNINGS: 1 | FAILED: 1 ]
      1. Failure: authors are correct (@test-books.R#117) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# keyholder

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/keyholder
* URL: https://echasnovski.github.io/keyholder/, https://github.com/echasnovski/keyholder/
* BugReports: https://github.com/echasnovski/keyholder/issues/
* Date/Publication: 2018-12-01 17:10:03 UTC
* Number of recursive dependencies: 56

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
      
      [31m──[39m [31m3. Failure: key_by_id works on grouped_df (@test-id.R#108) [39m [31m────────────────────[39m
      `output_3` not identical to `output_ref_3`.
      Objects equal but not identical
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 306 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: add_id works on grouped_df (@test-id.R#46) 
      2. Failure: key_by_id works on grouped_df (@test-id.R#85) 
      3. Failure: key_by_id works on grouped_df (@test-id.R#108) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# MachineShop

<details>

* Version: 2.1.0
* Source code: https://github.com/cran/MachineShop
* URL: https://brian-j-smith.github.io/MachineShop/
* BugReports: https://github.com/brian-j-smith/MachineShop/issues
* Date/Publication: 2020-02-08 23:50:02 UTC
* Number of recursive dependencies: 195

Run `revdep_details(,"MachineShop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
        step
    
    > library(MASS)
    
    Attaching package: ‘MASS’
    
    The following object is masked from ‘package:dplyr’:
    
        select
    
    > 
    > rec <- recipe(medv ~ ., data = Boston) %>%
    +   step_pca(all_numeric(), -all_outcomes(), id = "pca")
    > 
    > grid <- expand_steps(
    +   pca = list(num_comp = 1:3)
    + )
    > 
    > fit(TunedInput(rec, grid = grid), model = GLMModel)
    Error: All columns in a tibble must be vectors:
    ```

## In both

*   checking S3 generic/method consistency ... WARNING
    ```
    SelectedInput:
      function(...)
    SelectedInput.formula:
      function(..., data, control, metrics, stat, cutoff)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.5Mb
      sub-directories of 1Mb or more:
        R  10.1Mb
    ```

# mcp

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/mcp
* URL: http://lindeloev.github.io/mcp/, https://github.com/lindeloev/mcp
* BugReports: https://github.com/lindeloev/mcp/issues
* Date/Publication: 2020-01-09 16:30:02 UTC
* Number of recursive dependencies: 93

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
* Number of recursive dependencies: 146

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
      
      [31m──[39m [31m3. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.[39m
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
    > ### ** Examples
    > 
    > # Loading an example pan-matrix
    > data(xmpl.panmat)
    > 
    > # Estimating binomial mixture models
    > binmix.lst <- binomixEstimate(xmpl.panmat, K.range = 3:8)
    binomixEstimate: Fitting 3 component model...
    Error: `value` can't be recycled to size 1.
    [31mx[39m It must be size 1 or 1, not 3.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─micropan::binomixEstimate(xmpl.panmat, K.range = 3:8)
    [90m 2. [39m│ ├─base::`[<-`(...) [90m00_pkg_src/micropan/R/binomix.R:132:4[39m
    [90m 3. [39m│ └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/micropan/R/binomix.R:132:4[39m
    [90m 4. [39m│   └─tibble:::tbl_subassign(x, i, j, value)
    [90m 5. [39m│     └─tibble:::tbl_subassign_row(xj, i, value)
    [90m 6. [39m│       └─vctrs::`vec_slice<-`(`*tmp*`, i, value = value[[j]])
    [90m 7. [39m└─vctrs:::stop_recycle_incompatible_size(...)
    [90m 8. [39m  └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# MNLpred

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/MNLpred
* Date/Publication: 2019-11-05 15:20:09 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"MNLpred")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(nnet)
    > library(MASS)
    > 
    > dataset <- data.frame(y = c(rep("a", 10), rep("b", 10), rep("c", 10)),
    +                       x1 = rnorm(30),
    +                       x2 = rnorm(30, mean = 1),
    +                       x3 = sample(1:10, 30, replace = TRUE))
    > 
    > mod <- multinom(y ~ x1 + x2 + x3, data = dataset, Hess = TRUE)
    # weights:  15 (8 variable)
    initial  value 32.958369 
    iter  10 value 30.528006
    final  value 30.525569 
    converged
    > 
    > fdi1 <- mnl_fd2_ova(model = mod, data = dataset,
    +                     xvari = "x1",
    +                     value1 = min(dataset$x1), value2 = max(dataset$x1))
    Error: Lossy cast from `value` <double> to `x` <logical>.
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Lossy cast from `value` <double> to `x` <logical>.
      * Locations: 1, 2
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_equal(...)
      [90m 12. [39mvctrs:::vec_cast.logical.double(...)
      [90m 13. [39mvctrs::maybe_lossy_cast(out, x, to, lossy, x_arg = x_arg, to_arg = to_arg)
      [90m 17. [39mvctrs:::stop_lossy_cast(...)
      [90m 18. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: mnl_pred_ova() returns two predictions when by = NULL (@test_inputvariants.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# MPTmultiverse

<details>

* Version: 0.3-3
* Source code: https://github.com/cran/MPTmultiverse
* URL: https://github.com/mpt-network/MPTmultiverse
* BugReports: https://github.com/mpt-network/MPTmultiverse/issues
* Date/Publication: 2019-08-27 23:30:29 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"MPTmultiverse")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 3 | WARNINGS: 14 | FAILED: 16 ]
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
      Execution halted
    ```

# OncoBayes2

<details>

* Version: 0.6-0
* Source code: https://github.com/cran/OncoBayes2
* Date/Publication: 2020-02-11 13:50:02 UTC
* Number of recursive dependencies: 82

Run `revdep_details(,"OncoBayes2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Generated formula        :
       cbind(num_toxicities, num_patients - num_toxicities) ~
       1 + I(log(A/1)) |
       1 + I(log(B/1)) |
       1 + I(log(C/1)) |
       0 + I(A/1 * B/1) + I(A/1 * C/1) + I(B/1 * C/1) |
       stratum_id / group_id 
      
      BLRM prior undefined!
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 130 | SKIPPED: 4 | WARNINGS: 166 | FAILED: 1 ]
      1. Error: update.blrmfit grows the data set (@test-blrm_exnex.R#264) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 49.0Mb
      sub-directories of 1Mb or more:
        libs  47.3Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# oppr

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/oppr
* URL: https://prioritizr.github.io/oppr, https://github.com/prioritizr/oppr
* BugReports: https://github.com/prioritizr/oppr/issues
* Date/Publication: 2020-02-07 12:10:07 UTC
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
            Time to load data was 0.042 seconds, presolve used 0.000 seconds,
             ... 0.004 seconds in simplex solver, in total 0.046 seconds.
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
      installed size is 19.5Mb
      sub-directories of 1Mb or more:
        R      3.9Mb
        libs  14.5Mb
    ```

# pmdplyr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/pmdplyr
* URL: https://nickch-k.github.io/pmdplyr, https://github.com/NickCH-K/pmdplyr
* BugReports: https://github.com/NickCH-K/pmdplyr/issues
* Date/Publication: 2019-08-26 09:50:02 UTC
* Number of recursive dependencies: 106

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
      
      [31m──[39m [31m5. Failure: Different inexact joins work (@test-inexact_join.R#213) [39m [31m───────────[39m
      inexact_anti_join(left, right, var = t, jvar = t2, method = "last") not equal to last_join %>% dplyr::select(-b) %>% dplyr::filter(FALSE).
      Incompatible type for column `t2`: x logical, y numeric
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 296 | SKIPPED: 0 | WARNINGS: 16 | FAILED: 5 ]
      1. Error: inexact_join input failstates (@test-bad_input.R#96) 
      2. Failure: Different inexact joins work (@test-inexact_join.R#162) 
      3. Failure: Different inexact joins work (@test-inexact_join.R#169) 
      4. Failure: Different inexact joins work (@test-inexact_join.R#206) 
      5. Failure: Different inexact joins work (@test-inexact_join.R#213) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# portalr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/portalr
* URL: https://weecology.github.io/portalr/, https://github.com/weecology/portalr
* BugReports: https://github.com/weecology/portalr/issues
* Date/Publication: 2020-01-16 15:00:02 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"portalr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Failure: data generated by level = 'stake' is same (ant colony_presence_absen[39m
      Value hashes to 2194929e3e, not 4639dbfbf3
      
      [31m──[39m [31m4. Failure: data generated by level = 'plot' is same (ant colony_presence_absenc[39m
      Value hashes to 255aef31fb, not 60e9306bfc
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: data generated by default setting is same (shrub_cover) (@test-99-regression.R#166) 
      2. Failure: data generated by default setting is same (ant colony_presence_absence) (@test-99-regression.R#177) 
      3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#195) 
      4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#213) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# projects

<details>

* Version: 2.0.0
* Source code: https://github.com/cran/projects
* URL: https://www.github.com/NikKrieger/projects
* Date/Publication: 2019-09-05 16:10:03 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"projects")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;250m1[39m 13: Agnew     8888: Stone  0: rstudio
    > 
    > # Editing a project, showcasing the addition and removal of authors
    > edit_project(
    +   "Understanding",
    +   short_title = "usa1",
    +   authors = ~ + "303" - 13 - Stone
    + )
    Error: No common type for `value` <projects_author> and `x` <projects_author>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─projects::edit_project(...)
    [90m  2. [39m│ └─projects:::edit_metadata(...) [90m00_pkg_src/projects/R/edit.R:151:2[39m
    [90m  3. [39m│   └─purrr::iwalk(...) [90m00_pkg_src/projects/R/metadata_manipulation.R:67:2[39m
    [90m  4. [39m│     └─purrr::walk2(.x, vec_index(.x), .f, ...)
    [90m  5. [39m│       └─purrr::map2(.x, .y, .f, ...)
    [90m  6. [39m│         └─projects:::.f(.x[[i]], .y[[i]], ...)
    [90m  7. [39m│           ├─base::`[<-`(`*tmp*`, row_number, name, value = structure(NA, class = "projects_author")) [90m00_pkg_src/projects/R/metadata_manipulation.R:71:8[39m
    [90m  8. [39m│           └─tibble:::`[<-.tbl_df`(`*tmp*`, row_number, name, value = structure(NA, class = "projects_author")) [90m00_pkg_src/projects/R/metadata_manipulation.R:71:8[39m
    [90m  9. [39m│             └─tibble:::tbl_subas
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
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
      [31m──[39m [31m1. Failure: validate_no_logical -concern dataset (@test-validate.R#36) [39m [31m────────[39m
      ds$field_index not equal to 2.
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
      + }
      Loading required package: testthat
      [31m──[39m [31m1. Error: corner cases (@test-exec-all.R#46) [39m [31m──────────────────────────────────[39m
      `x` must be a vector, not a `rematch_allrecords` object.
      [1mBacktrace:[22m
      [90m 1. [39mrematch2::re_exec_all(.text <- character(), "")
      [90m 8. [39mvctrs:::stop_scalar_type(...)
      [90m 9. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 59

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
      
      [31m──[39m [31m3. Failure: Bootstrap estimate of mean is close to estimate of mean from normal [39m
      ttest$estimate not equal to single_bca_res$.estimate.
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 126

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
* Number of recursive dependencies: 60

Run `revdep_details(,"rubias")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [1] "/tmp/Rtmpcb2nLv/mixfile"
    > 
    > # note that in practice you will probably want to specify
    > # your own directory...
    > 
    > # run the function
    > write_gsi_sim_mixture(chinook_mix, 5, prefix)
    Error: No common type for `value` <double> and `x` <character>.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─rubias::write_gsi_sim_mixture(chinook_mix, 5, prefix)
    [90m  2. [39m│ ├─base::`[<-`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m  3. [39m│ └─tibble:::`[<-.tbl_df`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m  4. [39m│   └─tibble:::tbl_subassign_matrix(x, j, value)
    [90m  5. [39m│     └─tibble:::map2(x[col_idx], cells[col_idx], `vec_slice<-`, value)
    [90m  6. [39m│       └─base::mapply(.f, .x, .y, MoreArgs = list(...), SIMPLIFY = FALSE)
    [90m  7. [39m│         └─(function (x, i, value) ...
    [90m  8. [39m├─vctrs:::vec_ptype2_dispatch_s3(x = x, y = y, x_arg = x_arg, y_arg = y_arg)
    [90m  9. [39m├─vctrs::vec_ptype2.double(x = x, y = y, x_arg = x_arg, y_arg = y_arg)
    [90m 10. [39m└─vctrs:::vec_ptype2.double.default(...
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.4Mb
      sub-directories of 1Mb or more:
        libs   8.5Mb
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
* Number of recursive dependencies: 59

Run `revdep_details(,"ruler")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Error: is_exposure works (@test-exposure.R#166) [39m [31m────────────────────────────[39m
      `x` must be a vector, not a function.
      [1mBacktrace:[22m
      [90m 1. [39mbase::`[[<-`(...)
      [90m 7. [39mvctrs:::stop_scalar_type(...)
      [90m 8. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 42

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

* Version: 0.3.0
* Source code: https://github.com/cran/sclr
* Date/Publication: 2019-11-26 21:40:02 UTC
* Number of recursive dependencies: 56

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
      
      [31m──[39m [31m3. Failure: protective titre is found correctly (@test-protection.R#16) [39m [31m───────[39m
      predict(fit, prot50_high)$prot_u not equal to 0.5.
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 84 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: protective titre is found correctly (@test-protection.R#12) 
      2. Failure: protective titre is found correctly (@test-protection.R#14) 
      3. Failure: protective titre is found correctly (@test-protection.R#16) 
      
      Error: testthat unit tests failed
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
      > 
      > test_check("silicate")
      [31m──[39m [31m1. Error: building sf works (@test-spatial-build.R#6) [39m [31m─────────────────────────[39m
      `x` must be a vector, not a `sfc_MULTIPOLYGON/sfc` object.
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_s3_class(build_sf(PATH(minimal_mesh)), "sf")
      [90m 12. [39mvctrs:::stop_scalar_type(...)
      [90m 13. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Error: Prepare Design (@test-utils.R#44) [39m [31m───────────────────────────────────[39m
      Can't join on 'q' x 'q' because of incompatible types (list / list)
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_identical(prepare_design(opts), dgn)
      [90m 3. [39mtestthat:::compare.default(act$val, exp$val)
      [90m 5. [39mdplyr:::all.equal.tbl_df(x, y, ...)
      [90m 6. [39mdplyr:::equal_data_frame(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 169 | SKIPPED: 21 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: Prepare Design (@test-utils.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# srvyr

<details>

* Version: 0.3.7
* Source code: https://github.com/cran/srvyr
* URL: http://gdfe.co/srvyr, https://github.com/gergness/srvyr
* BugReports: https://github.com/gergness/srvyr/issues
* Date/Publication: 2020-01-17 09:10:02 UTC
* Number of recursive dependencies: 89

Run `revdep_details(,"srvyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Incompatible type for column `survey_mean_upp`: x numeric, y matrix
      
      [31m──[39m [31m3. Failure: deff and df work for grouped survey total (@expect-equality.R#61) [39m [31m─[39m
      `x` not equal to `y`.
      Incompatible type for column `survey_total_low`: x numeric, y matrix
      Incompatible type for column `survey_total_upp`: x numeric, y matrix
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 206 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: deff and df work for grouped survey total (@expect-equality.R#61) 
      2. Failure: deff and df work for grouped survey mean (@expect-equality.R#61) 
      3. Failure: deff and df work for grouped survey total (@expect-equality.R#61) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# taxa

<details>

* Version: 0.3.3
* Source code: https://github.com/cran/taxa
* URL: https://docs.ropensci.org/taxa, https://github.com/ropensci/taxa
* BugReports: https://github.com/ropensci/taxa/issues
* Date/Publication: 2020-02-25 06:40:02 UTC
* Number of recursive dependencies: 95

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
      
      [31m──[39m [31m3. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#[39m
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 607 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 3 ]
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

# tidybayes

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/tidybayes
* URL: http://mjskay.github.io/tidybayes, https://github.com/mjskay/tidybayes
* BugReports: https://github.com/mjskay/tidybayes/issues/new
* Date/Publication: 2020-01-28 21:20:02 UTC
* Number of recursive dependencies: 193

Run `revdep_details(,"tidybayes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > library(ggplot2)
    > 
    > data(RankCorr, package = "tidybayes")
    > 
    > # Let's do all pairwise comparisons of b[i,1]:
    > RankCorr %>%
    +   spread_draws(b[i,j]) %>%
    +   filter(j == 1) %>%
    +   compare_levels(b, by = i) %>%
    +   median_qi()
    Error: Tibble columns must have consistent sizes, only values of size one are recycled:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 288 | SKIPPED: 108 | WARNINGS: 75 | FAILED: 33 ]
      1. Error: compare_levels respects groups of input data frame (@test.compare_levels.R#180) 
      2. Error: regular expressions for parameter names work on indexed parameters (@test.gather_draws.R#23) 
      3. Error: gather_draws works on a combination of 0 and 1-dimensional values (with correct groups) (@test.gather_draws.R#31) 
      4. Error: gather_variables works on the results of spread_draws with multiple variables and dimensions (@test.gather_variables.R#32) 
      5. Error: (unknown) (@test.geom_interval.R#15) 
      6. Error: (unknown) (@test.geom_pointinterval.R#14) 
      7. Error: spread_draws works on a variable with one unnamed index (@spread_draws.R#269) 
      8. Error: spread_draws works on a variable with one named index (@spread_draws.R#269) 
      9. Error: spread_draws works on a variable with one anonymous wide index (@test.spread_draws.R#129) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc   3.7Mb
    ```

# trialr

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/trialr
* URL: https://github.com/brockk/trialr
* BugReports: https://github.com/brockk/trialr/issues
* Date/Publication: 2020-01-08 22:30:10 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"trialr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Chain 4: Iteration: 1800 / 2000 [ 90%]  (Sampling)
      Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
      Chain 4: 
      Chain 4:  Elapsed Time: 0.210709 seconds (Warm-up)
      Chain 4:                0.195426 seconds (Sampling)
      Chain 4:                0.406135 seconds (Total)
      Chain 4: 
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 732 | SKIPPED: 0 | WARNINGS: 37 | FAILED: 3 ]
      1. Error: careful_escalation advocates start_dose when n = 0 (@test_stan_crm.R#361) 
      2. Error: careful_escalation does not skip doses (@test_stan_crm.R#386) 
      3. Error: careful_escalation stops appropriately (@test_stan_crm.R#405) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 186.1Mb
      sub-directories of 1Mb or more:
        doc     4.1Mb
        libs  181.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

## Newly fixed

*   checking whether package ‘trialr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/tibble/revdep/checks/trialr/old/trialr.Rcheck/00install.out’ for details.
    ```

# unheadr

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/unheadr
* URL: https://github.com/luisDVA/unheadr
* BugReports: https://github.com/luisDVA/unheadr/issues
* Date/Publication: 2020-02-09 15:40:02 UTC
* Number of recursive dependencies: 66

Run `revdep_details(,"unheadr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘unheadr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotate_mf
    > ### Title: Annotate meaningful formatting
    > ### Aliases: annotate_mf
    > 
    > ### ** Examples
    > 
    > example_spreadsheet <- system.file("extdata/dog_test.xlsx", package = "unheadr")
    > annotate_mf(example_spreadsheet, orig = Task, new = Task_annotated)
    Error in tbl_subassign_matrix(x, j, value) : 
      vec_size(value) == 1 is not TRUE
    Calls: annotate_mf ... [<- -> [<-.tbl_df -> tbl_subassign_matrix -> stopifnot
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("unheadr")
      [31m──[39m [31m1. Error: all four formatting options are annotated (@test-annotate_mf.R#23) [39m [31m──[39m
      vec_size(value) == 1 is not TRUE
      [1mBacktrace:[22m
      [90m 1. [39munheadr::annotate_mf("./dog_test_f.xlsx", orig = Task, new = Task_annotated)
      [90m 3. [39mtibble:::`[<-.tbl_df`(...) [90mrevdep/checks/unheadr/new/unheadr.Rcheck/00_pkg_src/unheadr/R/annotate_mf.R:63:2[39m
      [90m 4. [39mtibble:::tbl_subassign_matrix(x, j, value)
      [90m 5. [39mbase::stopifnot(vec_is(value), vec_size(value) == 1)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 15 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: all four formatting options are annotated (@test-annotate_mf.R#23) 
      
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
* Number of recursive dependencies: 71

Run `revdep_details(,"units")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      All columns in a tibble must be vectors:
      * Column `m` is mixed_units
      [1mBacktrace:[22m
      [90m 1. [39mbase::print(tibble::tibble(m))
      [90m 2. [39mtibble::tibble(m)
      [90m 3. [39mtibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
      [90m 4. [39mtibble:::check_valid_col(res, col_names[[j]], j)
      [90m 5. [39mtibble:::check_valid_cols(list2(`:=`(!!name, x)))
      
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 416 | SKIPPED: 6 | WARNINGS: 13 | FAILED: 1 ]
      1. Error: mixed units work (@test_mixed.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# vctrs

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/vctrs
* URL: https://github.com/r-lib/vctrs
* BugReports: https://github.com/r-lib/vctrs/issues
* Date/Publication: 2020-02-20 18:50:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"vctrs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 2862 | SKIPPED: 13 | WARNINGS: 0 | FAILED: 26 ]
      1. Error: data frames of all types are not lists (@test-assert.R#274) 
      2. Error: output is tibble if any input is tibble (@test-bind.R#17) 
      3. Error: output is tibble if any input is tibble (@test-bind.R#294) 
      4. Error: vec_c() includes index in argument tag (@test-c.R#72) 
      5. Error: cast errors create helpful messages (#57, #225) (@test-cast.R#56) 
      6. Error: can order data frames (and subclasses) with matrix columns (@test-compare.R#281) 
      7. Error: also works for data frames (@test-dictionary.R#93) 
      8. Error: dispatch is symmetric with tibbles (@test-partial-frame.R#57) 
      9. Error: can take the common type with partial frames (@test-partial-frame.R#63) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# vip

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/vip
* URL: https://github.com/koalaverse/vip/
* BugReports: https://github.com/koalaverse/vip/issues
* Date/Publication: 2020-01-20 19:20:02 UTC
* Number of recursive dependencies: 180

Run `revdep_details(,"vip")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      ----- FAILED[data]: test_pkg_earth.R<28--31>
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
      Execution halted
    ```

# xpose

<details>

* Version: 0.4.7
* Source code: https://github.com/cran/xpose
* URL: https://github.com/UUPharmacometrics/xpose
* BugReports: https://github.com/UUPharmacometrics/xpose/issues
* Date/Publication: 2020-02-04 20:30:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"xpose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > # Histogram of parameters
    > prm_distrib(xpdb_ex_pk, type = 'h')
    Dropped fixed variables ALAG1.
    Using data from $prob no.1
    Removing duplicated rows based on: ID
    Tidying data by ID, SEX, MED1, MED2, DOSE ... and 23 more variables
    > 
    > # Density plot of etas with a rug
    > eta_distrib(xpdb_ex_pk, type = 'dr')
    Using data from $prob no.1
    Removing duplicated rows based on: ID
    Tidying data by ID, SEX, MED1, MED2, DOSE ... and 23 more variables
    > 
    > # Histogram of different residuals
    > res_distrib(xpdb_ex_pk, type = 'hr', res = c('IWRES', 'CWRES'))
    Using data from $prob no.1
    Filtering data by EVID == 0
    Error: `i` must have one dimension, not 2.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 477 | SKIPPED: 7 | WARNINGS: 4 | FAILED: 29 ]
      1. Error: only_obs function works properly (@test-fetch_data.R#15) 
      2. Error: fetch_data can get simple data (@test-fetch_data.R#30) 
      3. Error: fetch_data can tidy data (@test-fetch_data.R#43) 
      4. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function dv_vs_pred (@test-directory.R#186) 
      5. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function dv_vs_ipred (@test-directory.R#186) 
      6. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function dv_vs_idv (@test-directory.R#186) 
      7. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function ipred_vs_idv (@test-directory.R#186) 
      8. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function pred_vs_idv (@test-directory.R#186) 
      9. Error: xpose plot objects are returned with appropriate xpdb_ex_pk for plot_function dv_preds_vs_idv (@test-directory.R#186) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

