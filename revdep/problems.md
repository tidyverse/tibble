# AGread

<details>

* Version: 1.1.1
* GitHub: https://github.com/paulhibbing/AGread
* Source code: https://github.com/cran/AGread
* Date/Publication: 2020-02-26 14:30:02 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "AGread")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component 3: Attributes: < Modes: list, NULL >
      Component 3: Attributes: < names for target but not for current >
      Component 3: Attributes: < current is not list-like >
      Component 3: Length mismatch: comparison on first 1 components
      Component 3: Component 1: Numeric: lengths (179, 1) differ
      Component 4: Modes: list, numeric
      ...
      Backtrace:
          █
       1. └─testthat::expect_equal_to_reference(...) test_gt3x.R:35:4
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 17 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.5Mb
      sub-directories of 1Mb or more:
        libs   9.0Mb
    ```

# comparer

<details>

* Version: 0.2.2
* GitHub: https://github.com/CollinErickson/comparer
* Source code: https://github.com/cran/comparer
* Date/Publication: 2021-03-29 09:10:09 UTC
* Number of recursive dependencies: 93

Run `cloud_details(, "comparer")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. ├─testthat::expect_error(f1$run_all(verbose = 0), NA) test_ffexp.R:409:2
       2. │ └─testthat:::quasi_capture(...)
       3. │   ├─testthat:::.capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─f1$run_all(verbose = 0)
      ── Failure (test_ffexp.R:410:3): ffexp with single df input and df multirow output ──
      all(f1$completed_runs) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 4 | WARN 1 | SKIP 0 | PASS 238 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# crosstable

<details>

* Version: 0.2.1
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2021-03-08 09:20:02 UTC
* Number of recursive dependencies: 125

Run `cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4. ├─flextable::merge_v(., part = "head")
       5. └─flextable::add_header_row(., values = header_values, colwidths = header_colwidths)
      ── Error (test-1-crosstable.R:414:3): Testing everything ───────────────────────
      Error: colwidths' sum must be equal to the number of col_keys (20)
      Backtrace:
          █
       1. ├─flextable::as_flextable(x)
       2. ├─crosstable:::as_flextable.crosstable(x)
       3. │ └─`%>%`(...)
       4. ├─flextable::merge_v(., part = "head")
       5. └─flextable::add_header_row(., values = header_values, colwidths = header_colwidths)
      
      [ FAIL 12 | WARN 0 | SKIP 13 | PASS 289 ]
      Error: Test failures
      Execution halted
    ```

# dat

<details>

* Version: 0.5.0
* GitHub: https://github.com/wahani/dat
* Source code: https://github.com/cran/dat
* Date/Publication: 2020-05-15 19:40:03 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "dat")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. │     └─base::as.data.frame(x) test-mutar-data-table.R:6:4
       10. └─base::cbind(dat, list(a = mean(dat$x)))
       11.   └─tibble:::cbind(deparse.level, ...)
       12.     └─vctrs::vec_cbind(!!!list(...))
       13.       └─(function () ...
       14.         ├─vctrs::vec_cbind_frame_ptype(x = x)
       15.         └─vctrs:::vec_cbind_frame_ptype.default(x = x)
       16.           ├─x[0]
       17.           └─dat:::`[.DataFrame`(x, 0)
       18.             └─dat:::handleCols(...)
       19.               └─(function (classes, fdef, mtable) ...
      
      [ FAIL 1 | WARN 4 | SKIP 1 | PASS 118 ]
      Error: Test failures
      Execution halted
    ```

# designr

<details>

* Version: 0.1.12
* GitHub: https://github.com/mmrabe/designr
* Source code: https://github.com/cran/designr
* Date/Publication: 2021-04-22 14:00:15 UTC
* Number of recursive dependencies: 102

Run `cloud_details(, "designr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘designr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: factor.design
    > ### Title: Factorial Designs
    > ### Aliases: factor.design
    > 
    > ### ** Examples
    > 
    > # To create an empty design:
    ...
      4. │     ├─base::do.call(...)
      5. │     └─(function (...) ...
      6. │       └─designr:::na_join(ret, el)
      7. │         └─base::cbind(...)
      8. │           └─tibble:::cbind(deparse.level, ...)
      9. │             └─vctrs::vec_cbind(!!!list(...))
     10. └─vctrs::stop_incompatible_size(...)
     11.   └─vctrs:::stop_incompatible(...)
     12.     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 47 marked UTF-8 strings
    ```

# drake

<details>

* Version: 7.13.2
* GitHub: https://github.com/ropensci/drake
* Source code: https://github.com/cran/drake
* Date/Publication: 2021-04-22 16:40:02 UTC
* Number of recursive dependencies: 150

Run `cloud_details(, "drake")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 5. Error (test-8-decorated-storr.R:264:3): flow with rds format ─────────────
      Error: Can't combine `..1$command` <character> and `..2$command` <list>.
      Backtrace:
        1. drake::drake_plan(...) test-8-decorated-storr.R:264:2
        2. drake:::parse_custom_plan_columns(plan, envir = envir)
        7. tibble:::rbind(deparse.level, ...)
        8. vctrs::vec_rbind(!!!list(...))
       10. vctrs::vec_default_ptype2(...)
       11. vctrs::stop_incompatible_type(...)
       12. vctrs:::stop_incompatible(...)
       13. vctrs:::stop_vctrs(...)
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

# EFAtools

<details>

* Version: 0.3.1
* GitHub: https://github.com/mdsteiner/EFAtools
* Source code: https://github.com/cran/EFAtools
* Date/Publication: 2021-03-27 08:40:42 UTC
* Number of recursive dependencies: 86

Run `cloud_details(, "EFAtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EFAtools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.EFA_AVERAGE
    > ### Title: Plot EFA_AVERAGE object
    > ### Aliases: plot.EFA_AVERAGE
    > 
    > ### ** Examples
    > 
    > EFA_aver <- EFA_AVERAGE(test_models$baseline$cormat, n_factors = 3, N = 500)
    ...
      5.     ├─...[]
      6.     └─tibble:::`[.tbl_df`(...)
      7.       └─tibble:::vectbl_as_col_location(...)
      8.         ├─tibble:::subclass_col_index_errors(...)
      9.         │ └─base::withCallingHandlers(...)
     10.         └─vctrs::vec_as_location(j, n, names)
     11.           └─(function () ...
     12.             └─vctrs:::stop_subscript_oob(...)
     13.               └─vctrs:::stop_subscript(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc    1.0Mb
        libs   7.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘progress’
      All declared Imports should be used.
    ```

# egor

<details>

* Version: 1.21.7
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2021-07-01 16:20:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_egograms
    > ### Title: Plotting _egor_ objects
    > ### Aliases: plot_egograms plot_ego_graphs plot_egor plot.egor
    > 
    > ### ** Examples
    > 
    > e <- make_egor(net.count = 5, max.alters = 12)
    > plot_egograms(x = e,
    +               ego_no = 2,
    +               venn_var = "sex",
    +               pie_var = "country",
    +               vertex_size_var = "age")
    Error in coords[, 4] - coords[, 2] : 
      non-numeric argument to binary operator
    Calls: plot_egograms ... plot_egogram -> plot_one_ego_graph -> <Anonymous> -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          █
       1. ├─testthat::expect_warning(...) test-plot_egor.R:448:2
       2. │ └─testthat:::quasi_capture(enquo(object), label, capture_warnings)
       3. │   ├─testthat:::.capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─egor::plot_egograms(t1, 1, venn_var = "country", pie_var = "test")
       7.   └─egor:::plot_egogram(...)
       8.     └─egor:::plot_one_ego_graph(...)
       9.       └─igraph::plot.igraph(...)
      
      [ FAIL 6 | WARN 1 | SKIP 0 | PASS 211 ]
      Error: Test failures
      Execution halted
    ```

# ExpertChoice

<details>

* Version: 0.2.0
* GitHub: https://github.com/JedStephens/ExpertChoice
* Source code: https://github.com/cran/ExpertChoice
* Date/Publication: 2020-04-03 14:30:02 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "ExpertChoice")` for more info

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
      2.   ├─base::duplicated(...)
      3.   └─base::rbind(dplyr::as_tibble(fractional_factorial_design), dplyr::as_tibble(full_factorial))
      4.     └─tibble:::rbind(deparse.level, ...)
      5.       └─vctrs::vec_rbind(!!!list(...))
      6.         └─(function () ...
      7.           └─vctrs::vec_default_ptype2(...)
      8.             └─vctrs::stop_incompatible_type(...)
      9.               └─vctrs:::stop_incompatible(...)
     10.                 └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# fgeo.tool

<details>

* Version: 1.2.7
* GitHub: https://github.com/forestgeo/fgeo.tool
* Source code: https://github.com/cran/fgeo.tool
* Date/Publication: 2021-05-25 19:40:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "fgeo.tool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (1)
      • ctfs cannot be loaded (6)
      • fgeo.data cannot be loaded (2)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-add_var.R:41:3): add_gxgy handles NA ──────────────────────────
      is.na(add_gxgy(tree)$gx1) is not TRUE
      
      `actual`:       
      `expected`: TRUE
      
      [ FAIL 1 | WARN 4 | SKIP 9 | PASS 288 ]
      Error: Test failures
      Execution halted
    ```

# finetune

<details>

* Version: 0.1.0
* GitHub: https://github.com/tidymodels/finetune
* Source code: https://github.com/cran/finetune
* Date/Publication: 2021-07-21 19:40:02 UTC
* Number of recursive dependencies: 162

Run `cloud_details(, "finetune")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘helpers.R’
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (15)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error (test-anova-filter.R:23:1): (code run outside of `test_that()`) ───────
    ...
      Error: All of the models failed. See the .notes column.
      Backtrace:
          █
       1. ├─tune::collect_metrics(grid_res) test-anova-filter.R:23:0
       2. └─tune:::collect_metrics.tune_results(grid_res)
       3.   └─tune::estimate_tune_results(x)
      
      [ FAIL 1 | WARN 1 | SKIP 15 | PASS 149 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ranger’ ‘yardstick’
      All declared Imports should be used.
    ```

# geonet

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/geonet
* Date/Publication: 2021-06-07 06:50:10 UTC
* Number of recursive dependencies: 64

Run `cloud_details(, "geonet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘geonet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_lpp
    > ### Title: Transmute to Point Pattern on a Linear Network
    > ### Aliases: as_lpp as_lpp.gnpp
    > 
    > ### ** Examples
    > 
    > library(spatstat.data)
    ...
    spatstat.core 2.3-0
    spatstat.linnet 2.3-0
    > 
    > x <- as_lpp(montgomery)
    Warning: Unknown or uninitialised column: `marks`.
    > plot(x)
    > 
    > L <- chicago
    > X <- as_gnpp(chicago, spatstat = TRUE)
    New names:
    ```

# ggiraph

<details>

* Version: 0.7.10
* GitHub: https://github.com/davidgohel/ggiraph
* Source code: https://github.com/cran/ggiraph
* Date/Publication: 2021-05-19 16:50:04 UTC
* Number of recursive dependencies: 99

Run `cloud_details(, "ggiraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggiraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotate_interactive
    > ### Title: Create interactive annotations
    > ### Aliases: annotate_interactive
    > 
    > ### ** Examples
    > 
    > # add interactive annotation to a ggplot -------
    ...
      7. │       └─base::lapply(def_fonts, font_family_exists)
      8. │         └─ggiraph:::FUN(X[[i]], ...)
      9. │           └─ggiraph:::fortify_font_db()
     10. │             └─base::rbind(db_sys, db_reg)
     11. │               └─tibble:::rbind(deparse.level, ...)
     12. │                 └─vctrs::vec_rbind(!!!list(...))
     13. └─vctrs::stop_incompatible_type(...)
     14.   └─vctrs:::stop_incompatible(...)
     15.     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─ggiraph:::default_fontname()
        4. │     ├─base::unlist(lapply(def_fonts, font_family_exists))
        5. │     └─base::lapply(def_fonts, font_family_exists)
        6. │       └─ggiraph:::FUN(X[[i]], ...)
        7. │         └─ggiraph:::fortify_font_db()
        8. │           └─base::rbind(db_sys, db_reg)
        9. │             └─tibble:::rbind(deparse.level, ...)
       10. │               └─vctrs::vec_rbind(!!!list(...))
       11. └─vctrs::stop_incompatible_type(...)
       12.   └─vctrs:::stop_incompatible(...)
       13.     └─vctrs:::stop_vctrs(...)
      
      [ FAIL 28 | WARN 0 | SKIP 0 | PASS 192 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        libs   6.5Mb
    ```

# ggiraphExtra

<details>

* Version: 0.3.0
* GitHub: https://github.com/cardiomoon/ggiraphExtra
* Source code: https://github.com/cran/ggiraphExtra
* Date/Publication: 2020-10-06 07:00:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "ggiraphExtra")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggiraphExtra-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggAncova
    > ### Title: Make an interactive plot for an ANCOVA model
    > ### Aliases: ggAncova ggAncova.default ggAncova.formula ggAncova.lm
    > 
    > ### ** Examples
    > 
    > require(moonBook)
    ...
     11. │             └─base::lapply(def_fonts, font_family_exists)
     12. │               └─ggiraph:::FUN(X[[i]], ...)
     13. │                 └─ggiraph:::fortify_font_db()
     14. │                   └─base::rbind(db_sys, db_reg)
     15. │                     └─tibble:::rbind(deparse.level, ...)
     16. │                       └─vctrs::vec_rbind(!!!list(...))
     17. └─vctrs::stop_incompatible_type(...)
     18.   └─vctrs:::stop_incompatible(...)
     19.     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# ggspatial

<details>

* Version: 1.1.5
* GitHub: https://github.com/paleolimbot/ggspatial
* Source code: https://github.com/cran/ggspatial
* Date/Publication: 2021-01-04 17:30:15 UTC
* Number of recursive dependencies: 98

Run `cloud_details(, "ggspatial")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * x -> x...3
      
      Backtrace:
          █
       1. ├─testthat::expect_identical(...) test-df-spatial.R:6:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─testthat::expect_message(fix_duplicate_cols(tbl), "Renamed columns")
      ── Failure (test-df-spatial.R:6:3): duplicate column name fixing works ─────────
      expect_message(fix_duplicate_cols(tbl), "Renamed columns") not identical to tibble::tibble(x = 1:5, y = 1:5, x..3 = letters[1:5]).
      Names: 2 string mismatches
      
      [ FAIL 3 | WARN 0 | SKIP 22 | PASS 129 ]
      Error: Test failures
      Execution halted
    ```

# graphicalVAR

<details>

* Version: 0.2.4
* GitHub: NA
* Source code: https://github.com/cran/graphicalVAR
* Date/Publication: 2020-10-23 17:50:07 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "graphicalVAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphicalVAR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphicalVAR
    > ### Title: Estimate the graphical VAR model.
    > ### Aliases: graphicalVAR
    > 
    > ### ** Examples
    > 
    > # Simulate model:
    ...
    Warning: `filter_()` was deprecated in dplyr 0.7.0.
    Please use `filter()` instead.
    See vignette('programming') for more help
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Warning: `select_()` was deprecated in dplyr 0.7.0.
    Please use `select()` instead.
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    New names:
    ```

# grobblR

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/grobblR
* Date/Publication: 2020-11-30 06:20:03 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "grobblR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grobblR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_aesthetic
    > ### Title: Add an Aesthetic
    > ### Aliases: add_aesthetic
    > 
    > ### ** Examples
    > 
    > 
    > df = data.frame(var1 = c(5, 14, 6, 10), var2 = c(3, 30, 17, 7))
    > df %>%
    +   grob_matrix() %>% 
    +   add_aesthetic(aesthetic = 'text_color', value = 'red', group = 'cells') %>%
    +   view_grob()
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. │ └─methods::is(grob_object, "grob_matrix_object")
       15. └─grobblR::grob_matrix(.)
       16.   └─grobblR:::column_names_to_row(grob_object)
       17.     └─base::rbind(column_names, mat)
       18.       └─tibble:::rbind(deparse.level, ...)
       19.         └─vctrs::vec_rbind(!!!list(...))
       20.           └─(function () ...
       21.             └─vctrs::vec_default_ptype2(...)
       22.               └─vctrs::stop_incompatible_type(...)
       23.                 └─vctrs:::stop_incompatible(...)
       24.                   └─vctrs:::stop_vctrs(...)
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# groupr

<details>

* Version: 0.1.0
* GitHub: https://github.com/ngriffiths21/groupr
* Source code: https://github.com/cran/groupr
* Date/Publication: 2020-10-14 12:30:06 UTC
* Number of recursive dependencies: 57

Run `cloud_details(, "groupr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─groupr:::pivot_cg(testb3, "is_ok")
        5. │ ├─dplyr::group_modify(x, ~col_grps(., rows))
        6. │ └─dplyr:::group_modify.data.frame(x, ~col_grps(., rows))
        7. │   └─groupr:::.f(.data, group_keys(.data), ...)
        8. │     └─groupr:::col_grps(., rows)
        9. │       └─base::cbind(...)
       10. │         └─tibble:::cbind(deparse.level, ...)
       11. │           └─vctrs::vec_cbind(!!!list(...))
       12. └─vctrs::stop_incompatible_size(...)
       13.   └─vctrs:::stop_incompatible(...)
       14.     └─vctrs:::stop_vctrs(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 18 ]
      Error: Test failures
      Execution halted
    ```

# heatwaveR

<details>

* Version: 0.4.5
* GitHub: https://github.com/robwschlegel/heatwaveR
* Source code: https://github.com/cran/heatwaveR
* Date/Publication: 2021-01-07 16:10:16 UTC
* Number of recursive dependencies: 137

Run `cloud_details(, "heatwaveR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(heatwaveR)
      > 
      > test_check("heatwaveR")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-proto_event.R:27:3): joinAcrossGaps = FALSE creates more events ──
      max(res2$event_no, na.rm = T) is not strictly more than max(res1$event_no, na.rm = T). Difference: NaN
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 227 ]
      Error: Test failures
      Execution halted
    ```

# HEDA

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/HEDA
* Date/Publication: 2021-07-20 19:00:02 UTC
* Number of recursive dependencies: 38

Run `cloud_details(, "HEDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HEDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Clean_Spt
    > ### Title: Clean_Spt
    > ### Aliases: Clean_Spt
    > 
    > ### ** Examples
    > 
    > # before running the function
    > HPK_SampleData$dateTime <- parse_date_time(HPK_SampleData$dateTime,"mdy HM")
    > 
    > hpk_flow_cln <- HEDA_Tidy(HPK_SampleData, season = c(6,7,8,9))
    > 
    > hpk_flow_cg <- ReversalCount(hpk_flow_cln)
    New names:
    ```

# heemod

<details>

* Version: 0.14.2
* GitHub: https://github.com/pierucci/heemod
* Source code: https://github.com/cran/heemod
* Date/Publication: 2021-01-22 13:00:02 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "heemod")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │ └─base::rbind(should_be_fits_3, direct_dist_def_3)
        4. │   └─tibble:::rbind(deparse.level, ...)
        5. │     └─vctrs::vec_rbind(!!!list(...))
        6. │       └─(function () ...
        7. │         └─vctrs::vec_default_ptype2(...)
        8. │           └─vctrs::stop_incompatible_type(...)
        9. │             └─vctrs:::stop_incompatible(...)
       10. │               └─vctrs:::stop_vctrs(...)
       11. ├─dplyr::ungroup(.)
       12. ├─dplyr::do(., fit = join_fits_across_time(.data))
       13. └─dplyr::group_by(., .data$.strategy, .data$.type)
      
      [ FAIL 1 | WARN 6 | SKIP 0 | PASS 503 ]
      Error: Test failures
      Execution halted
    ```

# htmlTable

<details>

* Version: 2.2.1
* GitHub: https://github.com/gforge/htmlTable
* Source code: https://github.com/cran/htmlTable
* Date/Publication: 2021-05-18 11:10:02 UTC
* Number of recursive dependencies: 87

Run `cloud_details(, "htmlTable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘htmlTable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidyHtmlTable
    > ### Title: Generate an htmlTable using tidy data as input
    > ### Aliases: tidyHtmlTable
    > 
    > ### ** Examples
    > 
    > library(tibble)
    ...
    +     header = gear,
    +     cgroup = cyl,
    +     rnames = summary_stat,
    +     rgroup = per_metric,
    +     skip_removal_warning = TRUE)
    `summarise()` has grouped output by 'cyl', 'gear'. You can override using the `.groups` argument.
    Error in checkUniqueness(tidyTableDataList) : 
      The input parameters "value", "header", "rnames", "rgroup", "cgroup" do not specify unique rows. The following rows are duplicated: 94
    Calls: %>% ... tidyHtmlTable -> tidyHtmlTable.data.frame -> checkUniqueness
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testInteractive.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. ├─htmlTable::tidyHtmlTable(...)
       12. └─htmlTable:::tidyHtmlTable.data.frame(...)
       13.   └─htmlTable:::checkUniqueness(tidyTableDataList)
      ── Error (test-tidyHtmlTable_sorting.R:85:3): Correct table sort ───────────────
      Error: The input parameters "value", "header", "rnames", "rgroup", "cgroup" do not specify unique rows. The following rows are duplicated: 96
      Backtrace:
          █
       1. ├─`%>%`(...) test-tidyHtmlTable_sorting.R:85:2
       2. ├─htmlTable::tidyHtmlTable(...)
       3. └─htmlTable:::tidyHtmlTable.data.frame(...)
       4.   └─htmlTable:::checkUniqueness(tidyTableDataList)
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 468 ]
      Error: Test failures
      Execution halted
    ```

# hurricaneexposure

<details>

* Version: 0.1.1
* GitHub: https://github.com/geanders/hurricaneexposure
* Source code: https://github.com/cran/hurricaneexposure
* Date/Publication: 2020-02-13 14:30:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "hurricaneexposure")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘hurricaneexposure-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: county_events
    > ### Title: Find events for storms by county
    > ### Aliases: county_events
    > 
    > ### ** Examples
    > 
    > # Ensure that data package is available before running the example.
    ...
      4. │ └─tibble:::`[.tbl_df`(events, events[, event_type], c("fips", "storm_id"))
      5. │   └─tibble:::tbl_subset_row(xo, i = i, i_arg)
      6. │     └─tibble:::vectbl_as_row_index(i, x, i_arg)
      7. │       └─tibble:::vectbl_as_row_location(i, nr, i_arg, assign)
      8. │         ├─tibble:::subclass_row_index_errors(...)
      9. │         │ └─base::withCallingHandlers(...)
     10. │         └─vctrs::vec_as_location(i, n)
     11. ├─dplyr::left_join(...)
     12. └─dplyr::mutate(., storm_id = as.character(.data$storm_id))
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mapproj’
      All declared Imports should be used.
    ```

# impactr

<details>

* Version: 0.1.0
* GitHub: https://github.com/verasls/impactr
* Source code: https://github.com/cran/impactr
* Date/Publication: 2021-07-01 07:30:11 UTC
* Number of recursive dependencies: 95

Run `cloud_details(, "impactr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘impactr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: predict_loading
    > ### Title: Predict mechanical loading
    > ### Aliases: predict_loading
    > 
    > ### ** Examples
    > 
    > data <- read_acc(impactr_example("hip-raw.csv"))
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `actual`:   "...1"      "acc_X" "acc_Y" "acc_Z"
      `expected`: "timestamp" "acc_X" "acc_Y" "acc_Z"
      ── Failure (test-read_acc.R:81:3): output columns are correct ──────────────────
      test_imu$timestamp is not an S3 object
      ── Failure (test-read_acc.R:82:3): output columns are correct ──────────────────
      test_raw$timestamp is not an S3 object
      ── Failure (test-read_acc.R:94:3): read_acc() works with date format separated by `/` ──
      `sep_dash` (`actual`) not equal to `sep_slash` (`expected`).
      
      `attr(actual, 'problems')` is <pointer: 0x55b404ea54b0>
      `attr(expected, 'problems')` is <pointer: 0x55b408620840>
      
      [ FAIL 9 | WARN 6 | SKIP 4 | PASS 53 ]
      Error: Test failures
      Execution halted
    ```

# isoreader

<details>

* Version: 1.3.0
* GitHub: https://github.com/isoverse/isoreader
* Source code: https://github.com/cran/isoreader
* Date/Publication: 2021-02-16 06:20:07 UTC
* Number of recursive dependencies: 109

Run `cloud_details(, "isoreader")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          █
       1. ├─testthat::expect_warning(...) test-data-structures.R:219:2
       2. │ └─testthat:::quasi_capture(enquo(object), label, capture_warnings)
       3. │   ├─testthat:::.capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─isoreader:::warn_problems(iso_filesABABC, cutoff = 3)
       7.   └─purrr::map(widths, ~paste(rep(".", .x), collapse = ""))
       8.     └─isoreader:::.f(.x[[i]], ...)
       9.       └─base::paste(rep(".", .x), collapse = "")
      
      [ FAIL 2 | WARN 0 | SKIP 9 | PASS 831 ]
      Error: Test failures
      Execution halted
    ```

# ITNr

<details>

* Version: 0.6.0
* GitHub: NA
* Source code: https://github.com/cran/ITNr
* Date/Publication: 2020-03-11 17:30:13 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "ITNr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ITNr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: core_periphery_weighted
    > ### Title: Core-Periphery for Weighted Networks
    > ### Aliases: core_periphery_weighted
    > 
    > ### ** Examples
    > 
    > require(igraph)
    ...
    > V(ITN)$name<-1:vcount(ITN)
    > 
    > ##Implement core-periphery algorithm
    > ITNcp<-core_periphery_weighted(ITN,"directed")
    Warning: `as_data_frame()` was deprecated in tibble 2.0.0.
    Please use `as_tibble()` instead.
    The signature and semantics have changed, see `?as_tibble`.
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    New names:
    ```

# LexisNexisTools

<details>

* Version: 0.3.4
* GitHub: https://github.com/JBGruber/LexisNexisTools
* Source code: https://github.com/cran/LexisNexisTools
* Date/Publication: 2021-04-06 14:50:06 UTC
* Number of recursive dependencies: 118

Run `cloud_details(, "LexisNexisTools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • !dir.exists("/home/johannes/Dropbox/LexisNexis_sample_files/") is TRUE (1)
      • On CRAN (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-methods.R:67:3): add ──────────────────────────────────────────
      {
          ...
      } not equal to 9.
      1/1 mismatches
      [1] 10 - 9 == 1
      
      [ FAIL 1 | WARN 4 | SKIP 2 | PASS 99 ]
      Error: Test failures
      Execution halted
    ```

# lvmisc

<details>

* Version: 0.1.1
* GitHub: https://github.com/verasls/lvmisc
* Source code: https://github.com/cran/lvmisc
* Date/Publication: 2021-04-05 15:20:02 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "lvmisc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lvmisc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_bland_altman
    > ### Title: Create a Bland-Altman plot
    > ### Aliases: plot_bland_altman
    > 
    > ### ** Examples
    > 
    > mtcars <- tibble::as_tibble(mtcars, rownames = "car")
    > m <- stats::lm(disp ~ mpg, mtcars)
    > cv <- loo_cv(m, mtcars, car)
    > plot_bland_altman(cv, colour = as.factor(am))
    New names:
    ```

# mfGARCH

<details>

* Version: 0.2.1
* GitHub: https://github.com/onnokleen/mfGARCH
* Source code: https://github.com/cran/mfGARCH
* Date/Publication: 2021-06-17 14:20:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "mfGARCH")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_equal(...) test-estimation.R:73:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─mfGARCH::fit_mfgarch(...)
        5.   └─stats::constrOptim(...)
        6.     └─mfGARCH:::f(theta, ...)
        7.       └─mfGARCH:::lf(theta)
        8.         └─mfGARCH:::llh_mf(...)
        9.           └─mfGARCH:::calculate_tau_mf(...)
       10.             ├─base::`$<-`(`*tmp*`, "tau", value = integer(0))
       11.             └─base::`$<-.data.frame`(`*tmp*`, "tau", value = integer(0))
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

# mortAAR

<details>

* Version: 1.1.1
* GitHub: NA
* Source code: https://github.com/cran/mortAAR
* Date/Publication: 2021-05-24 23:30:02 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "mortAAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mortAAR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lt.correction
    > ### Title: Calculates a corrected life table from a mortAAR life table
    > ### Aliases: lt.correction
    > 
    > ### ** Examples
    > 
    > # Calculate a corrected life table from real life dataset.
    ...
      3. │ └─mortAAR::life.table(...)
      4. │   └─mortAAR:::life.table.df(...)
      5. │     ├─base::`[<-`(...)
      6. │     └─tibble:::`[<-.tbl_df`(...)
      7. │       └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
      8. │         └─tibble:::vectbl_recycle_rhs(...)
      9. │           └─vctrs::vec_recycle(value, ncol)
     10. └─vctrs:::stop_recycle_incompatible_size(...)
     11.   └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# msigdbr

<details>

* Version: 7.4.1
* GitHub: https://github.com/igordot/msigdbr
* Source code: https://github.com/cran/msigdbr
* Date/Publication: 2021-05-05 16:10:02 UTC
* Number of recursive dependencies: 48

Run `cloud_details(, "msigdbr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * Pan troglodytes
      * Rattus norvegicus
      * Saccharomyces cerevisiae
      * Schizosaccharomyces pombe 972h-
      * Sus scrofa
      * Xenopus tropicalis
      * <NA>
      Backtrace:
          █
       1. └─testthat::expect_match(...) test-functions.R:8:2
       2.   └─testthat:::expect_match_(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 102 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        R   5.8Mb
    ```

# neonstore

<details>

* Version: 0.4.3
* GitHub: NA
* Source code: https://github.com/cran/neonstore
* Date/Publication: 2021-04-27 20:00:02 UTC
* Number of recursive dependencies: 80

Run `cloud_details(, "neonstore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘neonstore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: neon_citation
    > ### Title: Generate the appropriate citation for your data
    > ### Aliases: neon_citation
    > 
    > ### ** Examples
    > 
    > 
    ...
      6.           ├─base::do.call(rbind, x)
      7.           └─(function (..., deparse.level = 1) ...
      8.             └─tibble:::rbind(deparse.level, ...)
      9.               └─vctrs::vec_rbind(!!!list(...))
     10.                 └─(function () ...
     11.                   └─vctrs::vec_default_ptype2(...)
     12.                     └─vctrs::stop_incompatible_type(...)
     13.                       └─vctrs:::stop_incompatible(...)
     14.                         └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4.       └─neonstore::neon_filename_parser(files)
        5.         └─neonstore:::ragged_bind(...)
        6.           ├─base::do.call(rbind, x)
        7.           └─(function (..., deparse.level = 1) ...
        8.             └─tibble:::rbind(deparse.level, ...)
        9.               └─vctrs::vec_rbind(!!!list(...))
       10.                 └─(function () ...
       11.                   └─vctrs::vec_default_ptype2(...)
       12.                     └─vctrs::stop_incompatible_type(...)
       13.                       └─vctrs:::stop_incompatible(...)
       14.                         └─vctrs:::stop_vctrs(...)
      
      [ FAIL 3 | WARN 0 | SKIP 18 | PASS 16 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rhdf5’
    ```

# OncoBayes2

<details>

* Version: 0.7-0
* GitHub: NA
* Source code: https://github.com/cran/OncoBayes2
* Date/Publication: 2021-05-07 19:30:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "OncoBayes2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘OncoBayes2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: blrm_exnex
    > ### Title: Bayesian Logistic Regression Model for N-compounds with EXNEX
    > ### Aliases: blrm_exnex print.blrmfit
    > 
    > ### ** Examples
    > 
    > ## Setting up dummy sampling for fast execution of example
    ...
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > blrmfit_new <- update(blrmfit,
    +                       data = rbind(hist_combo3, newdata) %>%
    +                                arrange(stratum, group_id))
    Error in factor(group_index) : object 'group_index' not found
    Calls: update ... update.blrmfit -> eval -> eval -> blrm_exnex -> factor
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 59.5Mb
      sub-directories of 1Mb or more:
        libs  58.4Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# optimall

<details>

* Version: 0.1.0
* GitHub: https://github.com/yangjasp/optimall
* Source code: https://github.com/cran/optimall
* Date/Publication: 2021-07-21 10:10:02 UTC
* Number of recursive dependencies: 122

Run `cloud_details(, "optimall")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘optimall-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: allocate_wave
    > ### Title: Adaptive Multi-Wave Sampling
    > ### Aliases: allocate_wave
    > 
    > ### ** Examples
    > 
    > # Create dataframe with a column specifying strata, a variable of interest
    ...
    +                      AlreadySampled = rep(c(rep(1, times = 5),
    +                                             rep(0, times = 15)),
    +                                           times = 3))
    > 
    > x <- allocate_wave(
    +   data = mydata, strata = "Strata",
    +   y = "Var", already_sampled = "AlreadySampled",
    +   nsample = 20, method = "simple"
    + )
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. └─optimall::allocate_wave(...) test-sample_strata.R:19:0
        2.   └─optimall::optimum_allocation(...)
        3.     ├─...[]
        4.     └─tibble:::`[.tbl_df`(...)
        5.       └─tibble:::vectbl_as_col_location(...)
        6.         ├─tibble:::subclass_col_index_errors(...)
        7.         │ └─base::withCallingHandlers(...)
        8.         └─vctrs::vec_as_location(j, n, names)
        9.           └─(function () ...
       10.             └─vctrs:::stop_subscript_oob(...)
       11.               └─vctrs:::stop_subscript(...)
      
      [ FAIL 17 | WARN 0 | SKIP 1 | PASS 135 ]
      Error: Test failures
      Execution halted
    ```

# phenofit

<details>

* Version: 0.2.7
* GitHub: https://github.com/kongdd/phenofit
* Source code: https://github.com/cran/phenofit
* Date/Publication: 2020-04-02 11:40:03 UTC
* Number of recursive dependencies: 95

Run `cloud_details(, "phenofit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phenofit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_GOF
    > ### Title: get_GOF
    > ### Aliases: get_GOF get_GOF.fFITs
    > 
    > ### ** Examples
    > 
    > library(phenofit)
    ...
    > y <- fFUN(par, t)
    > methods <- c("AG", "Beck", "Elmore", "Gu", "Zhang") # "Klos" too slow
    > fFITs <- curvefit(y, t, tout, methods)
    > # multiple years
    > fits  <- list(`2001` = fFITs, `2002` = fFITs)
    > 
    > l_param   <- get_param(fits)
    > d_GOF     <- get_GOF(fits)
    > d_fitting <- get_fitting(fits)
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       17. │       ├─base::merge(fFITs$data[Ix], df, id = "t")
       18. │       └─data.table::merge.data.table(fFITs$data[Ix], df, id = "t")
       19. └─phenofit:::melt_list(., "flag")
       20.   └─data.table::is.data.table(list[[1]])
      
      [ FAIL 1 | WARN 12 | SKIP 0 | PASS 45 ]
      Error: Test failures
      In addition: Warning messages:
      1: In strptime(x, format, tz = "GMT") :
        day-of-year 366 in year 2017 is invalid
      2: In strptime(x, format, tz = "GMT") :
        day-of-year 366 in year 2017 is invalid
      3: In strptime(x, format, tz = "GMT") :
        day-of-year 366 in year 2017 is invalid
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        libs   6.4Mb
    ```

# pitchRx

<details>

* Version: 1.8.2
* GitHub: https://github.com/cpsievert/pitchRx
* Source code: https://github.com/cran/pitchRx
* Date/Publication: 2015-12-09 12:57:25
* Number of recursive dependencies: 96

Run `cloud_details(, "pitchRx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pitchRx-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: strikeFX
    > ### Title: Visualize PITCHf/x strikezones
    > ### Aliases: strikeFX
    > 
    > ### ** Examples
    > 
    > data(pitches)
    > 
    > strikeFX(pitches)
    Error in strikeFX(pitches) : 
      'list' object cannot be coerced to type 'double'
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘ggsubplot’
    ```

# PKNCA

<details>

* Version: 0.9.4
* GitHub: https://github.com/billdenney/pknca
* Source code: https://github.com/cran/PKNCA
* Date/Publication: 2020-06-01 17:00:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "PKNCA")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error (test-class-PKNCAdata.R:336:3): intervals may be a tibble ─────────────
      Error: exclude column must be character vector or something convertable to character without loss of information.
      Backtrace:
          █
       1. ├─testthat::expect_equal(...) test-class-PKNCAdata.R:336:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::as.data.frame(pk.nca(mydata_tibble))
       5. └─PKNCA::pk.nca(mydata_tibble)
       6.   └─PKNCA::PKNCAresults(result = results, data = data, exclude = "exclude")
       7.     └─PKNCA:::setExcludeColumn(ret, exclude = exclude, dataname = "result")
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1305 ]
      Error: Test failures
      Execution halted
    ```

# prettyglm

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/prettyglm
* Date/Publication: 2021-06-24 07:40:05 UTC
* Number of recursive dependencies: 127

Run `cloud_details(, "prettyglm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘prettyglm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pretty_relativities
    > ### Title: pretty_relativities
    > ### Aliases: pretty_relativities
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
      3.   │ └─base::withCallingHandlers(...)
      4.   └─base::rbind(count_df_all, count_df)
      5.     └─tibble:::rbind(deparse.level, ...)
      6.       └─vctrs::vec_rbind(!!!list(...))
      7.         └─(function () ...
      8.           └─vctrs::vec_default_ptype2(...)
      9.             └─vctrs::stop_incompatible_type(...)
     10.               └─vctrs:::stop_incompatible(...)
     11.                 └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘parsnip’
    ```

# psychmeta

<details>

* Version: 2.6.0
* GitHub: https://github.com/psychmeta/psychmeta
* Source code: https://github.com/cran/psychmeta
* Date/Publication: 2021-06-01 04:30:02 UTC
* Number of recursive dependencies: 81

Run `cloud_details(, "psychmeta")` for more info

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
    ...
     13.                     ├─base::factor(...)
     14.                     ├─moderator_data[, i][!duplicated(moderator_data[, i])]
     15.                     └─tibble:::`[.tbl_df`(...)
     16.                       └─tibble:::vectbl_as_col_location(...)
     17.                         ├─tibble:::subclass_col_index_errors(...)
     18.                         │ └─base::withCallingHandlers(...)
     19.                         └─vctrs::vec_as_location(j, n, names)
     20.                           └─(function () ...
     21.                             └─vctrs:::stop_indicator_size(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       16.                 └─psychmeta:::ma_wrapper(...)
       17.                   └─psychmeta:::organize_moderators(...)
       18.                     ├─base::factor(...)
       19.                     ├─moderator_data[, i][!duplicated(moderator_data[, i])]
       20.                     └─tibble:::`[.tbl_df`(...)
       21.                       └─tibble:::vectbl_as_col_location(...)
       22.                         ├─tibble:::subclass_col_index_errors(...)
       23.                         │ └─base::withCallingHandlers(...)
       24.                         └─vctrs::vec_as_location(j, n, names)
       25.                           └─(function () ...
       26.                             └─vctrs:::stop_indicator_size(...)
      
      [ FAIL 8 | WARN 0 | SKIP 0 | PASS 44 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mathjaxr’
      All declared Imports should be used.
    ```

# REddyProc

<details>

* Version: 1.2.2
* GitHub: https://github.com/bgctw/REddyProc
* Source code: https://github.com/cran/REddyProc
* Date/Publication: 2020-03-18 07:00:18 UTC
* Number of recursive dependencies: 74

Run `cloud_details(, "REddyProc")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘doRUnit.R’
    Running the tests in ‘tests/doRUnit.R’ failed.
    Last 13 lines of output:
          █
       1. └─testthat::expect_equal(sum(is.finite(tmpPar[, "FP_beta"])), 4L) test_partGL.R:839:2
       2.   └─testthat::quasi_label(enquo(object), label, arg = "object")
       3.     └─rlang::eval_bare(expr, quo_get_env(quo))
      ── Error (test_partGL.R:881:3): partGLPartitionFluxes missing prediction VPD ───
      Error: default method not implemented for type 'list'
      Backtrace:
          █
       1. └─testthat::expect_equal(sum(is.finite(tmpPar[, "FP_beta"])), 4L) test_partGL.R:881:2
       2.   └─testthat::quasi_label(enquo(object), label, arg = "object")
       3.     └─rlang::eval_bare(expr, quo_get_env(quo))
      
      [ FAIL 3 | WARN 3 | SKIP 19 | PASS 344 ]
      Error: Test failures
      Execution halted
    ```

# reproducer

<details>

* Version: 0.4.2
* GitHub: NA
* Source code: https://github.com/cran/reproducer
* Date/Publication: 2021-02-23 18:40:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "reproducer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘reproducer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments
    > ### Title: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments
    > ### Aliases: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments
    > 
    > ### ** Examples
    > 
    > rrData = reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments()
    New names:
    ```

# RKorAPClient

<details>

* Version: 0.6.1
* GitHub: https://github.com/KorAP/RKorAPClient
* Source code: https://github.com/cran/RKorAPClient
* Date/Publication: 2021-03-12 22:10:11 UTC
* Number of recursive dependencies: 112

Run `cloud_details(, "RKorAPClient")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          █
       1. ├─`%>%`(...) test-demos.R:89:2
       2. ├─RKorAPClient::hc_freq_by_year_ci(.)
       3. │ └─`%>%`(...)
       4. ├─base::cbind(...)
       5. │ └─tibble:::cbind(deparse.level, ...)
       6. │   └─vctrs::vec_cbind(!!!list(...))
       7. └─vctrs::stop_incompatible_size(...)
       8.   └─vctrs:::stop_incompatible(...)
       9.     └─vctrs:::stop_vctrs(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

# rubias

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/rubias
* Date/Publication: 2021-01-15 19:10:02 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "rubias")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rubias-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: infer_mixture
    > ### Title: Estimate mixing proportions and origin probabilities from one or
    > ###   several mixtures
    > ### Aliases: infer_mixture
    > 
    > ### ** Examples
    > 
    > mcmc <- infer_mixture(reference = small_chinook_ref,
    +                       mixture = small_chinook_mix,
    +                       gen_start_col = 5,
    +                       method = "MCMC",
    +                       reps  = 200)
    Collating data; compiling reference allele frequencies, etc.New names:
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.6Mb
      sub-directories of 1Mb or more:
        libs   8.8Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# sapfluxnetr

<details>

* Version: 0.1.1
* GitHub: https://github.com/sapfluxnet/sapfluxnetr
* Source code: https://github.com/cran/sapfluxnetr
* Date/Publication: 2020-08-27 12:50:02 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "sapfluxnetr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sapfluxnetr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diurnal_centroid
    > ### Title: Diurnal centroid calculation
    > ### Aliases: diurnal_centroid
    > 
    > ### ** Examples
    > 
    > # dplyr
    ...
    > sfn_metrics(
    +   ARG_TRE,
    +   period = '1 day',
    +   .funs = list(~ diurnal_centroid(.),
    +                ~ data_coverage(., timestep, period_minutes)),
    +   solar = FALSE,
    +   interval = 'general'
    + )
    [1] "Crunching data for ARG_TRE. In large datasets this could take a while"
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       18. │       └─tidyselect:::vars_select_eval(...)
       19. │         └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
       20. │           └─tidyselect:::eval_minus(expr, data_mask, context_mask)
       21. │             └─tidyselect:::eval_bang(expr, data_mask, context_mask)
       22. │               └─tidyselect:::walk_data_tree(expr[[2]], data_mask, context_mask)
       23. │                 └─base::eval(expr, data_mask)
       24. │                   └─base::eval(expr, data_mask)
       25. │                     ├─TIMESTAMP
       26. │                     └─rlang:::`$.rlang_data_pronoun`(.data, TIMESTAMP)
       27. │                       └─rlang:::data_pronoun_get(x, nm)
       28. └─rlang:::abort_data_pronoun(x)
      
      [ FAIL 17 | WARN 0 | SKIP 19 | PASS 140 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# sim2Dpredictr

<details>

* Version: 0.1.0
* GitHub: https://github.com/jmleach-bst/sim2Dpredictr
* Source code: https://github.com/cran/sim2Dpredictr
* Date/Publication: 2020-03-14 16:10:02 UTC
* Number of recursive dependencies: 134

Run `cloud_details(, "sim2Dpredictr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sim2Dpredictr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: precision_builder
    > ### Title: Construct a Precision Matrix
    > ### Aliases: precision_builder
    > 
    > ### ** Examples
    > 
    > 
    ...
    [21,]  0.00
    [22,]  0.00
    [23,]  0.00
    [24,] -0.75
    [25,]  2.00
    > 
    > ## binary weights
    > precision_builder(im.res = c(5, 5), tau = 1, alpha = 0.75,
    +                   neighborhood = "round", r = 3)
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(sim2Dpredictr)
      > 
      > test_check("sim2Dpredictr")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test_builders.R:8:3): proximity matrix is not binary ───────────────
      length(...) is not strictly more than 2. Difference: -1
      ── Failure (test_builders.R:16:3): proximity matrix has max of phi ─────────────
      max(...) not equal to 2.
      1/1 mismatches
      [1] 0 - 2 == -2
      
      [ FAIL 2 | WARN 752 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘car’ ‘ggplot2’ ‘magrittr’ ‘tidyverse’
      All declared Imports should be used.
    ```

# SMMT

<details>

* Version: 1.0.7
* GitHub: NA
* Source code: https://github.com/cran/SMMT
* Date/Publication: 2021-02-20 18:30:02 UTC
* Number of recursive dependencies: 60

Run `cloud_details(, "SMMT")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          filter, lag
      
      The following objects are masked from 'package:base':
      
          intersect, setdiff, setequal, union
      
      Loading required package: SMMT
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-get_irreversible_municipality_mutations.R:72:3): Irreversible mutation is detected ──
      `result` not identical to `expected`.
      Objects equal but not identical
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

# stacks

<details>

* Version: 0.2.1
* GitHub: https://github.com/tidymodels/stacks
* Source code: https://github.com/cran/stacks
* Date/Publication: 2021-07-23 16:20:02 UTC
* Number of recursive dependencies: 132

Run `cloud_details(, "stacks")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       26.         └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
       27.           └─tidyselect:::eval_c(expr, data_mask, context_mask)
       28.             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       29.               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       30.                 └─tidyselect:::as_indices_sel_impl(...)
       31.                   └─tidyselect:::as_indices_impl(x, vars, strict = strict)
       32.                     └─tidyselect:::chr_as_locations(x, vars)
       33.                       └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       34.                         └─(function () ...
       35.                           └─vctrs:::stop_subscript_oob(...)
       36.                             └─vctrs:::stop_subscript(...)
      
      [ FAIL 1 | WARN 1 | SKIP 38 | PASS 5 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘workflowsets’ ‘yardstick’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘h2o’, ‘SuperLearner’
    ```

# stevemisc

<details>

* Version: 1.2.0
* GitHub: https://github.com/svmiller/stevemisc
* Source code: https://github.com/cran/stevemisc
* Date/Publication: 2021-07-27 13:50:02 UTC
* Number of recursive dependencies: 106

Run `cloud_details(, "stevemisc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘stevemisc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_sims
    > ### Title: Get Simulations from a Model Object (with New Data)
    > ### Aliases: get_sims
    > 
    > ### ** Examples
    > 
    > # Note: these models are dumb, but they illustrate how it works.
    ...
      7.         └─tibble:::repaired_names(...)
      8.           ├─tibble:::subclass_name_repair_errors(...)
      9.           │ └─base::withCallingHandlers(...)
     10.           └─vctrs::vec_as_names(...)
     11.             └─(function () ...
     12.               └─vctrs:::validate_unique(names = names, arg = arg)
     13.                 └─vctrs:::stop_names_cannot_be_empty(names)
     14.                   └─vctrs:::stop_names(...)
     15.                     └─vctrs:::stop_vctrs(class = c(class, "vctrs_error_names"), ...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# tablet

<details>

* Version: 0.3.2
* GitHub: https://github.com/bergsmat/tablet
* Source code: https://github.com/cran/tablet
* Date/Publication: 2021-07-18 04:10:02 UTC
* Number of recursive dependencies: 122

Run `cloud_details(, "tablet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          █
       1. └─testthat::expect_equal_to_reference(...) test-tablet.R:84:2
       2.   └─testthat::expect_known_value(..., update = update)
      ── Failure (test-tablet.R:89:3): tablet package result is stable ───────────────
      `%>%`(...) has changed from known value recorded in '016.rds'.
      Attributes: < Component "class": Lengths (4, 2) differ (string compare on first 2) >
      Attributes: < Component "class": 1 string mismatch >
      Backtrace:
          █
       1. └─testthat::expect_equal_to_reference(...) test-tablet.R:89:2
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# textrecipes

<details>

* Version: 0.4.1
* GitHub: https://github.com/tidymodels/textrecipes
* Source code: https://github.com/cran/textrecipes
* Date/Publication: 2021-07-11 08:00:02 UTC
* Number of recursive dependencies: 99

Run `cloud_details(, "textrecipes")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • skip, wait for final smltar render (4)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-embeddings.R:251:3): NA tokens work. ──────────────────────────
      `test_result` not identical to `expected_result`.
      Length mismatch: comparison on first 5 components
      Component "w_embed_sum_d1": 'is.NA' value mismatch: 1 in current 0 in target
      Component "w_embed_sum_d2": 'is.NA' value mismatch: 1 in current 0 in target
      Component "w_embed_sum_d3": 'is.NA' value mismatch: 1 in current 0 in target
      Component "w_embed_sum_d4": 'is.NA' value mismatch: 1 in current 0 in target
      Component "w_embed_sum_d5": 'is.NA' value mismatch: 1 in current 0 in target
      
      [ FAIL 1 | WARN 0 | SKIP 8 | PASS 293 ]
      Error: Test failures
      Execution halted
    ```

# tidypredict

<details>

* Version: 0.4.8
* GitHub: https://github.com/tidymodels/tidypredict
* Source code: https://github.com/cran/tidypredict
* Date/Publication: 2020-10-28 06:50:02 UTC
* Number of recursive dependencies: 98

Run `cloud_details(, "tidypredict")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8. │   └─tibble:::`$<-.tbl_df`(`*tmp*`, "fit_diff", value = numeric(0))
        9. │     └─tibble:::tbl_subassign(...)
       10. │       └─tibble:::vectbl_recycle_rhs(...)
       11. │         ├─base::withCallingHandlers(...)
       12. │         └─vctrs::vec_recycle(value[[j]], nrow)
       13. ├─vctrs:::stop_recycle_incompatible_size(...)
       14. │ └─vctrs:::stop_vctrs(...)
       15. │   └─rlang::abort(message, class = c(class, "vctrs_error"), ...)
       16. │     └─rlang:::signal_abort(cnd)
       17. │       └─base::signalCondition(cnd)
       18. └─(function (cnd) ...
      
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 117 ]
      Error: Test failures
      Execution halted
    ```

# tune

<details>

* Version: 0.1.6
* GitHub: https://github.com/tidymodels/tune
* Source code: https://github.com/cran/tune
* Date/Publication: 2021-07-21 14:40:06 UTC
* Number of recursive dependencies: 112

Run `cloud_details(, "tune")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tune-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: conf_mat_resampled
    > ### Title: Compute average confusion matrix across resamples
    > ### Aliases: conf_mat_resampled
    > 
    > ### ** Examples
    > 
    > library(parsnip)
    ...
    > 
    > data(two_class_dat, package = "modeldata")
    > 
    > set.seed(2393)
    > res <-
    +   logistic_reg() %>%
    +   set_engine("glm") %>%
    +   fit_resamples(Class ~ ., resamples = vfold_cv(two_class_dat, v = 3),
    +                 control = control_resamples(save_pred = TRUE))
    New names:
    ```

# twoxtwo

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/twoxtwo
* Date/Publication: 2021-07-09 09:00:02 UTC
* Number of recursive dependencies: 65

Run `cloud_details(, "twoxtwo")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─base::summary(tmp_twoxtwo)
        5. └─twoxtwo:::summary.twoxtwo(tmp_twoxtwo)
        6.   ├─base::cat(print(object, ...), sep = "\n")
        7.   ├─base::print(object, ...)
        8.   └─twoxtwo:::print.twoxtwo(object, ...)
        9.     ├─base::cat(display(x, ...), sep = "\n")
       10.     └─twoxtwo::display(x, ...)
       11.       └─knitr::kable(...)
       12.         └─base::`colnames<-`(`*tmp*`, value = col.names)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 59 ]
      Error: Test failures
      Execution halted
    ```

# VarBundle

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/VarBundle
* Date/Publication: 2018-08-17 08:40:10 UTC
* Number of recursive dependencies: 57

Run `cloud_details(, "VarBundle")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           █
        1. └─VarBundle::varbundle(ll) test-varbundle.R:40:2
        2.   ├─base::do.call(rbind, lapply(1:length(x), create_df))
        3.   └─(function (..., deparse.level = 1) ...
        4.     └─tibble:::rbind(deparse.level, ...)
        5.       └─vctrs::vec_rbind(!!!list(...))
        6.         └─(function () ...
        7.           └─vctrs::vec_default_ptype2(...)
        8.             └─vctrs::stop_incompatible_type(...)
        9.               └─vctrs:::stop_incompatible(...)
       10.                 └─vctrs:::stop_vctrs(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 38 ]
      Error: Test failures
      Execution halted
    ```

# visR

<details>

* Version: 0.2.0
* GitHub: https://github.com/openpharma/visR
* Source code: https://github.com/cran/visR
* Date/Publication: 2021-06-14 09:00:02 UTC
* Number of recursive dependencies: 123

Run `cloud_details(, "visR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘visR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_tableone
    > ### Title: Calculate summary statistics
    > ### Aliases: get_tableone get_tableone.default
    > 
    > ### ** Examples
    > 
    > 
    ...
      6. │   └─tibble:::rbind(deparse.level, ...)
      7. │     └─vctrs::vec_rbind(!!!list(...))
      8. │       └─(function () ...
      9. │         └─vctrs::vec_default_ptype2(...)
     10. │           └─vctrs::stop_incompatible_type(...)
     11. │             └─vctrs:::stop_incompatible(...)
     12. │               └─vctrs:::stop_vctrs(...)
     13. ├─dplyr::select(., variable, statistic, everything())
     14. └─dplyr::rename(., statistic = summary_id)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8. │ ├─`%>%`(...)
        9. │ └─base::rbind(data_ns, data_summary)
       10. │   └─tibble:::rbind(deparse.level, ...)
       11. │     └─vctrs::vec_rbind(!!!list(...))
       12. │       └─(function () ...
       13. │         └─vctrs::vec_default_ptype2(...)
       14. │           └─vctrs::stop_incompatible_type(...)
       15. │             └─vctrs:::stop_incompatible(...)
       16. │               └─vctrs:::stop_vctrs(...)
       17. ├─dplyr::select(., variable, statistic, everything())
       18. └─dplyr::rename(., statistic = summary_id)
      
      [ FAIL 9 | WARN 0 | SKIP 12 | PASS 527 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘parcats’
      All declared Imports should be used.
    ```

# vlda

<details>

* Version: 1.1.5
* GitHub: https://github.com/pnuwon/vlda
* Source code: https://github.com/cran/vlda
* Date/Publication: 2020-06-26 08:50:02 UTC
* Number of recursive dependencies: 47

Run `cloud_details(, "vlda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vlda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vlda_plot
    > ### Title: VLDA Plot
    > ### Aliases: vlda_plot
    > ### Keywords: Plot Visualzation
    > 
    > ### ** Examples
    > 
    ...
      9. │           └─base::lapply(def_fonts, font_family_exists)
     10. │             └─ggiraph:::FUN(X[[i]], ...)
     11. │               └─ggiraph:::fortify_font_db()
     12. │                 └─base::rbind(db_sys, db_reg)
     13. │                   └─tibble:::rbind(deparse.level, ...)
     14. │                     └─vctrs::vec_rbind(!!!list(...))
     15. └─vctrs::stop_incompatible_type(...)
     16.   └─vctrs:::stop_incompatible(...)
     17.     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# workflowsets

<details>

* Version: 0.1.0
* GitHub: https://github.com/tidymodels/workflowsets
* Source code: https://github.com/cran/workflowsets
* Date/Publication: 2021-07-22 14:00:02 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "workflowsets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─tune::collect_metrics(res_1)
        5. ├─workflowsets:::collect_metrics.workflow_set(res_1)
        6. │ ├─dplyr::mutate(...)
        7. │ └─dplyr:::mutate.data.frame(...)
        8. │   └─dplyr:::mutate_cols(.data, ..., caller_env = caller_env())
        9. │     ├─base::withCallingHandlers(...)
       10. │     └─mask$eval_all_mutate(quo)
       11. └─purrr::map(result, collect_metrics, summarize = summarize)
       12.   ├─tune:::.f(.x[[i]], ...)
       13.   └─tune:::collect_metrics.tune_results(.x[[i]], ...)
       14.     └─tune::estimate_tune_results(x)
      
      [ FAIL 1 | WARN 30 | SKIP 6 | PASS 326 ]
      Error: Test failures
      Execution halted
    ```

# wpa

<details>

* Version: 1.6.0
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2021-07-06 09:30:02 UTC
* Number of recursive dependencies: 116

Run `cloud_details(, "wpa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wpa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: collaboration_rank
    > ### Title: Collaboration Ranking
    > ### Aliases: collaboration_rank collab_rank
    > 
    > ### ** Examples
    > 
    > # Return rank table
    ...
      2.   └─wpa::create_rank(...)
      3.     └─base::rbind(results, table1)
      4.       └─tibble:::rbind(deparse.level, ...)
      5.         └─vctrs::vec_rbind(!!!list(...))
      6.           └─(function () ...
      7.             └─vctrs::vec_default_ptype2(...)
      8.               └─vctrs::stop_incompatible_type(...)
      9.                 └─vctrs:::stop_incompatible(...)
     10.                   └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# xpose4

<details>

* Version: 4.7.1
* GitHub: https://github.com/UUPharmacometrics/xpose4
* Source code: https://github.com/cran/xpose4
* Date/Publication: 2020-12-18 13:00:02 UTC
* Number of recursive dependencies: 92

Run `cloud_details(, "xpose4")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xpose4-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: runsum
    > ### Title: Print run summary in Xpose 4
    > ### Aliases: runsum
    > ### Keywords: methods
    > 
    > ### ** Examples
    > 
    ...
    Table files read.
    
    Looking for NONMEM simulation table files.
    No simulated table files read.
    
    > runsum(xpdb)
    Error in Math.data.frame(list(IWRES = integer(0))) : 
      non-numeric variable(s) in data frame: IWRES
    Calls: runsum ... absval.iwres.vs.ipred -> xpose.plot.default -> do.call -> Math.data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "ID": Attributes: < target is NULL, current is list >
      Component "ID": target is numeric, current is factor
      Component "IWRES": names for current but not for target
      Component "IWRES": Attributes: < target is NULL, current is list >
      Component "IWRES": target is numeric, current is factor
      Component "CWRES": names for current but not for target
      ...
      Backtrace:
          █
       1. └─xpose4:::compare_xpdb(xpdb_2, xpdb_3) test_reading_data.R:25:2
       2.   └─testthat::expect_equal(xpdb_1@Data, xpdb_2@Data) test_reading_data.R:7:2
      
      [ FAIL 3 | WARN 0 | SKIP 1 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

# xrf

<details>

* Version: 0.2.0
* GitHub: https://github.com/holub008/xrf
* Source code: https://github.com/cran/xrf
* Date/Publication: 2020-05-03 21:00:01 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "xrf")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2. └─xrf:::xrf.formula(...)
       3.   ├─rule_features[, varying_rules]
       4.   └─base::`[.data.frame`(rule_features, , varying_rules)
      ── Error (test_model.R:99:3): call scrubbed ────────────────────────────────────
      Error: undefined columns selected
      Backtrace:
          █
       1. ├─xrf::xrf(...) test_model.R:99:2
       2. └─xrf:::xrf.formula(...)
       3.   ├─rule_features[, varying_rules]
       4.   └─base::`[.data.frame`(rule_features, , varying_rules)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 26 ]
      Error: Test failures
      Execution halted
    ```

# ypr

<details>

* Version: 0.5.2
* GitHub: https://github.com/poissonconsulting/ypr
* Source code: https://github.com/cran/ypr
* Date/Publication: 2021-07-03 04:40:02 UTC
* Number of recursive dependencies: 74

Run `cloud_details(, "ypr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ypr)
      > 
      > test_check("ypr")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-base.R:16:3): as.data.frame ───────────────────────────────────
      as.data.frame(ypr_populations(Rk = c(3, 4))) not identical to structure(...).
      Attributes: < Component "row.names": Modes: numeric, character >
      Attributes: < Component "row.names": target is numeric, current is character >
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 174 ]
      Error: Test failures
      Execution halted
    ```

