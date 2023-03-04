# actxps

<details>

* Version: 0.2.1
* GitHub: https://github.com/mattheaphy/actxps
* Source code: https://github.com/cran/actxps
* Date/Publication: 2023-02-11 13:10:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "actxps")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        `actual$ae_expected_1`: 0.9
      `expected$ae_expected_1`: 1.4
      
        `actual$ae_expected_2`: 1.0
      `expected$ae_expected_2`: 1.7
      
        `actual$adj_expected_1`: 0.02
      `expected$adj_expected_1`: 0.03
      
        `actual$adj_expected_2`: 0.02
      `expected$adj_expected_2`: 0.03
      
      [ FAIL 2 | WARN 3 | SKIP 0 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

# anomalize

<details>

* Version: 0.2.3
* GitHub: https://github.com/business-science/anomalize
* Source code: https://github.com/cran/anomalize
* Date/Publication: 2023-02-09 20:10:02 UTC
* Number of recursive dependencies: 203

Run `revdepcheck::cloud_details(, "anomalize")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘anomalize-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: decompose_methods
    > ### Title: Methods that power time_decompose()
    > ### Aliases: decompose_methods decompose_twitter decompose_stl
    > 
    > ### ** Examples
    > 
    > 
    ...
     13.     │   └─name %in% x
     14.     ├─dplyr::group_vars(x)
     15.     └─dplyr:::group_vars.data.frame(x)
     16.       ├─generics::setdiff(names(group_data(x)), ".rows")
     17.       ├─dplyr::group_data(x)
     18.       └─dplyr:::group_data.grouped_df(x)
     19.         ├─base::withCallingHandlers(...)
     20.         └─dplyr::validate_grouped_df(.data)
     21.           └─rlang::abort(result)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-utils.R:4'): utils: time_decompose `merge = T` works ───────────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `dplyr::mutate(., nested.col = purrr::map(.x = data, .f = .f, 
          target = !!target_expr, ...))`: ℹ In argument: `nested.col = purrr::map(.x = data, .f = .f, target =
        count, ...)`.
      Caused by error in `purrr::map()`:
      ℹ In index: 1.
      Caused by error in `group_data()`:
      ! `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      
      [ FAIL 25 | WARN 0 | SKIP 0 | PASS 27 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘anomalize_methods.Rmd’ using rmarkdown
    Quitting from lines 87-110 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    `.data` must be a valid <grouped_df> object.
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘anomalize_methods.Rmd’
    
    --- re-building ‘anomalize_quick_start_guide.Rmd’ using rmarkdown
    ...
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘forecasting_with_cleaned_anomalies.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘anomalize_methods.Rmd’ ‘anomalize_quick_start_guide.Rmd’
      ‘forecasting_with_cleaned_anomalies.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘cli’ ‘crayon’ ‘rstudioapi’
      All declared Imports should be used.
    ```

# audubon

<details>

* Version: 0.4.0
* GitHub: https://github.com/paithiov909/audubon
* Source code: https://github.com/cran/audubon
* Date/Publication: 2022-12-15 12:20:07 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "audubon")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘audubon-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: collapse_tokens
    > ### Title: Collapse sequences of tokens by condition
    > ### Aliases: collapse_tokens
    > 
    > ### ** Examples
    > 
    > df <- prettify(head(hiroba), col_select = "POS1")
    ...
      3. │ │ └─base::withCallingHandlers(...)
      4. │ └─... %>% ...
      5. └─readr::read_delim(...)
      6.   └─vroom::vroom(...)
      7.     └─vroom:::vroom_select(out, col_select, id)
      8.       └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
      9.         └─tidyselect:::eval_select_impl(...)
     10.           └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     11.             └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─audubon::prettify(hiroba)
        6. │ ├─base::suppressWarnings(...)
        7. │ │ └─base::withCallingHandlers(...)
        8. │ └─... %>% ...
        9. └─readr::read_delim(...)
       10.   └─vroom::vroom(...)
       11.     └─vroom:::vroom_select(out, col_select, id)
       12.       └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
       13.         └─tidyselect:::eval_select_impl(...)
       14.           └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
       15.             └─rlang::abort(...)
      
      [ FAIL 4 | WARN 0 | SKIP 1 | PASS 33 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 54582 marked UTF-8 strings
    ```

# auk

<details>

* Version: 0.6.0
* GitHub: https://github.com/CornellLabofOrnithology/auk
* Source code: https://github.com/cran/auk
* Date/Publication: 2022-10-29 22:15:59 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "auk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘auk-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: auk_rollup
    > ### Title: Roll up eBird taxonomy to species
    > ### Aliases: auk_rollup
    > 
    > ### ** Examples
    > 
    > # get the path to the example data included in the package
    ...
     1. ├─auk::read_ebd(f, rollup = FALSE)
     2. └─auk:::read_ebd.character(f, rollup = FALSE)
     3.   └─readr::read_delim(...)
     4.     └─vroom::vroom(...)
     5.       └─vroom:::vroom_select(out, col_select, id)
     6.         └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
     7.           └─tidyselect:::eval_select_impl(...)
     8.             └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     9.               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─auk::auk_zerofill(...) at test_unmarked.r:57:2
        2. └─auk:::auk_zerofill.character(...)
        3.   ├─auk::read_ebd(x = x, sep = sep, unique = FALSE, rollup = FALSE)
        4.   └─auk:::read_ebd.character(x = x, sep = sep, unique = FALSE, rollup = FALSE)
        5.     └─readr::read_delim(...)
        6.       └─vroom::vroom(...)
        7.         └─vroom:::vroom_select(out, col_select, id)
        8.           └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
        9.             └─tidyselect:::eval_select_impl(...)
       10.               └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
       11.                 └─rlang::abort(...)
      
      [ FAIL 20 | WARN 0 | SKIP 10 | PASS 169 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘auk.Rmd’ using rmarkdown
    Quitting from lines 212-215 (auk.Rmd) 
    Error: processing vignette 'auk.Rmd' failed with diagnostics:
    Can't select within an unnamed vector.
    --- failed re-building ‘auk.Rmd’
    
    --- re-building ‘development.Rmd’ using rmarkdown
    --- finished re-building ‘development.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘auk.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 552 marked UTF-8 strings
    ```

# brolgar

<details>

* Version: 1.0.0
* GitHub: https://github.com/njtierney/brolgar
* Source code: https://github.com/cran/brolgar
* Date/Publication: 2023-02-07 05:12:31 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "brolgar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘brolgar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_n_obs
    > ### Title: Add the number of observations for each key in a 'tsibble'
    > ### Aliases: add_n_obs
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
      7. ├─dplyr::mutate(., n_obs = dplyr::n())
      8. └─tsibble::group_by_key(.)
      9.   ├─dplyr::group_by(.data, !!!key(.data), .drop = .drop)
     10.   └─tsibble:::group_by.tbl_ts(.data, !!!key(.data), .drop = .drop)
     11.     └─tsibble::build_tsibble(...)
     12.       └─tsibble::build_tsibble_meta(...)
     13.         └─tsibble::new_tsibble(x, groups = grp_data, class = cls)
     14.           └─tsibble:::assert_key_data(attr(x, "key"))
     15.             └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9.   └─tsibble:::group_by.tbl_ts(.data, !!!key(.data), .drop = .drop)
       10.     └─tsibble::build_tsibble(...)
       11.       └─tsibble::build_tsibble_meta(...)
       12.         └─tsibble::new_tsibble(x, groups = grp_data, class = cls)
       13.           └─tsibble:::assert_key_data(attr(x, "key"))
       14.             └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
      
      [ FAIL 2 | WARN 1 | SKIP 5 | PASS 236 ]
      Deleting unused snapshots:
      • facet-sample/gg-facet-sample-alt.svg
      • facet-sample/gg-facet-sample.svg
      • facet-strata/gg-facet-strata-along.svg
      • facet-strata/gg-facet-strata.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘exploratory-modelling.Rmd’ using rmarkdown
    --- finished re-building ‘exploratory-modelling.Rmd’
    
    --- re-building ‘finding-features.Rmd’ using rmarkdown
    --- finished re-building ‘finding-features.Rmd’
    
    --- re-building ‘getting-started.Rmd’ using rmarkdown
    Quitting from lines 74-75 (getting-started.Rmd) 
    Error: processing vignette 'getting-started.Rmd' failed with diagnostics:
    ...
    Quitting from lines 58-60 (visualisation-gallery.Rmd) 
    Error: processing vignette 'visualisation-gallery.Rmd' failed with diagnostics:
    The `key` attribute must be a data frame with its last column called `.rows`.
    --- failed re-building ‘visualisation-gallery.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘getting-started.Rmd’ ‘visualisation-gallery.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# btb

<details>

* Version: 0.2.0
* GitHub: https://github.com/InseeFr/btb
* Source code: https://github.com/cran/btb
* Date/Publication: 2022-10-24 15:25:11 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "btb")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘btb.Rmd’ using rmarkdown
    Quitting from lines 113-119 (btb.Rmd) 
    Error: processing vignette 'btb.Rmd' failed with diagnostics:
    Can't extract column with `attr(obj, "sf_column")`.
    ✖ Subscript `attr(obj, "sf_column")` must be size 1, not 0.
    --- failed re-building ‘btb.Rmd’
    
    --- re-building ‘logo.Rmd’ using rmarkdown
    --- finished re-building ‘logo.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘btb.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        data   1.6Mb
        libs   4.6Mb
    ```

# bupaR

<details>

* Version: 0.5.2
* GitHub: https://github.com/bupaverse/bupaR
* Source code: https://github.com/cran/bupaR
* Date/Publication: 2022-09-30 14:40:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "bupaR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. │   └─dplyr:::add_computed_columns(.data, vars, error_call = error_call)
       10. │     ├─dplyr::ungroup(.data)
       11. │     └─bupaR:::ungroup.activitylog(.data)
       12. │       └─x %>% as.data.frame() %>% dplyr::ungroup(...) %>% ...
       13. └─bupaR::re_map(., mapping)
       14.   ├─bupaR::activitylog(...)
       15.   └─bupaR:::activitylog.data.frame(...)
       16.     └─purrr::reduce(...)
       17.       └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
       18.         └─bupaR (local) fn(out, elt, ...)
       19.           └─bupaR:::check_attributes_activitylog(...)
      
      [ FAIL 21 | WARN 0 | SKIP 10 | PASS 217 ]
      Error: Test failures
      Execution halted
    ```

# cleanTS

<details>

* Version: 0.1.1
* GitHub: https://github.com/Mayur1009/cleanTS
* Source code: https://github.com/cran/cleanTS
* Date/Publication: 2022-06-15 09:20:19 UTC
* Number of recursive dependencies: 163

Run `revdepcheck::cloud_details(, "cleanTS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cleanTS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cleanTS
    > ### Title: Clean univariate time-series data
    > ### Aliases: cleanTS
    > 
    > ### ** Examples
    > 
    > # Convert sunspots.month to dataframe
    ...
     20.     │   └─name %in% x
     21.     ├─dplyr::group_vars(x)
     22.     └─dplyr:::group_vars.data.frame(x)
     23.       ├─generics::setdiff(names(group_data(x)), ".rows")
     24.       ├─dplyr::group_data(x)
     25.       └─dplyr:::group_data.grouped_df(x)
     26.         ├─base::withCallingHandlers(...)
     27.         └─dplyr::validate_grouped_df(.data)
     28.           └─rlang::abort(result)
    Execution halted
    ```

# cubble

<details>

* Version: 0.2.0
* GitHub: https://github.com/huizezhang-sherry/cubble
* Source code: https://github.com/cran/cubble
* Date/Publication: 2022-11-17 12:30:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "cubble")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11.   └─cubble:::ungroup.cubble_df(data)
       12.     └─cubble:::new_cubble(...)
       13.       ├─dplyr::arrange(data, !!sym(key[1]))
       14.       └─tsibble:::arrange.tbl_ts(data, !!sym(key[1]))
       15.         └─tsibble:::update_meta(arr_data, .data, ordered = FALSE, interval = interval(.data))
       16.           ├─tsibble::build_tsibble(...)
       17.           │ └─rlang::enquo(index2)
       18.           └─tsibble::index2(old)
       19.             └─rlang::sym(index2_var(x))
       20.               └─rlang:::abort_coercion(x, "a symbol")
       21.                 └─rlang::abort(msg, call = call)
      
      [ FAIL 1 | WARN 13 | SKIP 7 | PASS 51 ]
      Error: Test failures
      Execution halted
    ```

# daqapo

<details>

* Version: 0.3.2
* GitHub: https://github.com/bupaverse/daqapo
* Source code: https://github.com/cran/daqapo
* Date/Publication: 2022-07-14 09:00:09 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "daqapo")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction-to-DaQAPO.Rmd’ using rmarkdown
    Quitting from lines 200-203 (Introduction-to-DaQAPO.Rmd) 
    Error: processing vignette 'Introduction-to-DaQAPO.Rmd' failed with diagnostics:
    No case_id provided
    --- failed re-building ‘Introduction-to-DaQAPO.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction-to-DaQAPO.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dataquieR

<details>

* Version: 2.0.0
* GitHub: NA
* Source code: https://github.com/cran/dataquieR
* Date/Publication: 2023-03-01 16:30:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "dataquieR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • plots/pro-applicability-matrix-segment-v50000.svg
      • plots/pro-applicability-matrix.svg
      • plots/reportsummarytable-cont.svg
      • plots/shape-or-scale-dbp0.svg
      • print/app-ex-repsumtab.svg
      • print/im-empty-repsumtab.svg
      • print/im-ex1-repsumtab.svg
      • print/im-ex2-repsumtab.svg
      • pro_applicability_matrix/appmatrix-plot-for-segment-v10000-ok.svg
      • pro_applicability_matrix/appmatrix-plot-ok.svg
      • util_heatmap_1th/util-heatmap-1th-1.svg
      • util_heatmap_1th/util-heatmap-1th-2.svg
      • util_heatmap_1th/util-heatmap-1th-3.svg
      Error: Test failures
      Execution halted
    ```

# dcurves

<details>

* Version: 0.4.0
* GitHub: https://github.com/ddsjoberg/dcurves
* Source code: https://github.com/cran/dcurves
* Date/Publication: 2022-12-23 19:00:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "dcurves")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dca.Rmd’ using rmarkdown
    Quitting from lines 48-51 (dca.Rmd) 
    Error: processing vignette 'dca.Rmd' failed with diagnostics:
    'exponentiate' is not provided. You need to pass it explicitely.
    --- failed re-building ‘dca.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘dca.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dplyr

<details>

* Version: 1.1.0
* GitHub: https://github.com/tidyverse/dplyr
* Source code: https://github.com/cran/dplyr
* Date/Publication: 2023-01-29 22:50:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "dplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `expected` is a character vector ('bar')
      ── Failure ('test-group-by.R:582'): group_by() keeps attributes unrelated to the grouping (#5760) ──
      attr(d2, "foo") (`actual`) not equal to "bar" (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('bar')
      ── Failure ('test-group-by.R:585'): group_by() keeps attributes unrelated to the grouping (#5760) ──
      attr(d2, "foo") (`actual`) not equal to "bar" (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('bar')
      
      [ FAIL 5 | WARN 0 | SKIP 311 | PASS 2738 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# edeaR

<details>

* Version: 0.9.3
* GitHub: https://github.com/bupaverse/edeaR
* Source code: https://github.com/cran/edeaR
* Date/Publication: 2023-02-16 17:30:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "edeaR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `check_attributes()`:
      ! No case_id provided nor found
      ── Error ('test_throughput_time.R:119'): test throughput_time on grouped_activitylog for attr 'units' set when arg 'units' = 'auto' ──
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `mutate(., data = map(data, re_map, mapping))`: i In argument: `data = map(data, re_map, mapping)`.
      Caused by error in `map()`:
      i In index: 1.
      Caused by error in `check_attributes()`:
      ! No case_id provided nor found
      
      [ FAIL 4 | WARN 1 | SKIP 1 | PASS 127 ]
      Error: Test failures
      Execution halted
    ```

# eflm

<details>

* Version: 0.3.0
* GitHub: https://github.com/pachadotdev/eflm
* Source code: https://github.com/cran/eflm
* Date/Publication: 2021-05-31 21:20:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "eflm")` for more info

</details>

## Newly broken

*   checking whether package ‘eflm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/eflm/new/eflm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘eflm’
Execution halted
ERROR: lazy loading failed for package ‘eflm’
* removing ‘/tmp/workdir/eflm/new/eflm.Rcheck/eflm’


```
### CRAN

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (eflm)


```
# eks

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/eks
* Date/Publication: 2022-11-29 19:20:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "eks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eks-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidyst_kdr
    > ### Title: Tidy and geospatial kernel density ridge estimates
    > ### Aliases: tidy_kdr st_kdr
    > ### Keywords: smooth
    > 
    > ### ** Examples
    > 
    ...
    > data(wa)
    > data(grevilleasf)
    > hakeoides <- dplyr::filter(grevilleasf, species=="hakeoides")
    > ## gridsize=c(21,21) is for illustrative purposes only 
    > ## remove for more complete KDR
    > s1 <- st_kdr(hakeoides, gridsize=c(21,21))
    Error in select.sf(xs, -dplyr::all_of("n")) : 
      internal error: can't find sf column
    Calls: st_kdr ... .tidy_kdr -> st_simplify_point -> <Anonymous> -> select.sf
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tidysf_kde.Rmd’ using rmarkdown
    Quitting from lines 123-140 (tidysf_kde.Rmd) 
    Error: processing vignette 'tidysf_kde.Rmd' failed with diagnostics:
    'names' attribute [4] must be the same length as the vector [3]
    --- failed re-building ‘tidysf_kde.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tidysf_kde.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ExpertChoice

<details>

* Version: 0.2.0
* GitHub: https://github.com/JedStephens/ExpertChoice
* Source code: https://github.com/cran/ExpertChoice
* Date/Publication: 2020-04-03 14:30:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "ExpertChoice")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ExpertChoice-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: check_overshadow
    > ### Title: Check Overshadow - Pareto Dominate Solutions
    > ### Aliases: check_overshadow
    > 
    > ### ** Examples
    > 
    > #See Step 7 of the Practical Introduction to ExpertChoice Vignette.
    ...
    > # Step 5 - Skipped, but important, see vignette.
    > 
    > # Step 6
    > # Two modulators c(1,1,1) and c(0,1,1) are specified.
    > dce_modulo <- modulo_method(
    + fractional,
    + list(c(1,1,1),c(0,1,1))
    + )
    Error: Ill defined generators
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘practical.Rmd’ using rmarkdown
    Quitting from lines 210-212 (practical.Rmd) 
    Error: processing vignette 'practical.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘practical.Rmd’
    
    --- re-building ‘include_theory.Rnw’ using Sweave
    Error: processing vignette 'include_theory.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'include_theory.tex' failed.
    ...
    l.4 ^^M
           
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘include_theory.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘practical.Rmd’ ‘include_theory.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# fable

<details>

* Version: 0.3.2
* GitHub: https://github.com/tidyverts/fable
* Source code: https://github.com/cran/fable
* Date/Publication: 2022-09-01 19:40:02 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "fable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: AR
    > ### Title: Estimate a AR model
    > ### Aliases: AR report.AR
    > 
    > ### ** Examples
    > 
    > luteinizing_hormones <- as_tsibble(lh)
    ...
     14. └─fabletools:::forecast.lst_mdl(...)
     15.   └─fabletools:::mapply_maybe_parallel(...)
     16.     └─base::mapply(FUN = .f, ..., MoreArgs = MoreArgs, SIMPLIFY = SIMPLIFY)
     17.       ├─fabletools (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]], h = NULL, point_forecast = `<named list>`)
     18.       └─fabletools:::forecast.mdl_ts(...)
     19.         └─fabletools:::build_fable(fbl, response = resp_vars, distribution = !!sym(dist_col))
     20.           └─tsibble::new_tsibble(...)
     21.             └─tsibble:::assert_key_data(attr(x, "key"))
     22.               └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-var.R:28'): Univariate VAR ─────────────────────────────────────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `mutate(.tbl, !!!funs)`: ℹ In argument: `VAR(fdeaths ~ 0) = (function (object, ...) ...`.
      Caused by error in `assert_key_data()`:
      ! The `key` attribute must be a data frame with its last column called `.rows`.
      ── Error ('test-var.R:43'): VAR with xregs ─────────────────────────────────────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `mutate(.tbl, !!!funs)`: ℹ In argument: `VAR(vars(mdeaths, fdeaths) ~ AR(2) + fourier(K = 5)) =
        (function (object, ...) ...`.
      Caused by error in `assert_key_data()`:
      ! The `key` attribute must be a data frame with its last column called `.rows`.
      
      [ FAIL 13 | WARN 0 | SKIP 1 | PASS 51 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fable.Rmd’ using rmarkdown
    Quitting from lines 30-35 (fable.Rmd) 
    Error: processing vignette 'fable.Rmd' failed with diagnostics:
    The `key` attribute must be a data frame with its last column called `.rows`.
    --- failed re-building ‘fable.Rmd’
    
    --- re-building ‘transformations.Rmd’ using rmarkdown
    --- finished re-building ‘transformations.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fable.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# fable.ata

<details>

* Version: 0.0.3
* GitHub: https://github.com/alsabtay/fable.ata
* Source code: https://github.com/cran/fable.ata
* Date/Publication: 2021-12-09 17:10:06 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "fable.ata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fable.ata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: forecast.ATA
    > ### Title: Forecast a model from the fable ATA model
    > ### Aliases: forecast.ATA
    > 
    > ### ** Examples
    > 
    > library(fable.ata)
    ...
     13. └─fabletools:::forecast.lst_mdl(...)
     14.   └─fabletools:::mapply_maybe_parallel(...)
     15.     └─base::mapply(FUN = .f, ..., MoreArgs = MoreArgs, SIMPLIFY = SIMPLIFY)
     16.       ├─fabletools (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]], h = 24, point_forecast = `<named list>`)
     17.       └─fabletools:::forecast.mdl_ts(...)
     18.         └─fabletools:::build_fable(fbl, response = resp_vars, distribution = !!sym(dist_col))
     19.           └─tsibble::new_tsibble(...)
     20.             └─tsibble:::assert_key_data(attr(x, "key"))
     21.               └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

# fabletools

<details>

* Version: 0.3.2
* GitHub: https://github.com/tidyverts/fabletools
* Source code: https://github.com/cran/fabletools
* Date/Publication: 2021-11-29 05:50:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "fabletools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fabletools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: accuracy
    > ### Title: Evaluate accuracy of a forecast or model
    > ### Aliases: accuracy accuracy.mdl_df accuracy.fbl_ts
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
     18. └─fabletools:::forecast.lst_mdl(...)
     19.   └─fabletools:::mapply_maybe_parallel(...)
     20.     └─base::mapply(FUN = .f, ..., MoreArgs = MoreArgs, SIMPLIFY = SIMPLIFY)
     21.       ├─fabletools (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]], h = "5 years", point_forecast = `<named list>`)
     22.       └─fabletools:::forecast.mdl_ts(...)
     23.         └─fabletools:::build_fable(fbl, response = resp_vars, distribution = !!sym(dist_col))
     24.           └─tsibble::new_tsibble(...)
     25.             └─tsibble:::assert_key_data(attr(x, "key"))
     26.               └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       19. │       ├─base::withCallingHandlers(...)
       20. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       21. │         └─mask$eval_all_mutate(quo)
       22. │           └─dplyr (local) eval()
       23. ├─fabletools (local) `<fn>`(...)
       24. └─fabletools:::forecast.lst_mdl(...)
       25.   └─fabletools:::mapply_maybe_parallel(...)
       26.     └─base::mapply(FUN = .f, ..., MoreArgs = MoreArgs, SIMPLIFY = SIMPLIFY)
       27.       ├─fabletools (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]], h = 12, point_forecast = `<named list>`)
       28.       └─fabletools:::forecast.mdl_ts(...)
       29.         └─fabletools:::build_fable(fbl, response = resp_vars, distribution = !!sym(dist_col))
       30.           └─tsibble::new_tsibble(...)
       31.             └─tsibble:::assert_key_data(attr(x, "key"))
       32.               └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘extension_models.Rmd’ using rmarkdown
    Quitting from lines 249-272 (extension_models.Rmd) 
    Error: processing vignette 'extension_models.Rmd' failed with diagnostics:
    ℹ In argument: `SMEAN(Beer) = (function (object, ...) ...`.
    Caused by error in `assert_key_data()`:
    ! The `key` attribute must be a data frame with its last column called `.rows`.
    --- failed re-building ‘extension_models.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘extension_models.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# feasts

<details>

* Version: 0.3.0
* GitHub: https://github.com/tidyverts/feasts
* Source code: https://github.com/cran/feasts
* Date/Publication: 2022-09-01 19:50:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "feasts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘feasts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ACF
    > ### Title: (Partial) Autocorrelation and Cross-Correlation Function
    > ###   Estimation
    > ### Aliases: ACF PACF CCF
    > 
    > ### ** Examples
    > 
    ...
    ! The `key` attribute must be a data frame with its last column called `.rows`.
    Backtrace:
        ▆
     1. ├─vic_elec %>% ACF(Temperature)
     2. └─feasts::ACF(., Temperature)
     3.   └─feasts:::build_cf(...)
     4.     └─tsibble::new_tsibble(...)
     5.       └─tsibble:::assert_key_data(attr(x, "key"))
     6.         └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `transmute(as_tibble(object), !!!syms(kv), !!sym(".model"), cmp = map(!!sym(".fit"), 
          components))`: ℹ In argument: `cmp = map(.fit, components)`.
      Caused by error in `assert_key_data()`:
      ! The `key` attribute must be a data frame with its last column called `.rows`.
      ── Error ('test-x11.R:48'): Multiplicative X11 decomposition ───────────────────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `transmute(as_tibble(object), !!!syms(kv), !!sym(".model"), cmp = map(!!sym(".fit"), 
          components))`: ℹ In argument: `cmp = map(.fit, components)`.
      Caused by error in `assert_key_data()`:
      ! The `key` attribute must be a data frame with its last column called `.rows`.
      
      [ FAIL 12 | WARN 0 | SKIP 0 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘feasts.Rmd’ using rmarkdown
    Quitting from lines 30-35 (feasts.Rmd) 
    Error: processing vignette 'feasts.Rmd' failed with diagnostics:
    The `key` attribute must be a data frame with its last column called `.rows`.
    --- failed re-building ‘feasts.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘feasts.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘scales’
      All declared Imports should be used.
    ```

# fgdr

<details>

* Version: 1.1.1
* GitHub: https://github.com/uribo/fgdr
* Source code: https://github.com/cran/fgdr
* Date/Publication: 2022-02-22 05:00:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "fgdr")` for more info

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
    ...
      6.       ├─obj[[attr(obj, "sf_column")]]
      7.       └─tibble:::`[[.tbl_df`(obj, attr(obj, "sf_column"))
      8.         └─tibble:::tbl_subset2(x, j = i, j_arg = substitute(i))
      9.           └─tibble:::vectbl_as_col_location2(...)
     10.             ├─tibble:::subclass_col_index_errors(...)
     11.             │ └─base::withCallingHandlers(...)
     12.             └─vctrs::vec_as_location2(j, n, names, call = call)
     13.               └─vctrs:::result_get(...)
     14.                 └─rlang::cnd_signal(x$err)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4.     ├─sf::st_geometry(x)
        5.     └─sf:::st_geometry.sf(x)
        6.       ├─obj[[attr(obj, "sf_column")]]
        7.       └─tibble:::`[[.tbl_df`(obj, attr(obj, "sf_column"))
        8.         └─tibble:::tbl_subset2(x, j = i, j_arg = substitute(i))
        9.           └─tibble:::vectbl_as_col_location2(...)
       10.             ├─tibble:::subclass_col_index_errors(...)
       11.             │ └─base::withCallingHandlers(...)
       12.             └─vctrs::vec_as_location2(j, n, names, call = call)
       13.               └─vctrs:::result_get(...)
       14.                 └─rlang::cnd_signal(x$err)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 48 ]
      Error: Test failures
      Execution halted
    ```

# galah

<details>

* Version: 1.5.1
* GitHub: https://github.com/AtlasOfLivingAustralia/galah-R
* Source code: https://github.com/cran/galah
* Date/Publication: 2023-01-13 09:20:07 UTC
* Number of recursive dependencies: 125

Run `revdepcheck::cloud_details(, "galah")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       5.     └─rlang::abort(bullets, call = error_call)
      ── Error ('test-international-UK.R:99'): show_values works for UK ──────────────
      Error in `show_values(x)`: Wrong input provided.
      ℹ Must supply a tibble created by `search_all` or `show_all_` functions.
      Backtrace:
          ▆
       1. ├─vcr::use_cassette(...) at test-international-UK.R:99:2
       2. │ └─cassette$call_block(...)
       3. └─galah::show_values(x) at test-international-UK.R:100:3
       4.   └─galah:::check_inputs_to_values(df)
       5.     └─rlang::abort(bullets, call = error_call)
      
      [ FAIL 6 | WARN 0 | SKIP 92 | PASS 523 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘galah-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: galah_geolocate
    > ### Title: Narrow a query to within a specified area
    > ### Aliases: galah_geolocate
    > 
    > ### ** Examples
    > 
    > ## Not run: 
    ...
     10. │     │ └─base::withCallingHandlers(...)
     11. │     ├─sf::st_as_sfc(query)
     12. │     └─sf:::st_as_sfc.character(query)
     13. │       ├─sf::st_sfc(CPL_sfc_from_wkt(x))
     14. │       └─sf:::CPL_sfc_from_wkt(x)
     15. ├─base::stop(`<Rcpp::xc>`)
     16. └─rlang (local) `<fn>`(`<Rcpp::xc>`)
     17.   └─handlers[[1L]](cnd)
     18.     └─rlang::abort(bullets, call = caller_env())
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
    object 'tbl_subset_col' not found
    --- failed re-building ‘ggESDA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggESDA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggseg

<details>

* Version: 1.6.5
* GitHub: https://github.com/ggseg/ggseg
* Source code: https://github.com/cran/ggseg
* Date/Publication: 2022-06-13 11:10:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "ggseg")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘externalData.Rmd’ using rmarkdown
    Quitting from lines 148-160 (externalData.Rmd) 
    Error: processing vignette 'externalData.Rmd' failed with diagnostics:
    'names' attribute [12] must be the same length as the vector [11]
    --- failed re-building ‘externalData.Rmd’
    
    --- re-building ‘freesurfer_files.Rmd’ using rmarkdown
    --- finished re-building ‘freesurfer_files.Rmd’
    ...
    Quitting from lines 179-187 (ggseg.Rmd) 
    Error: processing vignette 'ggseg.Rmd' failed with diagnostics:
    'names' attribute [12] must be the same length as the vector [11]
    --- failed re-building ‘ggseg.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘externalData.Rmd’ ‘ggseg.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggseqplot

<details>

* Version: 0.8.1
* GitHub: https://github.com/maraab23/ggseqplot
* Source code: https://github.com/cran/ggseqplot
* Date/Publication: 2022-10-11 10:32:33 UTC
* Number of recursive dependencies: 130

Run `revdepcheck::cloud_details(, "ggseqplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggseqplot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggseqmsplot
    > ### Title: Modal State Sequence Plot
    > ### Aliases: ggseqmsplot
    > 
    > ### ** Examples
    > 
    > # Use examples from TraMineR
    ...
     15. │           └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
     16. │             └─mask$eval_all_mutate(quo)
     17. │               └─dplyr (local) eval()
     18. ├─dplyr:::dplyr_internal_error(...)
     19. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
     20. │   └─rlang:::signal_abort(cnd, .file)
     21. │     └─base::signalCondition(cnd)
     22. └─dplyr (local) `<fn>`(`<dpl:::__>`)
     23.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-ggseqmsplot.R:63'): check if output of ggseqmsplot is ggplot ───
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `purrr::map(msplotdata, ~dplyr::mutate(dplyr::mutate(tidyr::pivot_longer(.x, 
          cols = -1, values_to = "state", names_to = "xlab"), value = as.numeric(attributes(.x)$Frequencies)), 
          x = factor(dplyr::row_number()), .before = 2))`: i In index: 1.
      Caused by error in `dplyr::mutate()`:
      i In argument: `value = as.numeric(attributes(.x)$Frequencies)`.
      Caused by error:
      ! `value` must be size 12 or 1, not 0.
      
      [ FAIL 1 | WARN 1545 | SKIP 0 | PASS 130 ]
      Error: Test failures
      Execution halted
    ```

# gtsummary

<details>

* Version: 1.7.0
* GitHub: https://github.com/ddsjoberg/gtsummary
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2023-01-13 08:50:06 UTC
* Number of recursive dependencies: 199

Run `revdepcheck::cloud_details(, "gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot
    > ### Title: Plot Regression Coefficients
    > ### Aliases: plot plot.tbl_regression plot.tbl_uvregression
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    +   plot()
    + ## Don't show: 
    + }) # examplesIf
    > glm(response ~ marker + grade, trial, family = binomial) %>% tbl_regression(add_estimate_to_reference_rows = TRUE, 
    +     exponentiate = TRUE) %>% plot()
    Warning: Unknown or uninitialised column: `coefficients_label`.
    Error in if (result$label %in% c("Beta", "exp(Beta)")) { : 
      argument is of length zero
    Calls: <Anonymous> ... .tbl_regression_default_table_header -> .estimate_column_labels
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. ├─lm(age ~ trt, trial) %>% tbl_regression() %>% ...
        8. ├─base::plot(., remove_reference_rows = TRUE)
        9. ├─gtsummary::tbl_regression(.)
       10. └─gtsummary:::tbl_regression.default(.)
       11.   └─gtsummary:::.tbl_regression_default_table_header(...)
       12.     └─gtsummary:::.estimate_column_labels(x)
      
      [ FAIL 2 | WARN 3 | SKIP 76 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘gallery.Rmd’ using rmarkdown
    --- finished re-building ‘gallery.Rmd’
    
    --- re-building ‘gtsummary_definition.Rmd’ using rmarkdown
    Quitting from lines 27-38 (gtsummary_definition.Rmd) 
    Error: processing vignette 'gtsummary_definition.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘gtsummary_definition.Rmd’
    
    ...
    --- finished re-building ‘tbl_summary.Rmd’
    
    --- re-building ‘themes.Rmd’ using rmarkdown
    --- finished re-building ‘themes.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gtsummary_definition.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# halk

<details>

* Version: 0.0.1
* GitHub: NA
* Source code: https://github.com/cran/halk
* Date/Publication: 2023-02-13 08:40:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "halk")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `attr(actual, 'autobin')` is absent
      `attr(expected, 'autobin')` is a logical vector (TRUE)
      
      `attr(actual, 'dnorm_params')` is absent
      `attr(expected, 'dnorm_params')` is an S3 object of class <tbl_df/tbl/data.frame>, a list
      
      `attr(actual, 'size_bin')` is absent
      `attr(expected, 'size_bin')` is a double vector (1)
      
      `attr(actual, 'size_col')` is absent
      `attr(expected, 'size_col')` is a character vector ('length')
      
      [ FAIL 1 | WARN 75 | SKIP 0 | PASS 94 ]
      Error: Test failures
      Execution halted
    ```

# haven

<details>

* Version: 2.5.2
* GitHub: https://github.com/tidyverse/haven
* Source code: https://github.com/cran/haven
* Date/Publication: 2023-02-28 17:52:31 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "haven")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `expected` is a character vector ('abcd')
      ── Failure ('test-haven-stata.R:219'): can roundtrip file labels ───────────────
      attr(roundtrip_dta(df), "label") (`actual`) not equal to "abc" (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('abc')
      ── Failure ('test-haven-stata.R:220'): can roundtrip file labels ───────────────
      attr(roundtrip_dta(df, label = "abcd"), "label") (`actual`) not equal to "abcd" (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('abcd')
      
      [ FAIL 8 | WARN 0 | SKIP 17 | PASS 411 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        libs   4.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dplyr’
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# himach

<details>

* Version: 0.3.1
* GitHub: https://github.com/david6marsh/himach
* Source code: https://github.com/cran/himach
* Date/Publication: 2022-12-05 09:30:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "himach")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11.     └─himach (local) FUN(X[[i]], ...)
       12.       ├─ggplot2::ggplot(...)
       13.       └─ggplot2:::ggplot.default(...)
       14.         ├─ggplot2::fortify(data, ...)
       15.         └─ggplot2:::fortify.grouped_df(data, ...)
       16.           ├─base::`$<-`(`*tmp*`, ".group", value = `<int>`)
       17.           └─sf:::`$<-.sf`(`*tmp*`, ".group", value = `<int>`)
       18.             ├─base::`[[<-`(`*tmp*`, i, value = `<int>`)
       19.             └─sf:::`[[<-.sf`(`*tmp*`, i, value = `<int>`)
       20.               ├─sf::`st_agr<-`(`*tmp*`, value = agr)
       21.               └─sf:::`st_agr<-.sf`(`*tmp*`, value = agr)
      
      [ FAIL 1 | WARN 5 | SKIP 9 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

# impactflu

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/impactflu
* Date/Publication: 2020-01-14 11:00:02 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "impactflu")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   ├─tibble::as_tibble(...)
       3.   └─impactflu:::method3_cpp(init_pop_size, vaccinations, cases, ve)
      ── Failure ('test-sim.R:66'): simulation works with no lag ─────────────────────
      attr(pop, "seed") not equal to 1L.
      target is NULL, current is numeric
      ── Failure ('test-sim.R:67'): simulation works with no lag ─────────────────────
      attr(pop, "init_pop_size") not equal to 1000000L.
      target is NULL, current is numeric
      ── Failure ('test-sim.R:68'): simulation works with no lag ─────────────────────
      attr(pop, "lag") not equal to 0L.
      target is NULL, current is numeric
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 27 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# impactr

<details>

* Version: 0.4.1
* GitHub: https://github.com/verasls/impactr
* Source code: https://github.com/cran/impactr
* Date/Publication: 2022-08-08 10:10:05 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "impactr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘impactr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: define_region
    > ### Title: Define region of interest
    > ### Aliases: define_region
    > 
    > ### ** Examples
    > 
    > data <- read_acc(impactr_example("hip-raw.csv"))
    ...
    Backtrace:
        ▆
     1. └─impactr::read_acc(impactr_example("hip-raw.csv"))
     2.   └─vroom::vroom(...)
     3.     └─vroom:::vroom_select(out, col_select, id)
     4.       └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!!col_select)
     5.         └─tidyselect:::eval_select_impl(...)
     6.           └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     7.             └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-utils.R:78'): define_region() works ────────────────────────────
      Error in `vroom_select(out, col_select, id)`: Can't select within an unnamed vector.
      Backtrace:
          ▆
       1. └─impactr::read_acc(test_path("test-data-long.csv")) at test-utils.R:78:2
       2.   └─vroom::vroom(...)
       3.     └─vroom:::vroom_select(out, col_select, id)
       4.       └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!!col_select)
       5.         └─tidyselect:::eval_select_impl(...)
       6.           └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
       7.             └─rlang::abort(...)
      
      [ FAIL 16 | WARN 0 | SKIP 7 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘impactr.Rmd’ using rmarkdown
    Quitting from lines 53-54 (impactr.Rmd) 
    Error: processing vignette 'impactr.Rmd' failed with diagnostics:
    Can't select within an unnamed vector.
    --- failed re-building ‘impactr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘impactr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘accdata’
    ```

# incidence2

<details>

* Version: 1.2.3
* GitHub: https://github.com/reconverse/incidence2
* Source code: https://github.com/cran/incidence2
* Date/Publication: 2021-11-07 22:00:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "incidence2")` for more info

</details>

## Newly broken

*   checking whether package ‘incidence2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘incidence2’
Execution halted
ERROR: lazy loading failed for package ‘incidence2’
* removing ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/incidence2’


```
### CRAN

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (incidence2)


```
# infer

<details>

* Version: 1.0.4
* GitHub: https://github.com/tidymodels/infer
* Source code: https://github.com/cran/infer
* Date/Publication: 2022-12-02 00:10:10 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "infer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘infer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate
    > ### Title: Generate resamples, permutations, or simulations
    > ### Aliases: generate
    > 
    > ### ** Examples
    > 
    > # generate a null distribution by taking 200 bootstrap samples
    ...
     11. │     ├─base::withCallingHandlers(...)
     12. │     └─mask$eval_all_filter(dots, env_filter)
     13. │       └─dplyr (local) eval()
     14. ├─dplyr:::dplyr_internal_error(...)
     15. │ └─rlang::abort(class = c(class, "dplyr:::internal_error"), dplyr_error_data = data)
     16. │   └─rlang:::signal_abort(cnd, .file)
     17. │     └─base::signalCondition(cnd)
     18. └─dplyr (local) `<fn>`(`<dpl:::__>`)
     19.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • visualize/viz-assume-t-p-val-right.svg
      • visualize/viz-assume-t-sim.svg
      • visualize/viz-assume-t.svg
      • visualize/viz-assume-z-ci.svg
      • visualize/viz-assume-z-p-val-both.svg
      • visualize/viz-assume-z-p-val-left.svg
      • visualize/viz-assume-z-p-val-right.svg
      • visualize/viz-assume-z.svg
      • visualize/viz-fit-conf-int.svg
      • visualize/viz-fit-no-h0.svg
      • visualize/viz-fit-p-val-both.svg
      • visualize/viz-fit-p-val-left.svg
      • visualize/viz-fit-p-val-right.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘anova.Rmd’ using rmarkdown
    Response: age (numeric)
    Explanatory: partyid (factor)
    Null Hypothesis: independence
    # A tibble: 1 × 1
       stat
      <dbl>
    1  2.48
    Response: age (numeric)
    ...
      p_value
        <dbl>
    1   0.296
    --- finished re-building ‘t_test.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘chi_squared.Rmd’ ‘observed_stat_examples.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# iNZightTools

<details>

* Version: 1.13.0
* GitHub: https://github.com/iNZightVIT/iNZightTools
* Source code: https://github.com/cran/iNZightTools
* Date/Publication: 2023-01-26 22:10:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "iNZightTools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      Loading required namespace: styler
      [ FAIL 1 | WARN 6 | SKIP 5 | PASS 386 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (4)
      • packageVersion("survey") < package_version("4.2") is TRUE (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_smart_read.R:72'): Columns with 1000+ NAs read as character ──
      x$x3 is not an S3 object
      
      [ FAIL 1 | WARN 6 | SKIP 5 | PASS 386 ]
      Error: Test failures
      Execution halted
    ```

# jpmesh

<details>

* Version: 2.1.0
* GitHub: https://github.com/uribo/jpmesh
* Source code: https://github.com/cran/jpmesh
* Date/Publication: 2022-01-10 03:32:41 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "jpmesh")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jpmesh-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: export_mesh
    > ### Title: Export meshcode to geometry
    > ### Aliases: export_mesh export_meshes
    > 
    > ### ** Examples
    > 
    > export_mesh("6441427712")
    ...
     14.               ├─obj[[attr(obj, "sf_column")]]
     15.               └─tibble:::`[[.tbl_df`(obj, attr(obj, "sf_column"))
     16.                 └─tibble:::tbl_subset2(x, j = i, j_arg = substitute(i))
     17.                   └─tibble:::vectbl_as_col_location2(...)
     18.                     ├─tibble:::subclass_col_index_errors(...)
     19.                     │ └─base::withCallingHandlers(...)
     20.                     └─vctrs::vec_as_location2(j, n, names, call = call)
     21.                       └─vctrs:::result_get(...)
     22.                         └─rlang::cnd_signal(x$err)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Deleting unused snapshots:
      • administration_mesh/administration-10kmmesh-pref33-34.svg
      • administration_mesh/administration-10kmmesh-pref35.svg
      • administration_mesh/administration-1kmmesh-city08220-08221.svg
      • administration_mesh/administration-1kmmesh-city08220.svg
      • administration_mesh/administration-1kmmesh-city35201.svg
      • administration_mesh/administration-80kmmesh-pref08.svg
      • find/neighbor-mesh-10km-6meshes.svg
      • find/neighbor-mesh-1km-self-contains-false.svg
      • find/neighbor-mesh-1km-self-contains-true.svg
      • find/neighbor-mesh-80km-7meshes.svg
      • fine_separate/fine-separate-10km.svg
      • fine_separate/fine-separate-1km.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘usage.Rmd’ using rmarkdown
    Quitting from lines 54-63 (usage.Rmd) 
    Error: processing vignette 'usage.Rmd' failed with diagnostics:
    missing value where TRUE/FALSE needed
    --- failed re-building ‘usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘usage.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 176 marked UTF-8 strings
    ```

# keyholder

<details>

* Version: 0.1.6
* GitHub: https://github.com/echasnovski/keyholder
* Source code: https://github.com/cran/keyholder
* Date/Publication: 2021-12-04 10:50:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "keyholder")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          filter
      
      > 
      > test_check("keyholder")
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 313 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-keys-manip.R:104'): restore_keys.default preserves class ─────
      class(output_3) not equal to c("keyed_df", "tbl_df", "tbl", "data.frame").
      Lengths differ: 3 is not 4
      
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 313 ]
      Error: Test failures
      Execution halted
    ```

# logitr

<details>

* Version: 1.0.1
* GitHub: https://github.com/jhelvy/logitr
* Source code: https://github.com/cran/logitr
* Date/Publication: 2023-02-19 13:00:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "logitr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘basic_usage.Rmd’ using rmarkdown
    --- finished re-building ‘basic_usage.Rmd’
    
    --- re-building ‘benchmark.Rmd’ using rmarkdown
    --- finished re-building ‘benchmark.Rmd’
    
    --- re-building ‘convergence.Rmd’ using rmarkdown
    --- finished re-building ‘convergence.Rmd’
    
    ...
    --- failed re-building ‘summarizing_results.Rmd’
    
    --- re-building ‘utility_models.Rmd’ using rmarkdown
    --- finished re-building ‘utility_models.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘summarizing_results.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# meltr

<details>

* Version: 1.0.1
* GitHub: https://github.com/r-lib/meltr
* Source code: https://github.com/cran/meltr
* Date/Publication: 2022-09-10 19:52:53 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "meltr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        `actual`: 0
      `expected`: 1
      ── Failure ('test-melt-fwf.R:139'): check for line breaks in between widths ────
      `out2 <- melt_fwf(txt2, fwf_empty(I(txt2)))` did not throw the expected warning.
      ── Failure ('test-melt-fwf.R:140'): check for line breaks in between widths ────
      n_problems(out2) (`actual`) not equal to 1 (`expected`).
      
        `actual`: 0
      `expected`: 1
      ── Failure ('test-melt-table.R:33'): melt_table can read a truncated file without crashing ──
      `expect_error(melt_table("table-crash"), NA)` did not throw the expected warning.
      
      [ FAIL 9 | WARN 0 | SKIP 1 | PASS 107 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        libs   5.1Mb
    ```

# motif

<details>

* Version: 0.5.2
* GitHub: https://github.com/Nowosad/motif
* Source code: https://github.com/cran/motif
* Date/Publication: 2022-06-07 05:10:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "motif")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `names(value) <- nv`: 'names' attribute [6] must be the same length as the vector [5]
      Backtrace:
          ▆
       1. ├─motif::lsp_add_examples(x = landform_grid_sf_sel, y = landform) at test-lsp_add_clusters.R:47:0
       2. └─motif:::lsp_add_examples.sf(x = landform_grid_sf_sel, y = landform)
       3.   ├─base::`$<-`(`*tmp*`, "region", value = `<list>`)
       4.   └─sf:::`$<-.sf`(`*tmp*`, "region", value = `<list>`)
       5.     ├─base::`[[<-`(`*tmp*`, i, value = `<list>`)
       6.     └─sf:::`[[<-.sf`(`*tmp*`, i, value = `<list>`)
       7.       ├─sf::`st_agr<-`(`*tmp*`, value = agr)
       8.       └─sf:::`st_agr<-.sf`(`*tmp*`, value = agr)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 52 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        libs     6.2Mb
        raster   2.2Mb
    ```

# networkLite

<details>

* Version: 1.0.1
* GitHub: https://github.com/EpiModel/networkLite
* Source code: https://github.com/cran/networkLite
* Date/Publication: 2023-01-25 15:50:02 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "networkLite")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      `tbl` not identical to tibble::as_tibble(nwL, attrname = attrname, na.rm = na.rm).
      Attributes: < Length mismatch: comparison on first 3 components >
      ── Failure ('test-networkLite.R:672'): network and networkLite produce identical matrices, edgelists, and tibbles ──
      `tbl` not identical to tibble::as_tibble(nwL, attrname = attrname, na.rm = na.rm).
      Attributes: < Length mismatch: comparison on first 3 components >
      ── Failure ('test-networkLite.R:672'): network and networkLite produce identical matrices, edgelists, and tibbles ──
      `tbl` not identical to tibble::as_tibble(nwL, attrname = attrname, na.rm = na.rm).
      Attributes: < Length mismatch: comparison on first 3 components >
      ── Failure ('test-networkLite.R:672'): network and networkLite produce identical matrices, edgelists, and tibbles ──
      `tbl` not identical to tibble::as_tibble(nwL, attrname = attrname, na.rm = na.rm).
      Attributes: < Length mismatch: comparison on first 3 components >
      
      [ FAIL 18 | WARN 6 | SKIP 0 | PASS 3025 ]
      Error: Test failures
      Execution halted
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
    
    > ### Name: inspect
    > ### Title: Inspect observations
    > ### Aliases: inspect
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    ...
      <int> <chr>      <int>  <int>   <int> <named list>   <chr>             <int>
    1     1 y < 4          2      1       0 <booltype [1]> failed                1
    2     2 x > 1          2      1       0 <booltype [1]> failed                1
    > 
    > df1 <- df %>%  
    +   inspect(ob = 5, cols="most")
    Error in if (ob[["Status"]] == "passed") { : 
      missing value where TRUE/FALSE needed
    Calls: %>% -> inspect
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

# pammtools

<details>

* Version: 0.5.8
* GitHub: https://github.com/adibender/pammtools
* Source code: https://github.com/cran/pammtools
* Date/Publication: 2022-01-09 03:32:43 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "pammtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pammtools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_newdata
    > ### Title: Construct a data frame suitable for prediction
    > ### Aliases: make_newdata make_newdata.default make_newdata.ped
    > ###   make_newdata.fped
    > 
    > ### ** Examples
    > 
    ...
    1      0  500    500    (0,500] 1.8 6.214608          0              2 58.8
    2    500 1000    500 (500,1000] 1.8 6.214608          0              2 58.8
         sex transfusion complications metastases resection
    1 female         yes            no        yes        no
    2 female         yes            no        yes        no
    > ped %>% group_by(sex) %>% make_newdata(tend = unique(tend))
    Error in int_info.default(attr(x, "breaks"), ...) : 
      Assertion on 'x' failed: Must be of type 'numeric', not 'NULL'.
    Calls: %>% ... int_info.default -> assert_numeric -> makeAssertion -> mstop
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │     └─base::isTRUE(lhs)
        5. ├─group_by(ped, complications) %>% ped_info()
        6. ├─pammtools::ped_info(.)
        7. └─pammtools:::ped_info.ped(.)
        8.   ├─pammtools::int_info(ped)
        9.   └─pammtools:::int_info.ped(ped)
       10.     ├─pammtools::int_info(attr(x, "breaks"), ...)
       11.     └─pammtools:::int_info.default(attr(x, "breaks"), ...)
       12.       └─checkmate::assert_numeric(x, lower = 0, any.missing = FALSE)
       13.         └─checkmate::makeAssertion(x, res, .var.name, add)
       14.           └─checkmate:::mstop(...)
      
      [ FAIL 4 | WARN 8 | SKIP 0 | PASS 330 ]
      Error: Test failures
      Execution halted
    ```

# panelr

<details>

* Version: 0.7.7
* GitHub: https://github.com/jacob-long/panelr
* Source code: https://github.com/cran/panelr
* Date/Publication: 2023-02-09 16:00:02 UTC
* Number of recursive dependencies: 169

Run `revdepcheck::cloud_details(, "panelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘panelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: are_varying
    > ### Title: Check if variables are constant or variable over time.
    > ### Aliases: are_varying
    > 
    > ### ** Examples
    > 
    > 
    ...
    ! The `groups` attribute must be a data frame.
    Backtrace:
      1. wages %>% are_varying(occ, ind, fem, blk)
      2. panelr::are_varying(., occ, ind, fem, blk)
      6. dplyr:::select.data.frame(data, ...)
      7. dplyr:::ensure_group_vars(loc, .data, notify = TRUE)
      9. dplyr:::group_vars.data.frame(data)
     12. dplyr:::group_data.grouped_df(x)
     14. dplyr::validate_grouped_df(.data)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘reshape.Rmd’ using rmarkdown
    Quitting from lines 55-70 (reshape.Rmd) 
    Error: processing vignette 'reshape.Rmd' failed with diagnostics:
    `.data` must be a valid <grouped_df> object.
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘reshape.Rmd’
    
    ...
    `.data` must be a valid <grouped_df> object.
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘wbm.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘reshape.Rmd’ ‘wbm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      ── Error ('test_wbgee.R:11'): (code run outside of `test_that()`) ──────────────
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      ── Error ('test_wbm.R:11'): (code run outside of `test_that()`) ────────────────
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      
      [ FAIL 17 | WARN 0 | SKIP 0 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# parquetize

<details>

* Version: 0.5.3
* GitHub: https://github.com/ddotta/parquetize
* Source code: https://github.com/cran/parquetize
* Date/Publication: 2023-02-20 15:50:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "parquetize")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘parquetize-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: csv_to_parquet
    > ### Title: Convert a csv file to parquet format
    > ### Aliases: csv_to_parquet
    > 
    > ### ** Examples
    > 
    > 
    ...
        ▆
     1. └─parquetize::csv_to_parquet(...)
     2.   └─readr::read_delim(...)
     3.     └─vroom::vroom(...)
     4.       └─vroom:::vroom_select(out, col_select, id)
     5.         └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
     6.           └─tidyselect:::eval_select_impl(...)
     7.             └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     8.               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Class:   rlang_error/error/condition
      Backtrace:
          ▆
       1. └─parquetize::csv_to_parquet(...)
       2.   └─readr::read_delim(...)
       3.     └─vroom::vroom(...)
       4.       └─vroom:::vroom_select(out, col_select, id)
       5.         └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
       6.           └─tidyselect:::eval_select_impl(...)
       7.             └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
       8.               └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 28 | PASS 15 ]
      Error: Test failures
      Execution halted
    ```

# pathviewr

<details>

* Version: 1.1.5
* GitHub: https://github.com/ropensci/pathviewr
* Source code: https://github.com/cran/pathviewr
* Date/Publication: 2022-11-08 22:30:02 UTC
* Number of recursive dependencies: 153

Run `revdepcheck::cloud_details(, "pathviewr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pathviewr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bind_viewr_objects
    > ### Title: Bind viewr objects
    > ### Aliases: bind_viewr_objects
    > 
    > ### ** Examples
    > 
    > ## Since we only have one example file of each type provided
    ...
    +     motive_batch_imports,
    +     desired_percent = 50,
    +     max_frame_gap = "autodetect",
    +     span = 0.95
    +   )
    autodetect is an experimental feature -- please report issues.
    Error in while (j < max_frame_gap_allowed + 1) { : 
      argument is of length zero
    Calls: clean_viewr_batch -> %>% -> clean_viewr -> %>% -> separate_trajectories
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          cts[[j]] <- dplyr::count(mfg[[j]], traj_id)
          trajectory_count[j] <- nrow(cts[[j]])
          frame_gap_allowed[j] <- j
          j <- j + 1
      }`: argument is of length zero
      Backtrace:
          ▆
       1. ├─motive_data %>% ... at test-rm_by_trajnum.R:16:0
       2. ├─pathviewr::clean_viewr(...)
       3. │ └─obj %>% separate_trajectories(...)
       4. └─pathviewr::separate_trajectories(., ...)
      
      [ FAIL 10 | WARN 1 | SKIP 0 | PASS 166 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘data-import-cleaning.Rmd’ using rmarkdown
    Quitting from lines 457-464 (data-import-cleaning.Rmd) 
    Error: processing vignette 'data-import-cleaning.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘data-import-cleaning.Rmd’
    
    --- re-building ‘managing-frame-gaps.Rmd’ using rmarkdown
    Quitting from lines 191-202 (managing-frame-gaps.Rmd) 
    ...
    Error: processing vignette 'visual-perception-functions.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘visual-perception-functions.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘data-import-cleaning.Rmd’ ‘managing-frame-gaps.Rmd’
      ‘visual-perception-functions.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# photobiology

<details>

* Version: 0.10.15
* GitHub: https://github.com/aphalo/photobiology
* Source code: https://github.com/cran/photobiology
* Date/Publication: 2023-01-07 16:40:02 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "photobiology")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘userguide-0-r4p-introduction.Rmd’ using rmarkdown
    --- finished re-building ‘userguide-0-r4p-introduction.Rmd’
    
    --- re-building ‘userguide-1-radiation.Rmd’ using rmarkdown
    Quitting from lines 957-960 (userguide-1-radiation.Rmd) 
    Error: processing vignette 'userguide-1-radiation.Rmd' failed with diagnostics:
    'w.length' must be sorted and have unique values
    --- failed re-building ‘userguide-1-radiation.Rmd’
    
    --- re-building ‘userguide-2-astronomy.Rmd’ using rmarkdown
    --- finished re-building ‘userguide-2-astronomy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘userguide-1-radiation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# portalr

<details>

* Version: 0.3.11
* GitHub: https://github.com/weecology/portalr
* Source code: https://github.com/cran/portalr
* Date/Publication: 2022-12-01 17:40:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "portalr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─portalr::bait_presence_absence(path = portal_data_path, level = "plot") at test-10-summarize_ants.R:49:2
       2. │ ├─compute_presence(bait, level) %>% as.data.frame()
       3. │ └─portalr:::compute_presence(bait, level)
       4. │   └─... %>% ...
       5. ├─base::as.data.frame(.)
       6. ├─tidyr::complete(., !!!grouping, fill = list(presence = 0))
       7. ├─dplyr::mutate(., presence = 1)
       8. ├─dplyr::distinct(.)
       9. └─dplyr::select(., !!!grouping)
      
      [ FAIL 12 | WARN 43 | SKIP 42 | PASS 17 ]
      Error: Test failures
      Execution halted
    ```

# processcheckR

<details>

* Version: 0.1.4
* GitHub: https://github.com/bupaverse/processcheckr
* Source code: https://github.com/cran/processcheckR
* Date/Publication: 2022-10-03 09:40:08 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "processcheckR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘processcheckR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: absent
    > ### Title: Absent
    > ### Aliases: absent
    > 
    > ### ** Examples
    > 
    > library(bupaR)
    ...
     26. │         └─mask$eval_all_summarise(quo)
     27. │           └─dplyr (local) eval()
     28. ├─dplyr::n_distinct(.data[[NULL]])
     29. │ └─vctrs::df_list(...)
     30. │   └─rlang::list2(...)
     31. ├─<unknown>
     32. └─rlang:::`[[.rlang_data_pronoun`(.data, NULL)
     33.   └─rlang:::data_pronoun_get(...)
     34.     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       30. ├─bupaR::re_map(., mapping)
       31. │ ├─bupaR::activitylog(...)
       32. │ └─bupaR:::activitylog.data.frame(...)
       33. │   └─purrr::reduce(...)
       34. │     └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
       35. │       └─bupaR (local) fn(out, elt, ...)
       36. │         └─bupaR:::check_attributes_activitylog(...)
       37. │           └─base::stop(glue("No {attribute_name} provided"))
       38. └─base::.handleSimpleError(...)
       39.   └─dplyr (local) h(simpleError(msg, call))
       40.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      
      [ FAIL 74 | WARN 0 | SKIP 0 | PASS 79 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘processcheckr.Rmd’ using rmarkdown
    Quitting from lines 58-67 (processcheckr.Rmd) 
    Error: processing vignette 'processcheckr.Rmd' failed with diagnostics:
    No case_id provided nor found
    --- failed re-building ‘processcheckr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘processcheckr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# processmapR

<details>

* Version: 0.5.2
* GitHub: https://github.com/bupaverse/processmapr
* Source code: https://github.com/cran/processmapR
* Date/Publication: 2022-10-03 07:40:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "processmapR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       15. ├─dplyr::group_by(., across(c(one_of(paste(groups)), ...)))
       16. ├─bupaR::ungroup_eventlog(.)
       17. ├─bupaR:::ungroup_eventlog.grouped_log(.)
       18. │ └─log %>% as.data.frame() %>% re_map(mapping(log))
       19. └─bupaR::re_map(., mapping(log))
       20.   ├─bupaR::eventlog(...)
       21.   └─bupaR:::eventlog.data.frame(...)
       22.     └─purrr::reduce(.x = attribute_list, .f = check_wrapper, .init = eventlog)
       23.       └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
       24.         └─bupaR (local) fn(out, elt, ...)
       25.           └─bupaR:::check_attributes(...)
      
      [ FAIL 4 | WARN 51 | SKIP 10 | PASS 107 ]
      Error: Test failures
      Execution halted
    ```

# psmineR

<details>

* Version: 0.1.0
* GitHub: https://github.com/bupaverse/psmineR
* Source code: https://github.com/cran/psmineR
* Date/Publication: 2022-10-10 17:00:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "psmineR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. │ │     └─base::is.data.frame(x)
       15. │ ├─bupaR::ungroup_eventlog(log)
       16. │ └─bupaR:::ungroup_eventlog.grouped_log(log)
       17. │   └─log %>% as.data.frame() %>% re_map(mapping(log))
       18. └─bupaR::re_map(., mapping(log))
       19.   ├─bupaR::activitylog(...)
       20.   └─bupaR:::activitylog.data.frame(...)
       21.     └─purrr::reduce(...)
       22.       └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
       23.         └─bupaR (local) fn(out, elt, ...)
       24.           └─bupaR:::check_attributes_activitylog(...)
      
      [ FAIL 8 | WARN 16 | SKIP 8 | PASS 29 ]
      Error: Test failures
      Execution halted
    ```

# pubh

<details>

* Version: 1.2.7
* GitHub: https://github.com/josie-athens/pubh
* Source code: https://github.com/cran/pubh
* Date/Publication: 2022-04-04 13:50:02 UTC
* Number of recursive dependencies: 235

Run `revdepcheck::cloud_details(, "pubh")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pubh-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cosm_reg
    > ### Title: Cosmetics for tables of regression coefficients. Converts tables
    > ###   generated by 'tbl_regression' to 'huxtable' and adds some cosmetics.
    > ### Aliases: cosm_reg
    > 
    > ### ** Examples
    > 
    ...
     13. ├─gtsummary:::tbl_regression.default(., exponentiate = TRUE)
     14. │ └─gtsummary:::tidy_prep(...)
     15. │   └─... %>% ...
     16. ├─rlang::eval_tidy(.)
     17. ├─broom.helpers::tidy_plus_plus(...)
     18. │ └─... %>% tidy_add_coefficients_type()
     19. └─broom.helpers::tidy_add_coefficients_type(.)
     20.   └─cli::cli_abort("'exponentiate' is not provided. You need to pass it explicitely.")
     21.     └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 349-353 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘introduction.Rmd’
    
    --- re-building ‘regression.Rmd’ using rmarkdown
    Quitting from lines 118-122 (regression.Rmd) 
    Error: processing vignette 'regression.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘regression.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘introduction.Rmd’ ‘regression.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Hmisc’ ‘sjPlot’
      All declared Imports should be used.
    ```

# rapbase

<details>

* Version: 1.24.0
* GitHub: https://github.com/Rapporteket/rapbase
* Source code: https://github.com/cran/rapbase
* Date/Publication: 2023-02-27 10:22:31 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "rapbase")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-github.R:6'): contributors are provided ──────────────────────
      class(getGithub("contributors", "rapbase")) not equal to "character".
      1/1 mismatches
      x[1]: "NULL"
      y[1]: "character"
      ── Failure ('test-github.R:10'): key can be provided ───────────────────────────
      grepl("ssh-rsa", getGithub("keys", "areedv")) is not TRUE
      
      `actual`:       
      `expected`: TRUE
      
      [ FAIL 2 | WARN 0 | SKIP 37 | PASS 246 ]
      Error: Test failures
      Execution halted
    ```

# readr

<details>

* Version: 2.1.4
* GitHub: https://github.com/tidyverse/readr
* Source code: https://github.com/cran/readr
* Date/Publication: 2023-02-10 09:20:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "readr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘readr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read_delim
    > ### Title: Read a delimited file (including CSV and TSV) into a tibble
    > ### Aliases: read_delim read_csv read_csv2 read_tsv
    > 
    > ### ** Examples
    > 
    > # Input sources -------------------------------------------------------------
    ...
    Backtrace:
        ▆
     1. └─readr::read_csv(...)
     2.   └─vroom::vroom(...)
     3.     └─vroom:::vroom_select(out, col_select, id)
     4.       └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!!col_select)
     5.         └─tidyselect:::eval_select_impl(...)
     6.           └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     7.             └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘first_edition.R’
    Running the tests in ‘tests/first_edition.R’ failed.
    Last 13 lines of output:
        `actual`: 0
      `expected`: 1
      ── Failure ('test-melt-fwf.R:139'): check for line breaks in between widths ────
      `out2 <- melt_fwf(txt2, fwf_empty(I(txt2)))` did not throw the expected warning.
      ── Failure ('test-melt-fwf.R:140'): check for line breaks in between widths ────
      n_problems(out2) (`actual`) not equal to 1 (`expected`).
      
        `actual`: 0
      `expected`: 1
      ── Failure ('test-melt-table.R:38'): melt_table can read a truncated file without crashing ──
      `expect_error(melt_table("table-crash"), NA)` did not throw the expected warning.
      
      [ FAIL 9 | WARN 1 | SKIP 34 | PASS 709 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.8Mb
      sub-directories of 1Mb or more:
        libs   9.9Mb
    ```

# rio

<details>

* Version: 0.5.29
* GitHub: https://github.com/leeper/rio
* Source code: https://github.com/cran/rio
* Date/Publication: 2021-11-22 07:40:02 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "rio")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ── 3. Failure ('test_gather_attrs.R:23'): Spread attrs from Stata ──────────────
      "label" %in% names(attributes(s)) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      ── 4. Failure ('test_gather_attrs.R:24'): Spread attrs from Stata ──────────────
      "notes" %in% names(attributes(s)) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

# rmapzen

<details>

* Version: 0.4.3
* GitHub: https://github.com/tarakc02/rmapzen
* Source code: https://github.com/cran/rmapzen
* Date/Publication: 2021-06-18 08:30:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "rmapzen")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7.       ├─sf::st_geometry(x)
        8.       └─sf:::st_geometry.sf(x)
        9.         ├─obj[[attr(obj, "sf_column")]]
       10.         └─tibble:::`[[.tbl_df`(obj, attr(obj, "sf_column"))
       11.           └─tibble:::tbl_subset2(x, j = i, j_arg = substitute(i))
       12.             └─tibble:::vectbl_as_col_location2(...)
       13.               ├─tibble:::subclass_col_index_errors(...)
       14.               │ └─base::withCallingHandlers(...)
       15.               └─vctrs::vec_as_location2(j, n, names, call = call)
       16.                 └─vctrs:::result_get(...)
       17.                   └─rlang::cnd_signal(x$err)
      
      [ FAIL 1 | WARN 21 | SKIP 2 | PASS 202 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rmapzen-introduction.Rmd’ using rmarkdown
    Quitting from lines 75-77 (rmapzen-introduction.Rmd) 
    Error: processing vignette 'rmapzen-introduction.Rmd' failed with diagnostics:
    Can't extract column with `attr(obj, "sf_column")`.
    ✖ Subscript `attr(obj, "sf_column")` must be size 1, not 0.
    --- failed re-building ‘rmapzen-introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rmapzen-introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
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

# ruler

<details>

* Version: 0.2.4
* GitHub: https://github.com/echasnovski/ruler
* Source code: https://github.com/cran/ruler
* Date/Publication: 2020-11-25 08:00:03 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "ruler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ruler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cell-pack
    > ### Title: Cell rule pack
    > ### Aliases: cell-pack
    > 
    > ### ** Examples
    > 
    > cell_outlier_rules <- . %>% dplyr::transmute_at(
    ...
     48. │                   └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     49. │                     └─tidyselect:::as_indices_sel_impl(...)
     50. │                       └─tidyselect:::as_indices_impl(...)
     51. │                         └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
     52. │                           └─vctrs::vec_as_location(...)
     53. └─vctrs (local) `<fn>`()
     54.   └─vctrs:::stop_subscript_oob(...)
     55.     └─vctrs:::stop_subscript(...)
     56.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       27. │               └─tidyselect:::eval_c(expr, data_mask, context_mask)
       28. │                 └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       29. │                   └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       30. │                     └─tidyselect:::as_indices_sel_impl(...)
       31. │                       └─tidyselect:::as_indices_impl(...)
       32. │                         └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
       33. │                           └─vctrs::vec_as_location(...)
       34. └─vctrs (local) `<fn>`()
       35.   └─vctrs:::stop_subscript_oob(...)
       36.     └─vctrs:::stop_subscript(...)
       37.       └─rlang::abort(...)
      
      [ FAIL 9 | WARN 6 | SKIP 1 | PASS 277 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘design-and-format.Rmd’ using rmarkdown
    --- finished re-building ‘design-and-format.Rmd’
    
    --- re-building ‘rule-packs.Rmd’ using rmarkdown
    --- finished re-building ‘rule-packs.Rmd’
    
    --- re-building ‘validation.Rmd’ using rmarkdown
    Quitting from lines 192-213 (validation.Rmd) 
    ...
    Error: processing vignette 'validation.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `id` doesn't exist.
    --- failed re-building ‘validation.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘validation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# RWDataPlyr

<details>

* Version: 0.6.4
* GitHub: https://github.com/BoulderCodeHub/RWDataPlyr
* Source code: https://github.com/cran/RWDataPlyr
* Date/Publication: 2020-04-17 08:20:06 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "RWDataPlyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Length mismatch: comparison on first 2 components >
      Attributes: < Component 2: Modes: character, numeric >
      Attributes: < Component 2: Lengths: 1, 960 >
      Attributes: < Component 2: target is character, current is numeric >
      ── Failure ('test_rdf_to_tbl2.R:157'): methods match for scalar slots ──────────
      `xx` not equal to `xx2`.
      Attributes: < Names: 1 string mismatch >
      Attributes: < Length mismatch: comparison on first 2 components >
      Attributes: < Component 2: Modes: character, numeric >
      Attributes: < Component 2: Lengths: 1, 480 >
      Attributes: < Component 2: target is character, current is numeric >
      
      [ FAIL 22 | WARN 0 | SKIP 0 | PASS 633 ]
      Error: Test failures
      Execution halted
    ```

# simpr

<details>

* Version: 0.2.4
* GitHub: https://github.com/statisfactions/simpr
* Source code: https://github.com/cran/simpr
* Date/Publication: 2023-02-20 22:30:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "simpr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simpr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: glance_fits
    > ### Title: Create tibble of model "glances" (summaries)
    > ### Aliases: glance_fits
    > 
    > ### ** Examples
    > 
    > simple_linear_data = specify(a = ~ 2 + rnorm(n),
    ...
      2. └─simpr::glance_fits(.)
      3.   ├─simpr::apply_fits(...)
      4.   └─simpr:::apply_fits.simpr_tibble(...)
      5.     ├─dplyr::left_join(simpr_meta, simpr_tidy, by = c(".sim_id", "Source"))
      6.     └─dplyr:::left_join.data.frame(simpr_meta, simpr_tidy, by = c(".sim_id", "Source"))
      7.       └─dplyr:::join_mutate(...)
      8.         └─dplyr:::join_cols(...)
      9.           └─dplyr:::check_join_vars(by$y, y_names, by$condition, "y", error_call = error_call)
     10.             └─rlang::abort(bullets, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─... %>% tidy_fits() at test_calc_tidy.R:73:2
        2. └─simpr::tidy_fits(.)
        3.   ├─simpr::apply_fits(...)
        4.   └─simpr:::apply_fits.simpr_tibble(...)
        5.     ├─dplyr::left_join(simpr_meta, simpr_tidy, by = c(".sim_id", "Source"))
        6.     └─dplyr:::left_join.data.frame(simpr_meta, simpr_tidy, by = c(".sim_id", "Source"))
        7.       └─dplyr:::join_mutate(...)
        8.         └─dplyr:::join_cols(...)
        9.           └─dplyr:::check_join_vars(by$y, y_names, by$condition, "y", error_call = error_call)
       10.             └─rlang::abort(bullets, call = error_call)
      
      [ FAIL 4 | WARN 16 | SKIP 0 | PASS 42 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘optimization.Rmd’ using rmarkdown
    Quitting from lines 59-71 (optimization.Rmd) 
    Error: processing vignette 'optimization.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error in `select()`:
    ! Can't subset columns that don't exist.
    ✖ Column `n` doesn't exist.
    --- failed re-building ‘optimization.Rmd’
    
    ...
    Error: processing vignette 'simulation-errors.Rmd' failed with diagnostics:
    Join columns in `y` must be present in the data.
    ✖ Problem with `Source`.
    --- failed re-building ‘simulation-errors.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘optimization.Rmd’ ‘reproducibility.Rmd’ ‘simulation-errors.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sugrrants

<details>

* Version: 0.2.8
* GitHub: https://github.com/earowang/sugrrants
* Source code: https://github.com/cran/sugrrants
* Date/Publication: 2020-10-05 08:30:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "sugrrants")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sugrrants-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: frame_calendar
    > ### Title: Rearrange a temporal data frame to a calendar-based data format
    > ###   using linear algebra
    > ### Aliases: frame_calendar prettify
    > 
    > ### ** Examples
    > 
    ...
    +   frame_calendar(x = Time, y = Hourly_Counts, date = Date, week_start = 7)
    > 
    > p2 <- grped_calendar %>%
    +   ggplot(aes(x = .Time, y = .Hourly_Counts, group = Date)) +
    +   geom_line() +
    +   facet_wrap(~ Sensor_Name, nrow = 2)
    > prettify(p2)
    Error in if (calendar == "monthly") { : argument is of length zero
    Calls: prettify -> prettify.ggplot -> pre_plot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─ped_ts %>% group_by(Sensor_Name) %>% ...
        5. ├─sugrrants::frame_calendar(., x = Time, y = Hourly_Counts, date = Date)
        6. ├─dplyr::group_by(., Sensor_Name)
        7. └─tsibble:::group_by.tbl_ts(., Sensor_Name)
        8.   └─tsibble::build_tsibble(...)
        9.     └─tsibble::build_tsibble_meta(...)
       10.       └─tsibble::new_tsibble(x, groups = grp_data, class = cls)
       11.         └─tsibble:::assert_key_data(attr(x, "key"))
       12.           └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
      
      [ FAIL 1 | WARN 26 | SKIP 0 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘frame-calendar.Rmd’ using rmarkdown
    Quitting from lines 115-125 (frame-calendar.Rmd) 
    Error: processing vignette 'frame-calendar.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘frame-calendar.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘frame-calendar.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tfrmt

<details>

* Version: 0.0.2
* GitHub: https://github.com/GSK-Biostatistics/tfrmt
* Source code: https://github.com/cran/tfrmt
* Date/Publication: 2023-02-13 20:40:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "tfrmt")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─... %>% print_mock_gt(span_df_big_n) at test-big_ns.R:432:2
        2. ├─tfrmt::print_mock_gt(., span_df_big_n)
        3. │ └─apply_tfrmt(.data, tfrmt, mock = TRUE) %>% ...
        4. ├─tfrmt:::cleaned_data_to_gt(., tfrmt)
        5. │ └─gt_out_final %>% ...
        6. ├─tfrmt:::apply_footnote_plan(., tfrmt, attr(.data, ".footnote_locs"))
        7. │ └─... %>% apply_cells_body(footnote_loc[[i]])
        8. ├─tfrmt:::apply_cells_body(., footnote_loc[[i]])
        9. ├─tfrmt:::apply_cells_row_groups(., tfrmt, footnote_loc[[i]])
       10. ├─tfrmt:::apply_cells_stub(., tfrmt, footnote_loc[[i]])
       11. └─tfrmt:::apply_cells_column_spanners(., footnote_loc[[i]])
      
      [ FAIL 5 | WARN 0 | SKIP 9 | PASS 481 ]
      Error: Test failures
      Execution halted
    ```

# tibbletime

<details>

* Version: 0.1.8
* GitHub: https://github.com/business-science/tibbletime
* Source code: https://github.com/cran/tibbletime
* Date/Publication: 2023-01-24 19:10:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "tibbletime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tibbletime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_period
    > ### Title: Change 'tbl_time' periodicity
    > ### Aliases: as_period
    > 
    > ### ** Examples
    > 
    > 
    ...
      9.     └─dplyr:::compute_by(...)
     10.       ├─dplyr::group_vars(data)
     11.       └─dplyr:::group_vars.data.frame(data)
     12.         ├─generics::setdiff(names(group_data(x)), ".rows")
     13.         ├─dplyr::group_data(x)
     14.         └─dplyr:::group_data.grouped_df(x)
     15.           ├─base::withCallingHandlers(...)
     16.           └─dplyr::validate_grouped_df(.data)
     17.             └─rlang::abort(result)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      ── Error ('test_filter_time.R:53'): Groups are respected ───────────────────────
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      ── Error ('test_print.R:26'): Groups are still printed ─────────────────────────
      Error in `group_data(x)`: `.data` must be a valid <grouped_df> object.
      Caused by error in `validate_grouped_df()`:
      ! The `groups` attribute must be a data frame.
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 141 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘TT-01-time-based-filtering.Rmd’ using rmarkdown
    Quitting from lines 117-119 (TT-01-time-based-filtering.Rmd) 
    Error: processing vignette 'TT-01-time-based-filtering.Rmd' failed with diagnostics:
    `.data` must be a valid <grouped_df> object.
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘TT-01-time-based-filtering.Rmd’
    
    --- re-building ‘TT-02-changing-time-periods.Rmd’ using rmarkdown
    ...
    Caused by error in `validate_grouped_df()`:
    ! The `groups` attribute must be a data frame.
    --- failed re-building ‘TT-04-use-with-dplyr.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘TT-01-time-based-filtering.Rmd’ ‘TT-02-changing-time-periods.Rmd’
      ‘TT-04-use-with-dplyr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidycmprsk

<details>

* Version: 0.2.0
* GitHub: https://github.com/MSKCC-Epi-Bio/tidycmprsk
* Source code: https://github.com/cran/tidycmprsk
* Date/Publication: 2022-10-03 07:20:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "tidycmprsk")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10.   └─gtsummary:::tbl_regression.default(...)
       11.     └─gtsummary:::.tbl_regression_default_table_header(...)
       12.       └─gtsummary:::.estimate_column_labels(x)
      ── Error ('test-gtsummary.R:35'): gtsummary tables work with crr() output ──────
      Error in `unique(contr_sum$table_body$contrasts_type)`: object 'contr_sum' not found
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-gtsummary.R:35:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::unique(contr_sum$table_body$contrasts_type)
      
      [ FAIL 6 | WARN 7 | SKIP 0 | PASS 90 ]
      Error: Test failures
      Execution halted
    ```

# TidyDensity

<details>

* Version: 1.2.4
* GitHub: https://github.com/spsanderson/TidyDensity
* Source code: https://github.com/cran/TidyDensity
* Date/Publication: 2022-11-16 15:40:17 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "TidyDensity")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TidyDensity-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bootstrap_density_augment
    > ### Title: Bootstrap Density Tibble
    > ### Aliases: bootstrap_density_augment
    > 
    > ### ** Examples
    > 
    > x <- mtcars$mpg
    > 
    > tidy_bootstrap(x) %>%
    +   bootstrap_density_augment()
    Error in if (!atb$tibble_type == "tidy_bootstrap_nested") { : 
      argument is of length zero
    Calls: %>% -> bootstrap_density_augment -> %>% -> <Anonymous>
    Execution halted
    ```

# tidyterra

<details>

* Version: 0.3.2
* GitHub: https://github.com/dieghernan/tidyterra
* Source code: https://github.com/cran/tidyterra
* Date/Publication: 2023-02-24 11:00:03 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "tidyterra")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-as_spatraster.R:46'): Regenerate raster properly ─────────────
      compare_spatrasters(r, default_crs) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Failure ('test-fortify-Spat.R:40'): Fortify SpatRasters ─────────────────────
      compare_spatrasters(r, back) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 2 | WARN 0 | SKIP 18 | PASS 953 ]
      Error: Test failures
      Execution halted
    ```

# tidytransit

<details>

* Version: 1.4.1
* GitHub: https://github.com/r-transit/tidytransit
* Source code: https://github.com/cran/tidytransit
* Date/Publication: 2023-02-01 12:40:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "tidytransit")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. └─tidytransit::travel_times(...) at test-raptor.R:350:2
      ── Failure ('test-spatial.R:99'): sf_as_tbl ────────────────────────────────────
      duke_df$stops[colnames(gtfs_duke$stops)] not equal to gtfs_duke$stops.
      Attributes: < Names: 2 string mismatches >
      Attributes: < Length mismatch: comparison on first 2 components >
      Attributes: < Component 1: Modes: character, externalptr >
      Attributes: < Component 1: Lengths: 3, 1 >
      Attributes: < Component 1: target is character, current is externalptr >
      Attributes: < Component 2: Modes: numeric, character >
      Attributes: < Component 2: Lengths: 124, 3 >
      Attributes: < Component 2: target is numeric, current is character >
      
      [ FAIL 2 | WARN 0 | SKIP 6 | PASS 220 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘frequency.Rmd’ using rmarkdown
    Quitting from lines 382-391 (frequency.Rmd) 
    Error: processing vignette 'frequency.Rmd' failed with diagnostics:
    'names' attribute [4] must be the same length as the vector [3]
    --- failed re-building ‘frequency.Rmd’
    
    --- re-building ‘introduction.Rmd’ using rmarkdown
    --- finished re-building ‘introduction.Rmd’
    ...
    --- finished re-building ‘servicepatterns.Rmd’
    
    --- re-building ‘timetable.Rmd’ using rmarkdown
    --- finished re-building ‘timetable.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘frequency.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        doc       2.1Mb
        extdata   4.5Mb
    ```

# tsibble

<details>

* Version: 1.1.3
* GitHub: https://github.com/tidyverts/tsibble
* Source code: https://github.com/cran/tsibble
* Date/Publication: 2022-10-09 03:20:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tsibble-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_tsibble
    > ### Title: Low-level constructor for a tsibble object
    > ### Aliases: build_tsibble
    > 
    > ### ** Examples
    > 
    > # Prepare `pedestrian` to use a new index `Date` ----
    ...
    ! The `key` attribute must be a data frame with its last column called `.rows`.
    Backtrace:
        ▆
     1. ├─pedestrian %>% ...
     2. └─tsibble::build_tsibble(...)
     3.   └─tsibble::build_tsibble_meta(...)
     4.     └─tsibble::new_tsibble(x, groups = grp_data, class = cls)
     5.       └─tsibble:::assert_key_data(attr(x, "key"))
     6.         └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `assert_key_data(attr(x, "key"))`: The `key` attribute must be a data frame with its last column called `.rows`.
      Backtrace:
          ▆
       1. ├─pedestrian %>% group_by(Sensor) at test-tsibble.R:441:2
       2. ├─dplyr::group_by(., Sensor)
       3. └─tsibble:::group_by.tbl_ts(., Sensor)
       4.   └─tsibble::build_tsibble(...)
       5.     └─tsibble::build_tsibble_meta(...)
       6.       └─tsibble::new_tsibble(x, groups = grp_data, class = cls)
       7.         └─tsibble:::assert_key_data(attr(x, "key"))
       8.           └─rlang::abort("The `key` attribute must be a data frame with its last column called `.rows`.")
      
      [ FAIL 21 | WARN 6 | SKIP 5 | PASS 488 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘faq.Rmd’ using rmarkdown
    --- finished re-building ‘faq.Rmd’
    
    --- re-building ‘implicit-na.Rmd’ using rmarkdown
    --- finished re-building ‘implicit-na.Rmd’
    
    --- re-building ‘intro-tsibble.Rmd’ using rmarkdown
    Quitting from lines 66-73 (intro-tsibble.Rmd) 
    Error: processing vignette 'intro-tsibble.Rmd' failed with diagnostics:
    The `key` attribute must be a data frame with its last column called `.rows`.
    --- failed re-building ‘intro-tsibble.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro-tsibble.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# vitae

<details>

* Version: 0.5.2
* GitHub: https://github.com/mitchelloharawild/vitae
* Source code: https://github.com/cran/vitae
* Date/Publication: 2022-09-01 18:00:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "vitae")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (1)
      • rmarkdown::pandoc_available("2.7") is not TRUE (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-entries.R:27'): detailed_entries ───────────────────────────────
      Error in `!(x %@% "protect")`: invalid argument type
      Backtrace:
          ▆
       1. ├─knitr::knit_print(entries) at test-entries.R:27:2
       2. └─vitae:::knit_print.vitae_detailed(entries)
      
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

# vroom

<details>

* Version: 1.6.1
* GitHub: https://github.com/tidyverse/vroom
* Source code: https://github.com/cran/vroom
* Date/Publication: 2023-01-22 21:00:01 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "vroom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vroom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vroom
    > ### Title: Read a delimited file into a tibble
    > ### Aliases: vroom
    > 
    > ### ** Examples
    > 
    > # get path to example file
    ...
    ! Can't select within an unnamed vector.
    Backtrace:
        ▆
     1. └─vroom::vroom(input_file, col_select = c(model, cyl, gear))
     2.   └─vroom:::vroom_select(out, col_select, id)
     3.     └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!!col_select)
     4.       └─tidyselect:::eval_select_impl(...)
     5.         └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
     6.           └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       3.     └─tidyselect::vars_select(c(names(spec(x)$cols), id), !!col_select)
       4.       └─tidyselect:::eval_select_impl(...)
       5.         └─cli::cli_abort("Can't select within an unnamed vector.", call = error_call)
       6.           └─rlang::abort(...)
      ── Failure ('test-vroom.R:418'): Can return the spec object ────────────────────
      `obj` is not an S3 object
      ── Failure ('test-vroom.R:421'): Can return the spec object ────────────────────
      `obj` (`actual`) not equal to `exp` (`expected`).
      
      `actual` is NULL
      `expected` is an S3 object of class <col_spec>, a list
      
      [ FAIL 16 | WARN 0 | SKIP 11 | PASS 995 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘benchmarks.Rmd’ using rmarkdown
    --- finished re-building ‘benchmarks.Rmd’
    
    --- re-building ‘vroom.Rmd’ using rmarkdown
    Quitting from lines 143-146 (vroom.Rmd) 
    Error: processing vignette 'vroom.Rmd' failed with diagnostics:
    Can't select within an unnamed vector.
    --- failed re-building ‘vroom.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘vroom.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 25.9Mb
      sub-directories of 1Mb or more:
        libs  24.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘readr’
    ```

# xportr

<details>

* Version: 0.2.0
* GitHub: https://github.com/atorus-research/xportr
* Source code: https://github.com/cran/xportr
* Date/Publication: 2023-02-23 20:30:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "xportr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • empty test (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-write.R:21'): SAS Transport file ─────────────────────────────
      `str\(read_xpt\(tmp\)\)` does not match "Lorem ipsum dolor sit amet".
      Actual value: "tibble \[3 x 3\] \(S3: tbl_df/tbl/data\.frame\)\\n \$ X: num \[1:3\] 1 2 NA\\n  \.\.- attr\(\*, "label"\)= chr "foo"\\n \$ Y: chr \[1:3\] "a" "" "c"\\n  \.\.- attr\(\*, "label"\)= chr "bar"\\n \$ Z: num \[1:3\] 1 2 3\\n  \.\.- attr\(\*, "label"\)= chr "baz""
      Backtrace:
          ▆
       1. └─testthat::expect_output(str(read_xpt(tmp)), "Lorem ipsum dolor sit amet") at test-write.R:21:2
       2.   └─testthat::expect_match(...)
       3.     └─testthat:::expect_match_(...)
      
      [ FAIL 1 | WARN 2 | SKIP 1 | PASS 41 ]
      Error: Test failures
      Execution halted
    ```

