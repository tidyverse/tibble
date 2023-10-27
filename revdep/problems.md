# bulkreadr

<details>

* Version: 1.0.0
* GitHub: https://github.com/gbganalyst/bulkreadr
* Source code: https://github.com/cran/bulkreadr
* Date/Publication: 2023-09-26 13:30:02 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "bulkreadr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
      * metadata.consumer: projects/603366585132
      * metadata.quota_metric: sheets.googleapis.com/read_requests
      * metadata.quota_limit: ReadRequestsPerMinutePerProject
      Links
      * Description: Request a higher quota limit.
        URL: https://cloud.google.com/docs/quota#requesting_higher_quota
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# dplyr

<details>

* Version: 1.1.3
* GitHub: https://github.com/tidyverse/dplyr
* Source code: https://github.com/cran/dplyr
* Date/Publication: 2023-09-03 16:20:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "dplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(dplyr)
      
      Attaching package: 'dplyr'
      
      The following object is masked from 'package:testthat':
      
    ...
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-summarise.R:248:3'): summarise allows names (#2675) ──────────
      names(data$b) (`actual`) not equal to c("1", "2", "3") (`expected`).
      
      `actual` is NULL
      `expected` is a character vector ('1', '2', '3')
      
      [ FAIL 1 | WARN 0 | SKIP 327 | PASS 2851 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# historicalborrow

<details>

* Version: 1.0.4
* GitHub: https://github.com/wlandau/historicalborrow
* Source code: https://github.com/cran/historicalborrow
* Date/Publication: 2022-09-13 10:20:10 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "historicalborrow")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(historicalborrow)
      > 
      > test_check("historicalborrow")
      [ FAIL 10 | WARN 4 | SKIP 0 | PASS 365 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      `names(expected)` is a character vector ('2.5%')
      ── Failure ('test-hb_summary.R:385:3'): hb_summary() precision ratio ───────────
      out$precision_ratio_upper[1] (`actual`) not equal to quantile(samples, 0.975) (`expected`).
      
      `names(actual)` is absent
      `names(expected)` is a character vector ('97.5%')
      
      [ FAIL 10 | WARN 4 | SKIP 0 | PASS 365 ]
      Error: Test failures
      Execution halted
    ```

# LexisNexisTools

<details>

* Version: 0.3.7
* GitHub: https://github.com/JBGruber/LexisNexisTools
* Source code: https://github.com/cran/LexisNexisTools
* Date/Publication: 2023-07-05 13:33:03 UTC
* Number of recursive dependencies: 125

Run `revdepcheck::cloud_details(, "LexisNexisTools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library("testthat")
      > library("LexisNexisTools")
      LexisNexisTools Version 0.3.7
      > 
      > test_check("LexisNexisTools")
      
    ...
      Attributes: < Component "paragraphs": Attributes: < Component 1: Modes: character, externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: Lengths: 3, 1 > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: target is character, current is externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Modes: numeric, character > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Lengths: 122, 3 > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: target is numeric, current is character > >
      
      [ FAIL 2 | WARN 0 | SKIP 3 | PASS 96 ]
      Error: Test failures
      Execution halted
    ```

# matrixset

<details>

* Version: 0.2.0
* GitHub: https://github.com/pascalcroteau/matrixset
* Source code: https://github.com/cran/matrixset
* Date/Publication: 2023-07-08 12:40:02 UTC
* Number of recursive dependencies: 125

Run `revdepcheck::cloud_details(, "matrixset")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(matrixset)
      > 
      > test_check("matrixset")
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 1315 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      `names(expected$prev_Y_score)` is a character vector ('prev_Y_score10', 'prev_Y_score18', 'prev_Y_score2', 'prev_Y_score9', 'prev_Y_score8', ...)
      ── Failure ('test-properties.R:76:3'): matrixset properties works ──────────────
      row_info(student_results2) (`actual`) not equal to `ri2` (`expected`).
      
      `names(actual$prev_Y_score)` is absent
      `names(expected$prev_Y_score)` is a character vector ('prev_Y_score10', 'prev_Y_score1', 'prev_Y_score17', 'prev_Y_score4', 'prev_Y_score2', ...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 1315 ]
      Error: Test failures
      Execution halted
    ```

# NMdata

<details>

* Version: 0.1.2
* GitHub: https://github.com/philipdelff/NMdata
* Source code: https://github.com/cran/NMdata
* Date/Publication: 2023-10-19 07:10:09 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "NMdata")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NMdata)
      NMdata 0.1.2. Browse NMdata documentation at
      https://philipdelff.github.io/NMdata/
      > 
      > test_check("NMdata")
    ...
      Attributes: < Component 2: names for current but not for target >
      ...
      Backtrace:
          ▆
       1. └─testthat::expect_equal_to_reference(res1, fileRef, version = 2) at test_NMscanData.R:449:4
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 255 ]
      Error: Test failures
      Execution halted
    ```

# NMsim

<details>

* Version: 0.0.4
* GitHub: https://github.com/philipdelff/NMsim
* Source code: https://github.com/cran/NMsim
* Date/Publication: 2023-09-21 06:50:13 UTC
* Number of recursive dependencies: 112

Run `revdepcheck::cloud_details(, "NMsim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NMsim)
      NMsim 0.0.4. Browse NMsim documentation at
      https://philipdelff.github.io/NMsim/
      > 
      > test_check("NMsim")
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 19 ]
    ...
      Attributes: < Component 2: Lengths: 1, 3 >
      Attributes: < Component 2: target is numeric, current is character >
      Backtrace:
          ▆
       1. └─testthat::expect_equal_to_reference(res, fileRef) at test_NMcreateDoses.R:135:4
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 19 ]
      Error: Test failures
      Execution halted
    ```

# psychmeta

<details>

* Version: 2.6.5
* GitHub: https://github.com/psychmeta/psychmeta
* Source code: https://github.com/cran/psychmeta
* Date/Publication: 2022-08-26 12:30:07 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "psychmeta")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(psychmeta)
      -----------------------------------------------------  psychmeta version 2.6.5  --
      
      Please report any bugs to github.com/psychmeta/psychmeta/issues
      or issues@psychmeta.com
      
    ...
      Component "meta_tables": Component "analysis_id: 1": Component "artifact_distribution": Attributes: < Component "inputs": Component "correct_rr_y": names for current but not for target >
      Component "meta_tables": Component "analysis_id: 1": Component "artifact_distribution": Attributes: < Component "inputs": Component "indirect_rr_x": names for current but not for target >
      Component "meta_tables": Component "analysis_id: 1": Component "artifact_distribution": Attributes: < Component "inputs": Component "indirect_rr_y": names for current but not for target >
      Component "meta_tables": Component "analysis_id: 1": Component "artifact_distribution": Attributes: < Component "inputs": Component "sign_rxz": names for current but not for target >
      Component "meta_tables": Component "analysis_id: 1": Component "artifact_distribution": Attributes: < Component "inputs": Component "sign_ryz": names for current but not for target >
      ...
      
      [ FAIL 5 | WARN 1 | SKIP 0 | PASS 48 ]
      Error: Test failures
      Execution halted
    ```

# RevGadgets

<details>

* Version: 1.1.1
* GitHub: https://github.com/revbayes/RevGadgets
* Source code: https://github.com/cran/RevGadgets
* Date/Publication: 2023-05-25 07:40:11 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "RevGadgets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(RevGadgets)
      > 
      > test_check("RevGadgets")
      
        |                                              
        |                                        |   0%
    ...
      ── Failure ('test_plotTree.R:25:3'): plot basic, not-yet-rooted phylogeny ──────
      plot_new$data not equal to `plot_orig`.
      Component "posterior": names for current but not for target
      ── Failure ('test_rerootPhylo.R:39:3'): reroots tree ───────────────────────────
      `node_pp` not equal to `node_pp_root`.
      Component "posterior": names for target but not for current
      
      [ FAIL 5 | WARN 42 | SKIP 0 | PASS 118 ]
      Error: Test failures
      Execution halted
    ```

# simaerep

<details>

* Version: 0.4.3
* GitHub: https://github.com/openpharma/simaerep
* Source code: https://github.com/cran/simaerep
* Date/Publication: 2023-03-03 10:30:02 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "simaerep")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(simaerep)
      Loading required package: ggplot2
      > 
      > test_check("simaerep")
      [ FAIL 6 | WARN 1576 | SKIP 4 | PASS 77 ]
    ...
      `expected`: TRUE 
      
      [ FAIL 6 | WARN 1576 | SKIP 4 | PASS 77 ]
      Deleting unused snapshots:
      • validation/study-025.svg
      • validation/study-050.svg
      • validation/study-075.svg
      • validation/study-100.svg
      Error: Test failures
      Execution halted
    ```

# simTool

<details>

* Version: 1.1.7
* GitHub: https://github.com/MarselScheer/simTool
* Source code: https://github.com/cran/simTool
* Date/Publication: 2020-09-22 16:00:03 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "simTool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > 
      > if (requireNamespace("tinytest", quietly = TRUE)) {
      +   tinytest::test_package("simTool")
      + }
      
      test_bind_or_combine.R........    0 tests    
      test_bind_or_combine.R........    1 tests [0;32mOK[0m 
    ...
      ----- FAILED[attr]: test_eval_tibbles.R<297--297>
       call| simplify_the_simulation_results()
       call| -->expect_identical(expected_result, eg$simulation$results)
       diff| names for current but not for target
      Error: 1 out of 56 tests failed
      In addition: Warning message:
      The `.dots` argument of `group_by()` is deprecated as of dplyr 1.0.0.
      ℹ The deprecated feature was likely used in the dplyr package.
        Please report the issue at <https://github.com/tidyverse/dplyr/issues>. 
      Execution halted
    ```

# tidyposterior

<details>

* Version: 1.0.1
* GitHub: https://github.com/tidymodels/tidyposterior
* Source code: https://github.com/cran/tidyposterior
* Date/Publication: 2023-10-11 18:50:02 UTC
* Number of recursive dependencies: 174

Run `revdepcheck::cloud_details(, "tidyposterior")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidyposterior)
      > 
      > test_check("tidyposterior")
      
      Attaching package: 'rsample'
      
    ...
       1. ├─testthat::expect_equal(...) at test_perf_mod.R:238:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::colnames(coef(rsq_mod$stan)$id)
       5. │ └─base::is.data.frame(x)
       6. └─stats::coef(rsq_mod$stan)
      
      [ FAIL 2 | WARN 31 | SKIP 5 | PASS 97 ]
      Error: Test failures
      Execution halted
    ```

# tidyr

<details>

* Version: 1.3.0
* GitHub: https://github.com/tidyverse/tidyr
* Source code: https://github.com/cran/tidyr
* Date/Publication: 2023-01-24 16:00:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "tidyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidyr)
      
      Attaching package: 'tidyr'
      
      The following object is masked from 'package:testthat':
      
    ...
      ── Failure ('test-unnest-longer.R:342:3'): names are preserved when simplification isn't done and a ptype is supplied ──
      Names of out$x ('') don't match 'a', 'b'
      ── Failure ('test-unnest-longer.R:350:3'): names are preserved when simplification isn't done and a ptype is supplied ──
      Names of out$x ('') don't match 'a', 'b'
      ── Failure ('test-unnest-longer.R:376:3'): can't currently retain names when simplification isn't done and a ptype is supplied if there is a mix of named/unnamed elements (#1212) ──
      Names of out$x ('') don't match 'a', ''
      
      [ FAIL 5 | WARN 0 | SKIP 149 | PASS 1095 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# workflowsets

<details>

* Version: 1.0.1
* GitHub: https://github.com/tidymodels/workflowsets
* Source code: https://github.com/cran/workflowsets
* Date/Publication: 2023-04-06 22:40:02 UTC
* Number of recursive dependencies: 140

Run `revdepcheck::cloud_details(, "workflowsets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘workflowsets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.workflow_set
    > ### Title: Plot the results of a workflow set
    > ### Aliases: autoplot.workflow_set
    > 
    > ### ** Examples
    > 
    > autoplot(two_class_res)
    ...
     12. │   └─tibble:::`[.tbl_df`(y_in, vars$y$key)
     13. │     └─tibble:::vectbl_as_col_location(...)
     14. │       ├─tibble:::subclass_col_index_errors(...)
     15. │       │ └─base::withCallingHandlers(...)
     16. │       └─vctrs::vec_as_location(j, n, names, missing = "error", call = call)
     17. └─vctrs (local) `<fn>`()
     18.   └─vctrs:::stop_subscript_oob(...)
     19.     └─vctrs:::stop_subscript(...)
     20.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(workflowsets)
      > 
      > test_check("workflowsets")
      
      Attaching package: 'dplyr'
    ...
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(nrow(ranking_1), sum(param_lines * 2)) at test-collect-metrics.R:49:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::nrow(ranking_1)
      
      [ FAIL 4 | WARN 0 | SKIP 14 | PASS 368 ]
      Error: Test failures
      Execution halted
    ```

