# amt

<details>

* Version: 0.1.7
* GitHub: https://github.com/jmsigner/amt
* Source code: https://github.com/cran/amt
* Date/Publication: 2022-02-23 14:50:02 UTC
* Number of recursive dependencies: 153

Run `revdepcheck::cloud_details(, "amt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘amt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bbox
    > ### Title: Get bounding box of a track.
    > ### Aliases: bbox bbox.track_xy bbox.steps_xy
    > 
    > ### ** Examples
    > 
    > data(deer)
    ...
      6.   ├─amt:::`[.steps_xy`(ss, -togo, )
      7.   ├─base::NextMethod()
      8.   └─tibble:::`[.tbl_df`(ss, -togo, )
      9.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     10.       └─tibble:::fix_oob(i, nr)
     11.         └─tibble:::fix_oob_negative(i, n, warn)
     12.           └─lifecycle::deprecate_stop(...)
     13.             └─lifecycle:::deprecate_stop0(msg)
     14.               └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
        5.         └─base::eval(expr, envir = e)
        6.           └─base::eval(expr, envir = e)
        7.             ├─amt::steps_by_burst(d1)
        8.             └─amt:::steps_by_burst.track_xyt(d1)
        9.               ├─ss[-togo, ]
       10.               ├─amt:::`[.steps_xy`(ss, -togo, )
       11.               ├─base::NextMethod()
       12.               └─tibble:::`[.tbl_df`(ss, -togo, )
       13.                 └─tibble:::vectbl_as_row_index(i, x, i_arg)
       14.                   └─tibble:::fix_oob(i, nr)
       15.                     └─tibble:::fix_oob_negative(i, n, warn)
       16.                       └─lifecycle::deprecate_stop(...)
       17.                         └─lifecycle:::deprecate_stop0(msg)
       18.                           └─rlang::cnd_signal(...)
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘p1_getting_started.Rmd’ using rmarkdown
    Quitting from lines 247-252 (p1_getting_started.Rmd) 
    Error: processing vignette 'p1_getting_started.Rmd' failed with diagnostics:
    ℹ In argument: `steps = map(...)`.
    Caused by error in `map()`:
    ℹ In index: 2.
    Caused by error:
    ! The `i` argument of `[.tbl_df` must lie in [-rows, 0] if negative, as
      of tibble 3.0.0.
    ...
    --- failed re-building ‘p4_SSF.Rmd’
    
    --- re-building ‘p5_other_packages.Rmd’ using rmarkdown
    --- finished re-building ‘p5_other_packages.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘p1_getting_started.Rmd’ ‘p4_SSF.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        libs   3.9Mb
    ```

# broom

<details>

* Version: 1.0.3
* GitHub: https://github.com/tidymodels/broom
* Source code: https://github.com/cran/broom
* Date/Publication: 2023-01-25 08:00:16 UTC
* Number of recursive dependencies: 309

Run `revdepcheck::cloud_details(, "broom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘broom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: augment.poLCA
    > ### Title: Augment data with information from a(n) poLCA object
    > ### Aliases: augment.poLCA
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
      6. ├─generics::augment(nes2a, data = election)
      7. └─broom:::augment.poLCA(nes2a, data = election)
      8.   ├─ret[rownames(data), ]
      9.   └─tibble:::`[.tbl_df`(ret, rownames(data), )
     10.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     11.       └─tibble:::fix_oob_invalid(i, is_na_orig)
     12.         └─lifecycle::deprecate_stop(...)
     13.           └─lifecycle:::deprecate_stop0(msg)
     14.             └─rlang::cnd_signal(...)
    Execution halted
    ```

# colorfindr

<details>

* Version: 0.1.4
* GitHub: https://github.com/zumbov2/colorfindr
* Source code: https://github.com/cran/colorfindr
* Date/Publication: 2019-02-01 20:13:20 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "colorfindr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘colorfindr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_colors_3d
    > ### Title: Create interactive 3D scatterplots of image color compositions
    > ### Aliases: plot_colors_3d
    > 
    > ### ** Examples
    > 
    > # Extract all colors
    ...
    Backtrace:
        ▆
     1. └─colorfindr::plot_colors_3d(col)
     2.   ├─dplyr::bind_cols(all, tibble::as.tibble(t(grDevices::col2rgb(all[["hex"]]))))
     3.   │ └─rlang::list2(...)
     4.   └─tibble::as.tibble(t(grDevices::col2rgb(all[["hex"]])))
     5.     └─lifecycle::deprecate_stop(...)
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# fqar

<details>

* Version: 0.3.0
* GitHub: https://github.com/equitable-equations/fqar
* Source code: https://github.com/cran/fqar
* Date/Publication: 2023-01-21 23:20:13 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "fqar")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: The `value` argument of `names<-` must be a character vector as of
      tibble 3.0.0.
      Backtrace:
          ▆
       1. └─fqar::transect_inventory(test_transect) at test-transect_inventory.R:6:2
       2.   └─base::`colnames<-`(`*tmp*`, value = lapply(dropped[1, ], as.character))
       3.     ├─base::`names<-`(`*tmp*`, value = value)
       4.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
       5.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
       6.         └─lifecycle:::deprecate_stop0(msg)
       7.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 2 | SKIP 16 | PASS 164 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# geoviz

<details>

* Version: 0.2.2
* GitHub: https://github.com/neilcharles/geoviz
* Source code: https://github.com/cran/geoviz
* Date/Publication: 2020-01-12 10:50:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "geoviz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘geoviz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_gps_to_rayshader
    > ### Title: Adds a GPS trace to a 'rayshader' scene
    > ### Aliases: add_gps_to_rayshader
    > 
    > ### ** Examples
    > 
    > flight <- example_igc()
    ...
    ℹ The signature and semantics have changed, see `?as_tibble`.
    Backtrace:
        ▆
     1. └─geoviz::add_gps_to_rayshader(...)
     2.   └─geoviz::latlong_to_rayshader_coords(raster_input, lat, long)
     3.     └─tibble::as.tibble(track@coords)
     4.       └─lifecycle::deprecate_stop(...)
     5.         └─lifecycle:::deprecate_stop0(msg)
     6.           └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# ggcleveland

<details>

* Version: 0.1.0
* GitHub: https://github.com/mpru/ggcleveland
* Source code: https://github.com/cran/ggcleveland
* Date/Publication: 2021-08-16 07:00:09 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "ggcleveland")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggcleveland-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gg_pt
    > ### Title: Plots for power transformations
    > ### Aliases: gg_pt
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
     1. ├─fusion %>% filter(nv.vv == "VV") %>% gg_pt(time)
     2. ├─ggcleveland::gg_pt(., time)
     3. │ └─... %>% setNames(taus)
     4. └─stats::setNames(., taus)
     5.   ├─base::`names<-`(`*tmp*`, value = nm)
     6.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = nm)
     7.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
     8.       └─lifecycle:::deprecate_stop0(msg)
     9.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─ggplot2::is.ggplot(gg_pt(futbol2, dist, longp))
        5. ├─ggcleveland::gg_pt(futbol2, dist, longp)
        6. │ └─... %>% setNames(taus)
        7. └─stats::setNames(., taus)
        8.   ├─base::`names<-`(`*tmp*`, value = nm)
        9.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = nm)
       10.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
       11.       └─lifecycle:::deprecate_stop0(msg)
       12.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ggplot-cleveland.Rmd’ using rmarkdown
    Quitting from lines 110-111 (ggplot-cleveland.Rmd) 
    Error: processing vignette 'ggplot-cleveland.Rmd' failed with diagnostics:
    The `value` argument of `names<-` must be a character vector as of
    tibble 3.0.0.
    --- failed re-building ‘ggplot-cleveland.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggplot-cleveland.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggESDA

<details>

* Version: 0.2.0
* GitHub: https://github.com/kiangkiangkiang/ggESDA
* Source code: https://github.com/cran/ggESDA
* Date/Publication: 2022-08-19 08:40:10 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "ggESDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggESDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Cardiological
    > ### Title: Cardiological data example
    > ### Aliases: Cardiological
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(Cardiological)
    > ggInterval_index(Cardiological, aes(x = Syst))
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: ggInterval_index ... as.data.frame -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ggESDA.Rmd’ using rmarkdown
    Quitting from lines 47-57 (ggESDA.Rmd) 
    Error: processing vignette 'ggESDA.Rmd' failed with diagnostics:
    `as.tibble()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` instead.
    ℹ The signature and semantics have changed, see `?as_tibble`.
    --- failed re-building ‘ggESDA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggESDA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# hackeRnews

<details>

* Version: 0.1.0
* GitHub: https://github.com/szymanskir/hackeRnews
* Source code: https://github.com/cran/hackeRnews
* Date/Publication: 2019-12-13 13:20:05 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "hackeRnews")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_warning(...) at test-api.R:333:4
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─hackeRnews::get_comments(get_item_by_id(1000))
        7.   └─tibble::as.tibble(df)
        8.     └─lifecycle::deprecate_stop(...)
        9.       └─lifecycle:::deprecate_stop0(msg)
       10.         └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 24 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘hackeRnews-specs.Rmd’ using rmarkdown
    Quitting from lines 70-72 (hackeRnews-specs.Rmd) 
    Error: processing vignette 'hackeRnews-specs.Rmd' failed with diagnostics:
    `as.tibble()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` instead.
    ℹ The signature and semantics have changed, see `?as_tibble`.
    --- failed re-building ‘hackeRnews-specs.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘hackeRnews-specs.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# interpretCI

<details>

* Version: 0.1.1
* GitHub: https://github.com/cardiomoon/interpretCI
* Source code: https://github.com/cran/interpretCI
* Date/Publication: 2022-01-28 08:50:02 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "interpretCI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘interpretCI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: show_t_table
    > ### Title: Show t-value table
    > ### Aliases: show_t_table
    > 
    > ### ** Examples
    > 
    > show_t_table()
    ...
    Backtrace:
        ▆
     1. └─interpretCI::show_t_table()
     2.   └─base::`colnames<-`(`*tmp*`, value = pp)
     3.     ├─base::`names<-`(`*tmp*`, value = value)
     4.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
     5.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
     6.         └─lifecycle:::deprecate_stop0(msg)
     7.           └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Confidence_interval_for_a_mean.Rmd’ using rmarkdown
    Quitting from lines 101-102 (Confidence_interval_for_a_mean.Rmd) 
    Error: processing vignette 'Confidence_interval_for_a_mean.Rmd' failed with diagnostics:
    The `value` argument of `names<-` must be a character vector as of
    tibble 3.0.0.
    --- failed re-building ‘Confidence_interval_for_a_mean.Rmd’
    
    --- re-building ‘Confidence_interval_for_a_proportion.Rmd’ using rmarkdown
    Quitting from lines 121-122 (Confidence_interval_for_a_proportion.Rmd) 
    ...
    
    SUMMARY: processing the following files failed:
      ‘Confidence_interval_for_a_mean.Rmd’
      ‘Confidence_interval_for_a_proportion.Rmd’
      ‘Confidence_interval_for_paired_mean_difference.Rmd’
      ‘Confidence_interval_for_proportion_difference.Rmd’
      ‘Confidence_interval_for_unpaired_mean_difference.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘moonBook’
      All declared Imports should be used.
    ```

# observer

<details>

* Version: 0.1.2
* GitHub: https://github.com/paulponcet/observer
* Source code: https://github.com/cran/observer
* Date/Publication: 2017-01-29 22:03:43
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "observer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘observer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: check_that
    > ### Title: Check your data
    > ### Aliases: check check_that check_that_ ensure ensure_that ensure_that_
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    ...
      4.   └─observer:::observe_if_.data.frame(...)
      5.     ├─base::as.data.frame(...)
      6.     ├─observer::observe_if_(dplyr::tbl_df(.data), .dots = dots, .append = .append)
      7.     └─observer:::observe_if_.tbl_df(...)
      8.       └─observer:::observe_if_impl(.data, dots, .append)
      9.         └─tibble::tibble_(...)
     10.           └─lifecycle::deprecate_stop("2.0.0", "tibble_()", "tibble()", details = "`tibble()` supports dynamic dots, see `?\"dyn-dots\"`.")
     11.             └─lifecycle:::deprecate_stop0(msg)
     12.               └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ensurer’, ‘validate’
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# optimLanduse

<details>

* Version: 1.1.2
* GitHub: https://github.com/Forest-Economics-Goettingen/optimLanduse
* Source code: https://github.com/cran/optimLanduse
* Date/Publication: 2022-11-17 16:50:02 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "optimLanduse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘optimLanduse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dataPreparation
    > ### Title: Transform data into the expected format
    > ### Aliases: dataPreparation
    > 
    > ### ** Examples
    > 
    > require(readxl)
    ...
    Backtrace:
        ▆
     1. └─optimLanduse::dataPreparation(dat, uncertainty = "sd", expVAL = "mean")
     2.   └─base::`colnames<-`(`*tmp*`, value = dat.final[1, ])
     3.     ├─base::`names<-`(`*tmp*`, value = value)
     4.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
     5.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
     6.         └─lifecycle:::deprecate_stop0(msg)
     7.           └─rlang::cnd_signal(...)
    Execution halted
    ```

# pdi

<details>

* Version: 0.4.2
* GitHub: https://github.com/jasenfinch/pdi
* Source code: https://github.com/cran/pdi
* Date/Publication: 2021-02-09 17:40:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "pdi")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pdi-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calcDIs
    > ### Title: Calculate Decline Indexes
    > ### Aliases: calcDIs
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
     15.     │ └─base::withCallingHandlers(...)
     16.     ├─purrr:::call_with_cleanup(...)
     17.     └─pdi (local) .f(.x[[i]], ...)
     18.       └─base::`colnames<-`(`*tmp*`, value = description[1, ])
     19.         ├─base::`names<-`(`*tmp*`, value = value)
     20.         └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
     21.           └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
     22.             └─lifecycle:::deprecate_stop0(msg)
     23.               └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("pdi")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 9 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-calcDIs.R:5'): (code run outside of `test_that()`) ─────────────
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(files, readPhenotypeSheet)`: ℹ In index: 1.
      Caused by error:
      ! The `value` argument of `names<-` must be a character vector as of
        tibble 3.0.0.
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 9 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘pdi-example.Rmd’ using rmarkdown
    Quitting from lines 83-84 (pdi-example.Rmd) 
    Error: processing vignette 'pdi-example.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error:
    ! The `value` argument of `names<-` must be a character vector as of
      tibble 3.0.0.
    --- failed re-building ‘pdi-example.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘pdi-example.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# psychmeta

<details>

* Version: 2.6.5
* GitHub: https://github.com/psychmeta/psychmeta
* Source code: https://github.com/cran/psychmeta
* Date/Publication: 2022-08-26 12:30:07 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "psychmeta")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7.         └─base::tapply(seq_len(3L), `<named list>`, `<fn>`, simplify = TRUE)
        8.           └─base::lapply(X = ans[index], FUN = FUN, ...)
        9.             └─base (local) FUN(X[[i]], ...)
       10.               └─psychmeta (local) FUN(dd[x, ], ...)
       11.                 └─psychmeta:::ma_wrapper(...)
       12.                   └─stats::setNames(moderators_long, moderator_names[["all"]])
       13.                     ├─base::`names<-`(`*tmp*`, value = nm)
       14.                     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = nm)
       15.                       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
       16.                         └─lifecycle:::deprecate_stop0(msg)
       17.                           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 52 ]
      Error: Test failures
      Execution halted
    ```

# readabs

<details>

* Version: 0.4.13
* GitHub: https://github.com/mattcowgill/readabs
* Source code: https://github.com/cran/readabs
* Date/Publication: 2023-01-30 00:30:02 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "readabs")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • On CRAN (30)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-local-files.R:29'): Local file can be tidied without metadata ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `purrr::map(list_of_dfs, tidy_abs, metadata = metadata)`: ℹ In index: 1.
      ℹ With name: 6202021=Data1=Table 21. Quarterly hours worked in all jobs by
        Market and Non-market sector - Seasonally adjusted.
      Caused by error:
      ! The `value` argument of `names<-` must be a character vector as of
        tibble 3.0.0.
      
      [ FAIL 1 | WARN 0 | SKIP 30 | PASS 59 ]
      Error: Test failures
      Execution halted
    ```

# RSDA

<details>

* Version: 3.0.13
* GitHub: NA
* Source code: https://github.com/cran/RSDA
* Date/Publication: 2022-07-16 07:30:37 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RSDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: abalone
    > ### Title: SODAS XML data file.
    > ### Aliases: abalone
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(abalone)
    > res <- sym.pca(abalone, 'centers')
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: sym.pca ... %in% -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 60-64 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    object 'tbl_subset_col' not found
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rshift

<details>

* Version: 2.2.0
* GitHub: NA
* Source code: https://github.com/cran/rshift
* Date/Publication: 2023-01-06 09:00:08 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "rshift")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rshift-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Lanzante
    > ### Title: Lanzante L-test
    > ### Aliases: Lanzante
    > 
    > ### ** Examples
    > 
    > Lanzante(lake_data, "DCA1", "Age")
    ...
    ℹ Please use `as_tibble()` instead.
    ℹ The signature and semantics have changed, see `?as_tibble`.
    Backtrace:
        ▆
     1. └─rshift::Lanzante(lake_data, "DCA1", "Age")
     2.   └─tibble::as.tibble(cbind(shift_years, p_vals))
     3.     └─lifecycle::deprecate_stop(...)
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘STARSmanual.ltx’ using tex
    Error: processing vignette 'STARSmanual.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'STARSmanual.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `caption.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.9 ^^M
           
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘STARSmanual.ltx’
    
    SUMMARY: processing the following file failed:
      ‘STARSmanual.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rubias

<details>

* Version: 0.3.3
* GitHub: NA
* Source code: https://github.com/cran/rubias
* Date/Publication: 2022-02-10 00:10:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "rubias")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rubias-fully-bayesian.Rmd’ using rmarkdown
    --- finished re-building ‘rubias-fully-bayesian.Rmd’
    
    --- re-building ‘rubias-overview.Rmd’ using rmarkdown
    Quitting from lines 697-707 (rubias-overview.Rmd) 
    Error: processing vignette 'rubias-overview.Rmd' failed with diagnostics:
    `as.tibble()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` instead.
    ...
    --- failed re-building ‘rubias-overview.Rmd’
    
    --- re-building ‘rubias-underlying-data-structures.Rmd’ using rmarkdown
    --- finished re-building ‘rubias-underlying-data-structures.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rubias-overview.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.4Mb
      sub-directories of 1Mb or more:
        libs   8.7Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# scrutiny

<details>

* Version: 0.2.4
* GitHub: https://github.com/lhdjung/scrutiny
* Source code: https://github.com/cran/scrutiny
* Date/Publication: 2023-01-20 21:00:02 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "scrutiny")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      tibble 3.0.0.
      Backtrace:
          ▆
       1. ├─df %>% row_to_colnames() at test-row-to-colnames.R:10:0
       2. └─scrutiny::row_to_colnames(.)
       3.   └─base::`colnames<-`(`*tmp*`, value = correct)
       4.     ├─base::`names<-`(`*tmp*`, value = value)
       5.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
       6.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
       7.         └─lifecycle:::deprecate_stop0(msg)
       8.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 491 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘consistency-tests.Rmd’ using rmarkdown
    --- finished re-building ‘consistency-tests.Rmd’
    
    --- re-building ‘debit.Rmd’ using rmarkdown
    --- finished re-building ‘debit.Rmd’
    
    --- re-building ‘grim.Rmd’ using rmarkdown
    --- finished re-building ‘grim.Rmd’
    
    ...
    Error: processing vignette 'wrangling.Rmd' failed with diagnostics:
    The `value` argument of `names<-` must be a character vector as of
    tibble 3.0.0.
    --- failed re-building ‘wrangling.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘wrangling.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# shinyCohortBuilder

<details>

* Version: 0.1
* GitHub: NA
* Source code: https://github.com/cran/shinyCohortBuilder
* Date/Publication: 2022-06-23 18:10:05 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "shinyCohortBuilder")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘custom-gui-layer.Rmd’ using rmarkdown
    --- finished re-building ‘custom-gui-layer.Rmd’
    
    --- re-building ‘gui-filter-layer.Rmd’ using rmarkdown
    --- finished re-building ‘gui-filter-layer.Rmd’
    
    --- re-building ‘package-options.Rmd’ using rmarkdown
    --- finished re-building ‘package-options.Rmd’
    
    ...
    --- failed re-building ‘shinyCohortBuilder.Rmd’
    
    --- re-building ‘updating-source.Rmd’ using rmarkdown
    --- finished re-building ‘updating-source.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘shinyCohortBuilder.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘htmltools’
      All declared Imports should be used.
    ```

# srvyr

<details>

* Version: 1.2.0
* GitHub: https://github.com/gergness/srvyr
* Source code: https://github.com/cran/srvyr
* Date/Publication: 2023-02-21 04:10:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "srvyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘srvyr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cascade
    > ### Title: Summarise multiple values into cascading groups
    > ### Aliases: cascade
    > 
    > ### ** Examples
    > 
    > library(survey)
    ...
    > # is a little ugly, as it requires passing a list of quosures or
    > # symbols you've created, rather than the usual syntax
    > dstrata %>%
    +   cascade(
    +     prop = survey_mean(),
    +     .groupings = list(rlang::quos(stype, awards), rlang::quos(NULL))
    +   )
    Error in parent.env(private$chops) : argument is not an environment
    Calls: %>% ... cur_group_data -> cur_group_id -> <Anonymous> -> parent.env
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       26. │                   └─lifecycle:::deprecate_warn0(...)
       27. │                     ├─base::withRestarts(...)
       28. │                     │ └─base (local) withOneRestart(expr, restarts[[1L]])
       29. │                     │   └─base (local) doWithOneRestart(return(expr), restart)
       30. │                     └─base::signalCondition(wrn)
       31. └─dplyr (local) `<fn>`(`<lfcycl__>`)
       32.   └─dplyr:::cnd_data(...)
       33.     └─dplyr:::cur_group_data(mask_type)
       34.       └─dplyr::cur_group_id()
       35.         └─peek_mask()$get_current_group()
       36.           └─base::parent.env(private$chops)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 402 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘extending-srvyr.Rmd’ using rmarkdown
    --- finished re-building ‘extending-srvyr.Rmd’
    
    --- re-building ‘srvyr-database.Rmd’ using rmarkdown
    --- finished re-building ‘srvyr-database.Rmd’
    
    --- re-building ‘srvyr-vs-survey.Rmd’ using rmarkdown
    Quitting from lines 350-354 (srvyr-vs-survey.Rmd) 
    Error: processing vignette 'srvyr-vs-survey.Rmd' failed with diagnostics:
    argument is not an environment
    --- failed re-building ‘srvyr-vs-survey.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘srvyr-vs-survey.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘convey’
    ```

# survminer

<details>

* Version: 0.4.9
* GitHub: https://github.com/kassambara/survminer
* Source code: https://github.com/cran/survminer
* Date/Publication: 2021-03-09 09:50:03 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "survminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘survminer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggsurvplot_facet
    > ### Title: Facet Survival Curves into Multiple Panels
    > ### Aliases: ggsurvplot_facet
    > 
    > ### ** Examples
    > 
    > library(survival)
    ...
    ℹ The signature and semantics have changed, see `?as_tibble`.
    Backtrace:
        ▆
     1. ├─survminer::ggsurvplot_facet(...)
     2. │ └─... %>% tibble::as.tibble()
     3. └─tibble::as.tibble(.)
     4.   └─lifecycle::deprecate_stop(...)
     5.     └─lifecycle:::deprecate_stop0(msg)
     6.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        doc   5.5Mb
    ```

# swmmr

<details>

* Version: 0.9.1
* GitHub: https://github.com/dleutnant/swmmr
* Source code: https://github.com/cran/swmmr
* Date/Publication: 2020-03-02 14:10:03 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "swmmr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘How_swmmr_reads_and_writes_files.Rmd’ using rmarkdown
    SWMM executable not found.
    --- finished re-building ‘How_swmmr_reads_and_writes_files.Rmd’
    
    --- re-building ‘How_to_autocalibrate_a_SWMM_model_with_swmmr.Rmd’ using rmarkdown
    --- finished re-building ‘How_to_autocalibrate_a_SWMM_model_with_swmmr.Rmd’
    
    --- re-building ‘How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd’ using rmarkdown
    ...
    `as.tibble()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` instead.
    ℹ The signature and semantics have changed, see `?as_tibble`.
    --- failed re-building ‘How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# synoptReg

<details>

* Version: 1.2.1
* GitHub: https://github.com/lemuscanovas/synoptReg
* Source code: https://github.com/cran/synoptReg
* Date/Publication: 2021-04-21 23:20:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "synoptReg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘synoptReg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: synoptclas
    > ### Title: PCA Synoptic classification
    > ### Aliases: synoptclas
    > 
    > ### ** Examples
    > 
    > # Load data (mslp or precp_grid)
    ...
      3. ├─tibble::as_tibble(.)
      4. ├─base::cbind.data.frame(...)
      5. │ └─base::data.frame(..., check.names = FALSE)
      6. └─stats::setNames(., 1:ncomp)
      7.   ├─base::`names<-`(`*tmp*`, value = nm)
      8.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = nm)
      9.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must be a character vector')")
     10.       └─lifecycle:::deprecate_stop0(msg)
     11.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        data      1.5Mb
        extdata   3.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘metR’
      All declared Imports should be used.
    ```

# tidyCDISC

<details>

* Version: 0.2.0
* GitHub: https://github.com/Biogen-Inc/tidyCDISC
* Source code: https://github.com/cran/tidyCDISC
* Date/Publication: 2023-02-03 17:10:02 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::cloud_details(, "tidyCDISC")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │ └─tidyCDISC:::app_mean.ADSL(column, week, group, data)
        4. │   └─data %>% mean_summary(column) %>% transpose_df(999)
        5. └─tidyCDISC:::transpose_df(., 999)
        6.   ├─t_df[-num, ]
        7.   └─tibble:::`[.tbl_df`(t_df, -num, )
        8.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
        9.       └─tibble:::fix_oob(i, nr)
       10.         └─tibble:::fix_oob_negative(i, n, warn)
       11.           └─lifecycle::deprecate_stop(...)
       12.             └─lifecycle:::deprecate_stop0(msg)
       13.               └─rlang::cnd_signal(...)
      
      [ FAIL 7 | WARN 13 | SKIP 8 | PASS 98 ]
      Error: Test failures
      Execution halted
    ```

# understandBPMN

<details>

* Version: 1.1.1
* GitHub: NA
* Source code: https://github.com/cran/understandBPMN
* Date/Publication: 2019-09-27 11:30:03 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "understandBPMN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘understandBPMN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_metrics
    > ### Title: A calculation function for all metrics
    > ### Aliases: calculate_metrics
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
     1. ├─understandBPMN::calculate_metrics(file_path, generate_new_path_log = TRUE)
     2. │ └─tibble::tibble(...)
     3. │   └─tibble:::tibble_quos(xs, .rows, .name_repair)
     4. │     └─rlang::eval_tidy(xs[[j]], mask)
     5. └─understandBPMN::separability(file_path, signavio, generate_new_path_log = TRUE)
     6.   └─tibble::as.tibble(intersection_elements)
     7.     └─lifecycle::deprecate_stop(...)
     8.       └─lifecycle:::deprecate_stop0(msg)
     9.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ℹ The signature and semantics have changed, see `?as_tibble`.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at testMetrics.R:157:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─understandBPMN::separability(doc, generate_new_path_log = TRUE)
       5.   └─tibble::as.tibble(intersection_elements)
       6.     └─lifecycle::deprecate_stop(...)
       7.       └─lifecycle:::deprecate_stop0(msg)
       8.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 299 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# whomds

<details>

* Version: 1.1.0
* GitHub: https://github.com/lindsayevanslee/whomds
* Source code: https://github.com/cran/whomds
* Date/Publication: 2022-05-27 09:30:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "whomds")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘whomds-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: table_weightedpct
    > ### Title: Calculate table of percentages or N of response distribution for
    > ###   survey items, survey weighted, disaggregated
    > ### Aliases: table_weightedpct
    > 
    > ### ** Examples
    > 
    ...
    +     vars_strata = "strata",
    +     vars_weights = "weight",
    +     formula_vars = paste0("EF",1:10),
    +     formula_vars_levels = 1:5,
    +     by_vars = "sex")
    Warning in table_weightedpct(df_adults, vars_ids = c("HHID", "PSU"), vars_strata = "strata",  :
      You may have issues with lonely PSUs if you have not set: options(survey.lonely.psu = "adjust")
    Error in parent.env(private$chops) : argument is not an environment
    Calls: table_weightedpct ... cur_group_data -> cur_group_id -> <Anonymous> -> parent.env
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       28. │                   └─lifecycle:::deprecate_warn0(...)
       29. │                     ├─base::withRestarts(...)
       30. │                     │ └─base (local) withOneRestart(expr, restarts[[1L]])
       31. │                     │   └─base (local) doWithOneRestart(return(expr), restart)
       32. │                     └─base::signalCondition(wrn)
       33. └─dplyr (local) `<fn>`(`<lfcycl__>`)
       34.   └─dplyr:::cnd_data(...)
       35.     └─dplyr:::cur_group_data(mask_type)
       36.       └─dplyr::cur_group_id()
       37.         └─peek_mask()$get_current_group()
       38.           └─base::parent.env(private$chops)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘c1_background_EN.Rmd’ using rmarkdown
    --- finished re-building ‘c1_background_EN.Rmd’
    
    --- re-building ‘c1_background_ES.Rmd’ using rmarkdown
    --- finished re-building ‘c1_background_ES.Rmd’
    
    --- re-building ‘c2_getting_started_EN.Rmd’ using rmarkdown
    --- finished re-building ‘c2_getting_started_EN.Rmd’
    
    ...
    Quitting from lines 90-107 (c6_after_rasch_ES.Rmd) 
    Error: processing vignette 'c6_after_rasch_ES.Rmd' failed with diagnostics:
    argument is not an environment
    --- failed re-building ‘c6_after_rasch_ES.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘c6_after_rasch_EN.Rmd’ ‘c6_after_rasch_ES.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

