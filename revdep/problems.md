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
    > data(amt_fisher)
    > # Add the month
    > amt_fisher %>% mutate(yday = lubridate::yday(t_)) %>%
    + summarize_sampling_rate_many(c("id", "yday"))
    Error: No common type for `..1$ts$min` <table> and `..2$ts$min` <table>.
    [1m<error/vctrs_error_incompatible_type>[22m
    No common type for `..1$ts$min` <table> and `..2$ts$min` <table>.
    [1mBacktrace:[22m
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
    [90m 11. [39m│  
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
* Number of recursive dependencies: 76

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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-mcmc.r#35) 
      2. Error: (unknown) (@test-plot.r#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# beadplexr

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/beadplexr
* URL: https://gitlab.com/ustervbo/beadplexr
* BugReports: https://gitlab.com/ustervbo/beadplexr/issues
* Date/Publication: 2018-12-07 23:40:08 UTC
* Number of recursive dependencies: 131

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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 344 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: ident_bead_pop() works (@test_identify_assay_analyte.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘trimcluster’
    ```

# breathtestcore

<details>

* Version: 0.4.6
* Source code: https://github.com/cran/breathtestcore
* URL: https://github.com/dmenne/breathtestcore
* BugReports: https://github.com/dmenne/breathtestcore/issues
* Date/Publication: 2018-12-18 09:10:03 UTC
* Number of recursive dependencies: 92

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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

* Version: 0.4.0
* Source code: https://github.com/cran/corrr
* URL: https://github.com/tidymodels/corrr
* BugReports: https://github.com/tidymodels/corrr/issues
* Date/Publication: 2019-07-12 19:00:02 UTC
* Number of recursive dependencies: 109

Run `revdep_details(,"corrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > x <- correlate(mtcars)
    
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
    Error in matrix_to_cells(j, x) : is_bare_logical(j) is not TRUE
    Calls: %>% ... tbl_subassign_matrix -> matrix_to_cells -> stopifnot
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 81

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 114

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 104

Run `revdep_details(,"diffdf")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 89

Run `revdep_details(,"dmdScheme")` for more info

</details>

## Newly broken

*   checking whether package ‘dmdScheme’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/git/tibble/revdep/checks/dmdScheme/new/dmdScheme.Rcheck/00install.out’ for details.
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
   /tmp/RtmpjxiwZW/dmdScheme_15c8c7f457ade
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/RtmpjxiwZW/file15c8c7c1c9d0f/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Error: package or namespace load failed for ‘dmdScheme’:
 .onAttach failed in attachNamespace() for 'dmdScheme', details:
  call: NULL
  error: No common type for `..1$microcosmVolume` <double> and `..2$microcosmVolume` <character>.
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/home/rstudio/git/tibble/revdep/checks/dmdScheme/new/dmdScheme.Rcheck/dmdScheme’

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
   /tmp/RtmpO4A3OW/dmdScheme_15b1161dc76bf
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/RtmpO4A3OW/file15b1178d36364/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Theme switched to dmdScheme_0.9.5
** testing if installed package can be loaded from final location

#############################################
The cache will be in a temporary location and be deleted when you quit R.
It is located at
   /tmp/RtmpEzN9ZI/dmdScheme_15dc811d22d3a
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/RtmpEzN9ZI/file15dc88f7ae23/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Theme switched to dmdScheme_0.9.5
** testing if installed package keeps a record of temporary installation path
* DONE (dmdScheme)

```
# dplyr

<details>

* Version: 0.8.3
* Source code: https://github.com/cran/dplyr
* URL: http://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr
* BugReports: https://github.com/tidyverse/dplyr/issues
* Date/Publication: 2019-07-04 15:50:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"dplyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      > 
      > test_check("dplyr")
      [31m──[39m [31m1. Failure: mutate does not strip names of list-columns (#2675) (@test-mutate.r#297)[39m
      names(data$x) not identical to c("a", "b").
      target is NULL, current is character
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 3405 | SKIPPED: 14 | WARNINGS: 6 | FAILED: 1 ]
      1. Failure: mutate does not strip names of list-columns (#2675) (@test-mutate.r#297) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 44.5Mb
      sub-directories of 1Mb or more:
        libs  41.7Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# egor

<details>

* Version: 0.19.10
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2019-10-07 22:10:06 UTC
* Number of recursive dependencies: 70

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
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 6 ]
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
* Number of recursive dependencies: 122

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
    [1m<error/vctrs_error_incompatible_type>[22m
    No common type for `..1$value` <character> and `..2$value` <double>.
    [1mBacktrace:[22m
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
    [90m 11. [39m│           
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
      [31m──[39m [31m6. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summarize.R#1[39m
      [[ ]] improper number of subscripts
      
      # Scenario model: openfair_tef_tc_diff_lm
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 89

Run `revdep_details(,"exuber")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: crit as data (@test-cv.R#4) [39m [31m───────────────────────────────────────────[39m
      `capture.output(print(crit))` threw an error.
      Message: Expected a vector, not a `list/crit` object
      Class:   vctrs_error_scalar_type/vctrs_error/rlang_error/error/condition
      [1mBacktrace:[22m
      [90m  1. [39mbase::print(crit)
      [90m 19. [39mvctrs:::stop_scalar_type(...)
      [90m 20. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 258 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Failure: crit as data (@test-cv.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   2.5Mb
        libs   2.5Mb
    ```

# fabletools

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/fabletools
* URL: http://fabletools.tidyverts.org/
* BugReports: https://github.com/tidyverts/fabletools/issues
* Date/Publication: 2019-09-16 10:50:02 UTC
* Number of recursive dependencies: 92

Run `revdep_details(,"fabletools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   accuracy(
    +     aus_production,
    +     measures = list(interval_accuracy_measures, distribution_accuracy_measures)
    +   )
    + }
    
    Attaching package: ‘dplyr’
    
    The following object is masked from ‘package:tsibble’:
    
        id
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Error: All columns in a tibble must be vectors:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * Column `ets` is lst_mdl
      [1mBacktrace:[22m
      [90m     [39m█
      [90m  1. [39m└─testthat::test_check("fabletools")
      [90m  2. [39m  └─testthat:::test_package_dir(...)
      [90m  3. [39m    └─testthat::test_dir(...)
      [90m  4. [39m      └─testthat::source_test_setup(path, env)
      [90m  5. [39m        └─testthat::source_dir(path, "^setup.*\\.[rR]$", env = env, wrap = FALSE)
      [90m  6. [39m          └─base::lapply(files, source_file, env = env, chdir = chdir, wrap = wrap)
      [90m  7. [39m            └─testthat:::FUN(X[[i]], ...)
      [90m  8. [39m              └─base::eval(exprs, env)
      [90m  9. [39m                └─base::eval(exprs, env)
      [90m 10. [39m                  └─mbl %>% forecast(h = 12) [90msetup-data.R:14:0[39m
      [90m 11. [39m                    ├─base::withVisible(eval(q
      Execution halted
    ```

# feasts

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/feasts
* URL: http://feasts.tidyverts.org/
* BugReports: https://github.com/tidyverts/feasts/issues
* Date/Publication: 2019-09-02 14:10:06 UTC
* Number of recursive dependencies: 90

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
    
    Error: All columns in a tibble must be vectors:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  7. [39mmagrittr::freduce(value, `_function_list`)
      [90m  8. [39mfunction_list[[i]](value)
      [90m 10. [39mfabletools:::glance.mdl_df(.)
      [90m 12. [39mfabletools:::gather.mdl_df(...)
      [90m 15. [39mfabletools:::as_tibble.mdl_df(data)
      [90m 17. [39mtibble:::as_tibble.data.frame(x, ...)
      [90m 18. [39mtibble:::lst_to_tibble(unclass(x), .rows, .name_repair)
      [90m 19. [39mtibble:::check_valid_cols(x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 103 | SKIPPED: 0 | WARNINGS: 11 | FAILED: 1 ]
      1. Error: gg_arma() plots (@test-graphics.R#253) 
      
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
* Number of recursive dependencies: 101

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
      [31m──[39m [31m1. Failure: plot completes silently (@test-osar.R#22) [39m [31m─────────────────────────────[39m
      `plot(r, "hist")` produced warnings.
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 114

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
    Error in -x : invalid argument to unary operator
    Calls: %>% ... <Anonymous> -> vars_select_eval -> map_if -> map -> .f -> -
    In addition: Warning messages:
    1: `.key` is deprecated 
    2: unnest() has a new interface. See ?unnest for details.
    Try `df %>% unnest(c(est_n, data_n))`, with `mutate()` if needed 
    3: unnest() has a new interface. See ?unnest for details.
    Try `df %>% unnest(c(dat, est))`, with `mutate()` if needed 
    Execution halted
    ```

# googlesheets4

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/googlesheets4
* URL: https://github.com/tidyverse/googlesheets4
* BugReports: https://github.com/tidyverse/googlesheets4/issues
* Date/Publication: 2019-11-04 21:50:02 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"googlesheets4")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 19. [39mvctrs::vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 20. [39mvctrs::stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 21. [39mvctrs:::stop_incompatible(...)
      [90m 22. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 187 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: can shim a single side (@test-utils-sheet-geometry.R#38) 
      2. Error: can shim two opposing sides (@test-utils-sheet-geometry.R#49) 
      3. Error: can shim on two perpendicular sides (@test-utils-sheet-geometry.R#56) 
      4. Error: can shim three sides (@test-utils-sheet-geometry.R#67) 
      5. Error: can shim four sides (@test-utils-sheet-geometry.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# hardhat

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/hardhat
* URL: https://github.com/tidymodels/hardhat
* BugReports: https://github.com/tidymodels/hardhat/issues
* Date/Publication: 2020-01-08 23:01:24 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"hardhat")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [33mℹ[39m Writing skeleton files
      [32m✔[39m Setting active project to [34m'/tmp/RtmpgrWHLk/model'[39m
      [32m✔[39m Writing [34m'R/random_forest-constructor.R'[39m
      [32m✔[39m Writing [34m'R/random_forest-fit.R'[39m
      [32m✔[39m Writing [34m'R/random_forest-predict.R'[39m
      [31m●[39m Run [90m`devtools::document()`[39m
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 400 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: novel predictor levels are caught (@test-forge-formula.R#177) 
      2. Failure: novel predictor levels can be ignored (@test-forge-formula.R#204) 
      3. Failure: novel levels are handled correctly when the new column is a character (@test-forge-formula.R#285) 
      4. Failure: novel levels are ignored correctly when the new column is a character (@test-forge-formula.R#320) 
      
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
* Number of recursive dependencies: 60

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

* Version: 2.3.0
* Source code: https://github.com/cran/healthcareai
* URL: http://docs.healthcare.ai
* BugReports: https://github.com/HealthCatalyst/healthcareai-r/issues
* Date/Publication: 2018-12-12 23:50:03 UTC
* Number of recursive dependencies: 121

Run `revdep_details(,"healthcareai")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    
    The argument `options` is deprecated in favor of `freq_cut` and `unique_cut`. options` will be removed in next version.
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
      healthcareai version 2.3.0
      Please visit https://docs.healthcare.ai for full documentation and vignettes. Join the community at https://healthcare-ai.slack.com
      [31m──[39m [31m1. Error: the fundamentals work (@test-cran_only.R#4) [39m [31m─────────────────────────────[39m
      `goal` must be a vector, not a primitive function
      [1mBacktrace:[22m
      [90m  1. [39mhealthcareai::machine_learn(...)
      [90m 25. [39mvctrs:::stop_scalar_type(...)
      [90m 26. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: the fundamentals work (@test-cran_only.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# heemod

<details>

* Version: 0.11.0
* Source code: https://github.com/cran/heemod
* BugReports: https://github.com/pierucci/heemod/issues
* Date/Publication: 2019-10-22 08:40:05 UTC
* Number of recursive dependencies: 94

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
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 86

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
      [90m  1. [39mbase::`[<-`(`*tmp*`, 1, -c(1:4), value = NA)
      [90m  8. [39mvctrs:::vec_ptype2.logical.list(...)
      [90m  9. [39mvctrs::stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 10. [39mvctrs:::stop_incompatible(...)
      [90m 11. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 517 | SKIPPED: 0 | WARNINGS: 8 | FAILED: 3 ]
      1. Error: (unknown) (@test_model_gamm.R#4) 
      2. Error: (unknown) (@test_scoring.R#15) 
      3. Error: (unknown) (@test_test_interaction.R#27) 
      
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

# interactions

<details>

* Version: 1.1.1
* Source code: https://github.com/cran/interactions
* URL: https://interactions.jacob-long.com
* BugReports: https://github.com/jacob-long/interactions/issues
* Date/Publication: 2019-07-05 07:30:23 UTC
* Number of recursive dependencies: 91

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
    Error: Must extract with a single subscript.
    [31mx[39m `j` has the wrong type `symbol`.
    [34mℹ[39m This subscript must be a location or a name.
    Backtrace:
    [90m 1. [39minteractions::interact_plot(model = fit, pred = Murder, modx = Illiteracy)
    [90m 2. [39minteractions:::plot_mod_continuous(...) [90m00_pkg_src/interactions/R/interact_plot.R:424:2[39m
    [90m 5. [39mtibble:::`[[.tbl_df`(d, pred) [90m00_pkg_src/interactions/R/interact_plot.R:645:2[39m
    [90m 6. [39mtibble:::tbl_subset2(x, j = i)
    [90m 7. [39mvctrs::vec_as_location2(j, length(x), names(x), arg = "j")
    [90m 8. [39mvctrs:::result_get(...)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘quantreg’, ‘brms’, ‘effects’, ‘Hmisc’, ‘rockchalk’, ‘pequod’
    ```

# janitor

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/janitor
* URL: https://github.com/sfirke/janitor
* BugReports: https://github.com/sfirke/janitor/issues
* Date/Publication: 2019-04-21 04:20:13 UTC
* Number of recursive dependencies: 60

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
    Error: No common type for `value` <character> and `x` <double>.
    [1m<error/vctrs_error_incompatible_type>[22m
    No common type for `value` <character> and `x` <double>.
    [1mBacktrace:[22m
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
    [90m 10. [39m│             └─tibble:::`[<-.tbl_df`(`*tmp*`, 1, 1, value = "Total") [90
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 522 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 12 ]
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
* Number of recursive dependencies: 69

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
    Error: All columns in a tibble must be vectors:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 14. [39mtibble:::check_valid_cols(list2(`:=`(!!name, x)))
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 128

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
    Error: Must extract with a single subscript.
    [31mx[39m `j` has the wrong type `symbol`.
    [34mℹ[39m This subscript must be a location or a name.
    Backtrace:
    [90m 1. [39mjtools::effect_plot(model = fit, pred = Murder)
    [90m 2. [39mjtools:::plot_effect_continuous(...) [90m00_pkg_src/jtools/R/effect_plot.R:291:4[39m
    [90m 5. [39mtibble:::`[[.tbl_df`(d, pred) [90m00_pkg_src/jtools/R/effect_plot.R:390:2[39m
    [90m 6. [39mtibble:::tbl_subset2(x, j = i)
    [90m 7. [39mvctrs::vec_as_location2(j, length(x), names(x), arg = "j")
    [90m 8. [39mvctrs:::result_get(...)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 279 | SKIPPED: 0 | WARNINGS: 29 | FAILED: 11 ]
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
* Number of recursive dependencies: 57

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
      
      [31m──[39m [31m3. Failure: key_by_id works on grouped_df (@test-id.R#108) [39m [31m────────────────────────[39m
      `output_3` not identical to `output_ref_3`.
      Objects equal but not identical
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 145

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
      
      [31m──[39m [31m3. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.R#11[39m
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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

# MNLpred

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/MNLpred
* Date/Publication: 2019-11-05 15:20:09 UTC
* Number of recursive dependencies: 64

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
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 88

Run `revdep_details(,"MPTmultiverse")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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

# mudata2

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/mudata2
* URL: https://paleolimbot.github.io/mudata2, https://github.com/paleolimbot/mudata2
* BugReports: https://github.com/paleolimbot/mudata2/issues
* Date/Publication: 2020-01-09 16:50:02 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"mudata2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      * Column `c7` is json_column
      [1mBacktrace:[22m
      [90m 1. [39mtibble::tibble(...)
      [90m 2. [39mtibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
      [90m 3. [39mtibble:::check_valid_col(res, col_names[[j]], j)
      [90m 4. [39mtibble:::check_valid_cols(list2(`:=`(!!name, x)))
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 912 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: mudata_prepare_column and mudata_parse_column are opposites (@test-mudata-io.R#267) 
      2. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test-mudata-io.R#367) 
      3. Error: generate_type_str generates expected output (@test-types.R#331) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# OncoBayes2

<details>

* Version: 0.5-8
* Source code: https://github.com/cran/OncoBayes2
* Date/Publication: 2019-12-12 14:50:02 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"OncoBayes2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         mean se_mean      sd    2.5%     50%   97.5%   n_eff    Rhat 
       0.2644  0.0024  0.0019  0.2631  0.2644  0.2657  0.6021     Inf 
      
      Population correlation posterior rho_log_beta
                       mean se_mean   sd  2.5%   50% 97.5% n_eff Rhat
      I(log(drug1/1)) 0.088    0.44 0.34 -0.14 0.088  0.32   0.6  Inf
      
      No interaction model posterior specified.
      Error in na.fail.default(X[[i]], ...) : missing values in object
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 130 | SKIPPED: 4 | WARNINGS: 162 | FAILED: 1 ]
      1. Error: update.blrmfit grows the data set (@test-blrm_exnex.R#264) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 48.7Mb
      sub-directories of 1Mb or more:
        libs  47.3Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# oppr

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/oppr
* URL: https://prioritizr.github.io/oppr, https://github.com/prioritizr/oppr
* BugReports: https://github.com/prioritizr/oppr/issues
* Date/Publication: 2019-08-10 22:30:07 UTC
* Number of recursive dependencies: 95

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
            Time to load data was 0.044 seconds, presolve used 0.001 seconds,
             ... 0.000 seconds in simplex solver, in total 0.045 seconds.
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
      installed size is 19.3Mb
      sub-directories of 1Mb or more:
        R      3.9Mb
        libs  14.3Mb
    ```

# pkgsearch

<details>

* Version: 3.0.2
* Source code: https://github.com/cran/pkgsearch
* URL: https://github.com/r-hub/pkgsearch, https://r-hub.github.io/pkgsearch
* BugReports: https://github.com/r-hub/pkgsearch/issues
* Date/Publication: 2019-12-19 18:50:06 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"pkgsearch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     10  18 ggmap      3.0.0    ORPHANED         1y Spatial Visualization with g...
    > ps()
    - "visualization" ---------------------------- 1081 packages in 0.006 seconds -
    
    Error: Expected a vector, not a `package_version/numeric_version` object
    [1m<error/vctrs_error_scalar_type>[22m
    Expected a vector, not a `package_version/numeric_version` object
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m├─(if (getRversion() >= "3.4") withAutoprint else force)(...)
    [90m  2. [39m│ └─base::source(...)
    [90m  3. [39m│   ├─base::print(yy$value)
    [90m  4. [39m│   └─pkgsearch:::print.pkg_search_result(yy$value)
    [90m  5. [39m│     └─pkgsearch:::cat_hit(x, i) [90m00_pkg_src/pkgsearch/R/print.R:57:4[39m
    [90m  6. [39m│       ├─x[no, ] [90m00_pkg_src/pkgsearch/R/print.R:68:2[39m
    [90m  7. [39m│       ├─pkgsearch:::`[.pkg_search_result`(x, no, ) [90m00_pkg_src/pkgsearch/R/print.R:68:2[39m
    [90m  8. [39m│       ├─base::NextMethod("[") [90m00_pkg_src/pkgsearch/R/api.R:296:2[39m
    [90m  9. [39m│       └─tibble:::`[.tbl_df`(x, no, )
    [90m 10. [39m│         └─tibble:::tbl_subset_row(xo, i = i)
    [
    Execution halted
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
      
      [31m──[39m [31m5. Failure: Different inexact joins work (@test-inexact_join.R#213) [39m [31m───────────────[39m
      inexact_anti_join(left, right, var = t, jvar = t2, method = "last") not equal to last_join %>% dplyr::select(-b) %>% dplyr::filter(FALSE).
      Incompatible type for column `t2`: x logical, y numeric
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 296 | SKIPPED: 0 | WARNINGS: 16 | FAILED: 5 ]
      1. Error: inexact_join input failstates (@test-bad_input.R#96) 
      2. Failure: Different inexact joins work (@test-inexact_join.R#162) 
      3. Failure: Different inexact joins work (@test-inexact_join.R#169) 
      4. Failure: Different inexact joins work (@test-inexact_join.R#206) 
      5. Failure: Different inexact joins work (@test-inexact_join.R#213) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# PML

<details>

* Version: 1.1
* Source code: https://github.com/cran/PML
* URL: https://github.com/xinyue-L/PML
* BugReports: https://github.com/xinyue-L/PML/issues
* Date/Publication: 2019-09-17 08:00:02 UTC
* Number of recursive dependencies: 85

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
    Error: All columns in a tibble must be vectors:
    ```

# portalr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/portalr
* URL: https://weecology.github.io/portalr/, https://github.com/weecology/portalr
* BugReports: https://github.com/weecology/portalr/issues
* Date/Publication: 2020-01-10 11:50:02 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"portalr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) [39m
      Value hashes to 2194929e3e, not 4639dbfbf3
      
      [31m──[39m [31m4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) ([39m
      Value hashes to 255aef31fb, not 60e9306bfc
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: data generated by default setting is same (shrub_cover) (@test-99-regression.R#164) 
      2. Failure: data generated by default setting is same (ant colony_presence_absence) (@test-99-regression.R#175) 
      3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#193) 
      4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#211) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# psychmeta

<details>

* Version: 2.3.4
* Source code: https://github.com/cran/psychmeta
* BugReports: https://github.com/psychmeta/psychmeta/issues
* Date/Publication: 2019-12-19 17:20:02 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"psychmeta")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +               rxxi = c(.8, .7), n_rxxi = c(50, 150),
    +               ux = c(.9, .8), ni_ux = c(50, 150))
    Taylor-Series Artifact Distributions
    ------------------------------------
              mean   var var_res
    qxa_irr  0.905 0.001   0.001
    qxa_drr  0.905 0.001   0.001
    qxi_irr  0.856 0.002   0.001
    qxi_drr  0.856 0.002   0.001
    rxxa_irr 0.819 0.003   0.002
    rxxa_drr 0.819 0.003   0.002
    rxxi_irr 0.734 0.006   0.004
    rxxi_drr 0.734 0.006   0.004
    ux       0.825 0.004   0.000
    ut       0.781 0.005   0.000
    
    > 
    > create_ad(ad_type = "int", rxxa = c(.9, .8), n_rxxa = c(50, 150),
    +               rxxi = c(.8, .7), n_rxxi = c(50, 150),
    +               ux = c(.9, .8), ni_ux = c(50, 150))
    Error: All columns in a tibble must be vectors:
    ```

# readwritesqlite

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/readwritesqlite
* URL: https://github.com/poissonconsulting/readwritesqlite
* BugReports: https://github.com/poissonconsulting/readwritesqlite/issues
* Date/Publication: 2019-07-23 16:50:02 UTC
* Number of recursive dependencies: 71

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
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 443 | SKIPPED: 0 | WARNINGS: 27 | FAILED: 1 ]
      1. Failure: initialized even with no rows of data (@test-write.R#592) 
      
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
* Number of recursive dependencies: 41

Run `revdep_details(,"rematch2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > pos <- re_exec(notables, name_rex)
    > pos
    Error: Expected a vector, not a `rematch_records` object
    [1m<error/vctrs_error_scalar_type>[22m
    Expected a vector, not a `rematch_records` object
    [1mBacktrace:[22m
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
    [90m 
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      + }
      Loading required package: testthat
      [31m──[39m [31m1. Error: corner cases (@test-exec-all.R#46) [39m [31m──────────────────────────────────────[39m
      `x` must be a vector, not a `rematch_allrecords` object
      [1mBacktrace:[22m
      [90m 1. [39mrematch2::re_exec_all(.text <- character(), "")
      [90m 8. [39mvctrs:::stop_scalar_type(...)
      [90m 9. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 61

Run `revdep_details(,"RmarineHeatWaves")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ts_dat <- make_whole(sst_WA)
    > res <- detect(ts_dat, climatology_start = "1983-01-01",
    +               climatology_end = "2012-12-31")
    Error: Can't cast <double[,31]> to <double>.
    Can not decrease dimensions
    [1m<error/vctrs_error_incompatible_cast>[22m
    Can't cast <double[,31]> to <double>.
    Can not decrease dimensions
    [1mBacktrace:[22m
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
    [90m 10. [39m  └─vctrs:::shap
    Execution halted
    ```

# rsample

<details>

* Version: 0.0.5
* Source code: https://github.com/cran/rsample
* URL: https://tidymodels.github.io/rsample
* BugReports: https://github.com/tidymodels/rsample/issues
* Date/Publication: 2019-07-12 22:20:11 UTC
* Number of recursive dependencies: 90

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
      
      [31m──[39m [31m3. Failure: Bootstrap estimate of mean is close to estimate of mean from normal dist[39m
      ttest$estimate not equal to single_bca_res$.estimate.
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 127

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

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("RSDA")
      [31m──[39m [31m1. Failure: multiplication works (@test-read_sym_table.R#9) [39m [31m───────────────────────[39m
      is.sym.modal(sym.table$F3) isn't true.
      
      [31m──[39m [31m2. Failure: multiplication works (@test-read_sym_table.R#11) [39m [31m──────────────────────[39m
      is.sym.set(sym.table$F5) isn't true.
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 24 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: multiplication works (@test-read_sym_table.R#9) 
      2. Failure: multiplication works (@test-read_sym_table.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rubias

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/rubias
* Date/Publication: 2019-06-10 15:00:03 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"rubias")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # note that in practice you will probably want to specify
    > # your own directory...
    > 
    > # run the function
    > write_gsi_sim_mixture(chinook_mix, 5, prefix)
    Error: No common type for `value` <double> and `x` <character>.
    [1m<error/vctrs_error_incompatible_type>[22m
    No common type for `value` <double> and `x` <character>.
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m├─rubias::write_gsi_sim_mixture(chinook_mix, 5, prefix)
    [90m  2. [39m│ ├─base::`[<-`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m  3. [39m│ └─tibble:::`[<-.tbl_df`(`*tmp*`, is.na(mix), value = 0) [90m00_pkg_src/rubias/R/write_gsi_sim_mixture.R:36:2[39m
    [90m  4. [39m│   └─tibble:::tbl_subassign_matrix(x, j, value)
    [90m  5. [39m│     └─tibble:::map2(x[col_idx], cells[col_idx], `vec_slice<-`, value)
    [90m  6. [39m│       └─base::mapply(.f, .x, .y, MoreArgs = list(...), SIMPLIFY = FALSE)
    [90m  7. [39m│         └─(function (x, i, value) ...
    [90m  8. [39m├─vctrs:::vec_type2_dispatch(x = x, y = y, x_arg = x_arg, y_arg = y_arg)
    [90m  9. [39m├─vctrs::vec_ptype2.
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
* Number of recursive dependencies: 60

Run `revdep_details(,"ruler")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Error: is_exposure works (@test-exposure.R#166) [39m [31m────────────────────────────────[39m
      `x` must be a vector, not a function
      [1mBacktrace:[22m
      [90m 1. [39mbase::`[[<-`(...)
      [90m 7. [39mvctrs:::stop_scalar_type(...)
      [90m 8. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 44

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

# silicate

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/silicate
* Date/Publication: 2019-10-09 11:30:02 UTC
* Number of recursive dependencies: 138

Run `revdep_details(,"silicate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘silicate-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: TRI0
    > ### Title: TRI0 model, structural triangulations
    > ### Aliases: TRI0 TRI0.default TRI0.TRI TRI0.PATH0 TRI0.PATH
    > 
    > ### ** Examples
    > 
    > tri <- TRI0(minimal_mesh)
    Error: Argument 5 must be length 12, not 2
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m2. Error: building sf works (@test-spatial-build.R#6) [39m [31m─────────────────────────────[39m
      `x` must be a vector, not a `sfc_MULTIPOLYGON/sfc` object
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_s3_class(build_sf(PATH(minimal_mesh)), "sf")
      [90m 12. [39mvctrs:::stop_scalar_type(...)
      [90m 13. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 92 | SKIPPED: 7 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: print works (@test-print.R#11) 
      2. Error: building sf works (@test-spatial-build.R#6) 
      
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
* Number of recursive dependencies: 98

Run `revdep_details(,"simrel")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("simrel")
      [31m──[39m [31m1. Error: Prepare Design (@test-utils.R#44) [39m [31m───────────────────────────────────────[39m
      Can't join on 'q' x 'q' because of incompatible types (list / list)
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_identical(prepare_design(opts), dgn)
      [90m 3. [39mtestthat:::compare.default(act$val, exp$val)
      [90m 5. [39mdplyr:::all.equal.tbl_df(x, y, ...)
      [90m 6. [39mdplyr:::equal_data_frame(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 169 | SKIPPED: 21 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: Prepare Design (@test-utils.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simTool

<details>

* Version: 1.1.4
* Source code: https://github.com/cran/simTool
* URL: https://github.com/MarselScheer/simTool
* BugReports: https://github.com/MarselScheer/simTool/issues
* Date/Publication: 2019-09-14 18:50:02 UTC
* Number of recursive dependencies: 72

Run `revdep_details(,"simTool")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "Estimated replications per hour:  27844"
      [1] "Estimated replications per hour:  1483600"
      [1] "Estimated replications per hour:  133051"
      [1] "Estimated replications per hour:  2898787"
      [1] "Estimated replications per hour:  204311"
      [31m──[39m [31m1. Failure: One group for summary_fun. Results were created and stored in simulation[39m
      eg$simulation[[col]] not identical to expected_df[[col]].
      names for current but not for target
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 120 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: One group for summary_fun. Results were created and stored in simulation (@test_eval_tibbles.R#791) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# skimr

<details>

* Version: 2.0.2
* Source code: https://github.com/cran/skimr
* URL: https://docs.ropensci.org/skimr (website), https://github.com/ropensci/skimr
* BugReports: https://github.com/ropensci/skimr/issues
* Date/Publication: 2019-11-26 14:30:03 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"skimr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      input$skim_variable not identical to c("Sepal.Length", "Sepal.Width").
      names for target but not for current
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 564 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 7 ]
      1. Failure: skim returns expected response for numeric vectors (@test-skim.R#34) 
      2. Failure: skim returns expected response for factor vectors (@test-skim.R#178) 
      3. Failure: skim returns expected response for logical vectors (@test-skim.R#267) 
      4. Failure: skim returns expected response for complex vectors (@test-skim.R#319) 
      5. Failure: skim returns expected response for ts vectors (@test-skim.R#398) 
      6. Failure: You can use tidyselect negation (@test-skim.R#795) 
      7. Failure: Tidyselect helpers work as expected (@test-skim.R#804) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sociome

<details>

* Version: 1.3.0
* Source code: https://github.com/cran/sociome
* BugReports: https://github.com/NikKrieger/sociome/issues
* Date/Publication: 2019-11-06 23:40:06 UTC
* Number of recursive dependencies: 107

Run `revdep_details(,"sociome")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 5. [39mtestthat:::compare.default(act$val, exp$val)
      [90m 7. [39mdplyr:::all.equal.tbl_df(x, y, ...)
      [90m 8. [39mdplyr:::equal_data_frame(...)
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 4 | WARNINGS: 6 | FAILED: 6 ]
      1. Error: call tibble for geoids is correct (@test_arg_tibble_decennial1990.R#52) 
      2. Error: call tibble for state only is correct (@test_arg_tibble_decennial1990.R#179) 
      3. Error: call tibble for one state and multiple counties is correct (@test_arg_tibble_decennial1990.R#302) 
      4. Error: call tibble for geoids is correct (@test_arg_tibble_decennial2000.R#52) 
      5. Error: call tibble for state only is correct (@test_arg_tibble_decennial2000.R#183) 
      6. Error: call tibble for one state and multiple counties is correct (@test_arg_tibble_decennial2000.R#310) 
      
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
* Number of recursive dependencies: 90

Run `revdep_details(,"srvyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Incompatible type for column `survey_mean_upp`: x numeric, y matrix
      
      [31m──[39m [31m3. Failure: deff and df work for grouped survey total (@expect-equality.R#61) [39m [31m─────[39m
      `x` not equal to `y`.
      Incompatible type for column `survey_total_low`: x numeric, y matrix
      Incompatible type for column `survey_total_upp`: x numeric, y matrix
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 201 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: deff and df work for grouped survey total (@expect-equality.R#61) 
      2. Failure: deff and df work for grouped survey mean (@expect-equality.R#61) 
      3. Failure: deff and df work for grouped survey total (@expect-equality.R#61) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# stminsights

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/stminsights
* URL: https://github.com/cschwem2er/stminsights
* BugReports: https://github.com/cschwem2er/stminsights/issues
* Date/Publication: 2018-11-24 13:10:03 UTC
* Number of recursive dependencies: 114

Run `revdep_details(,"stminsights")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +  coord_flip() + theme_light() + labs(x = 'Treatment', y = 'Topic Proportion')
    > 
    > 
    > # combine estimates for interaction effects
    > prep_int <- estimateEffect(1:3 ~ treatment * s(pid_rep),
    +  gadarianFit, gadarian)
    > 
    > effects_int <- get_effects(estimates = prep_int,
    +                           variable = 'pid_rep',
    +                           type = 'continuous',
    +                           moderator = 'treatment',
    +                           modval = 1) %>%
    +  bind_rows(
    +    get_effects(estimates = prep_int,
    +                variable = 'pid_rep',
    +                type = 'continuous',
    +                moderator = 'treatment',
    +                modval = 0)
    +  )
    Error: Argument 3 must be length 100, not 2
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘huge’ ‘readr’ ‘scales’ ‘shinyjs’
      All declared Imports should be used.
    ```

# survminer

<details>

* Version: 0.4.6
* Source code: https://github.com/cran/survminer
* URL: http://www.sthda.com/english/rpkgs/survminer/
* BugReports: https://github.com/kassambara/survminer/issues
* Date/Publication: 2019-09-03 23:00:02 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"survminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    $`colon1::rx`
      variable        pval   method   pval.txt
    1       rx 0.001173476 Log-rank p = 0.0012
    
    $`colon2::rx`
      variable         pval   method   pval.txt
    1       rx 4.449283e-05 Log-rank p < 0.0001
    
    > 
    > 
    > # Grouped survfit
    > #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    > # - Group by the treatment "rx" and fit survival curves on each subset
    > # - Returns a list of survfit objects
    > fit <- surv_fit(Surv(time, status) ~ sex,
    +                data = colon, group.by = "rx")
    Error in names(res) <- .collapse(DNAME, FNAME, sep = "::") : 
      'names' attribute [27887] must be the same length as the vector [3]
    Calls: surv_fit
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# textrecipes

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/textrecipes
* URL: https://github.com/tidymodels/textrecipes
* BugReports: https://github.com/tidymodels/textrecipes/issues
* Date/Publication: 2019-09-07 11:20:02 UTC
* Number of recursive dependencies: 97

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
    Error: All columns in a tibble must be vectors:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 62

Run `revdep_details(,"tidyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════════
      [ OK: 546 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 16 ]
      1. Failure: optionally keep empty rows (@test-chop.R#57) 
      2. Failure: gather throws error for weird objects (@test-gather.R#141) 
      3. Failure: .id creates vector of names for vector unnest (@test-nest-legacy.R#177) 
      4. Failure: .id creates vector of names for grouped vector unnest (@test-nest-legacy.R#185) 
      5. Failure: .id creates vector of names for data frame unnest (@test-nest-legacy.R#195) 
      6. Failure: .id creates vector of names for grouped data frame unnest (@test-nest-legacy.R#206) 
      7. Failure: tibble conversion occurs in the `nest.data.frame()` method (@test-nest.R#71) 
      8. Failure: can nest multiple columns (@test-nest.R#80) 
      9. Failure: can nest multiple columns (@test-nest.R#81) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# units

<details>

* Version: 0.6-5
* Source code: https://github.com/cran/units
* URL: https://github.com/r-quantities/units/
* BugReports: https://github.com/r-quantities/units/issues/
* Date/Publication: 2019-10-08 11:40:02 UTC
* Number of recursive dependencies: 72

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

# unpivotr

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/unpivotr
* URL: https://github.com/nacnudus/unpivotr
* BugReports: https://github.com/nacnudus/unpivotr/issues
* Date/Publication: 2019-03-30 19:10:03 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"unpivotr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      a b
    1 1 3
    2 2 4
    > 
    > # Make a tidy representation of each cell
    > (cells <- as_cells(x, col_names = TRUE))
    [38;5;246m# A tibble: 6 x 5[39m
        row   col data_type chr     int
      [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<chr>[39m[23m     [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<int>[39m[23m
    [38;5;250m1[39m     1     1 chr       a        [31mNA[39m
    [38;5;250m2[39m     2     1 int       [31mNA[39m        1
    [38;5;250m3[39m     3     1 int       [31mNA[39m        2
    [38;5;250m4[39m     1     2 chr       b        [31mNA[39m
    [38;5;250m5[39m     2     2 int       [31mNA[39m        3
    [38;5;250m6[39m     3     2 int       [31mNA[39m        4
    > 
    > # Strip the cells in row 1 (the original headers) and use them as data
    > behead(cells, "N", foo)
    Error in functions[[name]] : subscript out of bounds
    Calls: behead ... mutate.tbl_df -> mutate_impl -> <Anonymous> -> map2 -> .f
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ══════════════════════════════════════════════════════════════
      [ OK: 158 | SKIPPED: 0 | WARNINGS: 128 | FAILED: 19 ]
      1. Error: behead() works (@test-behead.R#8) 
      2. Error: the `drop_na` argument of behead() works (@test-behead.R#23) 
      3. Error: behead() works with all common datatypes (@test-behead.R#69) 
      4. Error: behead() handles headers of factor and ordered-factor data types (@test-behead.R#125) 
      5. Error: behead() supports custom formatters (@test-behead.R#130) 
      6. Error: behead() can use row, col and data_type as headers (@test-behead.R#140) 
      7. Error: behead_if() works (@test-behead.R#170) 
      8. Failure: pack() works on common data types (@test-pack.R#36) 
      9. Error: unpack() works on common data types (@test-pack.R#51) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# vctrs

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/vctrs
* URL: https://github.com/r-lib/vctrs
* BugReports: https://github.com/r-lib/vctrs/issues
* Date/Publication: 2019-12-17 17:30:02 UTC
* Number of recursive dependencies: 63

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
      Error: object 'vec_as_location' is not exported by 'namespace:vctrs'
      Execution halted
    ```

