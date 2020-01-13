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
    > ### ** Examples
    > 
    > # Using the deer data set
    > data(deer)
    > data(sh_forest)
    > 
    > # first prepare the data and fit a model
    > m1 <- deer %>% steps_by_burst() %>%
    +   random_steps() %>%
    +   extract_covariates(sh_forest) %>%
    +   mutate(sh.forest = factor(sh.forest)) %>%
    +   fit_clogit(case_ ~ sh.forest * log(sl_) + sl_ + strata(step_id_))
    Warning: Negative row indexes must be between 0 and the number of rows negated (-825). Use `NA` as row index to obtain a row full of `NA` values.
    [90mThis warning is displayed once per session.[39m
    Warning in random_steps.steps_xy(.) :
      Step-lengths or turning angles contained NA, which were removed.
    Error in UseMethod("extract_covariates", x) : 
      no applicable method for 'extract_covariates' applied to an object of class "c('random_steps', 'tbl_df', 'tbl', 'data.frame')"
    Calls: %>% ... _fseq -> freduce -> <Anonymous> -> extract_covariates
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

# c14bazAAR

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/c14bazAAR
* URL: https://docs.ropensci.org/c14bazAAR, https://github.com/ropensci/c14bazAAR
* BugReports: https://github.com/ropensci/c14bazAAR/issues
* Date/Publication: 2020-01-12 16:50:02 UTC
* Number of recursive dependencies: 131

Run `revdep_details(,"c14bazAAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ###   *c14_date_list*
    > ### Aliases: determine_country_by_coordinate
    > ###   determine_country_by_coordinate.default
    > ###   determine_country_by_coordinate.c14_date_list country_attribution
    > ###   finalize_country_name finalize_country_name.default
    > ###   finalize_country_name.c14_date_list standardize_country_name
    > ###   standardize_country_name.default
    > ###   standardize_country_name.c14_date_list
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    > example_c14_date_list %>%
    +   determine_country_by_coordinate() %>%
    +   standardize_country_name() %>%
    +   finalize_country_name()
    Determining country by coordinates... 
    Error in UseMethod("st_join") : 
      no applicable method for 'st_join' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: %>% ... eval -> _fseq -> freduce -> <Anonymous> -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mtestthat::expect_message(...)
      [90m 7. [39mc14bazAAR:::write_c14.default(...) [90mrevdep/checks/c14bazAAR/new/c14bazAAR.Rcheck/00_pkg_src/c14bazAAR/R/c14_date_list_write_c14.R:24:2[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 58 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 7 ]
      1. Failure: classify_material gives back a c14_date_list (@test_c14_date_list_classify_material.R#11) 
      2. Failure: coordinate_precision gives back a c14_date_list (@test_c14_date_list_coordinate_precision.R#10) 
      3. Failure: standardize_country_name gives back a c14_date_list (@test_c14_date_list_country_attribution.R#13) 
      4. Error: (unknown) (@test_c14_date_list_country_attribution.R#39) 
      5. Error: (unknown) (@test_c14_date_list_duplicates.R#3) 
      6. Failure: fuse gives back a c14_date_list (@test_c14_date_list_fuse.R#6) 
      7. Error: list columns are correctly recognized and a message created (@test_c14_date_list_write_c14.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# comperes

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/comperes
* URL: https://github.com/echasnovski/comperes
* BugReports: https://github.com/echasnovski/comperes/issues
* Date/Publication: 2019-12-14 21:40:03 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"comperes")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 233 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 29 ]
      1. Failure: as_longcr.default preserves column types (@test-results-longcr.R#123) 
      2. Failure: as_longcr.default preserves column types (@test-results-longcr.R#130) 
      3. Failure: as_longcr.default preserves column types (@test-results-longcr.R#137) 
      4. Failure: as_longcr.default preserves column types (@test-results-longcr.R#145) 
      5. Failure: as_longcr.default preserves column types (@test-results-longcr.R#152) 
      6. Error: as_longcr.default preserves column types (@test-results-longcr.R#163) 
      7. Failure: as_longcr.widecr preserves column types (@test-results-longcr.R#231) 
      8. Failure: as_longcr.widecr preserves column types (@test-results-longcr.R#241) 
      9. Failure: as_longcr.widecr preserves column types (@test-results-longcr.R#249) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# compstatr

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/compstatr
* URL: https://github.com/slu-openGIS/compstatr
* BugReports: https://github.com/slu-openGIS/compstatr
* Date/Publication: 2019-08-07 21:40:02 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"compstatr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > # load example data
    > testData <- january2018
    > 
    > # identify missing x and y coordinates
    > testData <- cs_missingXY(testData, varX = x_coord, varY = y_coord, newVar = missingXY)
    > 
    > # subset to remove missing data
    > testData <- dplyr::filter(testData, missingXY == FALSE)
    > 
    > # project data
    > testData_sf <- cs_projectXY(testData, varX = x_coord, varY = y_coord)
    > 
    > # project data and transform to new CRS
    > testData_sf <- cs_projectXY(testData, varX = x_coord, varY = y_coord, crs = 4269)
    Error in UseMethod("st_transform") : 
      no applicable method for 'st_transform' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: cs_projectXY -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 7. [39msf::st_transform(out, crs = crs) [90mrevdep/checks/compstatr/new/compstatr.Rcheck/00_pkg_src/compstatr/R/spatial.R:195:4[39m
      
      [31m──[39m [31m2. Error: (unknown) (@test_projectXY.R#31) [39m [31m───────────────────────────────────────────────────────────────────────────────────────[39m
      no applicable method for 'st_transform' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
      [1mBacktrace:[22m
      [90m 1. [39mcompstatr::cs_projectXY(...)
      [90m 2. [39msf::st_transform(out, crs = crs) [90mrevdep/checks/compstatr/new/compstatr.Rcheck/00_pkg_src/compstatr/R/spatial.R:195:4[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 222 | SKIPPED: 3 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: correctly specified functions execute without error (@test_projectXY.R#24) 
      2. Error: (unknown) (@test_projectXY.R#31) 
      
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

# condformat

<details>

* Version: 0.8.0
* Source code: https://github.com/cran/condformat
* URL: http://github.com/zeehio/condformat
* BugReports: http://github.com/zeehio/condformat/issues
* Date/Publication: 2018-10-29 14:10:03 UTC
* Number of recursive dependencies: 73

Run `revdep_details(,"condformat")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      WARNING: Illegal reflective access by org.apache.poi.util.SAXHelper (file:/home/rstudio/git/tibble/revdep/library/condformat/xlsxjars/java/poi-ooxml-3.10.1-20140818.jar) to method com.sun.org.apache.xerces.internal.util.SecurityManager.setEntityExpansionLimit(int)
      WARNING: Please consider reporting this to the maintainers of org.apache.poi.util.SAXHelper
      WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
      WARNING: All illegal access operations will be denied in a future release
      [31m--[39m [31m1. Error: show_row works after modifying data frame (old API) (@test_show.R#135) [39m [31m-------------------------------------------------[39m
      non-numeric argument to binary operator
      [1mBacktrace:[22m
      [90m 1. [39mbase::Ops.data.frame(x, rs)
      
      == testthat results  =================================================================================================================
      [ OK: 125 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: show_row works after modifying data frame (old API) (@test_show.R#135) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘graphics’
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

# crimedata

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/crimedata
* URL: https://github.com/mpjashby/crimedata
* BugReports: https://github.com/mpjashby/crimedata/issues
* Date/Publication: 2019-03-21 23:23:31 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"crimedata")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        |                                                                            
        |                                                                      |   0%
        |                                                                            
        |======================================================================| 100%
      
        |                                                                            
        |                                                                      |   0%
        |                                                                            
        |======================================================================| 100%
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 34 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 1 ]
      1. Failure: return value of get_crime_data is a tibble or SF object (@test_get_crime_data.R#5) 
      
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

*   checking examples ... ERROR
    ```
    ...
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > library(cutpointr)
    > cutpointr(suicide, dsi, suicide, gender) %>%
    +   add_metric(list(ppv, npv)) %>%
    +   select(optimal_cutpoint, subgroup, AUC, sum_sens_spec, ppv, npv)
    Assuming the positive class is yes
    Assuming the positive class has higher x values
    Error in check_roc_curve(optcut) : 
      roc_curve as returned by the method function is not an object of the class roc_cutpointr
    Calls: %>% ... cutpointr_internal -> <Anonymous> -> .f -> check_roc_curve
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 23 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 50 ]
      1. Error: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#7) 
      2. Error: Cutpointr works with different data types (@test-cutpointr.R#23) 
      3. Error: Bootstrap does not return duplicate colnames (@test-cutpointr.R#82) 
      4. Error: Plotting with bootstrapping is silent (@test-cutpointr.R#98) 
      5. Error: AUC calculation is correct and works with Inf and -Inf (@test-cutpointr.R#115) 
      6. Error: Correct midpoints are found (@test-cutpointr.R#139) 
      7. Error: find_metric_name finds metric (@test-cutpointr.R#150) 
      8. Error: no duplicate column names are returned (@test-cutpointr.R#164) 
      9. Error: Correct cutpoints with example data (@test-cutpointr.R#202) 
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 1578 | SKIPPED: 12 | WARNINGS: 2 | FAILED: 12 ]
      1. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#910) 
      2. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#923) 
      3. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#936) 
      4. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#948) 
      5. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#962) 
      6. Failure: model_verbose reports the correct model functions in cross_validate() (@test_cross_validate.R#975) 
      7. Failure: multinomial random predictions work with cross_validate_fn() (@test_cross_validate_fn.R#1448) 
      8. Error: gaussian evaluations are correct in evaluate() (@test_evaluate.R#1069) 
      9. Failure: model_verbose reports the correct model functions in validate() (@test_validate.R#512) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dials

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/dials
* URL: https://tidymodels.github.io/dials, https://github.com/tidymodels/dials
* BugReports: https://github.com/tidymodels/dials/issues
* Date/Publication: 2019-12-02 06:50:02 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"dials")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      + }
      Loading required namespace: xml2
      [31m──[39m [31m1. Failure: updating (@test_param_set.R#56) [39m [31m──────────────────────────────────────────────────────────────────────────────────────[39m
      set_test(p_2) isn't true.
      
      [31m──[39m [31m2. Failure: updating (@test_param_set.R#61) [39m [31m──────────────────────────────────────────────────────────────────────────────────────[39m
      set_test(p_3) isn't true.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 284 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: updating (@test_param_set.R#56) 
      2. Failure: updating (@test_param_set.R#61) 
      
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
   /tmp/Rtmp2yzQXm/dmdScheme_13d4522db7696
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/Rtmp2yzQXm/file13d4525c57209/dmdScheme_0.9.5.tar.gz, installed with
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
   /tmp/Rtmpq5XsZz/dmdScheme_135b15b9b787
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/Rtmpq5XsZz/file135b1ca968f6/dmdScheme_0.9.5.tar.gz, installed with
name:    dmdScheme
version: 0.9.5
Theme switched to dmdScheme_0.9.5
** testing if installed package can be loaded from final location

#############################################
The cache will be in a temporary location and be deleted when you quit R.
It is located at
   /tmp/RtmpGapgRS/dmdScheme_137871c718913
To make it permanent, call
   cache(createPermanent = TRUE)
and restart R
and a permanent cache will be created which will survive restarts.
#############################################


trying URL 'https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/raw/master/schemes/dmdScheme_0.9.5.tar.gz'
Content type 'application/octet-stream' length 27511 bytes (26 KB)
==================================================
downloaded 26 KB

Scheme definition `/tmp/RtmpGapgRS/file137877b1a1386/dmdScheme_0.9.5.tar.gz, installed with
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
      `df %>% rename(e = d)` did not throw an error.
      
      [31m──[39m [31m3. Failure: rename errors with invalid grouped data frame (#640) (@test-select.r#74) [39m [31m─────────────────────────────────────────────[39m
      `df %>% rename(e = b)` did not throw an error.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 3403 | SKIPPED: 14 | WARNINGS: 6 | FAILED: 3 ]
      1. Failure: mutate does not strip names of list-columns (#2675) (@test-mutate.r#297) 
      2. Failure: rename errors with invalid grouped data frame (#640) (@test-select.r#70) 
      3. Failure: rename errors with invalid grouped data frame (#640) (@test-select.r#74) 
      
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

# dssd

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/dssd
* BugReports: https://github.com/DistanceDevelopment/dssd/issues
* Date/Publication: 2019-08-05 13:00:02 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"dssd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > #Load a multi strata unprojected shapefile
    > shapefile.name <- system.file("extdata", "AreaRStrata.shp", package = "dssd")
    > # Need to load shapefile first as it is not projected
    > sf.shape <- sf::read_sf(shapefile.name)
    > # Check current coordinate reference system
    > sf::st_crs(sf.shape)
    Coordinate Reference System:
      EPSG: 4326 
      proj4string: "+proj=longlat +datum=WGS84 +no_defs"
    > # Define a European Albers Equal Area projection
    > proj4string <- "+proj=aea +lat_1=43 +lat_2=62 +lat_0=30 +lon_0=-9 +x_0=0 +
    +                 y_0=0 +ellps=intl +units=km"
    > # Project the study area on to a flat plane
    > projected.shape <- sf::st_transform(sf.shape, crs = proj4string)
    > # Create region with default strata names
    > region <- make.region(region.name = "study area",
    +                       shape = projected.shape)
    Error in make.region(region.name = "study area", shape = projected.shape) : 
      This data type is not currently supported.
    Execution halted
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 0 | WARNINGS: 5 | FAILED: 6 ]
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
      [31m──[39m [31m6. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summarize.R#17) [39m [31m───────────────────────────────────────────[39m
      [[ ]] improper number of subscripts
      
      # Scenario model: openfair_tef_tc_diff_lm
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Failure: crit as data (@test-cv.R#4) [39m [31m──────────────────────────────────────────────────────────────────────────────────────────[39m
      `capture.output(print(crit))` threw an error.
      Message: Expected a vector, not a `list/crit` object
      Class:   vctrs_error_scalar_type/vctrs_error/rlang_error/error/condition
      [1mBacktrace:[22m
      [90m  1. [39mbase::print(crit)
      [90m 19. [39mvctrs:::stop_scalar_type(...)
      [90m 20. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
        intersect, setdiff, setequal, union
    
    Error: x is not a tsibble.
    [1m<error/rlang_error>[22m
    x is not a tsibble.
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m└─`%>%`(...)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          └─function_list[[i]](value)
    [90m  8. [39m            ├─dplyr::filter(., Quarter < yearquarter("2006 Q1"))
    [90m  9. [39m            └─tsibble:::filter.tbl_ts(., Quarter < yearquarter("2006 Q1"))
    [90m 10. [39m              └─tsibble:::by_row(...)
    [90m 11. [39m                └─tsibble:::update_meta(tbl, .data, ordered = ordered, interval = interval(.data))
    [90m 12. [39m                  └─tsibble:::restore_index_class(...)
    [90m 13. [39m                   
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
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
      [90m 10. [39m                  ├─dplyr::filter(us_deaths, index < tsibble::yearmonth("1978 Jan")) [90msetup-data.R:4:0[39m
      [90m 11. [39m                  └─tsibble:::filter.tbl_ts(us_deaths, index < tsibble::yearmonth("1978 Jan"))
      [90m 12. [39m              
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
    Warning: `...` must not be empty for ungrouped data frames.
    Did you want `data = everything()`?
    Error: x is not a tsibble.
    [1m<error/rlang_error>[22m
    x is not a tsibble.
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m└─vic_elec %>% ACF(Temperature)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            └─feasts::ACF(., Temperature)
    [90m 10. [39m              └─feasts:::build_cf(...) [90m00_pkg_src/feasts/R/acf.R:84:2[39m
    [90m 11. [39m                └─`%>%`(...) [90m00_pkg_src/feasts/R/acf.R:181:2[39m
    [90m 12. [39m                  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m 13. [39m    
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 36 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 9 ]
      1. Error: ACF (@test-cf.R#6) 
      2. Error: PACF (@test-cf.R#36) 
      3. Error: CCF (@test-cf.R#67) 
      4. Error: (unknown) (@test-graphics.R#4) 
      5. Failure: Bad inputs for seats decomposition (@test-seats.R#8) 
      6. Error: X-13ARIMA-SEATS decomposition (@test-seats.R#30) 
      7. Failure: Bad inputs for X11 decomposition (@test-x11.R#7) 
      8. Error: Additive X11 decomposition (@test-x11.R#24) 
      9. Error: Multiplicative X11 decomposition (@test-x11.R#48) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# fgeo.analyze

<details>

* Version: 1.1.11
* Source code: https://github.com/cran/fgeo.analyze
* URL: https://github.com/forestgeo/fgeo.analyze
* BugReports: https://github.com/forestgeo/fgeo.analyze/issues
* Date/Publication: 2019-06-18 22:11:12 UTC
* Number of recursive dependencies: 89

Run `revdep_details(,"fgeo.analyze")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      $time
      [1] 4.525246
      
      $date1
      [1] 18937.96
      
      $date2
      [1] 20600.72
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 306 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: add_cluster: has the expected structure (@test-add_cluster.R#13) 
      
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

*   checking examples ... ERROR
    ```
    Running examples in ‘foieGras-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fit_ssm
    > ### Title: Fit a continuous-time state-space model to filter Argos
    > ###   satellite geolocation data
    > ### Aliases: fit_ssm
    > 
    > ### ** Examples
    > 
    > ## fit rw model to one seal with Argos KF data
    > data(ellie)
    > fit <- fit_ssm(ellie, model = "rw", time.step = 24)
    
    pre-filtering data...
    Error in UseMethod("st_transform") : 
      no applicable method for 'st_transform' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: fit_ssm ... freduce -> withVisible -> <Anonymous> -> st_transform
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Unexpected column names in Data, type `?fit_ssm` for details
      [1mBacktrace:[22m
      [90m 1. [39mfoieGras::prefilter(ellie_sf, vmax = 10, ang = -1, min.dt = 120)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: fit_ssm defaults + crw + KF return foieGras list w 15 elements (@test-fit_ssm.R#34) 
      2. Error: (unknown) (@test-fmap.R#16) 
      3. Failure: join catches unequal rows in input (@test-join.R#26) 
      4. Error: (unknown) (@test-osar.R#5) 
      5. Error: (unknown) (@test-plot.R#7) 
      6. Error: (unknown) (@test-prefilter.R#7) 
      
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

# genio

<details>

* Version: 1.0.12
* Source code: https://github.com/cran/genio
* URL: https://github.com/OchoaLab/genio
* BugReports: https://github.com/OchoaLab/genio/issues
* Date/Publication: 2019-12-17 23:00:05 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"genio")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(genio)
      > 
      > test_check("genio")
      [31m──[39m [31m1. Failure: write_phen works (@test-genio.R#477) [39m [31m─────────────────────────────────────────────────────────────────────────────────[39m
      `phen1` not equal to `phen2`.
      Attributes: < Component "class": Lengths (3, 4) differ (string compare on first 3) >
      Attributes: < Component "class": 3 string mismatches >
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 249 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: write_phen works (@test-genio.R#477) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gghighlight

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/gghighlight
* URL: https://github.com/yutannihilation/gghighlight/
* BugReports: https://github.com/yutannihilation/gghighlight/issues
* Date/Publication: 2018-07-04 08:10:03 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"gghighlight")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 157 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 9 ]
      1. Failure: gghighligt_line() with usual arguments works (@test-gghighligt_old_line.R#12) 
      2. Failure: gghighligt_line() with usual arguments works (@test-gghighligt_old_line.R#15) 
      3. Error: gghighligt_line() with usual arguments works (@test-gghighligt_old_line.R#19) 
      4. Failure: gghighligt_line() works with facets (@test-gghighligt_old_line.R#76) 
      5. Failure: gghighligt_line() works with facets (@test-gghighligt_old_line.R#79) 
      6. Error: gghighligt_line() works with facets (@test-gghighligt_old_line.R#83) 
      7. Failure: gghighligt_line() works with numerical predicate (@test-gghighligt_old_line.R#107) 
      8. Failure: gghighligt_line() works with numerical predicate (@test-gghighligt_old_line.R#110) 
      9. Error: gghighligt_line() works with numerical predicate (@test-gghighligt_old_line.R#114) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggplot2

<details>

* Version: 3.2.1
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Date/Publication: 2019-08-10 22:30:13 UTC
* Number of recursive dependencies: 151

Run `revdep_details(,"ggplot2")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  8. [39mggplot2:::by_layer(function(l, d) l$compute_statistic(d, layout)) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/plot-build.r:72:2[39m
      [90m  9. [39mggplot2:::f(l = layers[[i]], d = data[[i]]) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/plot-build.r:42:6[39m
      [90m 10. [39ml$compute_statistic(d, layout) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/plot-build.r:72:2[39m
      [90m 11. [39mggplot2:::f(..., self = self) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/ggproto.r:177:4[39m
      [90m 12. [39mself$stat$compute_layer(data, params, layout) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/layer.r:284:4[39m
      [90m 13. [39mggplot2:::f(..., self = self) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/ggproto.r:177:4[39m
      [90m 14. [39mggplot2:::check_required_aesthetics(...) [90mrevdep/checks/ggplot2/new/ggplot2.Rcheck/00_pkg_src/ggplot2/R/stat-.r:73:4[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 1096 | SKIPPED: 105 | WARNINGS: 1 | FAILED: 2 ]
      1. Failure: geom_sf_text() and geom_sf_label() draws correctly (@test-geom-sf.R#46) 
      2. Failure: geom_sf_text() and geom_sf_label() draws correctly (@test-geom-sf.R#49) 
      
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

# ggspatial

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/ggspatial
* URL: https://github.com/paleolimbot/ggspatial
* BugReports: https://github.com/paleolimbot/ggspatial/issues
* Date/Publication: 2018-12-14 21:10:04 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"ggspatial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > load_longlake_data()
    > df_spatial(longlake_osm)
    [38;5;246m# A tibble: 260,463 x 6[39m
             x        y band1 band2 band3 feature_id
         [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<int>[39m[23m [3m[38;5;246m<fct>[39m[23m     
    [38;5;250m 1[39m [4m4[24m[4m0[24m[4m9[24m891. 5[4m0[24m[4m8[24m[4m4[24m849.   180   217   163 1         
    [38;5;250m 2[39m [4m4[24m[4m0[24m[4m9[24m895. 5[4m0[24m[4m8[24m[4m4[24m849.   184   219   164 2         
    [38;5;250m 3[39m [4m4[24m[4m0[24m[4m9[24m898. 5[4m0[24m[4m8[24m[4m4[24m849.   189   223   167 3         
    [38;5;250m 4[39m [4m4[24m[4m0[24m[4m9[24m901. 5[4m0[24m[4m8[24m[4m4[24m849.   186   223   166 4         
    [38;5;250m 5[39m [4m4[24m[4m0[24m[4m9[24m905. 5[4m0[24m[4m8[24m[4m4[24m849.   166   210   157 5         
    [38;5;250m 6[39m [4m4[24m[4m0[24m[4m9[24m908. 5[4m0[24m[4m8[24m[4m4[24m849.   163   208   156 6         
    [38;5;250m 7[39m [4m4[24m[4m0[24m[4m9[24m911. 5[4m0[24m[4m8[24m[4m4[24m849.   160   206   155 7         
    [38;5;250m 8[39m [4m4[24m[4m0[24m[4m9[24m915. 5[4m0[24m[4m8[24m[4m4[24m849.   154   202   151 8         
    [38;5;250m 9[39m [4m4[24m[4m0[24m[4m9[24m918. 5[4m0[24m[4m8[24m[4m4[24m849.   156   203   152 9         
    [38;5;250m10[39m [4m4[24m[4m0[24m[4m9[24m921. 5[4m0[24m[4m8[24m[4m4[24m849.   149   199   150 10        
    [38;5;246m# … with 260,453 more rows[39m
    > df_spatial(longlake_depthdf)
    Error in methods::as(sf::st_zm(x), "Spatial") : 
      no method or default for coercing “tbl_df” to “Spatial”
    Calls: df_spatial -> df_spatial.sf -> df_spatial -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mggspatial::df_spatial(longlake_depthdf)
      [90m 2. [39mggspatial:::df_spatial.sf(longlake_depthdf) [90mrevdep/checks/ggspatial/new/ggspatial.Rcheck/00_pkg_src/ggspatial/R/df-spatial.R:17:2[39m
      [90m 4. [39mmethods::as(sf::st_zm(x), "Spatial") [90mrevdep/checks/ggspatial/new/ggspatial.Rcheck/00_pkg_src/ggspatial/R/df-spatial.R:163:2[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 59 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 6 ]
      1. Failure: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      2. Failure: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      3. Error: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      4. Error: polypath works as intended (@test-geom-polypath.R#5) 
      5. Error: geom_spatial_* geoms work properly (@test-geom_spatial.R#26) 
      6. Error: stat_spatial_identity function (@test-geom_spatial.R#93) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘reshape2’ ‘rosm’
      All declared Imports should be used.
    ```

# googledrive

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/googledrive
* URL: https://googledrive.tidyverse.org, https://github.com/tidyverse/googledrive
* BugReports: https://github.com/tidyverse/googledrive/issues
* Date/Publication: 2019-08-19 16:50:09 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"googledrive")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m3. Failure: `[` retains dribble class when possible (@test-dribble-class.R#70) [39m [31m───────────────────────────────────────────────────[39m
      `d` inherits from `tbl_df/tbl/data.frame` not `dribble`.
      
      [31m──[39m [31m4. Failure: `[` retains dribble class when possible (@test-dribble-class.R#71) [39m [31m───────────────────────────────────────────────────[39m
      d[-4] inherits from `tbl_df/tbl/data.frame` not `dribble`.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 267 | SKIPPED: 66 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: validate_dribble() checks class, var names, var types (@test-dribble-class.R#26) 
      2. Failure: validate_dribble() checks class, var names, var types (@test-dribble-class.R#34) 
      3. Failure: `[` retains dribble class when possible (@test-dribble-class.R#70) 
      4. Failure: `[` retains dribble class when possible (@test-dribble-class.R#71) 
      
      Error: testthat unit tests failed
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 187 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: can shim a single side (@test-utils-sheet-geometry.R#38) 
      2. Error: can shim two opposing sides (@test-utils-sheet-geometry.R#49) 
      3. Error: can shim on two perpendicular sides (@test-utils-sheet-geometry.R#56) 
      4. Error: can shim three sides (@test-utils-sheet-geometry.R#67) 
      5. Error: can shim four sides (@test-utils-sheet-geometry.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gravitas

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/gravitas
* URL: https://github.com/Sayani07/gravitas/
* BugReports: https://github.com/Sayani07/gravitas/issues
* Date/Publication: 2019-11-05 14:30:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"gravitas")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   ) +
    +   scale_y_sqrt()
    Error: x is not a tsibble.
    [1m<error/rlang_error>[22m
    x is not a tsibble.
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m└─`%>%`(...)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          └─function_list[[i]](value)
    [90m  8. [39m            ├─dplyr::filter(., customer_id == 10017936)
    [90m  9. [39m            └─tsibble:::filter.tbl_ts(., customer_id == 10017936)
    [90m 10. [39m              └─tsibble:::by_row(...)
    [90m 11. [39m                └─tsibble:::update_meta(tbl, .data, ordered = ordered, interval = interval(.data))
    [90m 12. [39m                  └─tsibble:::restore_index_class(...)
    [90m 13. [39m                    └─tsibble::in
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 13. [39mmagrittr::freduce(value, `_function_list`)
      [90m 15. [39mfunction_list[[k]](value)
      [90m 16. [39mgravitas::create_gran(., gran2, hierarchy_tbl)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 121 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: gran_advice class (@test-gran_advice.R#36) 
      2. Error: tibble output (@test-harmony.R#43) 
      3. Error: norun check runs in create_gran (@test-harmony.R#48) 
      4. Error: character output (@test-is_harmony.R#27) 
      5. Failure: throws error with incorrect input for granularity 2 (@test-is_harmony.R#86) 
      6. Error: character output (@test-prob_plot.R#29) 
      
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
      [32m✔[39m Setting active project to [34m'/tmp/RtmpdYoOfC/model'[39m
      [32m✔[39m Writing [34m'R/random_forest-constructor.R'[39m
      [32m✔[39m Writing [34m'R/random_forest-fit.R'[39m
      [32m✔[39m Writing [34m'R/random_forest-predict.R'[39m
      [31m●[39m Run [90m`devtools::document()`[39m
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Error: the fundamentals work (@test-cran_only.R#4) [39m [31m────────────────────────────────────────────────────────────────────────────[39m
      `goal` must be a vector, not a primitive function
      [1mBacktrace:[22m
      [90m  1. [39mhealthcareai::machine_learn(...)
      [90m 25. [39mvctrs:::stop_scalar_type(...)
      [90m 26. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

# ipumsr

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/ipumsr
* URL: https://www.ipums.org, https://github.com/mnpopcenter/ipumsr
* BugReports: https://github.com/mnpopcenter/ipumsr/issues
* Date/Publication: 2019-06-04 17:00:03 UTC
* Number of recursive dependencies: 108

Run `revdep_details(,"ipumsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    Reading data file...
    > 
    > if (require(sf)) {
    +   sf <- read_ipums_sf(ipums_example("nhgis0008_shape_small.zip"))
    +   data_sf <- ipums_shape_inner_join(data, sf, by = "GISJOIN")
    + }
    Loading required package: sf
    Linking to GEOS 3.7.1, GDAL 2.4.0, PROJ 5.2.0
    options:        ENCODING=latin1 
    Reading layer `US_pmsa_1990' from data source `/tmp/Rtmp3n9odv/file140e109d0f88/US_pmsa_1990.shp' using driver `ESRI Shapefile'
    Simple feature collection with 71 features and 8 fields
    geometry type:  MULTIPOLYGON
    dimension:      XY
    bbox:           xmin: -2336182 ymin: -1247086 xmax: 2075339 ymax: 1476544
    epsg (SRID):    NA
    proj4string:    +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs
    Error in UseMethod("st_agr<-") : 
      no applicable method for 'st_agr<-' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: ipums_shape_inner_join ... ipums_shape_join.sf -> allign_id_vars -> [[<- -> [[<-.sf -> st_agr<-
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 172 | SKIPPED: 11 | WARNINGS: 0 | FAILED: 10 ]
      1.  Error: Can read NHGIS extract (with shape as sf) (@test_nhgis.r#31) 
      2.  Error: Can read NHGIS extract (with shape as sf - 1 layer unzipped) (@test_nhgis.r#54) 
      3.  Error: Can read NHGIS extract (with shape as sf - 2 layers unzipped) (@test_nhgis.r#93) 
      4.  Error: NHGIS - sf and sp polygon-data relationships didn't get scrambled in import (@test_nhgis.r#133) 
      5.  Error: Basic join works (sf) (@test_shape_join.r#8) 
      6.  Error: suffix argument works (sf) (@test_shape_join.r#33) 
      7.  Error: complicated by works (sf) (@test_shape_join.r#46) 
      8.  Error: error for missing a by variable (sf) (@test_shape_join.r#68) 
      9.  Error: Join failures are mentioned (@test_shape_join.r#77) 
      10. Error: Character -> Integer conversion works (#16) (@test_shape_join.r#105) 
      
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

# jpmesh

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/jpmesh
* URL: https://github.com/uribo/jpmesh#readme
* BugReports: https://github.com/uribo/jpmesh/issues
* Date/Publication: 2019-05-09 07:50:03 UTC
* Number of recursive dependencies: 89

Run `revdep_details(,"jpmesh")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  1. [39mtestthat::expect_equivalent(...)
      [90m  4. [39m`%>%`(...)
      [90m  6. [39m[ base::eval(...) ][90m with 1 more call[39m
      [90m  8. [39mjpmesh:::`_fseq`(`_lhs`)
      [90m  9. [39mmagrittr::freduce(value, `_function_list`)
      [90m 10. [39mfunction_list[[i]](value)
      [90m 11. [39msf::st_union(.)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 175 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: multiplication works (@test-administration_mesh.R#8) 
      2. Error: corners (@test-neighborhood.R#100) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 176 marked UTF-8 strings
    ```

# jpndistrict

<details>

* Version: 0.3.4
* Source code: https://github.com/cran/jpndistrict
* URL: https://uribo.github.io/jpndistrict/
* BugReports: https://github.com/uribo/jpndistrict/issues
* Date/Publication: 2019-05-23 06:20:03 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"jpndistrict")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      city_code city                                                        geometry
      [3m[38;5;246m<chr>[39m[23m     [3m[38;5;246m<chr>[39m[23m                                             [3m[38;5;246m<MULTIPOLYGON [°]>[39m[23m
    [38;5;250m1[39m 33103     岡山市 東区… (((133.9958 34.61302, 133.9902 34.61591, 133.9857 34.6255…
    > jpn_cities(jis_code = c(33103, 33104, 33205))
    Simple feature collection with 3 features and 2 fields
    geometry type:  MULTIPOLYGON
    dimension:      XY
    bbox:           xmin: 133.4448 ymin: 34.29839 xmax: 134.1228 ymax: 34.78309
    epsg (SRID):    4326
    proj4string:    +proj=longlat +datum=WGS84 +no_defs
    [38;5;246m# A tibble: 3 x 3[39m
      city_code city                                                        geometry
      [3m[38;5;246m<chr>[39m[23m     [3m[38;5;246m<chr>[39m[23m                                             [3m[38;5;246m<MULTIPOLYGON [°]>[39m[23m
    [38;5;250m1[39m 33103     岡山市 東区… (((133.9958 34.61302, 133.9902 34.61591, 133.9857 34.6255…
    [38;5;250m2[39m 33104     岡山市 南区… (((133.9109 34.64389, 133.9131 34.64387, 133.9131 34.6382…
    [38;5;250m3[39m 33205     笠岡市    (((133.5929 34.37393, 133.5942 34.37341, 133.5935 34.3721…
    > jpn_cities(jis_code = c(33103, 34107))
    Error in UseMethod("st_geometry") : 
      no applicable method for 'st_geometry' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: jpn_cities ... reduce_impl -> fn -> rbind -> st_sfc -> st_geometry
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Simple feature collection with 65 features and 4 fields
      geometry type:  POINT
      dimension:      XY
      bbox:           xmin: 123.0045 ymin: 24.06092 xmax: 131.2989 ymax: 27.03917
      epsg (SRID):    4612
      proj4string:    +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 80 | SKIPPED: 1 | WARNINGS: 2 | FAILED: 4 ]
      1. Error: (unknown) (@test-export.R#3) 
      2. Error: prefecture (@test-find_city.R#12) 
      3. Error: Failed (@test-find_city.R#38) 
      4. Error: city (@test-find_city.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 188 marked UTF-8 strings
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 258 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 50 ]
      1. Failure: add_id works on grouped_df (@test-id.R#46) 
      2. Failure: add_id works on grouped_df (@test-id.R#55) 
      3. Failure: key_by_id works on grouped_df (@test-id.R#85) 
      4. Failure: key_by_id works on grouped_df (@test-id.R#96) 
      5. Failure: key_by_id works on grouped_df (@test-id.R#108) 
      6. Failure: arrange.keyed_df works (@test-keyed-df-one-tbl.R#324) 
      7. Failure: arrange.keyed_df works (@test-keyed-df-one-tbl.R#325) 
      8. Failure: arrange.keyed_df works (@test-keyed-df-one-tbl.R#326) 
      9. Failure: arrange.keyed_df works (@test-keyed-df-one-tbl.R#337) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# MachineShop

<details>

* Version: 2.0.0
* Source code: https://github.com/cran/MachineShop
* URL: https://brian-j-smith.github.io/MachineShop/
* BugReports: https://github.com/brian-j-smith/MachineShop/issues
* Date/Publication: 2019-12-10 22:40:07 UTC
* Number of recursive dependencies: 195

Run `revdep_details(,"MachineShop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following object is masked from ‘package:stats’:
    
        step
    
    > library(MASS)
    
    Attaching package: ‘MASS’
    
    The following object is masked from ‘package:dplyr’:
    
        select
    
    > 
    > rec1 <- recipe(medv ~ crim + zn + indus + chas + nox + rm, data = Boston)
    > rec2 <- recipe(medv ~ chas + nox + rm + age + dis + rad + tax, data = Boston)
    > 
    > fit(SelectedRecipe(rec1, rec2), model = GLMModel)
    Warning: train resampling failed for GLMModel with error:
    task 1 failed - "no applicable method for 'response' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')""
    Error: train resampling failed for all models
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.3Mb
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
* Number of recursive dependencies: 95

Run `revdep_details(,"mcp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      2: response ~ 1 ~ 0 + time
      3: response ~ 1 ~ 1 + time
    
    Population-level parameters:
    Error: `by` can't contain join column `name` which is missing from LHS
    [1m<error/rlang_error>[22m
    `by` can't contain join column `name` which is missing from LHS
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m├─base::summary(ex_fit)
    [90m  2. [39m└─mcp:::summary.mcpfit(ex_fit)
    [90m  3. [39m  └─mcp:::get_summary(fit, width, varying = FALSE, prior = prior) [90m00_pkg_src/mcp/R/mcpfit_methods.R:239:4[39m
    [90m  4. [39m    └─`%>%`(...) [90m00_pkg_src/mcp/R/mcpfit_methods.R:142:4[39m
    [90m  5. [39m      ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  6. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  7. [39m        └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  8. [39m          └─mcp:::`_fseq`(`_lhs`)
    [90m  9. [39m            └─magrittr::freduce(value, `_function_list`)
    [90m 10. [39m              └─function_list[[i]](value)
    [90m 11. [39m                ├─dplyr::left_join(., simu
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4. Error: Good priors: dirichlet(3), dirichlet(2) (@test-runs.R#335) 
      5. Error: Good y:
          y ~ 1 (@test-runs.R#277) 
      6. Error: Good y:
          y ~ 1, y ~ 1 ~ 1, rel(1) + (1 | id) ~ rel(1) + x, ~1 (@test-runs.R#277) 
      7. Error: Good y:
          ok_y ~ 1 (@test-runs.R#277) 
      8. Error: Good intercepts:
          ok_y ~ 1 (@test-runs.R#277) 
      9. Error: Good intercepts:
          y ~ 0, 1 ~ 1, 1 ~ 0, 1 ~ 1 (@test-runs.R#277) 
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
      
      [31m──[39m [31m3. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.R#119) [39m [31m───────────────────────────────────────────[39m
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

# NipponMap

<details>

* Version: 0.2
* Source code: https://github.com/cran/NipponMap
* Date/Publication: 2018-05-16 12:30:20 UTC
* Number of recursive dependencies: 27

Run `revdep_details(,"NipponMap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NipponMap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: JapanPrefMap
    > ### Title: A simple choropleth map of Japan
    > ### Aliases: JapanPrefMap
    > ### Keywords: Japan Japanese map Japanese Prefecture
    > 
    > ### ** Examples
    > 
    > JapanPrefMap()
    Error in UseMethod("st_geometry") : 
      no applicable method for 'st_geometry' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: JapanPrefMap -> plot -> st_geometry
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'kokudosuuchi', 'estatapi', 'jpndistrict', 'jpmesh'
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cshapes’
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
             ... 0.001 seconds in simplex solver, in total 0.029 seconds.
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 1458 | SKIPPED: 35 | WARNINGS: 0 | FAILED: 9 ]
      1. Error: phylogenetic data (@test_plot.R#66) 
      2. Error: some projects funded (@test_plot_phylo_persistence.R#28) 
      3. Error: all projects funded (@test_plot_phylo_persistence.R#66) 
      4. Error: no projects funded (@test_plot_phylo_persistence.R#104) 
      5. Error: invalid arguments (@test_plot_phylo_persistence.R#128) 
      6. Failure: valid arguments (@test_project_cost_effectiveness.R#27) 
      7. Failure: valid arguments (@test_project_cost_effectiveness.R#36) 
      8. Failure: valid arguments (different number of actions/projects (@test_project_cost_effectiveness.R#63) 
      9. Failure: valid arguments (different number of actions/projects (@test_project_cost_effectiveness.R#69) 
      
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

# pammtools

<details>

* Version: 0.1.14
* Source code: https://github.com/cran/pammtools
* URL: https://github.com/adibender/pammtools
* BugReports: https://github.com/adibender/pammtools/issues
* Date/Publication: 2019-09-08 14:40:02 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"pammtools")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 10. [39mpammtools:::as_ped.data.frame(...) [90mrevdep/checks/pammtools/new/pammtools.Rcheck/00_pkg_src/pammtools/R/as-ped.R:44:2[39m
      [90m 19. [39mstats::model.frame.default(...)
      
      [31m──[39m [31m4. Failure: nested_fdf class is preserved after tidyr operations (@test-tidyverse-S3methods.R#65) [39m [31m────────────────────────────────[39m
      fill(sim_df, id, .direction = "up") inherits from `tbl_df/tbl/data.frame` not `nested_fdf`.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 279 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: cumulative hazard functions work for PAM (@test-add-functions.R#92) 
      2. Failure: survival probabilities functions work for PAM (@test-add-functions.R#227) 
      3. Error: LL helpers and as_ped produce equivalent LL windows (@test-cumulative-effect.R#37) 
      4. Failure: nested_fdf class is preserved after tidyr operations (@test-tidyverse-S3methods.R#65) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# panelr

<details>

* Version: 0.7.1
* Source code: https://github.com/cran/panelr
* URL: https://panelr.jacob-long.com
* BugReports: https://github.com/jacob-long/panelr
* Date/Publication: 2019-07-12 17:30:03 UTC
* Number of recursive dependencies: 168

Run `revdep_details(,"panelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘panelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: wbgee
    > ### Title: Panel regression models fit with GEE
    > ### Aliases: wbgee
    > 
    > ### ** Examples
    > 
    > data("WageData")
    > wages <- panel_data(WageData, id = id, wave = t)
    > model <- wbgee(lwage ~ lag(union) + wks | blk + fem | blk * lag(union),
    +          data = wages)
    Error: Only strings can be converted to symbols
    Backtrace:
    [90m 1. [39mpanelr::wbgee(...)
    [90m 2. [39mpanelr:::wb_prepare_data(...) [90m00_pkg_src/panelr/R/wb_gee.R:98:2[39m
    [90m 3. [39mpanelr:::complete_cases(e$data, min.waves = min.waves) [90m00_pkg_src/panelr/R/wb_data_prep.R:87:4[39m
    [90m 8. [39mrlang::sym(id)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mpanelr::wbm(wks ~ union + lag(lwage) | blk, data = wages, weights = wts)
      [90m 2. [39mpanelr:::wb_prepare_data(...) [90mrevdep/checks/panelr/new/panelr.Rcheck/00_pkg_src/panelr/R/wb_lmer.R:250:2[39m
      [90m 3. [39mpanelr:::complete_cases(e$data, min.waves = min.waves) [90mrevdep/checks/panelr/new/panelr.Rcheck/00_pkg_src/panelr/R/wb_data_prep.R:87:4[39m
      [90m 8. [39mrlang::sym(id)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 215 | SKIPPED: 0 | WARNINGS: 89 | FAILED: 5 ]
      1. Error: Models with time-varying factors work (@test_asym.R#134) 
      2. Error: Models with time-varying factors work (@test_asym_gee.R#134) 
      3. Error: Models with time-varying factors work (@test_fdm.R#134) 
      4. Error: (unknown) (@test_wbgee.R#127) 
      5. Error: (unknown) (@test_wbm.R#177) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# photobiology

<details>

* Version: 0.9.30
* Source code: https://github.com/cran/photobiology
* URL: https://www.r4photobiology.info/, https://bitbucket.org/aphalo/photobiology
* BugReports: https://bitbucket.org/aphalo/photobiology/issues
* Date/Publication: 2020-01-09 14:20:02 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"photobiology")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘photobiology-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: absorbance
    > ### Title: Absorbance
    > ### Aliases: absorbance absorbance.default absorbance.filter_spct
    > ###   absorbance.object_spct absorbance.filter_mspct
    > ###   absorbance.object_mspct
    > 
    > ### ** Examples
    > 
    > absorbance(polyester.spct, new_waveband(400,700))
    Warning in insert_spct_hinges(spct, all.hinges) :
      Only objects derived from 'generic_spct' are supported
    Error in trim_spct(spct, wb, use.hinges = FALSE) : 
      is.generic_spct(spct) is not TRUE
    Calls: absorbance ... absorbance_spct -> integrate_spct -> trim_spct -> stopifnot
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fishmethods’, ‘photobiologyWavebands’
    ```

# photobiologyInOut

<details>

* Version: 0.4.21-1
* Source code: https://github.com/cran/photobiologyInOut
* URL: http://www.r4photobiology.info/
* BugReports: https://bitbucket.org/aphalo/photobiologyinout/issues/
* Date/Publication: 2020-01-11 20:10:02 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"photobiologyInOut")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Loading required package: lattice
    Loading required package: grid
    Loading required package: ggplot2
    Package hyperSpec, version 0.99-20180627
    
    To get started, try
       vignette ("hyperspec")
       package?hyperSpec 
       vignette (package = "hyperSpec")
    
    If you use this package please cite it appropriately.
       citation("hyperSpec")
    will give you the correct reference.
    
    The project homepage is http://hyperspec.r-forge.r-project.org
    
    
    Error in `[[<-.generic_mspct`(`*tmp*`, r, value = list(w.length = c(411.74671803411,  : 
      is.member_class(x, value) || is.null(value) is not TRUE
    Calls: hyperSpec2mspct -> [[<- -> [[<-.generic_mspct -> stopifnot
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 404 | SKIPPED: 4 | WARNINGS: 1 | FAILED: 22 ]
      1. Failure: single spectrum (@test-aster.R#16) 
      2. Failure: single spectrum (@test-aster.R#17) 
      3. Failure: single spectrum (@test-aster.R#18) 
      4. Failure: single spectrum (@test-aster.R#25) 
      5. Error: colorSpec (@test-foreign.R#8) 
      6. Failure: single spectrum (@test-fred.R#27) 
      7. Failure: single spectrum (quantum) (@test-licor.R#30) 
      8. Failure: single spectrum Tfr (@test-licor.R#77) 
      9. Failure: single spectrum Rfr (@test-licor.R#108) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
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
    - "visualization" ---------------------------- 1081 packages in 0.008 seconds -
    
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
      1/6 mismatches
      [4] 3 - NA == NA
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 294 | SKIPPED: 0 | WARNINGS: 16 | FAILED: 7 ]
      1. Error: inexact_join input failstates (@test-bad_input.R#96) 
      2. Failure: Different inexact joins work (@test-inexact_join.R#162) 
      3. Failure: Different inexact joins work (@test-inexact_join.R#169) 
      4. Failure: Different inexact joins work (@test-inexact_join.R#206) 
      5. Failure: Different inexact joins work (@test-inexact_join.R#213) 
      6. Failure: tlag works (@test-tlag.R#45) 
      7. Failure: tlag works (@test-tlag.R#51) 
      
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
      [31m──[39m [31m3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#193) [39m [31m──────────────────[39m
      Value hashes to 2194929e3e, not 4639dbfbf3
      
      [31m──[39m [31m4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#211) [39m [31m───────────────────[39m
      Value hashes to 255aef31fb, not 60e9306bfc
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: data generated by default setting is same (shrub_cover) (@test-99-regression.R#164) 
      2. Failure: data generated by default setting is same (ant colony_presence_absence) (@test-99-regression.R#175) 
      3. Failure: data generated by level = 'stake' is same (ant colony_presence_absence) (@test-99-regression.R#193) 
      4. Failure: data generated by level = 'plot' is same (ant colony_presence_absence) (@test-99-regression.R#211) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# projects

<details>

* Version: 2.0.0
* Source code: https://github.com/cran/projects
* URL: https://www.github.com/NikKrieger/projects
* Date/Publication: 2019-09-05 16:10:03 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"projects")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # Editing a project, showcasing the addition and removal of authors
    > edit_project(
    +   "Understanding",
    +   short_title = "usa1",
    +   authors = ~ + "303" - 13 - Stone
    + )
    Error: No common type for `value` <projects_author> and `x` <projects_author>.
    [1m<error/vctrs_error_incompatible_type>[22m
    No common type for `value` <projects_author> and `x` <projects_author>.
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m├─projects::edit_project(...)
    [90m  2. [39m│ └─projects:::edit_metadata(...) [90m00_pkg_src/projects/R/edit.R:151:2[39m
    [90m  3. [39m│   └─purrr::iwalk(...) [90m00_pkg_src/projects/R/metadata_manipulation.R:67:2[39m
    [90m  4. [39m│     └─purrr::walk2(.x, vec_index(.x), .f, ...)
    [90m  5. [39m│       └─purrr::map2(.x, .y, .f, ...)
    [90m  6. [39m│         └─projects:::.f(.x[[i]], .y[[i]], ...)
    [90m  7. [39m│           ├─base::`[<-`(`*tmp*`, row_number, name, value = structure(NA, class = "projects_author")) [90m00_pkg_src/projects/R/metadata_manipulation.R:71:8[39m
    [90m  8. [39m│           └─tibble:::`[<-.tbl_df`(`*tmp*`, row_number, name, value = structure(NA, class = "project
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Error: Setup works (@test-setup.R#183) [39m [31m────────────────────────────────────────────────────────────────────────────────────────[39m
      No common type for `current_owner` <projects_author> and `current_owner` <projects_author>.
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_identical(...)
      [90m 10. [39mvctrs:::vec_ptype2.default(x = x, y = y, x_arg = x_arg, y_arg = y_arg)
      [90m 11. [39mvctrs::stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
      [90m 12. [39mvctrs:::stop_incompatible(...)
      [90m 13. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 17 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Setup works (@test-setup.R#183) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
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
    Running examples in ‘psychmeta-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: anova.ma_psychmeta
    > ### Title: Wald-type tests for moderators in psychmeta meta-analyses
    > ### Aliases: anova.ma_psychmeta
    > 
    > ### ** Examples
    > 
    > ma_obj <- ma_r(rxyi, n, construct_x = x_name, construct_y = y_name,
    + moderators = moderator, data = data_r_meas_multi)
     **** Running ma_r: Meta-analysis of correlations **** 
    > 
    > anova(ma_obj)
    Error in UseMethod("anova") : 
      no applicable method for 'anova' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: anova
    Execution halted
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Error: corner cases (@test-exec-all.R#46) [39m [31m─────────────────────────────────────────────────────────────────────────────────────[39m
      `x` must be a vector, not a `rematch_allrecords` object
      [1mBacktrace:[22m
      [90m 1. [39mrematch2::re_exec_all(.text <- character(), "")
      [90m 8. [39mvctrs:::stop_scalar_type(...)
      [90m 9. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      class(res2) not equal to c("rset", "tbl_df", "tbl", "data.frame").
      Lengths differ: 3 is not 4
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 523 | SKIPPED: 0 | WARNINGS: 13 | FAILED: 7 ]
      1. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#53) 
      2. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#63) 
      3. Failure: Bootstrap estimate of mean is close to estimate of mean from normal distribution (@test_bootci.R#73) 
      4. Failure: basics (@test_gather.R#16) 
      5. Error: extra args ignored (@test_gather.R#21) 
      6. Failure: no splits (@test_gather.R#37) 
      7. Failure: simple rset (@test_rset.R#43) 
      
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
      [31m──[39m [31m1. Failure: multiplication works (@test-read_sym_table.R#9) [39m [31m──────────────────────────────────────────────────────────────────────[39m
      is.sym.modal(sym.table$F3) isn't true.
      
      [31m──[39m [31m2. Failure: multiplication works (@test-read_sym_table.R#11) [39m [31m─────────────────────────────────────────────────────────────────────[39m
      is.sym.set(sym.table$F5) isn't true.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 291 | SKIPPED: 1 | WARNINGS: 2 | FAILED: 11 ]
      1. Error: bind_exposures works (@test-expose-helpers.R#82) 
      2. Failure: new_pack_info removes names inside `.packs` (@test-exposure.R#118) 
      3. Error: is_exposure works (@test-exposure.R#166) 
      4. Failure: print.exposure validates input (@test-exposure.R#337) 
      5. Failure: print.exposure validates input (@test-exposure.R#337) 
      6. Failure: print.exposure validates input (@test-exposure.R#347) 
      7. Failure: print.exposure validates input (@test-exposure.R#347) 
      8. Failure: print.packs_info validates input (@test-exposure.R#423) 
      9. Failure: print.packs_info validates input (@test-exposure.R#423) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sabre

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/sabre
* URL: https://nowosad.github.io/sabre/
* BugReports: https://github.com/Nowosad/sabre/issues
* Date/Publication: 2019-10-17 16:20:03 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"sabre")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data("regions1")
    > data("regions2")
    > vm = vmeasure_calc(x = regions1, y = regions2, x_name = z, y_name = z)
    Error: `by` can't contain join column `map1` which is missing from LHS
    [1m<error/rlang_error>[22m
    `by` can't contain join column `map1` which is missing from LHS
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m├─sabre::vmeasure_calc(...)
    [90m  2. [39m└─sabre:::vmeasure_calc.sf(...) [90m00_pkg_src/sabre/R/vmeasure_calc.R:61:2[39m
    [90m  3. [39m  ├─dplyr::left_join(x, x_df, by = "map1") [90m00_pkg_src/sabre/R/vmeasure_calc.R:119:2[39m
    [90m  4. [39m  ├─sf:::left_join.sf(x, x_df, by = "map1")
    [90m  5. [39m  │ └─sf:::sf_join(NextMethod(), attr(x, "sf_column"), suffix[1])
    [90m  6. [39m  │   └─sf_column %in% names(g)
    [90m  7. [39m  ├─base::NextMethod()
    [90m  8. [39m  └─dplyr:::left_join.tbl_df(x, x_df, by = "map1")
    [90m  9. [39m    ├─dplyr::common_by(by, x, y)
    [90m 10. [39m    └─dplyr:::common_by.character(by, x, y)
    [90m 11. [39m      └─dplyr:::common_by.list(by, x, y)
    [90m 12. [39m        └─dplyr:::bad_args
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  1. [39msabre::vmeasure_calc(...)
      [90m  2. [39msabre:::vmeasure_calc.sf(...) [90mrevdep/checks/sabre/new/sabre.Rcheck/00_pkg_src/sabre/R/vmeasure_calc.R:61:2[39m
      [90m  8. [39mdplyr:::left_join.tbl_df(x, x_df, by = "map1")
      [90m 10. [39mdplyr:::common_by.character(by, x, y)
      [90m 11. [39mdplyr:::common_by.list(by, x, y)
      [90m 12. [39mdplyr:::bad_args(...)
      [90m 13. [39mdplyr:::glubort(fmt_args(args), ..., .envir = .envir)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 13 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-eco-us.R#3) 
      2. Error: (unknown) (@test-fig1.R#5) 
      
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
    Simple feature collection with 6 features and 3 fields
    geometry type:  MULTIPOLYGON
    dimension:      XY
    bbox:           xmin: -81.74107 ymin: 36.07282 xmax: -75.77316 ymax: 36.58965
    epsg (SRID):    4267
    proj4string:    +proj=longlat +datum=NAD27 +no_defs
      row SID74 SID79                       geometry
    1   1     1     0 MULTIPOLYGON (((-81.47276 3...
    2   2     0     3 MULTIPOLYGON (((-81.23989 3...
    3   3     5     6 MULTIPOLYGON (((-80.45634 3...
    4   4     1     2 MULTIPOLYGON (((-76.00897 3...
    5   5     9     3 MULTIPOLYGON (((-77.21767 3...
    6   6     7     5 MULTIPOLYGON (((-76.74506 3...
    > storms.sf = st_as_sf(storms, coords = c("long", "lat"), crs = 4326)
    > x <- storms.sf %>% group_by(name, year) %>% nest
    > trs = lapply(x$data, function(tr) st_cast(st_combine(tr), "LINESTRING")[[1]]) %>%
    +     st_sfc(crs = 4326)
    Error in UseMethod("st_geometry") : 
      no applicable method for 'st_geometry' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: %>% ... st_cast -> st_combine -> st_sfc -> do.call -> st_geometry
    Execution halted
    ```

*   checking tests ...
    ```
    ...
    < Linking to GEOS 3.7.1, GDAL 2.4.0, PROJ 5.2.0
    ---
    > Linking to GEOS 3.7.1, GDAL 2.4.2, PROJ 5.2.0
     ERROR
    Running the tests in ‘tests/dplyr.R’ failed.
    Last 13 lines of output:
      > 
      > # set.seed(1331)
      > nc$gp <- sample(1:10, replace=T)
      > # Get centroid of each group of polygons; https://github.com/r-spatial/sf/issues/969
      > nc_gp_cent <- nc %>%
      +                 group_by(gp) %>%
      +                 group_map(st_centroid)
      Error in st_agr.default(ret) : all(is.na(x)) is not TRUE
      Calls: %>% ... st_centroid.sf -> st_agr -> st_agr.default -> stopifnot
      In addition: Warning messages:
      1: In st_centroid.sf(dots[[1L]][[1L]], dots[[2L]][[1L]]) :
        st_centroid assumes attributes are constant over geometries of x
      2: In st_centroid.sfc(st_geometry(x), of_largest_polygon = of_largest_polygon) :
        st_centroid does not give correct centroids for longitude/latitude data
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 31.0Mb
      sub-directories of 1Mb or more:
        R        1.1Mb
        doc     12.0Mb
        libs    14.3Mb
        sqlite   1.5Mb
    ```

# sfdct

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/sfdct
* URL: https://github.com/hypertidy/sfdct
* BugReports: https://github.com/hypertidy/sfdct/issues
* Date/Publication: 2018-03-23 14:35:45 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"sfdct")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    Linking to GEOS 3.7.1, GDAL 2.4.0, PROJ 5.2.0
    > nc <- read_sf(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
    > nc_triangles <- ct_triangulate(nc[, c("NAME", "geometry")])
    > plot(nc[, "NAME"])
    > plot(nc_triangles, add = TRUE, col = NA, lty = "dotted")
    Warning in xy.coords(x, y, xlabel, ylabel, log) :
      NAs introduced by coercion
    Error in xy.coords(x, y, xlabel, ylabel, log) : 
      'list' object cannot be coerced to type 'double'
    Calls: plot ... plot.data.frame -> plot2 -> plot -> plot.default -> xy.coords
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 1. [39mtestthat::expect_that(...)
      [90m 7. [39msf::st_geometry(nc_triangles[1:5, ]) [90mrevdep/checks/sfdct/new/sfdct.Rcheck/00_pkg_src/sfdct/R/sfdct.R:100:2[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 36 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 7 ]
      1. Failure: ct works (@test-basic-ct.R#11) 
      2. Error: ct works (@test-basic-ct.R#12) 
      3. Failure: different inputs work (@test-basic-ct.R#38) 
      4. Failure: different inputs work (@test-basic-ct.R#43) 
      5. Failure: different inputs work (@test-basic-ct.R#54) 
      6. Failure: different inputs work (@test-basic-ct.R#58) 
      7. Error: we can triangulate a geometrycollection (@test-basic-ct.R#78) 
      
      Error: testthat unit tests failed
      Execution halted
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
      
      [31m──[39m [31m2. Error: building sf works (@test-spatial-build.R#6) [39m [31m────────────────────────────────────────────────────────────────────────────[39m
      `x` must be a vector, not a `sfc_MULTIPOLYGON/sfc` object
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_s3_class(build_sf(PATH(minimal_mesh)), "sf")
      [90m 12. [39mvctrs:::stop_scalar_type(...)
      [90m 13. [39mvctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Error: Prepare Design (@test-utils.R#44) [39m [31m──────────────────────────────────────────────────────────────────────────────────────[39m
      Can't join on 'q' x 'q' because of incompatible types (list / list)
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_identical(prepare_design(opts), dgn)
      [90m 3. [39mtestthat:::compare.default(act$val, exp$val)
      [90m 5. [39mdplyr:::all.equal.tbl_df(x, y, ...)
      [90m 6. [39mdplyr:::equal_data_frame(...)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      [1] "Estimated replications per hour:  32827"
      [1] "Estimated replications per hour:  1245442"
      [1] "Estimated replications per hour:  232361"
      [1] "Estimated replications per hour:  1211516"
      [1] "Estimated replications per hour:  234785"
      [31m──[39m [31m1. Failure: One group for summary_fun. Results were created and stored in simulation (@test_eval_tibbles.R#791) [39m [31m──────────────────[39m
      eg$simulation[[col]] not identical to expected_df[[col]].
      names for current but not for target
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      Lengths differ: 10 is not 22
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 563 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Failure: skim returns expected response for numeric vectors (@test-skim.R#34) 
      2. Failure: skim returns expected response for factor vectors (@test-skim.R#178) 
      3. Failure: skim returns expected response for logical vectors (@test-skim.R#267) 
      4. Failure: skim returns expected response for complex vectors (@test-skim.R#319) 
      5. Failure: skim returns expected response for ts vectors (@test-skim.R#398) 
      6. Failure: You can use tidyselect negation (@test-skim.R#795) 
      7. Failure: Tidyselect helpers work as expected (@test-skim.R#804) 
      8. Failure: Skim prints a header for the entire output and each type (@test-skim_print.R#9) 
      
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

*   checking examples ... ERROR
    ```
    ...
    
        dotchart
    
    > data(api)
    > 
    > dstrata <- apistrat %>%
    +   as_survey_design(strata = stype, weights = pw)
    > 
    > dstrata_grp <- dstrata %>%
    +   group_by(stype)
    > 
    > dstrata_grp %>%
    +   cascade(api99 = survey_mean(api99),
    +             api00 = survey_mean(api00),
    +             api_diff = survey_mean(api00 - api99))
    Error in parse(text = x, keep.source = FALSE) : 
      <text>:2:0: unexpected end of input
    1: ~ 
       ^
    Calls: %>% ... formula -> formula.character -> formula -> eval -> parse
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 163 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 13 ]
      1. Error: (unknown) (@test_basic_example.r#46) 
      2. Error: (unknown) (@test_cascade.r#11) 
      3. Error: DB backed survey tests - RSQLite (@test_database.R#70) 
      4. Error: (unknown) (@test_level.R#50) 
      5. Error: Parameters for survey_count/tally work (@test_survey_count_tally.R#37) 
      6. Error: (unknown) (@test_survey_proportion.R#25) 
      7. Failure: deff and df work for grouped survey total (@expect-equality.R#61) 
      8. Error: survey_var works for grouped surveys - with se (@test_survey_statistics.r#395) 
      9. Error: survey_var works for grouped surveys - with ci (@test_survey_statistics.r#409) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# stlcsb

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/stlcsb
* URL: https://github.com/slu-openGIS/stlcsb
* BugReports: https://github.com/slu-openGIS/stlcsb/issues
* Date/Publication: 2019-02-22 00:20:02 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"stlcsb")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;250m 1[39m   1[4m0[24m[4m4[24m[4m9[24m265 2018-01-01 [38;5;246m00:48:30[39m 75 WILLMOR… A           WEB                   8
    [38;5;250m 2[39m   1[4m0[24m[4m4[24m[4m9[24m265 2018-01-01 [38;5;246m00:48:30[39m 75 WILLMOR… A           WEB                   8
    [38;5;250m 3[39m   1[4m0[24m[4m4[24m[4m9[24m266 2018-01-01 [38;5;246m05:29:06[39m 6739 VERMO… A           WEB                   1
    [38;5;250m 4[39m   1[4m0[24m[4m4[24m[4m9[24m267 2018-01-01 [38;5;246m08:53:07[39m 5444 ITASK… A           WEB                   7
    [38;5;250m 5[39m   1[4m0[24m[4m4[24m[4m9[24m268 2018-01-01 [38;5;246m09:13:22[39m CASS AVE &… B           PHONE                60
    [38;5;250m 6[39m   1[4m0[24m[4m4[24m[4m9[24m269 2018-01-01 [38;5;246m10:12:26[39m 6441 LLOYD… A           WEB                  42
    [38;5;250m 7[39m   1[4m0[24m[4m4[24m[4m9[24m270 2018-01-01 [38;5;246m10:52:32[39m 3100 WINNE… B           PHONE                19
    [38;5;250m 8[39m   1[4m0[24m[4m4[24m[4m9[24m271 2018-01-01 [38;5;246m10:54:43[39m S GRAND AV… B           PHONE                25
    [38;5;250m 9[39m   1[4m0[24m[4m4[24m[4m9[24m272 2018-01-01 [38;5;246m11:07:02[39m SIDNEY ST … B           WEB                  25
    [38;5;250m10[39m   1[4m0[24m[4m4[24m[4m9[24m273 2018-01-01 [38;5;246m12:05:40[39m 5400 N BRO… B           PHONE                79
    [38;5;246m# … with 1,496 more rows, and 11 more variables: ward [3m[38;5;246m<dbl>[38;5;246m[23m, problemcode [3m[38;5;246m<chr>[38;5;246m[23m,
    #   description [3m[38;5;246m<chr>[38;5;246m[23m, submitto [3m[38;5;246m<chr>[38;5;246m[23m, status [3m[38;5;246m<chr>[38;5;246m[23m, dateinvtdone [3m[38;5;246m<dttm>[38;5;246m[23m,
    #   datetimeclosed [3m[38;5;246m<dttm>[38;5;246m[23m, prjcompletedate [3m[38;5;246m<dttm>[38;5;246m[23m, datecancelled [3m[38;5;246m<dttm>[38;5;246m[23m,
    #   missing [3m[38;5;246m<lgl>[38;5;246m[23m, geometry [3m[38;5;246m<POINT [US_survey_foot]>[38;5;246m[23m[39m
    > 
    > # project with a custom crs
    > csb_projectXY(csb, srx, sry, crs = 4269)
    Error in UseMethod("st_transform") : 
      no applicable method for 'st_transform' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: csb_projectXY -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ==================================================
      downloaded 4976 bytes
      
      [31m──[39m [31m1. Error: (unknown) (@test_projectXY.R#18) [39m [31m───────────────────────────────────────────────────────────────────────────────────────[39m
      no applicable method for 'st_transform' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
      [1mBacktrace:[22m
      [90m 1. [39mstlcsb::csb_projectXY(valid, srx, sry, crs = 4326)
      [90m 2. [39msf::st_transform(out, crs = crs) [90mrevdep/checks/stlcsb/new/stlcsb.Rcheck/00_pkg_src/stlcsb/R/csb_projectXY.R:67:4[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 102 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test_projectXY.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
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

# studentlife

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/studentlife
* URL: https://github.com/Frycast/studentlife
* BugReports: https://github.com/Frycast/studentlife/issues
* Date/Publication: 2019-05-31 16:20:10 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"studentlife")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > d <- tempdir()
    > download_studentlife(location = d, url = "testdata")
    Downloading the small sample dataset...
    trying URL 'https://raw.githubusercontent.com/frycast/studentlife/master/tests/testthat/testdata/sample/sample_dataset.tar.bz2'
    Content type 'application/octet-stream' length 49784 bytes (48 KB)
    ==================================================
    downloaded 48 KB
    
    Download complete
    Unzipping the dataset...
    Unzip complete
    Untarring the dataset...
    Untar complete
    > 
    > tab_PAM <- load_SL_tibble(schema = "EMA", table = "PAM", location = d)
    > 
    > reg_PAM <- regularise_time(
    +   tab_PAM, blocks = c("day", "epoch"), m = mean(picture_idx, na.rm = TRUE))
    Error in regularise_time(tab_PAM, blocks = c("day", "epoch"), m = mean(picture_idx,  : 
      tab is not an interval_SL_tbl, timestamp_SL_tbl or dateonly_SL_tbl.
    Execution halted
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
      'names' attribute [33495] must be the same length as the vector [3]
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 543 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 19 ]
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

# tidystats

<details>

* Version: 0.4
* Source code: https://github.com/cran/tidystats
* Date/Publication: 2019-09-12 07:20:02 UTC
* Number of recursive dependencies: 31

Run `revdep_details(,"tidystats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > quote_source %>%
    +   group_by(source) %>%
    +   describe_data(response)
    Error: Unknown column `source` 
    [1m<error/rlang_error>[22m
    Unknown column `source` 
    [1mBacktrace:[22m
    [90m     [39m█
    [90m  1. [39m└─quote_source %>% group_by(source) %>% describe_data(response)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            └─tidystats::describe_data(., response)
    [90m 10. [39m              └─dplyr::group_by_at(output, dplyr::vars(grouping)) [90m00_pkg_src/tidystats/R/describe_data.r:121:2[39m
    [90m 11. [39m                └─dplyr:::manip_at(...)
    [90m 12. [39m                  └─dplyr:::tbl_at_
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 113 marked UTF-8 strings
    ```

# tidytransit

<details>

* Version: 0.6.1
* Source code: https://github.com/cran/tidytransit
* URL: https://github.com/r-transit/tidytransit
* BugReports: https://github.com/r-transit/tidytransit
* Date/Publication: 2019-11-06 08:40:02 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"tidytransit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytransit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: stops_as_sf
    > ### Title: Convert stops into Simple Features Points
    > ### Aliases: stops_as_sf
    > 
    > ### ** Examples
    > 
    > data(gtfs_duke)
    > some_stops <- gtfs_duke$stops[sample(nrow(gtfs_duke$stops), 40),]
    > some_stops_sf <- stops_as_sf(some_stops)
    > plot(some_stops_sf)
    Warning in data.matrix(x) : NAs introduced by coercion
    Warning in data.matrix(x) : NAs introduced by coercion
    Warning in data.matrix(x) : NAs introduced by coercion
    Error in data.matrix(x) : 
      'list' object cannot be coerced to type 'double'
    Calls: plot -> plot.data.frame -> pairs -> data.matrix
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 20. [39mbase:::tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
      [90m 21. [39mbase:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      [90m 22. [39mvalue[[3L]](cond)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 76 | SKIPPED: 9 | WARNINGS: 1 | FAILED: 6 ]
      1. Failure: convert gtfs stops and shapes to sf data frames (@test-spatial.R#5) 
      2. Failure: convert gtfs stops and shapes to sf data frames (@test-spatial.R#11) 
      3. Error: get_route_geometry (@test-spatial.R#25) 
      4. Failure: route_geometry behaves as before (@test-spatial.R#33) 
      5. Failure: route_geometry behaves as before (@test-spatial.R#35) 
      6. Error: plots work with and without shapes (@test-spatial.R#63) 
      
      Error: testthat unit tests failed
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

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 62 marked UTF-8 strings
    ```

# tidytree

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/tidytree
* URL: https://yulab-smu.github.io/treedata-book/
* BugReports: https://github.com/YuLab-SMU/tidytree/issues
* Date/Publication: 2019-12-14 17:40:02 UTC
* Number of recursive dependencies: 74

Run `revdep_details(,"tidytree")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      no applicable method for 'ancestor' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
      [1mBacktrace:[22m
      [90m 1. [39mtidytree::groupOTU(d, cls)
      [90m 2. [39mtidytree:::groupOTU.tbl_tree(d, cls) [90mrevdep/checks/tidytree/new/tidytree.Rcheck/00_pkg_src/tidytree/R/AllGenerics.R:52:4[39m
      [90m 3. [39mtidytree:::groupOTU.tbl_tree_item(...) [90mrevdep/checks/tidytree/new/tidytree.Rcheck/00_pkg_src/tidytree/R/groupOTU.R:11:12[39m
      [90m 4. [39mbase::lapply(focus, function(.node) sort(ancestor(.data, .node)$node)) [90mrevdep/checks/tidytree/new/tidytree.Rcheck/00_pkg_src/tidytree/R/groupOTU.R:61:4[39m
      [90m 5. [39mtidytree:::FUN(X[[i]], ...)
      [90m 7. [39mtidytree::ancestor(.data, .node) [90mrevdep/checks/tidytree/new/tidytree.Rcheck/00_pkg_src/tidytree/R/groupOTU.R:61:4[39m
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 43 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-grouping.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tsibble

<details>

* Version: 0.8.5
* Source code: https://github.com/cran/tsibble
* URL: https://tsibble.tidyverts.org
* BugReports: https://github.com/tidyverts/tsibble/issues
* Date/Publication: 2019-11-03 06:00:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: as.ts.tbl_ts
    > 
    > ### ** Examples
    > 
    > # a monthly series
    > x1 <- as_tsibble(AirPassengers)
    > as.ts(x1)
    Error: x is not a tsibble.
    [1m<error/rlang_error>[22m
    x is not a tsibble.
    [1mBacktrace:[22m
    [90m    [39m█
    [90m 1. [39m├─stats::as.ts(x1)
    [90m 2. [39m└─tsibble:::as.ts.tbl_ts(x1)
    [90m 3. [39m  ├─dplyr::arrange(tsbl_sel, !!!key_vars, !!idx) [90m00_pkg_src/tsibble/R/tsibble2ts.R:46:2[39m
    [90m 4. [39m  └─tsibble:::arrange.tbl_ts(tsbl_sel, !!!key_vars, !!idx)
    [90m 5. [39m    └─tsibble:::update_meta(arr_data, .data, ordered = FALSE, interval = interval(.data)) [90m00_pkg_src/tsibble/R/dplyr-verbs.R:27:2[39m
    [90m 6. [39m      └─tsibble:::restore_index_class(...) [90m00_pkg_src/tsibble/R/update.R:18:2[39m
    [90m 7. [39m        └─tsibble::interval(new) [90m00_pkg_src/tsibble/R/update.R:50:2[39m
    [90m 8. [39m          └─tsibble:::not_tsibble(x) [90m00_pkg_src/tsibble/R/tsibble-meta.R:189:2[39m
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 493 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 35 ]
      1. Error: 4 day interval (@test-append.R#27) 
      2. Error: (unknown) (@test-append.R#31) 
      3. Error: rbind() (@test-bind.R#15) 
      4. Error: (unknown) (@test-bind.R#19) 
      5. Error: (unknown) (@test-dplyr.R#5) 
      6. Error: (unknown) (@test-empty.R#11) 
      7. Error: an irregular tbl_ts (@test-gaps.R#23) 
      8. Error: a tbl_ts without implicit missing values (@test-gaps.R#29) 
      9. Error: (unknown) (@test-gaps.R#37) 
      1. ...
      
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
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

# valr

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/valr
* URL: http://github.com/rnabioco/valr, http://rnabioco.github.io/valr
* BugReports: https://github.com/rnabioco/valr/issues
* Date/Publication: 2019-01-03 16:20:04 UTC
* Number of recursive dependencies: 123

Run `revdep_details(,"valr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: x/y groupings are respected (@test_map.r#27) [39m [31m─────────────────────────────────────────────────────────────────────────[39m
      all(res == pred, na.rm = TRUE) isn't true.
      
      [31m──[39m [31m2. Failure: summary functions are executed per group (@test_partition.r#237) [39m [31m─────────────────────────────────────────────────────[39m
      sum(res$count) not equal to 196.
      1/1 mismatches
      [1] 299 - 196 == 103
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 444 | SKIPPED: 3 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: x/y groupings are respected (@test_map.r#27) 
      2. Failure: summary functions are executed per group (@test_partition.r#237) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 20.1Mb
      sub-directories of 1Mb or more:
        libs  19.0Mb
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

