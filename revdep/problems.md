# abjutils

<details>

* Version: 0.3.2
* GitHub: https://github.com/abjur/abjutils
* Source code: https://github.com/cran/abjutils
* Date/Publication: 2022-02-01 07:50:16 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "abjutils")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘abjutils-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sample_cnj
    > ### Title: Generate sample Brazilian lawsuit identification numbers
    > ### Aliases: sample_cnj
    > 
    > ### ** Examples
    > 
    > {
    ...
     1. ├─abjutils::sample_cnj(...)
     2. │ └─... %>% dplyr::select(n_processo)
     3. ├─dplyr::select(., n_processo)
     4. ├─dplyr::mutate(...)
     5. ├─stats::setNames(., "serial")
     6. └─dplyr::data_frame(.)
     7.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     8.     └─lifecycle:::deprecate_stop0(msg)
     9.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─base::nrow(...)
        5. ├─abjutils::sample_cnj(...)
        6. │ └─... %>% dplyr::select(n_processo)
        7. ├─dplyr::select(., n_processo)
        8. ├─dplyr::mutate(...)
        9. ├─stats::setNames(., "serial")
       10. └─dplyr::data_frame(.)
       11.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       12.     └─lifecycle:::deprecate_stop0(msg)
       13.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 14 ]
      Error: Test failures
      Execution halted
    ```

# ActFrag

<details>

* Version: 0.1.1
* GitHub: https://github.com/junruidi/ActFrag
* Source code: https://github.com/cran/ActFrag
* Date/Publication: 2020-02-11 19:00:10 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "ActFrag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ActFrag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fragmentation
    > ### Title: Fragmentation Metrics
    > ### Aliases: fragmentation
    > 
    > ### ** Examples
    > 
    > data(example_activity_data)
    ...
    Backtrace:
        ▆
     1. ├─ActFrag::fragmentation(...)
     2. │ ├─as_data_frame(rle2(yw)) %>% filter(!is.na(value))
     3. │ └─tibble::as_data_frame(rle2(yw))
     4. │   └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     5. │     └─lifecycle:::deprecate_stop0(msg)
     6. │       └─rlang::cnd_signal(...)
     7. └─dplyr::filter(., !is.na(value))
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# actogrammr

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/actogrammr
* Date/Publication: 2017-10-25 17:24:10 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "actogrammr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘actogrammr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bin_data
    > ### Title: bin_data
    > ### Aliases: bin_data
    > 
    > ### ** Examples
    > 
    > f <- file.path(system.file(package = 'actogrammr'), 'testdata')
    ...
      2. │ └─actogrammr:::read_clock_lab_file(file_name = file_name)
      3. │   └─... %>% return()
      4. ├─dplyr::mutate(., min = as.integer(min), light = long_light$light)
      5. ├─dplyr::select(., -trash)
      6. ├─tidyr::separate(., col = min, into = c("trash", "min"))
      7. └─dplyr::as_data_frame(.)
      8.   └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
      9.     └─lifecycle:::deprecate_stop0(msg)
     10.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─actogrammr::read_clock_lab_files(...) at test_read_clock_lab.R:7:12
        2. │ └─actogrammr:::read_clock_lab_file(file_name = file_name)
        3. │   └─... %>% return()
        4. ├─dplyr::mutate(., min = as.integer(min), light = long_light$light)
        5. ├─dplyr::select(., -trash)
        6. ├─tidyr::separate(., col = min, into = c("trash", "min"))
        7. └─dplyr::as_data_frame(.)
        8.   └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
        9.     └─lifecycle:::deprecate_stop0(msg)
       10.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# airt

<details>

* Version: 0.2.1
* GitHub: NA
* Source code: https://github.com/cran/airt
* Date/Publication: 2021-12-17 05:10:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "airt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘airt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: latent_trait_analysis
    > ### Title: Performs the latent trait analysis
    > ### Aliases: latent_trait_analysis
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    ...
      3. │   ├─... %>% select(-.data$count)
      4. │   ├─tibble::as_tibble(algo)
      5. │   └─tibble:::as_tibble.matrix(algo)
      6. │     └─lifecycle::deprecate_stop(...)
      7. │       └─lifecycle:::deprecate_stop0(msg)
      8. │         └─rlang::cnd_signal(...)
      9. ├─dplyr::select(., -.data$count)
     10. ├─tidyr::uncount(., .data$count)
     11. └─dplyr::mutate(., count = res$counts)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘airt.Rmd’ using rmarkdown
    Quitting from lines 77-84 (airt.Rmd) 
    Error: processing vignette 'airt.Rmd' failed with diagnostics:
    The `x` argument of `as_tibble.matrix()` must have unique column names
    if `.name_repair` is omitted as of tibble 2.0.0.
    ℹ Using compatibility `.name_repair`.
    --- failed re-building ‘airt.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘airt.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# akc

<details>

* Version: 0.9.9
* GitHub: https://github.com/hope-data-science/akc
* Source code: https://github.com/cran/akc
* Date/Publication: 2023-01-06 08:00:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "akc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘akc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: doc_group
    > ### Title: Construct network of documents based on keyword co-occurrence
    > ### Aliases: doc_group
    > 
    > ### ** Examples
    > 
    >  library(akc)
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,2]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Benchmarking.Rmd’ using rmarkdown
    --- finished re-building ‘Benchmarking.Rmd’
    
    --- re-building ‘akc_vignette.Rmd’ using rmarkdown
    Quitting from lines 75-79 (akc_vignette.Rmd) 
    Error: processing vignette 'akc_vignette.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    ...
      Some words could not fit on page. They have been placed at their original positions.
    Warning in wordcloud_boxes(data_points = points_valid_first, boxes = boxes,  :
      Some words could not fit on page. They have been placed at their original positions.
    --- finished re-building ‘tutorial_raw_text.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘akc_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

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

# APCI

<details>

* Version: 1.0.6
* GitHub: NA
* Source code: https://github.com/cran/APCI
* Date/Publication: 2022-11-11 08:00:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "APCI")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘1_tests.R’
    Running the tests in ‘tests/1_tests.R’ failed.
    Last 13 lines of output:
          acc2:pcc2     acc3:pcc2     acc4:pcc2     acc5:pcc2     acc6:pcc2 
       -0.273495688  -0.055749210  -0.154490151   0.070847287   0.486574701 
          acc7:pcc2     acc8:pcc2     acc9:pcc2     acc1:pcc3     acc2:pcc3 
        0.138423878  -0.302113758   0.190671496   0.052861923   0.029579311 
          acc3:pcc3     acc4:pcc3     acc5:pcc3     acc6:pcc3     acc7:pcc3 
       -0.374732222   0.024024387   0.177424485  -0.330329945   0.124688314 
          acc8:pcc3     acc9:pcc3     acc1:pcc4     acc2:pcc4     acc3:pcc4 
       -0.021253271   0.159310169  -0.469040113   0.064416461   0.267980726 
          acc4:pcc4     acc5:pcc4     acc6:pcc4     acc7:pcc4     acc8:pcc4 
        0.280092273   0.158932529  -0.175915083  -0.123578489  -0.239166137 
          acc9:pcc4     acc1:pcc5     acc2:pcc5     acc3:pcc5     acc4:pcc5 
        0.158260069   0.042340491   0.347430729  -0.082276459  -0.179784257 
          acc5:pcc5     acc6:pcc5     acc7:pcc5     acc8:pcc5     acc9:pcc5 
       -0.529986452  -0.368421533   0.343424818   0.693608838  -0.295714516 
      Killed
    ```

# applicable

<details>

* Version: 0.1.0
* GitHub: https://github.com/tidymodels/applicable
* Source code: https://github.com/cran/applicable
* Date/Publication: 2022-08-20 21:50:11 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "applicable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘applicable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.apd_similarity
    > ### Title: Plot the cumulative distribution function for similarity metrics
    > ### Aliases: autoplot.apd_similarity
    > 
    > ### ** Examples
    > 
    > set.seed(535)
    ...
      5.     ├─hardhat::run_mold(blueprint, x = x, y = y)
      6.     └─hardhat:::run_mold.default_xy_blueprint(blueprint, x = x, y = y)
      7.       └─hardhat:::mold_xy_default_clean(...)
      8.         └─hardhat:::mold_xy_default_clean_predictors(blueprint, x)
      9.           ├─tibble::as_tibble(x)
     10.           └─tibble:::as_tibble.matrix(x)
     11.             └─lifecycle::deprecate_stop(...)
     12.               └─lifecycle:::deprecate_stop0(msg)
     13.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

# arulesViz

<details>

* Version: 1.5-1
* GitHub: https://github.com/mhahsler/arulesViz
* Source code: https://github.com/cran/arulesViz
* Date/Publication: 2021-11-19 17:40:07 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "arulesViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘arulesViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: associations2igraph
    > ### Title: Convert rules or itemsets into a graph
    > ### Aliases: saveAsGraph associations2igraph igraph tidygraph
    > ### Keywords: file
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,9]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘arulesViz.Rnw’ using Sweave
    Loading required package: arules
    Loading required package: Matrix
    
    Attaching package: ‘arules’
    
    The following objects are masked from ‘package:base’:
    
        abbreviate, write
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘arulesViz.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘arulesViz.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# aspline

<details>

* Version: 0.2.0
* GitHub: https://github.com/goepp/aspline
* Source code: https://github.com/cran/aspline
* Date/Publication: 2022-06-09 08:00:02 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "aspline")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘helmet_data_example.Rmd’ using rmarkdown
    Quitting from lines 36-56 (helmet_data_example.Rmd) 
    Error: processing vignette 'helmet_data_example.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘helmet_data_example.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘helmet_data_example.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# bayesammi

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/bayesammi
* Date/Publication: 2018-04-12 09:03:23 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "bayesammi")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bayesammi-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bayes_ammi
    > ### Title: Bayesian Estimation of the Additive Main Effects and
    > ###   Multiplicative Interaction Model
    > ### Aliases: bayes_ammi bayes_ammi.default
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─bayesammi::bayes_ammi(...)
     2. └─bayesammi:::bayes_ammi.default(...)
     3.   ├─tibble::as_tibble(mu1)
     4.   └─tibble:::as_tibble.matrix(mu1)
     5.     └─lifecycle::deprecate_stop(...)
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# baystability

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/baystability
* Date/Publication: 2018-03-13 15:55:34 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "baystability")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘baystability-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bayes_ammi
    > ### Title: Bayesian Estimation of Genotype by Environment Interaction Model
    > ### Aliases: bayes_ammi bayes_ammi.default
    > 
    > ### ** Examples
    > 
    > 
    ...
      if `.name_repair` is omitted as of tibble 2.0.0.
    ℹ Using compatibility `.name_repair`.
    Backtrace:
        ▆
     1. ├─tibble::as_tibble(fm2$alphas)
     2. └─tibble:::as_tibble.matrix(fm2$alphas)
     3.   └─lifecycle::deprecate_stop(...)
     4.     └─lifecycle:::deprecate_stop0(msg)
     5.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggfortify’ ‘ggplot2’ ‘matrixStats’ ‘reshape2’ ‘scales’
      All declared Imports should be used.
    ```

# bib2df

<details>

* Version: 1.1.1
* GitHub: https://github.com/ropensci/bib2df
* Source code: https://github.com/cran/bib2df
* Date/Publication: 2019-05-22 22:15:15 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "bib2df")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bib2df-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bib2df
    > ### Title: Parse a BibTeX file to a 'tibble'
    > ### Aliases: bib2df
    > 
    > ### ** Examples
    > 
    > # Read from .bib file:
    ...
      tibble, or `as.data.frame()` to convert to a data frame.
    Backtrace:
        ▆
     1. └─bib2df::bib2df(path)
     2.   └─bib2df:::bib2df_gather(bib)
     3.     └─tibble::as_data_frame(dat)
     4.       └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     5.         └─lifecycle:::deprecate_stop0(msg)
     6.           └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
      ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
        tibble, or `as.data.frame()` to convert to a data frame.
      Backtrace:
          ▆
       1. └─bib2df::bib2df(...) at tests.R:3:0
       2.   └─bib2df:::bib2df_gather(bib)
       3.     └─tibble::as_data_frame(dat)
       4.       └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       5.         └─lifecycle:::deprecate_stop0(msg)
       6.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘bib2df.Rmd’ using rmarkdown
    Quitting from lines 42-48 (bib2df.Rmd) 
    Error: processing vignette 'bib2df.Rmd' failed with diagnostics:
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘bib2df.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘bib2df.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# BinMat

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/BinMat
* Date/Publication: 2022-03-06 07:50:14 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "BinMat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BinMat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: BinMatInput_ordination
    > ### Title: Example input data containing a consolidated binary matrix with
    > ###   groups
    > ### Aliases: BinMatInput_ordination
    > ### Keywords: datasets
    > 
    > ### ** Examples
    ...
     1. └─BinMat::nmds(mat, colours = clrs, labs = TRUE)
     2.   ├─base::suppressWarnings(as.data.frame(tibble::as_tibble(isoplot$points)))
     3.   │ └─base::withCallingHandlers(...)
     4.   ├─base::as.data.frame(tibble::as_tibble(isoplot$points))
     5.   ├─tibble::as_tibble(isoplot$points)
     6.   └─tibble:::as_tibble.matrix(isoplot$points)
     7.     └─lifecycle::deprecate_stop(...)
     8.       └─lifecycle:::deprecate_stop0(msg)
     9.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BinMat.Rmd’ using rmarkdown
    Quitting from lines 175-220 (BinMat.Rmd) 
    Error: processing vignette 'BinMat.Rmd' failed with diagnostics:
    The `x` argument of `as_tibble.matrix()` must have unique column names
    if `.name_repair` is omitted as of tibble 2.0.0.
    ℹ Using compatibility `.name_repair`.
    --- failed re-building ‘BinMat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘BinMat.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# bridger

<details>

* Version: 0.1.0
* GitHub: https://github.com/CommoditiesAI/bridger
* Source code: https://github.com/cran/bridger
* Date/Publication: 2021-08-24 20:10:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "bridger")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bridger-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: suitSplit
    > ### Title: suitSplit
    > ### Aliases: suitSplit
    > 
    > ### ** Examples
    > 
    > suitSplit(missingCards = 6, cards_W = 13, cards_E = 8)
    ...
     1. ├─bridger::suitSplit(missingCards = 6, cards_W = 13, cards_E = 8)
     2. │ └─outTable[, 1] %>% unname() %>% unlist()
     3. ├─base::unlist(.)
     4. └─base::unname(.)
     5.   ├─base::`names<-`(`*tmp*`, value = NULL)
     6.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
     7.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     8.       └─lifecycle:::deprecate_stop0(msg)
     9.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘kableExtra’
      All declared Imports should be used.
    ```

# broom

<details>

* Version: 1.0.3
* GitHub: https://github.com/tidymodels/broom
* Source code: https://github.com/cran/broom
* Date/Publication: 2023-01-25 08:00:16 UTC
* Number of recursive dependencies: 307

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

# broom.mixed

<details>

* Version: 0.2.9.4
* GitHub: https://github.com/bbolker/broom.mixed
* Source code: https://github.com/cran/broom.mixed
* Date/Publication: 2022-04-17 17:42:29 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "broom.mixed")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-glmmTMB.R:98:6
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::unname(glance(m1)[, c("nobs", "df.residual")])
       5.   ├─base::`names<-`(`*tmp*`, value = NULL)
       6.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
       7.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       8.       └─lifecycle:::deprecate_stop0(msg)
       9.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 6 | SKIP 1 | PASS 250 ]
      Error: Test failures
      Execution halted
    ```

# bsam

<details>

* Version: 1.1.3
* GitHub: https://github.com/ianjonsen/bsam
* Source code: https://github.com/cran/bsam
* Date/Publication: 2020-09-01 13:40:03 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "bsam")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bsam-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fit_ssm
    > ### Title: Fit Bayesian state-space models to animal movement data
    > ### Aliases: fit_ssm
    > 
    > ### ** Examples
    > 
    > 
    ...
        ▆
     1. └─bsam::fit_ssm(...)
     2.   └─bsam::ssm(...)
     3.     └─base::lapply(d, ssm1)
     4.       └─bsam (local) FUN(X[[i]], ...)
     5.         └─tibble::data_frame(...)
     6.           └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     7.             └─lifecycle:::deprecate_stop0(msg)
     8.               └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rworldxtra’ ‘sp’
      All declared Imports should be used.
    ```

# caffsim

<details>

* Version: 0.2.2
* GitHub: https://github.com/asancpt/caffsim
* Source code: https://github.com/cran/caffsim
* Date/Publication: 2017-08-28 03:36:21 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "caffsim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘caffsim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: caffConcTime
    > ### Title: Create a dataset of the concentration-time curve of single oral
    > ###   administration of caffeine
    > ### Aliases: caffConcTime
    > 
    > ### ** Examples
    > 
    ...
     10. ├─dplyr::select(...)
     11. ├─dplyr::mutate(., subjid = row_number())
     12. ├─dplyr::mutate(...)
     13. ├─dplyr::select(., eta1 = 1, eta2 = 2, eta3 = 3)
     14. ├─tibble::as_tibble(.)
     15. └─tibble:::as_tibble.matrix(.)
     16.   └─lifecycle::deprecate_stop(...)
     17.     └─lifecycle:::deprecate_stop0(msg)
     18.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘markdown’
      All declared Imports should be used.
    ```

# carpenter

<details>

* Version: 0.2.2
* GitHub: https://github.com/lwjohnst86/carpenter
* Source code: https://github.com/cran/carpenter
* Date/Publication: 2019-02-05 08:43:30 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "carpenter")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       20.           └─dplyr:::tbl_vars_dispatch(x)
      ── Error ('test-build_tables.R:36'): build_table outputs in order as determined in data ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      Backtrace:
          ▆
       1. └─dplyr::data_frame(...) at test-build_tables.R:36:4
       2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       3.     └─lifecycle:::deprecate_stop0(msg)
       4.       └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 5 | SKIP 0 | PASS 19 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘carpenter.Rmd’ using rmarkdown
    Quitting from lines 121-137 (carpenter.Rmd) 
    Error: processing vignette 'carpenter.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘carpenter.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘carpenter.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# ccrs

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ccrs
* Date/Publication: 2019-03-04 17:10:02 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "ccrs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ccrs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ccrs
    > ### Title: Correcting and Clustering response style biased data
    > ### Aliases: ccrs
    > 
    > ### ** Examples
    > 
    > ###data setting
    ...
        ▆
     1. └─ccrs::ccrs(ccrsdata.list, K = K, lam = lam)
     2.   └─base::lapply(X = tot.list, FUN = oneinit.func)
     3.     └─ccrs (local) FUN(X[[i]], ...)
     4.       └─ccrs:::update.U(G = G.para[[ite.g]], Y.hat = Y.hat)
     5.         └─dplyr::as_data_frame(Y.hat)
     6.           └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     7.             └─lifecycle:::deprecate_stop0(msg)
     8.               └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# cellranger

<details>

* Version: 1.1.0
* GitHub: https://github.com/rsheets/cellranger
* Source code: https://github.com/cran/cellranger
* Date/Publication: 2016-07-27 03:17:48
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "cellranger")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cellranger-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.cell_addr
    > ### Title: Convert to a cell_addr object
    > ### Aliases: as.cell_addr as.cell_addr.character as.cell_addr.ra_ref
    > ###   as.cell_addr_v as.cell_addr_v.character as.cell_addr_v.list
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─cellranger:::print.cell_addr(x)
     3.   ├─base::print(...)
     4.   └─tibble::trunc_mat(tibble::as_data_frame(unclass(x)), n = n)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# censusr

<details>

* Version: 0.0.4
* GitHub: https://github.com/transportfoundry/censusr
* Source code: https://github.com/cran/censusr
* Date/Publication: 2018-01-25 16:40:14 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "censusr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘censusr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: aggregate_moe
    > ### Title: Aggregated margin of error across multiple geographies
    > ### Aliases: aggregate_moe
    > 
    > ### ** Examples
    > 
    > x <- c(3, 5, 12, 4)
    ...
    Backtrace:
        ▆
     1. ├─... %>% summarise(moe = aggregate_moe(x))
     2. ├─dplyr::summarise(., moe = aggregate_moe(x))
     3. ├─dplyr::group_by(., group)
     4. └─tibble::data_frame(x = x, group = c(1, 1, 2, 2))
     5.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     6.     └─lifecycle:::deprecate_stop0(msg)
     7.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# chemodiv

<details>

* Version: 0.2.0
* GitHub: https://github.com/hpetren/chemodiv
* Source code: https://github.com/cran/chemodiv
* Date/Publication: 2023-01-12 09:30:06 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "chemodiv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘chemodiv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: molNet
    > ### Title: Generate a molecular network with some properties
    > ### Aliases: molNet
    > 
    > ### ** Examples
    > 
    > data(minimalCompDis)
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,1]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# clustrd

<details>

* Version: 1.4.0
* GitHub: NA
* Source code: https://github.com/cran/clustrd
* Date/Publication: 2022-07-16 23:20:06 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "clustrd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustrd-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clusmca
    > ### Title: Joint dimension reduction and clustering of categorical data.
    > ### Aliases: clusmca print.clusmca summary.clusmca fitted.clusmca
    > 
    > ### ** Examples
    > 
    > data(cmc)
    ...
    Backtrace:
        ▆
     1. └─clustrd::clusmca(cmc, 3, 2, method = "MCAk", nstart = 10, seed = 1234)
     2.   └─clustrd:::MCAk(...)
     3.     ├─tibble::as_tibble(cbind(Fm, group = as.factor(randVec)))
     4.     └─tibble:::as_tibble.matrix(cbind(Fm, group = as.factor(randVec)))
     5.       └─lifecycle::deprecate_stop(...)
     6.         └─lifecycle:::deprecate_stop0(msg)
     7.           └─rlang::cnd_signal(...)
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

# cpr

<details>

* Version: 0.2.3
* GitHub: https://github.com/dewittpe/cpr
* Source code: https://github.com/cran/cpr
* Date/Publication: 2017-03-07 13:41:34
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "cpr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cpr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bsplineD
    > ### Title: B-spline Derivatives
    > ### Aliases: bsplineD
    > 
    > ### ** Examples
    > 
    > 
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─dplyr::data_frame(...)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_true(recover_spline(start_with = 40L, progress = FALSE)$recovered) at test-recover-know-spline.R:57:12
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─cpr (local) recover_spline(start_with = 40L, progress = FALSE)
        5.   ├─cpr::cp(true_bmat, true_theta, ...) at test-recover-know-spline.R:17:2
        6.   └─cpr:::cp.cpr_bs(true_bmat, true_theta, ...)
        7.     └─dplyr::data_frame(xi_star = as.numeric(attr(x, "xi_star")), theta = as.vector(theta))
        8.       └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
        9.         └─lifecycle:::deprecate_stop0(msg)
       10.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 18 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cpr-pkg.Rmd’ using rmarkdown
    Quitting from lines 79-84 (cpr-pkg.Rmd) 
    Error: processing vignette 'cpr-pkg.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘cpr-pkg.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘cpr-pkg.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   5.9Mb
    ```

# crsra

<details>

* Version: 0.2.3
* GitHub: https://github.com/jhudsl/crsra
* Source code: https://github.com/cran/crsra
* Date/Publication: 2018-05-05 06:25:58 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "crsra")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crsra-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: crsra_assessmentskips
    > ### Title: Frequencies of skipping an peer-assessed submission
    > ### Aliases: crsra_assessmentskips
    > 
    > ### ** Examples
    > 
    > crsra_assessmentskips(example_course_import)
    ...
      9.           ├─knitr::kable(words[1:n, ])
     10.           ├─words[1:n, ]
     11.           └─tibble:::`[.tbl_df`(words, 1:n, )
     12.             └─tibble:::vectbl_as_row_index(i, x, i_arg)
     13.               └─tibble:::fix_oob(i, nr)
     14.                 └─tibble:::fix_oob_positive(i, n, warn)
     15.                   └─lifecycle::deprecate_stop(...)
     16.                     └─lifecycle:::deprecate_stop0(msg)
     17.                       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 500 marked UTF-8 strings
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
    Quitting from lines 277-281 (Introduction-to-DaQAPO.Rmd) 
    Error: processing vignette 'Introduction-to-DaQAPO.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘Introduction-to-DaQAPO.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction-to-DaQAPO.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dataquieR

<details>

* Version: 1.0.13
* GitHub: NA
* Source code: https://github.com/cran/dataquieR
* Date/Publication: 2022-11-16 14:40:22 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "dataquieR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • int_datatype_matrix/intdtv30000.svg
      • int_datatype_matrix/intdtv40000.svg
      • int_datatype_matrix/intdtv50000.svg
      • int_datatype_matrix/integrity-datatype.svg
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

# dbGaPCheckup

<details>

* Version: 1.0.2
* GitHub: https://github.com/lwheinsberg/dbGaPCheckup
* Source code: https://github.com/cran/dbGaPCheckup
* Date/Publication: 2023-02-22 18:10:03 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "dbGaPCheckup")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dbGaPCheckup-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: check_report
    > ### Title: Check Report
    > ### Aliases: check_report
    > 
    > ### ** Examples
    > 
    > # Example 1: Incorrectly showing as pass check on first attempt
    ...
      4.     │ └─rlang::list2(...)
      5.     └─dbGaPCheckup::values_check(DD_dict, verbose = FALSE)
      6.       ├─...[]
      7.       └─tibble:::`[.tbl_df`(...)
      8.         └─tibble:::vectbl_as_row_index(i, x, i_arg)
      9.           └─tibble:::vectbl_as_row_location(i, nr, i_arg, assign, call)
     10.             └─lifecycle::deprecate_stop(...)
     11.               └─lifecycle:::deprecate_stop0(msg)
     12.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dbGaPCheckup.Rmd’ using rmarkdown
    Quitting from lines 119-120 (dbGaPCheckup.Rmd) 
    Error: processing vignette 'dbGaPCheckup.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘dbGaPCheckup.Rmd’
    
    --- re-building ‘dbGaPCheckup_vignette.Rmd’ using rmarkdown
    ...
    Error: processing vignette 'dbGaPCheckup_vignette.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘dbGaPCheckup_vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘dbGaPCheckup.Rmd’ ‘dbGaPCheckup_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# diffdf

<details>

* Version: 1.0.4
* GitHub: https://github.com/gowerc/diffdf
* Source code: https://github.com/cran/diffdf
* Date/Publication: 2020-03-17 23:10:03 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "diffdf")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2.   └─testthat::test_dir(...)
        3.     └─testthat:::test_files(...)
        4.       └─testthat:::test_files_serial(...)
        5.         └─testthat:::test_files_setup_state(...)
        6.           └─testthat::source_test_helpers(".", env)
        7.             └─testthat::source_dir(path, "^helper.*\\.[rR]$", env = env, wrap = FALSE)
        8.               └─base::lapply(files, source_file, env = env, chdir = chdir, wrap = wrap)
        9.                 └─testthat (local) FUN(X[[i]], ...)
       10.                   └─base::eval(exprs, env)
       11.                     └─base::eval(exprs, env)
       12.                       └─dplyr::data_frame(...) at tests/testthat/helper-create_test_data.R:12:0
       13.                         └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       14.                           └─lifecycle:::deprecate_stop0(msg)
       15.                             └─rlang::cnd_signal(...)
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dkanr

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/dkanr
* Date/Publication: 2019-02-18 15:50:02 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "dkanr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
      ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
        tibble, or `as.data.frame()` to convert to a data frame.
      Backtrace:
          ▆
       1. └─dkanr::list_nodes_all() at test-list_nodes_all.R:27:4
       2.   └─dkanr:::jsldf(out)
       3.     └─tibble::as_data_frame(jsonlite::fromJSON(x, simplifyDataFrame = TRUE))
       4.       └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       5.         └─lifecycle:::deprecate_stop0(msg)
       6.           └─rlang::cnd_signal(...)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 84 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘getting_started_with_dkanr.Rmd’ using rmarkdown
    Quitting from lines 64-71 (getting_started_with_dkanr.Rmd) 
    Error: processing vignette 'getting_started_with_dkanr.Rmd' failed with diagnostics:
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘getting_started_with_dkanr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting_started_with_dkanr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dmutate

<details>

* Version: 0.1.3
* GitHub: https://github.com/kylebaron/dmutate
* Source code: https://github.com/cran/dmutate
* Date/Publication: 2021-04-22 22:20:03 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "dmutate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dmutate-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_idata
    > ### Title: Create individual data frame from a covset object
    > ### Aliases: as_idata
    > 
    > ### ** Examples
    > 
    > cov1 <- covset(Y ~ rbinomial(0.2), Z ~ rnorm(2,2))
    > 
    > as_idata(cov1, 10)
    Error in (function (cond)  : 
      error in evaluating the argument 'data' in selecting a method for function 'mutate_random': `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Calls: as_idata ... cnd_signal -> signal_abort -> signalCondition -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       9. base (local) `<fn>`(`<lfcycl__>`)
      
      ── 2. Error ('test-dmutate.R:12'): (code run outside of `test_that()`) ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      Backtrace:
       1. tibble::data_frame(ID = 1:10)
            at test-dmutate.R:12:0
       2. lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       3. lifecycle:::deprecate_stop0(msg)
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

# DMwR2

<details>

* Version: 0.0.2
* GitHub: https://github.com/ltorgo/DMwR2
* Source code: https://github.com/cran/DMwR2
* Date/Publication: 2016-10-13 00:23:37
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "DMwR2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DMwR2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: centralImputation
    > ### Title: Fill in NA values with central statistics
    > ### Aliases: centralImputation
    > ### Keywords: models
    > 
    > ### ** Examples
    > 
    ...
     1. └─DMwR2::centralImputation(algae)
     2.   ├─base::`[<-`(`*tmp*`, idx, i, value = `<dbl>`)
     3.   └─tibble:::`[<-.tbl_df`(`*tmp*`, idx, i, value = `<dbl>`)
     4.     └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
     5.       └─tibble:::vectbl_as_new_row_index(i, x, i_arg, call = call)
     6.         └─tibble:::vectbl_as_row_location(...)
     7.           └─lifecycle::deprecate_stop(...)
     8.             └─lifecycle:::deprecate_stop0(msg)
     9.               └─rlang::cnd_signal(...)
    Execution halted
    ```

# echarts4r

<details>

* Version: 0.4.4
* GitHub: https://github.com/JohnCoene/echarts4r
* Source code: https://github.com/cran/echarts4r
* Date/Publication: 2022-05-28 09:40:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "echarts4r")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. └─echarts4r:::.build_data2(y, "mpg")
       10.   └─base::unname(data)
       11.     ├─base::`names<-`(`*tmp*`, value = NULL)
       12.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
       13.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       14.         └─lifecycle:::deprecate_stop0(msg)
       15.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 14 | SKIP 0 | PASS 178 ]
      Error: Test failures
      Execution halted
    ```

# echarty

<details>

* Version: 1.5.0
* GitHub: https://github.com/helgasoft/echarty
* Source code: https://github.com/cran/echarty
* Date/Publication: 2022-11-24 09:50:05 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "echarty")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘echarty-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ecr.ebars
    > ### Title: Error bars
    > ### Aliases: ecr.ebars
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
      3.     └─echarty (local) FUN(X[[i]], ...)
      4.       ├─base::unlist(unique(unname(gp[, grnm])))
      5.       ├─base::unique(unname(gp[, grnm]))
      6.       └─base::unname(gp[, grnm])
      7.         ├─base::`names<-`(`*tmp*`, value = NULL)
      8.         └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
      9.           └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     10.             └─lifecycle:::deprecate_stop0(msg)
     11.               └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. └─echarty::ecr.ebars(...) at test-renderers.R:8:2
        2.   └─base::lapply(...)
        3.     └─echarty (local) FUN(X[[i]], ...)
        4.       ├─base::unlist(unique(unname(gp[, grnm])))
        5.       ├─base::unique(unname(gp[, grnm]))
        6.       └─base::unname(gp[, grnm])
        7.         ├─base::`names<-`(`*tmp*`, value = NULL)
        8.         └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
        9.           └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       10.             └─lifecycle:::deprecate_stop0(msg)
       11.               └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 106 ]
      Error: Test failures
      Execution halted
    ```

# echoice2

<details>

* Version: 0.2.1
* GitHub: https://github.com/ninohardt/echoice2
* Source code: https://github.com/cran/echoice2
* Date/Publication: 2023-02-04 07:02:30 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "echoice2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘echoice2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ec_boxplot_screen
    > ### Title: Generate Screening probability boxplot
    > ### Aliases: ec_boxplot_screen
    > 
    > ### ** Examples
    > 
    > data(icecream)
    ...
      5. ├─dplyr::left_join(...)
      6. ├─tidyr::pivot_longer(., cols = -any_of("draw"), names_to = "attribute_level")
      7. ├─tibble::rowid_to_column(., var = "draw")
      8. ├─rlang::set_names(., colnames(attributes(draws)$Af))
      9. ├─tibble::as_tibble(.)
     10. └─tibble:::as_tibble.matrix(.)
     11.   └─lifecycle::deprecate_stop(...)
     12.     └─lifecycle:::deprecate_stop0(msg)
     13.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.9Mb
      sub-directories of 1Mb or more:
        libs  16.4Mb
    ```

# eesim

<details>

* Version: 0.1.0
* GitHub: https://github.com/sakoehler7/eesim
* Source code: https://github.com/cran/eesim
* Date/Publication: 2017-06-03 17:55:52 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "eesim")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘eesim.Rmd’ using rmarkdown
    Quitting from lines 163-174 (eesim.Rmd) 
    Error: processing vignette 'eesim.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘eesim.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘eesim.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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
# epiflows

<details>

* Version: 0.2.0
* GitHub: https://github.com/reconhub/epiflows
* Source code: https://github.com/cran/epiflows
* Date/Publication: 2018-08-14 12:40:03 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "epiflows")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epiflows-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: YF_Brazil
    > ### Title: Yellow Fever Data from Brazil; 2016-12 to 2017-05
    > ### Aliases: YF_Brazil Brazil_epiflows YF_flows YF_locations YF_coordinates
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─epiflows:::print.epiflows(x)
     3.   ├─base::print(tibble::as_data_frame(x$linelist))
     4.   └─tibble::as_data_frame(x$linelist)
     5.     └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. │   │     ├─withr::with_output_sink(path, withVisible(code))
        7. │   │     │ └─base::force(code)
        8. │   │     └─base::withVisible(code)
        9. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       10. ├─base::print(epicontacts::thin(Brazil_epiflows[j = "Minas Gerais"]))
       11. └─epiflows:::print.epiflows(epicontacts::thin(Brazil_epiflows[j = "Minas Gerais"]))
       12.   ├─base::print(tibble::as_data_frame(x$linelist))
       13.   └─tibble::as_data_frame(x$linelist)
       14.     └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       15.       └─lifecycle:::deprecate_stop0(msg)
       16.         └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 5 | PASS 79 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘epiflows-class.Rmd’ using rmarkdown
    Quitting from lines 75-84 (epiflows-class.Rmd) 
    Error: processing vignette 'epiflows-class.Rmd' failed with diagnostics:
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘epiflows-class.Rmd’
    
    ...
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘epiflows-class.Rmd’ ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘htmlwidgets’
      All declared Imports should be used.
    ```

# ezec

<details>

* Version: 1.0.1
* GitHub: https://github.com/grunwaldlab/ezec
* Source code: https://github.com/cran/ezec
* Date/Publication: 2016-12-05 08:27:32
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "ezec")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ezec-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EC_table
    > ### Title: Function to generate a table of EC values from a data frame of
    > ###   multiple isolates.
    > ### Aliases: EC_table
    > 
    > ### ** Examples
    > 
    ...
        ▆
     1. ├─ezec::EC_table(dummydata, form = response ~ dose)
     2. │ ├─dplyr::data_frame(sample = models[[idcol]]) %>% ...
     3. │ └─dplyr::data_frame(sample = models[[idcol]])
     4. │   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     5. │     └─lifecycle:::deprecate_stop0(msg)
     6. │       └─rlang::cnd_signal(...)
     7. └─dplyr::bind_cols(., EC)
     8.   └─rlang::list2(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. │   │     │ └─base::force(code)
        8. │   │     └─base::withVisible(code)
        9. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       10. ├─ezec::EC_table(...)
       11. │ ├─dplyr::data_frame(sample = models[[idcol]]) %>% ...
       12. │ └─dplyr::data_frame(sample = models[[idcol]])
       13. │   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       14. │     └─lifecycle:::deprecate_stop0(msg)
       15. │       └─rlang::cnd_signal(...)
       16. └─dplyr::bind_cols(., EC)
       17.   └─rlang::list2(...)
      
      [ FAIL 2 | WARN 5 | SKIP 1 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘getting_started.Rmd’ using rmarkdown
    Quitting from lines 77-81 (getting_started.Rmd) 
    Error: processing vignette 'getting_started.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘getting_started.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting_started.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# fastRG

<details>

* Version: 0.3.1
* GitHub: https://github.com/RoheLab/fastRG
* Source code: https://github.com/cran/fastRG
* Date/Publication: 2022-06-30 07:30:12 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "fastRG")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fastRG-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sample_edgelist
    > ### Title: Sample a random edgelist from a random dot product graph
    > ### Aliases: sample_edgelist sample_edgelist.undirected_factor_model
    > ###   sample_edgelist.directed_factor_model
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,1]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# ferrn

<details>

* Version: 0.0.2
* GitHub: https://github.com/huizezhang-sherry/ferrn
* Source code: https://github.com/cran/ferrn
* Date/Publication: 2022-08-06 13:50:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "ferrn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ferrn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_start
    > ### Title: A ggproto for drawing start points
    > ### Aliases: add_start
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    ...
     18. ├─dplyr::select(., .data$basis)
     19. ├─dplyr::mutate(., basis = purrr::map(.data$data, fix_matrix))
     20. ├─dplyr::ungroup(.)
     21. ├─dplyr::nest_by(., id = dplyr::row_number())
     22. ├─tibble::as_tibble(.)
     23. └─tibble:::as_tibble.matrix(.)
     24.   └─lifecycle::deprecate_stop(...)
     25.     └─lifecycle:::deprecate_stop0(msg)
     26.       └─rlang::cnd_signal(...)
    Execution halted
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

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fqar.Rmd’ using rmarkdown
    Quitting from lines 63-65 (fqar.Rmd) 
    Error: processing vignette 'fqar.Rmd' failed with diagnostics:
    Timeout was reached: [universalfqa.org] Connection timed out after 10001 milliseconds
    --- failed re-building ‘fqar.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fqar.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# fuzzyjoin

<details>

* Version: 0.1.6
* GitHub: https://github.com/dgrtwo/fuzzyjoin
* Source code: https://github.com/cran/fuzzyjoin
* Date/Publication: 2020-05-15 05:50:21 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "fuzzyjoin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fuzzyjoin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: difference_join
    > ### Title: Join two tables based on absolute difference between their
    > ###   columns
    > ### Aliases: difference_join difference_inner_join difference_left_join
    > ###   difference_right_join difference_full_join difference_semi_join
    > ###   difference_anti_join
    > 
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─tibble::data_frame(Sepal.Length = c(5, 6, 7), Type = 1:3)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
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

# ggedit

<details>

* Version: 0.3.1
* GitHub: https://github.com/yonicd/ggedit
* Source code: https://github.com/cran/ggedit
* Date/Publication: 2020-06-02 11:50:06 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "ggedit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggedit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compare
    > ### Title: compare
    > ### Aliases: compare
    > 
    > ### ** Examples
    > 
    > compare(ggplot2::theme_bw(),ggplot2::theme_get())
    ...
     27. │             ├─purrr:::with_indexed_errors(...)
     28. │             │ └─base::withCallingHandlers(...)
     29. │             ├─purrr:::call_with_cleanup(...)
     30. │             └─ggedit (local) .f(.x[[i]], ...)
     31. │               └─dplyr::as_data_frame(t(x))
     32. │                 └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     33. │                   └─lifecycle:::deprecate_stop0(msg)
     34. │                     └─rlang::cnd_signal(...)
     35. └─dplyr::mutate(., call = x$call)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ggESDA

<details>

* Version: 0.2.0
* GitHub: https://github.com/kiangkiangkiang/ggESDA
* Source code: https://github.com/cran/ggESDA
* Date/Publication: 2022-08-19 08:40:10 UTC
* Number of recursive dependencies: 209

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

# ggraph

<details>

* Version: 2.1.0
* GitHub: https://github.com/thomasp85/ggraph
* Source code: https://github.com/cran/ggraph
* Date/Publication: 2022-10-09 20:33:19 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "ggraph")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Edges.Rmd’ using rmarkdown
    --- finished re-building ‘Edges.Rmd’
    
    --- re-building ‘Layouts.Rmd’ using rmarkdown
    Quitting from lines 93-94 (Layouts.Rmd) 
    Error: processing vignette 'Layouts.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘Layouts.Rmd’
    ...
    Error: processing vignette 'tidygraph.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘tidygraph.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Layouts.Rmd’ ‘tidygraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   5.9Mb
    ```

# GISSB

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/GISSB
* Date/Publication: 2023-01-10 18:33:14 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "GISSB")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GISSB-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vegnett_to_R
    > ### Title: Convert the Norwegian road network (NVDB Ruteplan
    > ###   nettverksdatasett) into network graphs in R
    > ### Aliases: vegnett_to_R
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,50]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 866 marked UTF-8 strings
    ```

# groupdata2

<details>

* Version: 2.0.2
* GitHub: https://github.com/ludvigolsen/groupdata2
* Source code: https://github.com/cran/groupdata2
* Date/Publication: 2022-11-24 09:50:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "groupdata2")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_identical(...) at test_summarizers.R:487:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─base::unname(num_summ_2)
       5.   ├─base::`names<-`(`*tmp*`, value = NULL)
       6.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
       7.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       8.       └─lifecycle:::deprecate_stop0(msg)
       9.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 11 | SKIP 5 | PASS 3525 ]
      Error: Test failures
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

# hacksig

<details>

* Version: 0.1.2
* GitHub: https://github.com/Acare/hacksig
* Source code: https://github.com/cran/hacksig
* Date/Publication: 2022-02-17 14:22:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "hacksig")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘hacksig.Rmd’ using rmarkdown
    Quitting from lines 97-104 (hacksig.Rmd) 
    Error: processing vignette 'hacksig.Rmd' failed with diagnostics:
    ℹ In argument: `genes = map(genes, compose(as_vector, unname))`.
    Caused by error in `map()`:
    ℹ In index: 1.
    Caused by error:
    ! The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘hacksig.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘hacksig.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# haven

<details>

* Version: 2.5.1
* GitHub: https://github.com/tidyverse/haven
* Source code: https://github.com/cran/haven
* Date/Publication: 2022-08-22 19:10:04 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "haven")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘datetimes.Rmd’ using rmarkdown
    --- finished re-building ‘datetimes.Rmd’
    
    --- re-building ‘semantics.Rmd’ using rmarkdown
    Quitting from lines 66-71 (semantics.Rmd) 
    Error: processing vignette 'semantics.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘semantics.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘semantics.Rmd’
    
    Error: Vignette re-building failed.
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

# HDStIM

<details>

* Version: 0.1.0
* GitHub: https://github.com/niaid/HDStIM
* Source code: https://github.com/cran/HDStIM
* Date/Publication: 2022-06-24 08:10:12 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "HDStIM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HDStIM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: HDStIM
    > ### Title: HDStIM: High Dimensional Stimulation Immune Mapping
    > ### Aliases: HDStIM
    > 
    > ### ** Examples
    > 
    > mapped_data <- HDStIM(chi11$expr_data, chi11$state_markers,
    ...
        ▆
     1. └─HDStIM::HDStIM(...)
     2.   ├─dat_stim_unstim[dat_stim_unstim[, cellpop_col] == cellpop, ]
     3.   └─tibble:::`[.tbl_df`(...)
     4.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     5.       └─tibble:::vectbl_as_row_location(i, nr, i_arg, assign, call)
     6.         └─lifecycle::deprecate_stop(...)
     7.           └─lifecycle:::deprecate_stop0(msg)
     8.             └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ℹ Convert to a vector.
      Backtrace:
          ▆
       1. └─HDStIM::HDStIM(...) at testPlots.R:22:2
       2.   ├─dat_stim_unstim[dat_stim_unstim[, cellpop_col] == cellpop, ]
       3.   └─tibble:::`[.tbl_df`(...)
       4.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
       5.       └─tibble:::vectbl_as_row_location(i, nr, i_arg, assign, call)
       6.         └─lifecycle::deprecate_stop(...)
       7.           └─lifecycle:::deprecate_stop0(msg)
       8.             └─rlang::cnd_signal(...)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘HDStIM.Rmd’ using rmarkdown
    Quitting from lines 36-47 (HDStIM.Rmd) 
    Error: processing vignette 'HDStIM.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘HDStIM.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘HDStIM.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# healthyR

<details>

* Version: 0.2.0
* GitHub: https://github.com/spsanderson/healthyR
* Source code: https://github.com/cran/healthyR
* Date/Publication: 2022-07-18 19:40:02 UTC
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "healthyR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘healthyR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: umap_list
    > ### Title: UMAP Projection
    > ### Aliases: umap_list
    > 
    > ### ** Examples
    > 
    > library(healthyR.data)
    ...
      2. │ └─... %>% dplyr::bind_cols(data %>% dplyr::select(1))
      3. ├─dplyr::bind_cols(., data %>% dplyr::select(1))
      4. │ └─rlang::list2(...)
      5. ├─purrr::set_names(., "x", "y")
      6. ├─tibble::as_tibble(.)
      7. └─tibble:::as_tibble.matrix(.)
      8.   └─lifecycle::deprecate_stop(...)
      9.     └─lifecycle:::deprecate_stop0(msg)
     10.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘getting-started.Rmd’ using rmarkdown
    --- finished re-building ‘getting-started.Rmd’
    
    --- re-building ‘kmeans-umap.Rmd’ using rmarkdown
    Quitting from lines 150-151 (kmeans-umap.Rmd) 
    Error: processing vignette 'kmeans-umap.Rmd' failed with diagnostics:
    The `x` argument of `as_tibble.matrix()` must have unique column names
    if `.name_repair` is omitted as of tibble 2.0.0.
    ℹ Using compatibility `.name_repair`.
    --- failed re-building ‘kmeans-umap.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘kmeans-umap.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   1.5Mb
        doc    3.8Mb
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
       13. │     ├─... %>% ...
       14. │     └─himach:::pathToGC(...)
       15. │       ├─gcid[farID + 1, "phase"]
       16. │       └─tibble:::`[.tbl_df`(gcid, farID + 1, "phase")
       17. │         └─tibble:::vectbl_as_row_index(i, x, i_arg)
       18. │           └─tibble:::fix_oob(i, nr)
       19. │             └─tibble:::fix_oob_positive(i, n, warn)
       20. │               └─lifecycle::deprecate_stop(...)
       21. │                 └─lifecycle:::deprecate_stop0(msg)
       22. │                   └─rlang::cnd_signal(...)
       23. └─dplyr::mutate(...)
      
      [ FAIL 1 | WARN 3 | SKIP 8 | PASS 56 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Supersonic_Routes.Rmd’ using rmarkdown
    Quitting from lines 250-260 (Supersonic_Routes.Rmd) 
    Error: processing vignette 'Supersonic_Routes.Rmd' failed with diagnostics:
    The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of
    tibble 3.0.0.
    ℹ Use `NA_integer_` as row index to obtain a row full of `NA` values.
    --- failed re-building ‘Supersonic_Routes.Rmd’
    
    ...
    The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of
    tibble 3.0.0.
    ℹ Use `NA_integer_` as row index to obtain a row full of `NA` values.
    --- failed re-building ‘Supersonic_Routes_in_depth.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Supersonic_Routes.Rmd’ ‘Supersonic_Routes_in_depth.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# hydraulics

<details>

* Version: 0.6.1
* GitHub: https://github.com/EdM44/hydraulics
* Source code: https://github.com/cran/hydraulics
* Date/Publication: 2022-12-06 22:30:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "hydraulics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘hydraulics_vignette.Rmd’ using rmarkdown
    Quitting from lines 103-108 (hydraulics_vignette.Rmd) 
    Error: processing vignette 'hydraulics_vignette.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘hydraulics_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘hydraulics_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# hypothesisr

<details>

* Version: 0.1.1
* GitHub: https://github.com/mdlincoln/hypothesisr
* Source code: https://github.com/cran/hypothesisr
* Date/Publication: 2016-07-01 16:33:31
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "hypothesisr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘hypothesisr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hs_search
    > ### Title: Search hypothes.is annotations
    > ### Aliases: hs_search
    > 
    > ### ** Examples
    > 
    > # Search for no more than 5 annotations containing the text "ulysses"
    ...
      tibble, or `as.data.frame()` to convert to a data frame.
    Backtrace:
        ▆
     1. └─hypothesisr::hs_search(text = "ulysses", limit = 5)
     2.   └─hypothesisr:::hs_search_results(query_response)
     3.     └─dplyr::as_data_frame(res_list$rows)
     4.       └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     5.         └─lifecycle:::deprecate_stop0(msg)
     6.           └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_message(hs_todo <- hs_search(text = "todo")) at test_search.R:36:2
        2. │ └─testthat:::quasi_capture(enquo(object), label, capture_messages)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─hypothesisr::hs_search(text = "todo")
        7.   └─hypothesisr:::hs_search_results(query_response)
        8.     └─dplyr::as_data_frame(res_list$rows)
        9.       └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       10.         └─lifecycle:::deprecate_stop0(msg)
       11.           └─rlang::cnd_signal(...)
      
      [ FAIL 3 | WARN 0 | SKIP 1 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# idiogramFISH

<details>

* Version: 2.0.9
* GitHub: NA
* Source code: https://github.com/cran/idiogramFISH
* Date/Publication: 2022-09-16 14:46:09 UTC
* Number of recursive dependencies: 174

Run `revdepcheck::cloud_details(, "idiogramFISH")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘idiogramFISH-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: posCalc
    > ### Title: FUNCTION posCalc and fillMarkInfo
    > ### Aliases: posCalc fillMarkInfo fillMarkInfo2
    > ### Keywords: chromosome fraction mark position
    > 
    > ### ** Examples
    > 
    ...
     1. └─idiogramFISH::posCalc(monoholoMarks2, monoholoCS, result = "data.frame")
     2.   ├─`*tmp*`[1, as.character(chrName)]
     3.   └─tibble:::`[.tbl_df`(`*tmp*`, 1, as.character(chrName))
     4.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     5.       └─tibble:::fix_oob(i, nr)
     6.         └─tibble:::fix_oob_positive(i, n, warn)
     7.           └─lifecycle::deprecate_stop(...)
     8.             └─lifecycle:::deprecate_stop0(msg)
     9.               └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘AVignette.Rmd’ using rmarkdown
    --- finished re-building ‘AVignette.Rmd’
    
    --- re-building ‘index.Rmd’ using rmarkdown
    Error running filter refs/multiple-bibliographies.lua:
    refs/multiple-bibliographies.lua:34: attempt to compare string with table
    stack traceback:
    	refs/multiple-bibliographies.lua:34: in function <refs/multiple-bibliographies.lua:32>
    ...
    	refs/multiple-bibliographies.lua:32: in main chunk
    Error: processing vignette 'index.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 83
    --- failed re-building ‘index.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘index.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘ggtree’
    ```

# igate

<details>

* Version: 0.3.3
* GitHub: https://github.com/stefan-stein/igate
* Source code: https://github.com/cran/igate
* Date/Publication: 2019-09-10 22:50:06 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "igate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘igate-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: robust.categorical.igate
    > ### Title: Robust igate for categorical target variables
    > ### Aliases: robust.categorical.igate
    > 
    > ### ** Examples
    > 
    > robust.categorical.igate(mtcars, target = "cyl",
    ...
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─igate::robust.categorical.igate(...)
     2.   └─tibble::data_frame()
     3.     └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘igate-vignette.Rmd’ using rmarkdown
    Quitting from lines 98-100 (igate-vignette.Rmd) 
    Error: processing vignette 'igate-vignette.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘igate-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘igate-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘kableExtra’ ‘knitr’ ‘xtable’
      All declared Imports should be used.
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
# inctools

<details>

* Version: 1.0.15
* GitHub: https://github.com/SACEMA/inctools
* Source code: https://github.com/cran/inctools
* Date/Publication: 2019-11-07 14:20:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "inctools")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘EstimatingIncidence.Rmd’ using rmarkdown
    --- finished re-building ‘EstimatingIncidence.Rmd’
    
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    --- finished re-building ‘Introduction.Rmd’
    
    --- re-building ‘SurveyDesign.Rmd’ using rmarkdown
    --- finished re-building ‘SurveyDesign.Rmd’
    ...
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘TestCalibration.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘TestCalibration.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# inspectdf

<details>

* Version: 0.0.12
* GitHub: https://github.com/alastairrushworth/inspectdf
* Source code: https://github.com/cran/inspectdf
* Date/Publication: 2022-08-09 06:30:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "inspectdf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘inspectdf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inspect_cat
    > ### Title: Summary and comparison of the levels in categorical columns
    > ### Aliases: inspect_cat
    > 
    > ### ** Examples
    > 
    > # Load dplyr for starwars data & pipe
    ...
     1. ├─inspectdf::inspect_cat(starwars)
     2. │ ├─base::suppressWarnings(...)
     3. │ │ └─base::withCallingHandlers(...)
     4. │ └─lapply(levels_list, nrow) %>% do.call("rbind", .) %>% ...
     5. ├─tibble::as_tibble(., rownames = "col_name")
     6. └─tibble:::as_tibble.matrix(., rownames = "col_name")
     7.   └─lifecycle::deprecate_stop(...)
     8.     └─lifecycle:::deprecate_stop0(msg)
     9.       └─rlang::cnd_signal(...)
    Execution halted
    ```

# interpretCI

<details>

* Version: 0.1.1
* GitHub: https://github.com/cardiomoon/interpretCI
* Source code: https://github.com/cran/interpretCI
* Date/Publication: 2022-01-28 08:50:02 UTC
* Number of recursive dependencies: 112

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

# ipumsr

<details>

* Version: 0.5.2
* GitHub: https://github.com/ipums/ipumsr
* Source code: https://github.com/cran/ipumsr
* Date/Publication: 2022-12-09 22:20:02 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "ipumsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ipumsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lbl_add
    > ### Title: Add labels for unlabelled values
    > ### Aliases: lbl_add lbl_add_vals
    > 
    > ### ** Examples
    > 
    > x <- haven::labelled(
    ...
        ▆
     1. └─ipumsr::lbl_add_vals(x, vals = c(100, 200))
     2.   ├─vals %in% unname(old_labels)
     3.   └─base::unname(old_labels)
     4.     ├─base::`names<-`(`*tmp*`, value = NULL)
     5.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
     6.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     7.         └─lifecycle:::deprecate_stop0(msg)
     8.           └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_equal(...) at test_lbls.r:254:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─ipumsr::lbl_add_vals(x_inc, ~paste0("$", .), c(100, 105))
        5.   ├─vals %in% unname(old_labels)
        6.   └─base::unname(old_labels)
        7.     ├─base::`names<-`(`*tmp*`, value = NULL)
        8.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
        9.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       10.         └─lifecycle:::deprecate_stop0(msg)
       11.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 19 | SKIP 12 | PASS 368 ]
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

Run `revdepcheck::cloud_details(, "ITNr")` for more info

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
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    Backtrace:
        ▆
     1. └─ITNr::core_periphery_weighted(ITN, "directed")
     2.   └─dplyr::as_data_frame(RESULT)
     3.     └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# janitor

<details>

* Version: 2.2.0
* GitHub: https://github.com/sfirke/janitor
* Source code: https://github.com/cran/janitor
* Date/Publication: 2023-02-02 16:50:06 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "janitor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. ├─example_data_row_to_names[[nm]] %>% ...
        8. └─janitor::row_to_names(., row_number = 1)
        9.   └─base::`colnames<-`(`*tmp*`, value = new_names)
       10.     ├─base::`names<-`(`*tmp*`, value = value)
       11.     └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
       12.       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be empty')")
       13.         └─lifecycle:::deprecate_stop0(msg)
       14.           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 797 ]
      Error: Test failures
      Execution halted
    ```

# konfound

<details>

* Version: 0.4.0
* GitHub: https://github.com/jrosen48/konfound
* Source code: https://github.com/cran/konfound
* Date/Publication: 2021-06-01 07:40:05 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "konfound")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘konfound-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: konfound
    > ### Title: Perform sensitivity analysis on fitted models
    > ### Aliases: konfound
    > 
    > ### ** Examples
    > 
    > # using lm() for linear models
    ...
      8.           └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
      9.             ├─purrr:::with_indexed_errors(...)
     10.             │ └─base::withCallingHandlers(...)
     11.             ├─purrr:::call_with_cleanup(...)
     12.             └─konfound (local) .f(.x[[i]], .y[[i]], ...)
     13.               └─dplyr::data_frame(t, df, action, inference, pct_bias, itcv, r_con)
     14.                 └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     15.                   └─lifecycle:::deprecate_stop0(msg)
     16.                     └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map2(.x, .y, .f, ...)`: ℹ In index: 1.
      Caused by error:
      ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      ── Error ('test-pkonfound.R:10'): (code run outside of `test_that()`) ──────────
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map2(.x, .y, .f, ...)`: ℹ In index: 1.
      Caused by error:
      ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      
      [ FAIL 2 | WARN 5 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction-to-konfound.Rmd’ using rmarkdown
    Quitting from lines 149-150 (introduction-to-konfound.Rmd) 
    Error: processing vignette 'introduction-to-konfound.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘introduction-to-konfound.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction-to-konfound.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘mice’ ‘tibble’
      All declared Imports should be used.
    ```

# labelled

<details>

* Version: 2.10.0
* GitHub: https://github.com/larmarange/labelled
* Source code: https://github.com/cran/labelled
* Date/Publication: 2022-09-14 12:20:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "labelled")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro_labelled.Rmd’ using rmarkdown
    Quitting from lines 480-486 (intro_labelled.Rmd) 
    Error: processing vignette 'intro_labelled.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘intro_labelled.Rmd’
    
    --- re-building ‘look_for.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘look_for.Rmd’
    
    --- re-building ‘missing_values.Rmd’ using rmarkdown
    --- finished re-building ‘missing_values.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro_labelled.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘memisc’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘memisc’
    ```

# lares

<details>

* Version: 5.2.0
* GitHub: https://github.com/laresbernardo/lares
* Source code: https://github.com/cran/lares
* Date/Publication: 2023-02-03 18:02:32 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "lares")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lares-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tree_var
    > ### Title: Recursive Partitioning and Regression Trees
    > ### Aliases: tree_var
    > 
    > ### ** Examples
    > 
    > data(dft)
    ...
        ▆
     1. └─lares::tree_var(dft, Fare, subtitle = "Titanic dataset")
     2.   ├─df[!is.na(df[, target_txt]), ]
     3.   └─tibble:::`[.tbl_df`(df, !is.na(df[, target_txt]), )
     4.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     5.       └─tibble:::vectbl_as_row_location(i, nr, i_arg, assign, call)
     6.         └─lifecycle::deprecate_stop(...)
     7.           └─lifecycle:::deprecate_stop0(msg)
     8.             └─rlang::cnd_signal(...)
    Execution halted
    ```

# lazytrade

<details>

* Version: 0.5.3
* GitHub: https://github.com/vzhomeexperiments/lazytrade
* Source code: https://github.com/cran/lazytrade
* Date/Publication: 2021-12-15 18:10:07 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "lazytrade")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lazytrade-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rl_generate_policy_mt
    > ### Title: Function performs RL and generates model policy for each Market
    > ###   Type
    > ### Aliases: rl_generate_policy_mt
    > 
    > ### ** Examples
    > 
    ...
     1. └─lazytrade::rl_generate_policy_mt(...)
     2.   ├─x[i + 1, ]
     3.   └─tibble:::`[.tbl_df`(x, i + 1, )
     4.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
     5.       └─tibble:::fix_oob(i, nr)
     6.         └─tibble:::fix_oob_positive(i, n, warn)
     7.           └─lifecycle::deprecate_stop(...)
     8.             └─lifecycle:::deprecate_stop0(msg)
     9.               └─rlang::cnd_signal(...)
    Execution halted
    ```

# lifelogr

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/lifelogr
* Date/Publication: 2017-05-12 23:23:16 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "lifelogr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lifelogr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Person
    > ### Title: A 'Person' object is a complete view of an individual over a
    > ###   certain time period, as seen through data from multiple sources
    > ### Aliases: Person
    > ### Keywords: datasets
    > 
    > ### ** Examples
    ...
    Backtrace:
        ▆
     1. └─Person$new(...)
     2.   └─lifelogr (local) initialize(...)
     3.     └─private$create_util_data(self$start_date, self$end_date)
     4.       └─tibble::data_frame(...)
     5.         └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     6.           └─lifecycle:::deprecate_stop0(msg)
     7.             └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_is(Person$new(), "Person") at test_person.R:54:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─Person$new()
        5.   └─lifelogr (local) initialize(...)
        6.     └─private$create_util_data(self$start_date, self$end_date)
        7.       └─tibble::data_frame(...)
        8.         └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
        9.           └─lifecycle:::deprecate_stop0(msg)
       10.             └─rlang::cnd_signal(...)
      
      [ FAIL 5 | WARN 50 | SKIP 0 | PASS 56 ]
      Error: Test failures
      Execution halted
    ```

# malan

<details>

* Version: 1.0.2
* GitHub: https://github.com/mikldk/malan
* Source code: https://github.com/cran/malan
* Date/Publication: 2020-06-25 12:00:06 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "malan")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘case-study-partial.Rmd’ using rmarkdown
    Quitting from lines 76-78 (case-study-partial.Rmd) 
    Error: processing vignette 'case-study-partial.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘case-study-partial.Rmd’
    
    --- re-building ‘introduction.Rmd’ using rmarkdown
    --- finished re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘case-study-partial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.8Mb
      sub-directories of 1Mb or more:
        libs  21.8Mb
    ```

# migraph

<details>

* Version: 0.13.2
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2022-12-20 16:20:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as
    > ### Title: Coercion between migraph-compatible object classes
    > ### Aliases: as as_edgelist as_matrix as_igraph as_tidygraph as_network
    > ###   as_siena as_graphAM
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,2]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# mildsvm

<details>

* Version: 0.4.0
* GitHub: https://github.com/skent259/mildsvm
* Source code: https://github.com/cran/mildsvm
* Date/Publication: 2022-07-14 09:00:04 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "mildsvm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. └─mildsvm (local) check_row_subset(df, 1:4)
        5.   ├─df[ind, ] at test-mi_df.R:129:4
        6.   ├─mildsvm:::`[.mi_df`(df, ind, ) at test-mi_df.R:129:4
        7.   ├─base::NextMethod("[")
        8.   └─tibble:::`[.tbl_df`(df, ind, )
        9.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
       10.       └─tibble:::fix_oob(i, nr)
       11.         └─tibble:::fix_oob_positive(i, n, warn)
       12.           └─lifecycle::deprecate_stop(...)
       13.             └─lifecycle:::deprecate_stop0(msg)
       14.               └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 16 | SKIP 89 | PASS 376 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘gurobi’
    ```

# msSPChelpR

<details>

* Version: 0.9.0
* GitHub: https://github.com/marianschmidt/msSPChelpR
* Source code: https://github.com/cran/msSPChelpR
* Date/Publication: 2022-06-10 23:50:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "msSPChelpR")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 114-129 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# multidplyr

<details>

* Version: 0.1.2
* GitHub: https://github.com/tidyverse/multidplyr
* Source code: https://github.com/cran/multidplyr
* Date/Publication: 2022-09-26 19:40:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "multidplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multidplyr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: partition
    > ### Title: Partition data across workers in a cluster
    > ### Aliases: partition
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─multidplyr:::print.multidplyr_party_df(x)
     3.   ├─base::print(tibble::trunc_mat(x, n = 6, width = width))
     4.   └─tibble::trunc_mat(x, n = 6, width = width)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       12.         ├─base::withVisible(value_fun(ev$value, ev$visible))
       13.         └─evaluate (local) value_fun(ev$value, ev$visible)
       14.           ├─testthat (local) value_handler(x)
       15.           └─testthat:::testthat_print.default(x)
       16.             ├─base::print(x)
       17.             └─multidplyr:::print.multidplyr_party_df(x)
       18.               ├─base::print(tibble::trunc_mat(x, n = 6, width = width))
       19.               └─tibble::trunc_mat(x, n = 6, width = width)
       20.                 └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
       21.                   └─lifecycle:::deprecate_stop0(msg)
       22.                     └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 6 | PASS 49 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘multidplyr.Rmd’ using rmarkdown
    Quitting from lines 50-52 (multidplyr.Rmd) 
    Error: processing vignette 'multidplyr.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘multidplyr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘multidplyr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# multinma

<details>

* Version: 0.5.0
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2022-08-29 21:00:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinma-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.igraph.nma_data
    > ### Title: Convert networks to graph objects
    > ### Aliases: as.igraph.nma_data as_tbl_graph.nma_data
    > 
    > ### ** Examples
    > 
    > # Set up network of smoking cessation data
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,2]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 250.0Mb
      sub-directories of 1Mb or more:
        doc     4.0Mb
        libs  244.6Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# namedropR

<details>

* Version: 2.4.1
* GitHub: https://github.com/nucleic-acid/namedropR
* Source code: https://github.com/cran/namedropR
* Date/Publication: 2022-08-28 10:50:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "namedropR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       15. └─namedropR::drop_name(bib = good_bib, cite_key = "Eschrich1983")
       16.   ├─base::suppressMessages(suppressWarnings(bib2df::bib2df(file = bib)))
       17.   │ └─base::withCallingHandlers(...)
       18.   ├─base::suppressWarnings(bib2df::bib2df(file = bib))
       19.   │ └─base::withCallingHandlers(...)
       20.   └─bib2df::bib2df(file = bib)
       21.     └─bib2df:::bib2df_gather(bib)
       22.       └─tibble::as_data_frame(dat)
       23.         └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       24.           └─lifecycle:::deprecate_stop0(msg)
       25.             └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 80 | SKIP 0 | PASS 57 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘custom_styling.Rmd’ using rmarkdown
    Quitting from lines 61-70 (custom_styling.Rmd) 
    Error: processing vignette 'custom_styling.Rmd' failed with diagnostics:
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘custom_styling.Rmd’
    
    ...
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘use_rmarkdown.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘custom_styling.Rmd’ ‘use_rmarkdown.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# naniar

<details>

* Version: 1.0.0
* GitHub: https://github.com/njtierney/naniar
* Source code: https://github.com/cran/naniar
* Date/Publication: 2023-02-02 09:50:02 UTC
* Number of recursive dependencies: 175

Run `revdepcheck::cloud_details(, "naniar")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘exploring-imputed-values.Rmd’ using rmarkdown
    Quitting from lines 78-87 (exploring-imputed-values.Rmd) 
    Error: processing vignette 'exploring-imputed-values.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘exploring-imputed-values.Rmd’
    
    --- re-building ‘getting-started-w-naniar.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘replace-with-na.Rmd’
    
    --- re-building ‘special-missing-values.Rmd’ using rmarkdown
    --- finished re-building ‘special-missing-values.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘exploring-imputed-values.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ncdump

<details>

* Version: 0.0.3
* GitHub: https://github.com/r-gris/ncdump
* Source code: https://github.com/cran/ncdump
* Date/Publication: 2017-05-02 12:35:30 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "ncdump")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ncdump-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: NetCDF
    > ### Title: Information about a NetCDF file, in convenient form.
    > ### Aliases: NetCDF
    > 
    > ### ** Examples
    > 
    > rnc <- NetCDF(system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package= "ncdump"))
    ...
        ▆
     1. └─ncdump::NetCDF(...)
     2.   ├─base::do.call(...)
     3.   └─base::lapply(...)
     4.     └─ncdump (local) FUN(X[[i]], ...)
     5.       └─dplyr::as_data_frame(...)
     6.         └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     7.           └─lifecycle:::deprecate_stop0(msg)
     8.             └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        tibble, or `as.data.frame()` to convert to a data frame.
      Backtrace:
          ▆
       1. └─ncdump::NetCDF(ifile) at testbasic.r:6:0
       2.   ├─base::do.call(...)
       3.   └─base::lapply(...)
       4.     └─ncdump (local) FUN(X[[i]], ...)
       5.       └─dplyr::as_data_frame(...)
       6.         └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
       7.           └─lifecycle:::deprecate_stop0(msg)
       8.             └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# NetFACS

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/NetFACS
* Date/Publication: 2022-12-06 17:32:35 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "NetFACS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetFACS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_conditional
    > ### Title: Create a network based on conditional probabilities of dyads of
    > ###   elements
    > ### Aliases: network_conditional
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,2]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

# noaastormevents

<details>

* Version: 0.2.0
* GitHub: https://github.com/geanders/noaastormevents
* Source code: https://github.com/cran/noaastormevents
* Date/Publication: 2021-01-21 10:20:06 UTC
* Number of recursive dependencies: 142

Run `revdepcheck::cloud_details(, "noaastormevents")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘noaastormevents-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: match_forecast_county
    > ### Title: Match events by forecast zone to county
    > ### Aliases: match_forecast_county
    > 
    > ### ** Examples
    > 
    > counties_to_parse <- dplyr::data_frame(
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─dplyr::data_frame(...)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-parsing-and-matching.R:35'): matching cz_names to county names to get FIPS for events listed by forecast zone ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      Backtrace:
          ▆
       1. └─dplyr::data_frame(...) at test-parsing-and-matching.R:35:12
       2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       3.     └─lifecycle:::deprecate_stop0(msg)
       4.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘choroplethr’ ‘choroplethrMaps’ ‘data.table’ ‘forcats’
      ‘hurricaneexposure’ ‘plyr’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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

# ohenery

<details>

* Version: 0.1.1
* GitHub: https://github.com/shabbychef/ohenery
* Source code: https://github.com/cran/ohenery
* Date/Publication: 2019-10-15 06:30:02 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "ohenery")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─... %>% mutate(place = ohenery::rsm(eta, g = eventnum)) at test-basic.r:447:8
        2. ├─dplyr::mutate(., place = ohenery::rsm(eta, g = eventnum))
        3. ├─dplyr::mutate(., eta = 1.5 * x + 0.3 * intercept)
        4. ├─dplyr::mutate(., intercept = as.numeric(program_num == 1))
        5. ├─dplyr::mutate(., program_num = rep(c(1, 2), nop))
        6. ├─dplyr::mutate(., x = rnorm(n()))
        7. └─tibble::data_frame(eventnum = floor(seq(1, nop + 0.7, by = 0.5)))
        8.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
        9.     └─lifecycle:::deprecate_stop0(msg)
       10.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 150 ]
      Error: Test failures
      Execution halted
    ```

# ontologics

<details>

* Version: 0.6.5
* GitHub: https://github.com/luckinet/ontologics
* Source code: https://github.com/cran/ontologics
* Date/Publication: 2023-01-31 13:10:08 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "ontologics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘conversion_to_rdf.Rmd’ using rmarkdown
    Quitting from lines 30-34 (conversion_to_rdf.Rmd) 
    Error: processing vignette 'conversion_to_rdf.Rmd' failed with diagnostics:
    The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
    ℹ Convert to a vector.
    --- failed re-building ‘conversion_to_rdf.Rmd’
    
    --- re-building ‘create_an_ontology.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘map_new_concepts.Rmd’
    
    --- re-building ‘ontology_database_description.Rmd’ using rmarkdown
    --- finished re-building ‘ontology_database_description.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘conversion_to_rdf.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

# padr

<details>

* Version: 0.6.2
* GitHub: https://github.com/EdwinTh/padr
* Source code: https://github.com/cran/padr
* Date/Publication: 2022-11-23 16:00:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "padr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘padr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fill_by_function
    > ### Title: Fill missing values by a function of the nonmissings
    > ### Aliases: fill_by_function
    > 
    > ### ** Examples
    > 
    > library(dplyr) # for the pipe operator
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─tibble::data_frame(...)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
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
    
    > ### Name: complete_data
    > ### Title: Filter out entities with too few observations
    > ### Aliases: complete_data
    > 
    > ### ** Examples
    > 
    > 
    ...
    Error:
    ! `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    Backtrace:
     1. base (local) `<fn>`(x)
     2. panelr:::print.panel_data(x)
     3. tibble::trunc_mat(x, ...)
     4. lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     5. lifecycle:::deprecate_stop0(msg)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘reshape.Rmd’ using rmarkdown
    --- finished re-building ‘reshape.Rmd’
    
    --- re-building ‘wbm.Rmd’ using rmarkdown
    Quitting from lines 59-61 (wbm.Rmd) 
    Error: processing vignette 'wbm.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘wbm.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘wbm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# pdfsearch

<details>

* Version: 0.3.0
* GitHub: https://github.com/lebebr01/pdfsearch
* Source code: https://github.com/cran/pdfsearch
* Date/Publication: 2019-01-09 19:30:08 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "pdfsearch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: `is.tibble()` was deprecated in tibble 2.0.0 and is now defunct.
      ℹ Please use `is_tibble()` instead.
      Backtrace:
          ▆
       1. ├─testthat::expect_true(...) at test_structure.r:34:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─tibble::is.tibble(...)
       5.   └─lifecycle::deprecate_stop("2.0.0", "is.tibble()", "is_tibble()")
       6.     └─lifecycle:::deprecate_stop0(msg)
       7.       └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 13 ]
      Error: Test failures
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

# Plasmidprofiler

<details>

* Version: 0.1.6
* GitHub: NA
* Source code: https://github.com/cran/Plasmidprofiler
* Date/Publication: 2017-01-06 01:10:47
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "Plasmidprofiler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Plasmidprofiler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: main
    > ### Title: Main: Run everything
    > ### Aliases: main
    > 
    > ### ** Examples
    > 
    > main(blastdata,
    ...
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─Plasmidprofiler::main(...)
     2.   └─Plasmidprofiler::amr_positives(blast.file)
     3.     └─tibble::data_frame()
     4.       └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     5.         └─lifecycle:::deprecate_stop0(msg)
     6.           └─rlang::cnd_signal(...)
    Execution halted
    ```

# PopED

<details>

* Version: 0.6.0
* GitHub: https://github.com/andrewhooker/PopED
* Source code: https://github.com/cran/PopED
* Date/Publication: 2021-05-21 14:50:03 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::cloud_details(, "PopED")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PopED-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_efficiency_of_windows
    > ### Title: Plot the efficiency of windows
    > ### Aliases: plot_efficiency_of_windows
    > 
    > ### ** Examples
    > 
    > library(PopED)
    ...
      4.   └─utils:::stack.data.frame(df, select = -sample)
      5.     ├─base::data.frame(values = unlist(unname(x)), ind, stringsAsFactors = FALSE)
      6.     ├─base::unlist(unname(x))
      7.     └─base::unname(x)
      8.       ├─base::`names<-`(`*tmp*`, value = NULL)
      9.       └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
     10.         └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     11.           └─lifecycle:::deprecate_stop0(msg)
     12.             └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘examples.Rmd’ using rmarkdown
    --- finished re-building ‘examples.Rmd’
    
    --- re-building ‘intro-poped.Rmd’ using rmarkdown
    Quitting from lines 258-259 (intro-poped.Rmd) 
    Error: processing vignette 'intro-poped.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘intro-poped.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro-poped.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# psr

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/psr
* Date/Publication: 2021-08-13 09:00:02 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "psr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘psr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ICC_long
    > ### Title: Intra-class Correlation Coefficient (ICC) for a set of athlete
    > ###   measurements, with the data in long format
    > ### Aliases: ICC_long
    > 
    > ### ** Examples
    > 
    ...
      4.     └─utils:::stack.data.frame(x)
      5.       ├─base::data.frame(values = unlist(unname(x)), ind, stringsAsFactors = FALSE)
      6.       ├─base::unlist(unname(x))
      7.       └─base::unname(x)
      8.         ├─base::`names<-`(`*tmp*`, value = NULL)
      9.         └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
     10.           └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     11.             └─lifecycle:::deprecate_stop0(msg)
     12.               └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘psr-explained.Rmd’ using rmarkdown
    Quitting from lines 102-103 (psr-explained.Rmd) 
    Error: processing vignette 'psr-explained.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘psr-explained.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘psr-explained.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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
     28.     │ └─base::withCallingHandlers(...)
     29.     ├─purrr:::call_with_cleanup(...)
     30.     └─psychmeta (local) .f(.x[[i]], ...)
     31.       ├─dplyr::filter(dplyr::as_tibble(levels), !exclude)
     32.       ├─dplyr::as_tibble(levels)
     33.       └─tibble:::as_tibble.matrix(levels)
     34.         └─lifecycle::deprecate_stop(...)
     35.           └─lifecycle:::deprecate_stop0(msg)
     36.             └─rlang::cnd_signal(...)
    Execution halted
    ```

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
       15.                       └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       16.                         └─lifecycle:::deprecate_stop0(msg)
       17.                           └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 52 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ma_r.Rmd’ using rmarkdown
    Quitting from lines 201-202 (ma_r.Rmd) 
    Error: processing vignette 'ma_r.Rmd' failed with diagnostics:
    ℹ In index: 1.
    ℹ With name: moderator.
    Caused by error in `mutate()`:
    ℹ In argument: `anova = purrr::map(.data$data, .anova.ma_psychmeta, conf_level)`.
    ℹ In group 1: `pair_id = 1`, `construct_x = X`, `construct_y = Y`.
    ...
    --- failed re-building ‘ma_r.Rmd’
    
    --- re-building ‘overview.Rmd’ using rmarkdown
    --- finished re-building ‘overview.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ma_r.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# r4lineups

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/r4lineups
* Date/Publication: 2018-07-18 13:20:02 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "r4lineups")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘r4lineups-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_roc
    > ### Title: Compute and plot ROC curve for lineup accuracy ~ confidence
    > ### Aliases: make_roc
    > 
    > ### ** Examples
    > 
    > #Data:
    ...
    Backtrace:
        ▆
     1. ├─r4lineups::make_roc(mickwick)
     2. │ └─make_rocdata(df_confacc) %>% make_roc_gg()
     3. └─r4lineups:::make_roc_gg(.)
     4.   └─dplyr::data_frame(...)
     5.     └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vignette.Rmd’ using rmarkdown
    Quitting from lines 398-400 (Vignette.Rmd) 
    Error: processing vignette 'Vignette.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# radsafer

<details>

* Version: 2.2.6
* GitHub: https://github.com/markhogue/radsafer
* Source code: https://github.com/cran/radsafer
* Date/Publication: 2022-02-01 20:10:01 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "radsafer")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction_to_radsafer.Rmd’ using rmarkdown
    Quitting from lines 97-98 (Introduction_to_radsafer.Rmd) 
    Error: processing vignette 'Introduction_to_radsafer.Rmd' failed with diagnostics:
    The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of
    tibble 3.0.0.
    ℹ Use `NA_integer_` as row index to obtain a row full of `NA` values.
    --- failed re-building ‘Introduction_to_radsafer.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction_to_radsafer.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘qpdf’ ‘utf8’
      All declared Imports should be used.
    ```

# rchess

<details>

* Version: 0.1
* GitHub: https://github.com/jbkunst/rchess
* Source code: https://github.com/cran/rchess
* Date/Publication: 2015-11-05 17:18:05
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "rchess")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rchess-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggchessboard
    > ### Title: Plot a fen representation chessboard via ggplot2
    > ### Aliases: ggchessboard
    > 
    > ### ** Examples
    > 
    > ggchessboard()
    ...
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─rchess::ggchessboard()
     2.   └─rchess:::.chessboarddata(fen = fen)
     3.     └─dplyr::data_frame(piece = names(pieces), text = pieces)
     4.       └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     5.         └─lifecycle:::deprecate_stop0(msg)
     6.           └─rlang::cnd_signal(...)
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

# readtext

<details>

* Version: 0.81
* GitHub: https://github.com/quanteda/readtext
* Source code: https://github.com/cran/readtext
* Date/Publication: 2021-07-14 14:40:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "readtext")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        8. │       │     ├─withr::with_output_sink(path, withVisible(code))
        9. │       │     │ └─base::force(code)
       10. │       │     └─base::withVisible(code)
       11. │       └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       12. ├─base::print(readtext("../data/fox/fox.txt"))
       13. └─readtext:::print.readtext(readtext("../data/fox/fox.txt"))
       14.   ├─base::print(tibble::trunc_mat(x, n = n))
       15.   └─tibble::trunc_mat(x, n = n)
       16.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
       17.       └─lifecycle:::deprecate_stop0(msg)
       18.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 0 | SKIP 10 | PASS 156 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘readtext_vignette.Rmd’ using rmarkdown
    Quitting from lines 47-49 (readtext_vignette.Rmd) 
    Error: processing vignette 'readtext_vignette.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘readtext_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘readtext_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked Latin-1 string
      Note: found 1 marked UTF-8 string
      Note: found 7 strings marked as "bytes"
    ```

# recipes

<details>

* Version: 1.0.5
* GitHub: https://github.com/tidymodels/recipes
* Source code: https://github.com/cran/recipes
* Date/Publication: 2023-02-20 18:00:02 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "recipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘recipes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: check_range
    > ### Title: Check Range Consistency
    > ### Aliases: check_range
    > 
    > ### ** Examples
    > 
    > slack_df <- data_frame(x = 0:100)
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─tibble::data_frame(x = 0:100)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastICA’, ‘dimRed’
    ```

# RPresto

<details>

* Version: 1.4.2
* GitHub: https://github.com/prestodb/RPresto
* Source code: https://github.com/cran/RPresto
* Date/Publication: 2023-01-13 08:30:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "RPresto")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2.   └─RPresto (local) .add_chunk(split_values[[i]], start = start + 1L)
        3.     ├─utils::object.size(...)
        4.     │ └─base::structure(.Call(C_objectSize, x), class = "object_size")
        5.     └─RPresto:::.create_values_statement(dummyPrestoConnection(), sample_value)
        6.       ├─base::do.call(paste, c(unname(sql_values), sep = ", "))
        7.       └─base::unname(sql_values)
        8.         ├─base::`names<-`(`*tmp*`, value = NULL)
        9.         └─tibble:::`names<-.tbl_df`(`*tmp*`, value = NULL)
       10.           └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       11.             └─lifecycle:::deprecate_stop0(msg)
       12.               └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 79 | PASS 209 ]
      Error: Test failures
      Execution halted
    ```

# rrr

<details>

* Version: 1.0.0
* GitHub: https://github.com/chrisaddy/rrr
* Source code: https://github.com/cran/rrr
* Date/Publication: 2016-12-09 15:15:55
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "rrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pairwise_plot
    > ### Title: Pairwise Plots
    > ### Aliases: pairwise_plot
    > 
    > ### ** Examples
    > 
    > data(pendigits)
    ...
     1. └─rrr::pairwise_plot(...)
     2.   └─rrr:::pca_pairwise_plot(x, pair_x, pair_y, y, rank, k, interactive)
     3.     └─rrr:::pca_pairwise(x, pc_x, pc_y, rank, k)
     4.       └─rrr:::pca_scores(x, rank, k)
     5.         └─rrr:::pca(x, rank, k)
     6.           └─tibble::as_data_frame(A %*% t(A))
     7.             └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     8.               └─lifecycle:::deprecate_stop0(msg)
     9.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rrr.Rmd’ using rmarkdown
    Quitting from lines 66-72 (rrr.Rmd) 
    Error: processing vignette 'rrr.Rmd' failed with diagnostics:
    `as_data_frame()` was deprecated in tibble 2.0.0 and is now defunct.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    --- failed re-building ‘rrr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rrr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rcpp’
      All declared Imports should be used.
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
    Quitting from lines 66-74 (rubias-fully-bayesian.Rmd) 
    Error: processing vignette 'rubias-fully-bayesian.Rmd' failed with diagnostics:
    The `x` argument of `as_tibble.matrix()` must have unique column names
    if `.name_repair` is omitted as of tibble 2.0.0.
    ℹ Using compatibility `.name_repair`.
    --- failed re-building ‘rubias-fully-bayesian.Rmd’
    
    ...
    --- failed re-building ‘rubias-overview.Rmd’
    
    --- re-building ‘rubias-underlying-data-structures.Rmd’ using rmarkdown
    --- finished re-building ‘rubias-underlying-data-structures.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘rubias-fully-bayesian.Rmd’ ‘rubias-overview.Rmd’
    
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

# saeSim

<details>

* Version: 0.11.0
* GitHub: https://github.com/wahani/saeSim
* Source code: https://github.com/cran/saeSim
* Date/Publication: 2022-02-07 16:40:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "saeSim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘saeSim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: agg_all
    > ### Title: Aggregation function
    > ### Aliases: agg_all
    > 
    > ### ** Examples
    > 
    > sim_base() %>% sim_gen_x() %>% sim_gen_e() %>% sim_agg(agg_all())
    ...
    Backtrace:
        ▆
     1. ├─methods (local) `<stndrdGn>`(`<sim_setp>`)
     2. └─saeSim (local) `<stndrdGn>`(`<sim_setp>`)
     3.   ├─base::print(trunc_mat(dat, n = 6, width = NULL))
     4.   └─tibble::trunc_mat(dat, n = 6, width = NULL)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Error: `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
      ℹ Printing has moved to the pillar package.
      Backtrace:
          ▆
       1. ├─methods::show(setup) at test-sim_setup.R:14:2
       2. └─saeSim::show(setup)
       3.   ├─base::print(trunc_mat(dat, n = 6, width = NULL))
       4.   └─tibble::trunc_mat(dat, n = 6, width = NULL)
       5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
       6.       └─lifecycle:::deprecate_stop0(msg)
       7.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 253 | SKIP 0 | PASS 133 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    Quitting from lines 31-39 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    `trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    ℹ Printing has moved to the pillar package.
    --- failed re-building ‘Introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

# sfnetworks

<details>

* Version: 0.6.1
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2022-10-27 15:10:02 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfnetworks-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_sfnetwork
    > ### Title: Convert a foreign object to a sfnetwork
    > ### Aliases: as_sfnetwork as_sfnetwork.default as_sfnetwork.sf
    > ###   as_sfnetwork.linnet as_sfnetwork.psp as_sfnetwork.sfc
    > ###   as_sfnetwork.sfNetwork as_sfnetwork.sfnetwork as_sfnetwork.tbl_graph
    > 
    > ### ** Examples
    ...
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─sfnetworks:::print.sfnetwork(x)
     3.   └─sfnetworks:::summarise_network_element(...)
     4.     ├─base::do.call(trunc_mat, modifyList(args, list(x = data, n = n)))
     5.     └─tibble (local) `<fn>`(x = `<sf[,1]>`, n = 6L)
     6.       └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     7.         └─lifecycle:::deprecate_stop0(msg)
     8.           └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘sfn01_structure.Rmd’ using rmarkdown
    Quitting from lines 64-82 (sfn01_structure.Rmd) 
    Error: processing vignette 'sfn01_structure.Rmd' failed with diagnostics:
    [1m[22m`trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    [36mℹ[39m Printing has moved to the pillar package.
    --- failed re-building ‘sfn01_structure.Rmd’
    
    --- re-building ‘sfn02_preprocess_clean.Rmd’ using rmarkdown
    Quitting from lines 56-68 (sfn02_preprocess_clean.Rmd) 
    ...
    [1m[22m`trunc_mat()` was deprecated in tibble 3.1.0 and is now defunct.
    [36mℹ[39m Printing has moved to the pillar package.
    --- failed re-building ‘sfn05_morphers.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘sfn01_structure.Rmd’ ‘sfn02_preprocess_clean.Rmd’
      ‘sfn03_join_filter.Rmd’ ‘sfn04_routing.Rmd’ ‘sfn05_morphers.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(sfnetworks)
      > 
      > test_check("sfnetworks")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 277 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_paths.R:242'): ... is passed correcly onto igraph::distances ──
      isTRUE(all.equal(cost_dijkstra, cost_johnson)) is not FALSE
      
      `actual`:   TRUE 
      `expected`: FALSE
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 277 ]
      Error: Test failures
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

# simPH

<details>

* Version: 1.3.13
* GitHub: https://github.com/christophergandrud/simPH
* Source code: https://github.com/cran/simPH
* Date/Publication: 2021-01-10 14:50:05 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "simPH")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simPH-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: coxsimPoly
    > ### Title: Simulate quantities of interest for a range of values for a
    > ###   polynomial nonlinear effect from Cox Proportional Hazards models
    > ### Aliases: coxsimPoly
    > 
    > ### ** Examples
    > 
    ...
      tibble, or `as.data.frame()` to convert to a data frame.
    Backtrace:
        ▆
     1. ├─simPH::coxsimPoly(...)
     2. │ └─inner_join(SimbPerc, merger_xj, by = "Xjl") %>% ...
     3. └─tibble::as_data_frame(.)
     4.   └─lifecycle::deprecate_stop("2.0.0", "as_data_frame()", details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame.")
     5.     └─lifecycle:::deprecate_stop0(msg)
     6.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘simPH-overview.Rnw’ using knitr
    Error: processing vignette 'simPH-overview.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'simPH-overview.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘simPH-overview.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘simPH-overview.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# soc.ca

<details>

* Version: 0.8.0
* GitHub: https://github.com/Rsoc/soc.ca
* Source code: https://github.com/cran/soc.ca
* Date/Publication: 2021-09-02 22:50:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "soc.ca")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘soc.ca-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mca.eigen.check
    > ### Title: MCA Eigenvalue check
    > ### Aliases: mca.eigen.check
    > 
    > ### ** Examples
    > 
    > example(soc.mca)
    ...
    Backtrace:
        ▆
     1. ├─soc.ca::mca.eigen.check(active)
     2. │ └─... %>% as_tibble()
     3. ├─tibble::as_tibble(.)
     4. └─tibble:::as_tibble.matrix(.)
     5.   └─lifecycle::deprecate_stop(...)
     6.     └─lifecycle:::deprecate_stop0(msg)
     7.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘FactoMineR’ ‘flextable’ ‘htmlTable’ ‘stringr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 938 marked UTF-8 strings
    ```

# spacejamr

<details>

* Version: 0.2.1
* GitHub: https://github.com/dscolby/spacejamr
* Source code: https://github.com/cran/spacejamr
* Date/Publication: 2022-04-01 20:10:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "spacejamr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spacejamr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: NetSim
    > ### Title: Simulate a network from a point process or sequence
    > ### Aliases: NetSim
    > 
    > ### ** Examples
    > 
    > # Load spacejamr object
    ...
      6. │     │ └─base::withCallingHandlers(...)
      7. │     ├─dplyr::as_tibble(...)
      8. │     └─tibble:::as_tibble.matrix(...)
      9. │       └─lifecycle::deprecate_stop(...)
     10. │         └─lifecycle:::deprecate_stop0(msg)
     11. │           └─rlang::cnd_signal(...)
     12. ├─base::as.matrix(.)
     13. ├─dplyr::ungroup(.)
     14. └─dplyr::mutate(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │     ├─... %>% as.matrix()
        5. │     ├─base::suppressWarnings(...)
        6. │     │ └─base::withCallingHandlers(...)
        7. │     ├─dplyr::as_tibble(...)
        8. │     └─tibble:::as_tibble.matrix(...)
        9. │       └─lifecycle::deprecate_stop(...)
       10. │         └─lifecycle:::deprecate_stop0(msg)
       11. │           └─rlang::cnd_signal(...)
       12. ├─base::as.matrix(.)
       13. ├─dplyr::ungroup(.)
       14. └─dplyr::mutate(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# splithalf

<details>

* Version: 0.8.2
* GitHub: https://github.com/sdparsons/splithalf
* Source code: https://github.com/cran/splithalf
* Date/Publication: 2022-08-11 14:30:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "splithalf")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘sim-validation.Rmd’ using rmarkdown
    Quitting from lines 837-854 (sim-validation.Rmd) 
    Error: processing vignette 'sim-validation.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘sim-validation.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘sim-validation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# srvyr

<details>

* Version: 1.2.0
* GitHub: https://github.com/gergness/srvyr
* Source code: https://github.com/cran/srvyr
* Date/Publication: 2023-02-21 04:10:02 UTC
* Number of recursive dependencies: 100

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
    Error in if (mask$get_size() > 0) { : argument is of length zero
    Calls: %>% ... cnd_bullet_cur_group_label -> cur_group_label -> mask_type
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       24. │               └─tibble:::`names<-.tbl_df`(...)
       25. │                 └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must have the same length as `x`')")
       26. │                   └─lifecycle:::deprecate_stop0(msg)
       27. │                     └─rlang::cnd_signal(...)
       28. │                       └─rlang:::signal_abort(cnd)
       29. │                         └─base::signalCondition(cnd)
       30. └─dplyr (local) `<fn>`(`<lfcycl__>`)
       31.   └─dplyr (local) handler(cnd)
       32.     └─dplyr:::cnd_bullet_cur_group_label()
       33.       └─dplyr:::cur_group_label()
       34.         └─dplyr:::mask_type()
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 389 ]
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
    argument is of length zero
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

# starvz

<details>

* Version: 0.7.1
* GitHub: https://github.com/schnorr/starvz
* Source code: https://github.com/cran/starvz
* Date/Publication: 2022-02-13 13:00:05 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "starvz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘starvz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: panel_node_summary
    > ### Title: Create a bar plot with node information
    > ### Aliases: panel_node_summary
    > 
    > ### ** Examples
    > 
    > panel_node_summary(data = starvz_sample_lu)
    ...
      8. │ └─starvz:::abe_cpu_cuda_inner(dfl, debug)
      9. │   └─... %>% as.matrix()
     10. ├─base::as.matrix(.)
     11. └─base (local) set_colnames(., NULL)
     12.   ├─base::`names<-`(`*tmp*`, value = value)
     13.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
     14.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
     15.       └─lifecycle:::deprecate_stop0(msg)
     16.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. │ └─rlang::eval_tidy(args[[j]], mask)
       11. ├─starvz:::abe_cpu_cuda(.data)
       12. │ └─starvz:::abe_cpu_cuda_inner(dfl, debug)
       13. │   └─... %>% as.matrix()
       14. ├─base::as.matrix(.)
       15. └─base (local) set_colnames(., NULL)
       16.   ├─base::`names<-`(`*tmp*`, value = value)
       17.   └─tibble:::`names<-.tbl_df`(`*tmp*`, value = value)
       18.     └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")
       19.       └─lifecycle:::deprecate_stop0(msg)
       20.         └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 24 | SKIP 1 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        libs   4.7Mb
    ```

# summarytools

<details>

* Version: 1.0.1
* GitHub: https://github.com/dcomtois/summarytools
* Source code: https://github.com/cran/summarytools
* Date/Publication: 2022-05-20 07:30:05 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "summarytools")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 687-688 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘introduction.Rmd’
    
    --- re-building ‘rmarkdown.Rmd’ using rmarkdown
    Quitting from lines 317-321 (rmarkdown.Rmd) 
    Error: processing vignette 'rmarkdown.Rmd' failed with diagnostics:
    The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
    --- failed re-building ‘rmarkdown.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘introduction.Rmd’ ‘rmarkdown.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 78 marked UTF-8 strings
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
    
    > ### Name: ct2env
    > ### Title: Establishing the relationship between CT and a environmental
    > ###   variable
    > ### Aliases: ct2env
    > 
    > ### ** Examples
    > 
    ...
        ▆
     1. ├─synoptReg::synoptclas(atm_data1, ncomp = 6)
     2. │ └─... %>% setNames(paste0("PC", 1:ncomp))
     3. ├─stats::setNames(., paste0("PC", 1:ncomp))
     4. ├─tibble::as_tibble(.)
     5. └─tibble:::as_tibble.matrix(.)
     6.   └─lifecycle::deprecate_stop(...)
     7.     └─lifecycle:::deprecate_stop0(msg)
     8.       └─rlang::cnd_signal(...)
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

# tbrf

<details>

* Version: 0.1.5
* GitHub: https://github.com/mps9506/tbrf
* Source code: https://github.com/cran/tbrf
* Date/Publication: 2020-04-09 04:40:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "tbrf")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro_to_tbrf.Rmd’ using rmarkdown
    Quitting from lines 70-77 (intro_to_tbrf.Rmd) 
    Error: processing vignette 'intro_to_tbrf.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    --- failed re-building ‘intro_to_tbrf.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro_to_tbrf.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tcgaViz

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/tcgaViz
* Date/Publication: 2022-07-05 14:00:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "tcgaViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tcgaViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_pvalue
    > ### Title: Corrected Wilcoxon tests
    > ### Aliases: calculate_pvalue
    > 
    > ### ** Examples
    > 
    > data(tcga)
    ...
      6.     ├─base::paste0(...)
      7.     ├─x[1, ]
      8.     └─tibble:::`[.tbl_df`(x, 1, )
      9.       └─tibble:::vectbl_as_row_index(i, x, i_arg)
     10.         └─tibble:::fix_oob(i, nr)
     11.           └─tibble:::fix_oob_positive(i, n, warn)
     12.             └─lifecycle::deprecate_stop(...)
     13.               └─lifecycle:::deprecate_stop0(msg)
     14.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

# tidyboot

<details>

* Version: 0.1.1
* GitHub: https://github.com/langcog/tidyboot
* Source code: https://github.com/cran/tidyboot
* Date/Publication: 2018-03-14 04:13:49 UTC
* Number of recursive dependencies: 25

Run `revdepcheck::cloud_details(, "tidyboot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidyboot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidyboot.data.frame
    > ### Title: Non-parametric bootstrap for data frames
    > ### Aliases: tidyboot.data.frame
    > 
    > ### ** Examples
    > 
    > ## Mean and 95% confidence interval for 500 samples from two different normal distributions
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─tibble::data_frame(value = rnorm(500, mean = 0, sd = 1), condition = 1)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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

# tidygraph

<details>

* Version: 1.2.3
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2023-02-01 21:10:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bind_graphs
    > ### Title: Add graphs, nodes, or edges to a tbl_graph
    > ### Aliases: bind_graphs bind_nodes bind_edges
    > 
    > ### ** Examples
    > 
    > graph <- create_notable('bull')
    ...
    Backtrace:
        ▆
     1. ├─base (local) `<fn>`(x)
     2. └─tidygraph:::print.tbl_graph(x)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,1]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
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

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytransit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_route_geometry
    > ### Title: Get all trip shapes for a given route and service
    > ### Aliases: get_route_geometry
    > 
    > ### ** Examples
    > 
    > data(gtfs_duke)
    ...
      3. └─sf:::`[.sf`(routes_sf, c(1, 1350), )
      4.   ├─x[i, , drop = drop]
      5.   └─tibble:::`[.tbl_df`(x, i, , drop = drop)
      6.     └─tibble:::vectbl_as_row_index(i, x, i_arg)
      7.       └─tibble:::fix_oob(i, nr)
      8.         └─tibble:::fix_oob_positive(i, n, warn)
      9.           └─lifecycle::deprecate_stop(...)
     10.             └─lifecycle:::deprecate_stop0(msg)
     11.               └─rlang::cnd_signal(...)
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

# tosr

<details>

* Version: 0.1.2
* GitHub: https://github.com/coreofscience/tosr
* Source code: https://github.com/cran/tosr
* Date/Publication: 2023-01-13 23:50:02 UTC
* Number of recursive dependencies: 182

Run `revdepcheck::cloud_details(, "tosr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─tosr::tosSAP(my_tosr_load$graph, my_tosr_load$df, my_tosr_load$nodes)
        6. │ ├─Hojas[1:60, ] %>% dplyr::filter(.data$SAP > 0)
        7. │ ├─Hojas[1:60, ]
        8. │ └─tibble:::`[.tbl_df`(Hojas, 1:60, )
        9. │   └─tibble:::vectbl_as_row_index(i, x, i_arg)
       10. │     └─tibble:::fix_oob(i, nr)
       11. │       └─tibble:::fix_oob_positive(i, n, warn)
       12. │         └─lifecycle::deprecate_stop(...)
       13. │           └─lifecycle:::deprecate_stop0(msg)
       14. │             └─rlang::cnd_signal(...)
       15. └─dplyr::filter(., .data$SAP > 0)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# TriDimRegression

<details>

* Version: 1.0.1
* GitHub: https://github.com/alexander-pastukhov/tridim-regression
* Source code: https://github.com/cran/TriDimRegression
* Date/Publication: 2021-10-05 08:30:08 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "TriDimRegression")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘calibration.Rmd’ using rmarkdown
    --- finished re-building ‘calibration.Rmd’
    
    --- re-building ‘comparing_faces.Rmd’ using rmarkdown
    Quitting from lines 28-61 (comparing_faces.Rmd) 
    Error: processing vignette 'comparing_faces.Rmd' failed with diagnostics:
    The `x` argument of `as_tibble.matrix()` must have unique column names
    if `.name_repair` is omitted as of tibble 2.0.0.
    ...
    --- failed re-building ‘comparing_faces.Rmd’
    
    --- re-building ‘transformation_matrices.Rmd’ using rmarkdown
    --- finished re-building ‘transformation_matrices.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘comparing_faces.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 53.9Mb
      sub-directories of 1Mb or more:
        libs  53.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RcppParallel’ ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
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

# useful

<details>

* Version: 1.2.6
* GitHub: https://github.com/jaredlander/useful
* Source code: https://github.com/cran/useful
* Date/Publication: 2018-10-08 16:00:03 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "useful")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘useful-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cart2pol
    > ### Title: cart2pol
    > ### Aliases: cart2pol
    > 
    > ### ** Examples
    > 
    > 
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─tibble::data_frame(x = x1, y = y1, Q = "I")
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
      ℹ Please use `tibble()` instead.
      Backtrace:
          ▆
       1. ├─dplyr::as.tbl(...) at test-unique.R:7:0
       2. ├─dplyr::bind_cols(ex, data_frame(Three = rep("a", nrow(ex))))
       3. │ └─rlang::list2(...)
       4. └─tibble::data_frame(Three = rep("a", nrow(ex)))
       5.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
       6.     └─lifecycle:::deprecate_stop0(msg)
       7.       └─rlang::cnd_signal(...)
      
      [ FAIL 6 | WARN 25 | SKIP 2 | PASS 714 ]
      Error: Test failures
      Execution halted
    ```

# VWPre

<details>

* Version: 1.2.4
* GitHub: NA
* Source code: https://github.com/cran/VWPre
* Date/Publication: 2020-11-29 17:10:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "VWPre")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘VWPre_Basic_Preprocessing.Rmd’ using rmarkdown
    --- finished re-building ‘VWPre_Basic_Preprocessing.Rmd’
    
    --- re-building ‘VWPre_Interest_Areas.Rmd’ using rmarkdown
    Quitting from lines 123-128 (VWPre_Interest_Areas.Rmd) 
    Error: processing vignette 'VWPre_Interest_Areas.Rmd' failed with diagnostics:
    `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    ...
    --- finished re-building ‘VWPre_Message_Alignment.Rmd’
    
    --- re-building ‘VWPre_Plotting.Rmd’ using rmarkdown
    --- finished re-building ‘VWPre_Plotting.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘VWPre_Interest_Areas.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# wakefield

<details>

* Version: 0.3.6
* GitHub: https://github.com/trinker/wakefield
* Source code: https://github.com/cran/wakefield
* Date/Publication: 2020-09-13 17:30:02 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "wakefield")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wakefield-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: r_insert
    > ### Title: Insert Data Frames Into 'r_data_frame'
    > ### Aliases: r_insert
    > ### Keywords: insert
    > 
    > ### ** Examples
    > 
    ...
    Error:
    ! `data_frame()` was deprecated in tibble 1.1.0 and is now defunct.
    ℹ Please use `tibble()` instead.
    Backtrace:
        ▆
     1. └─dplyr::data_frame(...)
     2.   └─lifecycle::deprecate_stop("1.1.0", "data_frame()", "tibble()")
     3.     └─lifecycle:::deprecate_stop0(msg)
     4.       └─rlang::cnd_signal(...)
    Execution halted
    ```

# waves

<details>

* Version: 0.2.4
* GitHub: https://github.com/GoreLab/waves
* Source code: https://github.com/cran/waves
* Date/Publication: 2022-03-29 21:50:02 UTC
* Number of recursive dependencies: 163

Run `revdepcheck::cloud_details(, "waves")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘waves-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: aggregate_spectra
    > ### Title: Aggregate data based on grouping variables and a user-provided
    > ###   function
    > ### Aliases: aggregate_spectra
    > 
    > ### ** Examples
    > 
    ...
        ▆
     1. ├─aggregated.test[1:5, 1:5]
     2. └─tibble:::`[.tbl_df`(aggregated.test, 1:5, 1:5)
     3.   └─tibble:::vectbl_as_row_index(i, x, i_arg)
     4.     └─tibble:::fix_oob(i, nr)
     5.       └─tibble:::fix_oob_positive(i, n, warn)
     6.         └─lifecycle::deprecate_stop(...)
     7.           └─lifecycle:::deprecate_stop0(msg)
     8.             └─rlang::cnd_signal(...)
    Execution halted
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
    Error in if (mask$get_size() > 0) { : argument is of length zero
    Calls: table_weightedpct ... cnd_bullet_cur_group_label -> cur_group_label -> mask_type
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       26. │               └─tibble:::`names<-.tbl_df`(...)
       27. │                 └─lifecycle::deprecate_stop("3.0.0", "tibble::`names<-`(value = 'must have the same length as `x`')")
       28. │                   └─lifecycle:::deprecate_stop0(msg)
       29. │                     └─rlang::cnd_signal(...)
       30. │                       └─rlang:::signal_abort(cnd)
       31. │                         └─base::signalCondition(cnd)
       32. └─dplyr (local) `<fn>`(`<lfcycl__>`)
       33.   └─dplyr (local) handler(cnd)
       34.     └─dplyr:::cnd_bullet_cur_group_label()
       35.       └─dplyr:::cur_group_label()
       36.         └─dplyr:::mask_type()
      
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
    argument is of length zero
    --- failed re-building ‘c6_after_rasch_ES.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘c6_after_rasch_EN.Rmd’ ‘c6_after_rasch_ES.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# wordgraph

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/wordgraph
* Date/Publication: 2020-07-01 08:40:03 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "wordgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wordgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.word.combinations.as.tbl_graph
    > ### Title: Calculate all word pairs frequencies.
    > ### Aliases: get.word.combinations.as.tbl_graph
    > 
    > ### ** Examples
    > 
    > # It is a time consuming function...
    ...
    Backtrace:
        ▆
     1. ├─base::print(df.word.combinations.as.tbl_graph)
     2. └─tidygraph:::print.tbl_graph(df.word.combinations.as.tbl_graph)
     3.   ├─base::do.call(...)
     4.   └─tibble (local) `<fn>`(x = `<tibble[,1]>`, n = 6)
     5.     └─lifecycle::deprecate_stop("3.1.0", "tibble::trunc_mat()", details = "Printing has moved to the pillar package.")
     6.       └─lifecycle:::deprecate_stop0(msg)
     7.         └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6738 marked UTF-8 strings
    ```

