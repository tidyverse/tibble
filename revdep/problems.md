# banR

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/banR
* URL: http://github.com/joelgombin/banR
* BugReports: http://github.com/joelgombin/banR/issues
* Date/Publication: 2017-08-03 14:33:11 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"banR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: geocode_tbl
    > ### Title: Geocode tbl
    > ### Aliases: geocode_tbl
    > 
    > ### ** Examples
    > 
    > 
    > table_test <- tibble::tibble(
    + x = c("39 quai Andre Citroen", "64 Allee de Bercy", "20 avenue de Segur"), 
    + y = c("75015", "75012", "75007"), 
    + z = rnorm(3)
    + )
    > 
    > geocode_tbl(tbl = table_test, adresse = x)
    Writing tempfile to.../tmp/Rtmphfl9Hs/file126f522f292b1.csv
    Error in stream_delim_(df, path, ..., bom = bom, quote_escape = quote_escape) : 
      Don't know how to handle vector of type list.
    Calls: geocode_tbl ... <Anonymous> -> write_delim -> stream_delim -> stream_delim_
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: `[<-.tbl_df`(`*tmp*`, , value = list(longitude = c(2.279092, 2.375933, 2.308332), latitude = c(48.84683, 
         48.84255, 48.85032)))
      17: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      18: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      19: stop_recycle_incompatible_size(x_size = 2L, size = 3L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      20: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      21: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 4 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: Geocode tbl works  (@test_geocodetbl.R#12) 
      2. Error: Reverse geocode tbl works  (@test_geocodetbl.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# banter

<details>

* Version: 0.9.3
* Source code: https://github.com/cran/banter
* Date/Publication: 2018-07-10 15:20:06 UTC
* Number of recursive dependencies: 60

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

* Version: 0.9.2
* Source code: https://github.com/cran/basket
* URL: https://github.com/kaneplusplus/basket
* BugReports: https://github.com/kaneplusplus/basket/issues
* Date/Publication: 2019-05-14 13:50:03 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"basket")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: tryCatch(vec_recycle(value, vec_size(x)), vctrs_error_recycle_incompatible_size = function(e) {
             abort(error_inconsistent_cols(nrow(x), name, vec_size(value), "Existing data"))
         }) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:197
      15: tryCatchList(expr, classes, parentenv, handlers)
      16: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      17: value[[3L]](cond)
      18: abort(error_inconsistent_cols(nrow(x), name, vec_size(value), "Existing data")) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:200
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-mcmc.r#33) 
      2. Error: (unknown) (@test-plot.r#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bench

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/bench
* URL: https://github.com/r-lib/bench
* BugReports: https://github.com/r-lib/bench/issues
* Date/Publication: 2019-04-29 20:30:02 UTC
* Number of recursive dependencies: 63

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
      [ OK: 142 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 12 ]
      1. Error: mark: Uses all.equal to check results by default (@test-mark.R#36) 
      2. Error: mark: Can use other functions to check results like identical to check results (@test-mark.R#52) 
      3. Error: mark: works with capabilities('profmem') (@test-mark.R#69) 
      4. Error: mark: works without capabilities('profmem') (@test-mark.R#81) 
      5. Error: mark: Can handle `NULL` results (@test-mark.R#90) 
      6. Error: summary.bench_mark: computes relative summaries if called with relative = TRUE (@test-mark.R#131) 
      7. Error: unnest.bench_mark: does not contain result or memory columns (@test-mark.R#184) 
      8. Error: press: Adds parameters to output (@test-press.R#6) 
      9. Error: press: Outputs status message before evaluating each parameter (@test-press.R#22) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bigstatsr

<details>

* Version: 0.9.1
* Source code: https://github.com/cran/bigstatsr
* URL: https://privefl.github.io/bigstatsr
* BugReports: https://github.com/privefl/bigstatsr/issues
* Date/Publication: 2019-03-03 17:30:13 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"bigstatsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # simulating some data
    > N <- 230
    > M <- 730
    > X <- FBM(N, M, init = rnorm(N * M, sd = 5))
    > y <- rowSums(X[, 1:10]) + rnorm(N)
    > covar <- matrix(rnorm(N * 3), N)
    > 
    > ind.train <- sort(sample(nrow(X), 150))
    > ind.test <- setdiff(rows_along(X), ind.train)
    > 
    > # fitting model for multiple lambdas and alphas
    > test <- big_spLinReg(X, y[ind.train], ind.train = ind.train,
    +                      covar.train = covar[ind.train, ],
    +                      alphas = c(1, 0.5, 0.1, 0.01))
    > # peek at the models
    > plot(test)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      error: inv(): matrix seems singular
      
      warning: solve(): system seems singular; attempting approx solution
      
      warning: solve(): system seems singular; attempting approx solution
      
      error: inv(): matrix seems singular
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 3200 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: (unknown) (@test-bigmemory.R#19) 
      2. Error: Copy from big.matrix (@test-copy.R#89) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 14.6Mb
      sub-directories of 1Mb or more:
        extdata   2.3Mb
        libs     11.7Mb
    ```

# biomartr

<details>

* Version: 0.9.0
* Source code: https://github.com/cran/biomartr
* URL: https://github.com/ropensci/biomartr
* BugReports: https://github.com/ropensci/biomartr/issues
* Date/Publication: 2019-05-21 17:40:02 UTC
* Number of recursive dependencies: 103

Run `revdep_details(,"biomartr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: getENSEMBLInfo
    > ### Title: Retrieve ENSEMBL info file
    > ### Aliases: getENSEMBLInfo
    > 
    > ### ** Examples
    > 
    > info.file <- getENSEMBLInfo()
    Error: Vector of length 10 cannot be recycled to length 207. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─biomartr::getENSEMBLInfo()
    [90m  2. [39m│ └─biomartr:::get.ensembl.info(update = TRUE) [90m00_pkg_src/biomartr/R/getENSEMBLInfo.R:10:4[39m
    [90m  3. [39m│   └─readr::write_tsv(ensembl.info, file.path(tempdir(), "ensembl_info.tsv")) [90m00_pkg_src/biomartr/R/get.ensembl.info.R:54:8[39m
    [90m  4. [39m│     └─readr::write_delim(...)
    [90m  5. [39m│       ├─base::`[<-`(...)
    [90m  6. [39m│       └─tibble:::`[<-.tbl_df`(...)
    [90m  7. [39m│         └─tibble:::tbl_extract_assign(x, j, value)
    [90m  8. [39m│           └─vctrs::vec_recycle(value, vec_size(x))
    [90m  9. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 10L, size = 207L)
    [90m 10. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      8: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      9: stop_recycle_incompatible_size(x_size = 10L, size = 207L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      10: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      11: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      trying URL 'ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/metagenomes/assembly_summary.txt'
      Content type 'unknown' length 3049382 bytes (2.9 MB)
      ==================================================
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 2 | SKIPPED: 100 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: The getENSEMBLInfo() interface works properly.. (@test-getENSEMBLInfo.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘fs’
      All declared Imports should be used.
    ```

# blaise

<details>

* Version: 1.3.4
* Source code: https://github.com/cran/blaise
* Date/Publication: 2019-05-15 13:00:03 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"blaise")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 338 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 11 ]
      1. Failure: correct data and datamodel can be read and reproduced (@test_read_fwf.R#42) 
      2. Failure: DUMMY variables are ignored for reading (@test_read_fwf.R#242) 
      3. Error: Numbered enums result in factors of their numbers (@test_read_fwf.R#260) 
      4. Error: Numbered enums can also be parsed by label (@test_read_fwf.R#280) 
      5. Failure: empty enums work (@test_read_fwf.R#299) 
      6. Error: Custom Types work (@test_read_fwf.R#328) 
      7. Failure: all types get read back identically for a dataframe (@test_types.R#34) 
      8. Failure: all types get read back identically for a tibble (@test_types.R#51) 
      9. Error: multiple factors can be written and read (@test_types.R#63) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# blorr

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/blorr
* URL: URL: https://blorr.rsquaredacademy.com/, https://github.com/rsquaredacademy/blorr
* BugReports: https://github.com/rsquaredacademy/blorr/issues
* Date/Publication: 2019-03-12 15:36:05 UTC
* Number of recursive dependencies: 161

Run `revdep_details(,"blorr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Pairs                  7791           c                0.8568   
    ---------------------------------------------------------------
    
    > 
    > # odds ratio estimates
    > blr_regress(model, odd_conf_limit = TRUE)
    - Creating model overview. 
    - Creating response profile. 
    - Extracting maximum likelihood estimates. 
    - Computing odds ratio estimates. 
    Error: Vector of length 2 cannot be recycled to length 3. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─blorr::blr_regress(model, odd_conf_limit = TRUE)
    [90m  2. [39m├─blorr:::blr_regress.glm(model, odd_conf_limit = TRUE) [90m00_pkg_src/blorr/R/blr-regress.R:26:15[39m
    [90m  3. [39m│ └─blorr:::blr_regress.default(object = formula, data = data, odd_conf_limit = odd_conf_limit) [90m00_pkg_src/blorr/R/blr-regress.R:51:2[39m
    [90m  4. [39m│   └─blorr:::blr_reg_comp(object, data, odd_conf_limit) [90m00_pkg_src/blorr/R/blr-regress.R:36:2[39m
    [90m  5. [39m│     ├─base::suppressMessages(odds_conf_limit(model)) [90m00_pkg_src/blorr/R/blr-regress-compute.R:54:4[39m
    [90m  6. [39m│     │ └─base::withCallingHandlers(expr, message = function(c) invokeRestart("muffleMessage"))
    [90m  7. [39m│     └─blorr:::odds_conf_limit(model) [90m00_pkg_src/blorr/R/blr-regress-compute.R:54:
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                           Added/                                                  
      Step    Variable    Removed        AIC           BIC           C(p)       
      ----------------------------------------------------------------------
         1       x6       addition     18869.627     18885.434    18865.6270    
         2       x1       addition     18571.376     18595.087    18565.3760    
         3       x3       addition     18016.724     18048.338    18008.7240    
         4       x2       addition     16642.374     16681.891    16632.3740    
         5       x5       addition     16640.883     16688.304    16628.8830    
         6       x6       removal      16639.219     16678.736    16629.2190    
      ----------------------------------------------------------------------══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 75 | SKIPPED: 28 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: output from blr_regress is as expected (@test-blr-regress.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘blorr’:
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

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lmtest’
    ```

# breathtestcore

<details>

* Version: 0.4.6
* Source code: https://github.com/cran/breathtestcore
* URL: https://github.com/dmenne/breathtestcore
* BugReports: https://github.com/dmenne/breathtestcore/issues
* Date/Publication: 2018-12-18 09:10:03 UTC
* Number of recursive dependencies: 82

Run `revdep_details(,"breathtestcore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    d 22.037 0.006304 1.398
    e 17.453 0.009322 2.432
    f 17.852 0.009003 2.351
    g 20.306 0.007039 1.769
    h  1.965 0.013929 5.710
    i 16.587 0.005433 2.496
    j 22.178 0.014617 1.564
    > pred_data = expand.grid(minute = seq(0, 400, 10), patient = letters[1:10])
    > pred_data$pdr = predict(pdr_nlme, newdata = pred_data)
    > suppressPackageStartupMessages(library(ggplot2))
    > ggplot() +
    +   geom_point(data = pdr1, aes(x = minute, y = pdr, color = "red")) + 
    +   geom_line(data = pred_data, aes(x = minute, y = pdr), color = "black", size=1) +
    +   ggtitle("Short patient record 'a' gives a good fit with many missing data using nlme.\n
    +           Borrowing strength from nlme in action!")+
    +   facet_wrap(~patient) +
    +   theme(legend.position="none")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      15: sort(unique(x), na.last = TRUE)
      16: sort.default(unique(x), na.last = TRUE)
      17: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      18: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 347 | SKIPPED: 5 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: Plot layers match expectations (@test_plot_breathtestfit.R#11) 
      2. Error: Failed nlme fit plots data only (@test_plot_breathtestfit.R#23) 
      3. Error: Successful nlme fit plots data and fit (@test_plot_breathtestfit.R#31) 
      4. Error: Plot multiple groups with repeats (@test_plot_breathtestfit.R#44) 
      5. Error: Plot multiple groups data only (no fit) (@test_plot_breathtestfit.R#82) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# broom.mixed

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/broom.mixed
* URL: http://github.com/bbolker/broom.mixed
* BugReports: http://github.com/bbolker/broom.mixed/issues
* Date/Publication: 2019-02-21 23:50:03 UTC
* Number of recursive dependencies: 139

Run `revdep_details(,"broom.mixed")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +    }
    + }
    Loading required package: lme4
    Loading required package: Matrix
    Loading required package: ggplot2
    Loading required package: dplyr
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'rstan', 'rstanarm', 'brms', 'glmmADMB'
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘brms’, ‘rstanarm’
    ```

# c14bazAAR

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/c14bazAAR
* URL: https://github.com/ISAAKiel/c14bazAAR
* BugReports: https://github.com/ISAAKiel/c14bazAAR/issues
* Date/Publication: 2019-08-02 08:30:05 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"c14bazAAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > library(magrittr)
    > example_c14_date_list %>%
    +   determine_country_by_coordinate() %>%
    +   standardize_country_name() %>%
    +   finalize_country_name()
    Determining country by coordinates... 
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─`%>%`(...)
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         └─function_list[[i]](value)
    [90m  8. [39m│           ├─c14bazAAR::determine_country_by_coordinate(.)
    [90m  9. [39m│           └─c14bazAAR:::determine_country_by_coordinate.c14_date_list(.) [90m00_pkg_src/c14bazAAR/R/c14_date_list_spatial_determine_country_by_coordinate.R:6:2[39m
    [90m 10. [39m│             ├─base::withCallingHandlers(...) [90m00_pkg_src/c14bazAAR/R/c14_date_list_spatial_determine_country_by_coordinate.R:29:4[39m
    [90m 11. [39m│             └─c14bazA
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        |                                                        
        |++++++++++++++++++++++++++++++++++++++++++++++++++| 100%
      
        |                                                        
        |                                                  |   0%
        |                                                        
        |+++++++++++++++++++++++++                         |  50%
        |                                                        
        |++++++++++++++++++++++++++++++++++++++++++++++++++| 100%
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 58 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test_c14_date_list_country_attribution.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# calendar

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/calendar
* Date/Publication: 2019-02-11 13:53:13 UTC
* Number of recursive dependencies: 36

Run `revdep_details(,"calendar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: ic_char_event
    > ### Title: Convert ical object to character strings of events
    > ### Aliases: ic_char_event
    > 
    > ### ** Examples
    > 
    > ic <- ical(ical_example)
    > ic_char_event(ic)
    Error: Vector of length 2 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─calendar::ic_char_event(ic)
    [90m 2. [39m│ ├─base::`[<-`(...) [90m00_pkg_src/calendar/R/ical.R:99:4[39m
    [90m 3. [39m│ └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/calendar/R/ical.R:99:4[39m
    [90m 4. [39m│   └─tibble:::tbl_extract_assign(x, j, value)
    [90m 5. [39m│     └─vctrs::vec_recycle(value, vec_size(x))
    [90m 6. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 1L)
    [90m 7. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# cattonum

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/cattonum
* URL: https://github.com/bfgray3/cattonum
* BugReports: https://github.com/bfgray3/cattonum/issues
* Date/Publication: 2018-05-02 03:18:21 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"cattonum")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 158 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 10 ]
      1.  Error: catto_dummy: multiple tibble training columns. (@test-dummy.R#41) 
      2.  Error: catto_dummy: one tibble training column. (@test-dummy.R#67) 
      3.  Error: catto_freq: multiple tibble training columns. (@test-freq.R#49) 
      4.  Error: catto_freq: one tibble training column. (@test-freq.R#79) 
      5.  Error: catto_loo: multiple tibble training columns. (@test-loo.R#43) 
      6.  Error: catto_loo: one tibble::tibble training column. (@test-loo.R#73) 
      7.  Error: catto_mean: multiple tibble training columns. (@test-mean.R#47) 
      8.  Error: catto_mean: one tibble training column. (@test-mean.R#77) 
      9.  Error: catto_median: multiple tibble training columns. (@test-median.R#47) 
      10. Error: catto_median: one tibble training column. (@test-median.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# CB2

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/CB2
* Date/Publication: 2019-05-16 17:20:03 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"CB2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CB2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_count_distribution
    > ### Title: A function to plot read count distribution.
    > ### Aliases: plot_count_distribution
    > 
    > ### ** Examples
    > 
    > library(CB2)
    > data(Evers_CRISPRn_RT112)
    > cpm <- get_CPM(Evers_CRISPRn_RT112$count)
    > plot_count_distribution(cpm, Evers_CRISPRn_RT112$design)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata   1.1Mb
        libs      3.2Mb
    ```

# childsds

<details>

* Version: 0.7.4
* Source code: https://github.com/cran/childsds
* BugReports: https://github.com/mvogel78/childsds/issues
* Date/Publication: 2019-03-26 08:33:25 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"childsds")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: make_percentile_tab
    > ### Title: calculate raw values
    > ### Aliases: make_percentile_tab
    > 
    > ### ** Examples
    > 
    > ptab <- make_percentile_tab(ref = kro.ref,
    +                             item = "height",
    +                            perc = c(2.5,10,50,90,97.5),
    +                            stack = TRUE)
    Loading required namespace: reshape2
    > 
    > ggplot2::ggplot(ptab, ggplot2::aes(x = age, y = value, colour = variable)) +
    +    ggplot2::geom_line() +
    +    ggplot2::facet_wrap(~ sex, nrow = 2)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 27 marked UTF-8 strings
    ```

# ClimMobTools

<details>

* Version: 0.2-6
* Source code: https://github.com/cran/ClimMobTools
* URL: https://agrobioinfoservices.github.io/ClimMobTools/
* BugReports: https://github.com/agrobioinfoservices/ClimMobTools/issues
* Date/Publication: 2019-08-07 16:00:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"ClimMobTools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data("beans", package = "PlackettLuce")
    > 
    > # first build rankings with only tricot items
    > # and return an object of class 'rankings'
    > R <- build_rankings(data = beans,
    +                     items = c(1:3),
    +                     input = c(4:5))
    Error: Vector of length 3 cannot be recycled to length 842. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─ClimMobTools::build_rankings(data = beans, items = c(1:3), input = c(4:5))
    [90m  2. [39m│ └─ClimMobTools:::.pivot_triadic(i = items, r = data[input]) [90m00_pkg_src/ClimMobTools/R/build_rankings.R:103:4[39m
    [90m  3. [39m│   ├─base::within(...) [90m00_pkg_src/ClimMobTools/R/build_rankings.R:168:2[39m
    [90m  4. [39m│   └─base::within.data.frame(...)
    [90m  5. [39m│     ├─base::`[<-`(...)
    [90m  6. [39m│     └─tibble:::`[<-.tbl_df`(...)
    [90m  7. [39m│       └─tibble:::tbl_extract_assign(x, j, value)
    [90m  8. [39m│         └─vctrs::vec_recycle(value, vec_size(x))
    [90m  9. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 3L, size = 842L)
    [90m 10. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# coefplot

<details>

* Version: 1.2.6
* Source code: https://github.com/cran/coefplot
* Date/Publication: 2018-02-07 23:34:38 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"coefplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: multiplot
    > ### Title: Plot multiple coefplots
    > ### Aliases: multiplot
    > 
    > ### ** Examples
    > 
    > 
    > data(diamonds)
    > model1 <- lm(price ~ carat + cut, data=diamonds)
    > model2 <- lm(price ~ carat + cut + color, data=diamonds)
    > model3 <- lm(price ~ carat + color, data=diamonds)
    > multiplot(model1, model2, model3)
    > multiplot(model1, model2, model3, single=FALSE)
    Warning: Row indexes must be between 0 and the number of rows. Use `NA` as row index to obtain a row full of `NA` values.
    [90mThis warning is displayed once per session.[39m
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# collector

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/collector
* URL: https://collector.tidyrisk.org
* BugReports: https://github.com/davidski/collector/issues
* Date/Publication: 2019-05-21 07:30:03 UTC
* Number of recursive dependencies: 121

Run `revdep_details(,"collector")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             "2018-09-10", "2018-09-10", "2018-09-10", "2018-09-10", "2018-09-10", "2018-09-10", "2018-09-10", 
             "2018-09-10", "2018-09-10", "2018-09-10", "2018-09-10")))
      5: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      6: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      7: stop_recycle_incompatible_size(x_size = 5L, size = 300L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      8: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      9: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: Read questions (@test-utils.R#13) 
      2. Error: Read answers (@test-utils.R#32) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(c(".", "src", "width", "height")) : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘collector’:
     unable to load R code in package ‘officer’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables(c(".", "src", "width", "height")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘officer’
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
    Error in globalVariables(c(".", "src", "width", "height")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘officer’
    Execution halted
    ```

# comperank

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/comperank
* URL: https://github.com/echasnovski/comperank
* BugReports: https://github.com/echasnovski/comperank/issues
* Date/Publication: 2018-05-30 08:27:55 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"comperank")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 172 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 11 ]
      1. Error: rate_iterative handles factor `player` (@test-iterative.R#54) 
      2. Error: rank_iterative handles factor `player` (@test-iterative.R#104) 
      3. Error: add_iterative_ratings handles factor `player` (@test-iterative.R#207) 
      4. Failure: rate_od works (@test-offense-defense.R#26) 
      5. Failure: rate_od works (@test-offense-defense.R#44) 
      6. Failure: rate_od handles factor `player` (@test-offense-defense.R#68) 
      7. Failure: rate_od handles numeric `player` (@test-offense-defense.R#91) 
      8. Failure: rank_od works (@test-offense-defense.R#114) 
      9. Failure: rank_od works (@test-offense-defense.R#127) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# comperes

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/comperes
* URL: https://github.com/echasnovski/comperes
* BugReports: https://github.com/echasnovski/comperes/issues
* Date/Publication: 2019-01-12 11:20:03 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"comperes")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 252 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 9 ]
      1. Failure: h2h_long handles `player` as factor (@test-head-to-head.R#59) 
      2. Failure: h2h_mat handles `player` as factor (@test-head-to-head.R#157) 
      3. Error: as_longcr.default handles missing columns correctly (@test-results-longcr.R#90) 
      4. Failure: as_longcr.default preserves column types (@test-results-longcr.R#123) 
      5. Failure: as_longcr.default preserves column types (@test-results-longcr.R#137) 
      6. Failure: as_longcr.widecr preserves column types (@test-results-longcr.R#231) 
      7. Failure: as_longcr.widecr preserves column types (@test-results-longcr.R#249) 
      8. Error: as_widecr.default handles simple repairing (@test-results-widecr.R#113) 
      9. Error: as_widecr.default places column 'game' on first place (@test-results-widecr.R#153) 
      
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
* Number of recursive dependencies: 67

Run `revdep_details(,"compstatr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # subset to remove missing data
    > testData <- dplyr::filter(testData, missingXY == FALSE)
    > 
    > # project data
    > testData_sf <- cs_projectXY(testData, varX = x_coord, varY = y_coord)
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─compstatr::cs_projectXY(testData, varX = x_coord, varY = y_coord)
    [90m  2. [39m│ ├─sf::st_as_sf(.data, coords = c(x = varXN, y = varYN), crs = "+proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.9999333333333333 +x_0=250000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs") [90m00_pkg_src/compstatr/R/spatial.R:189:2[39m
    [90m  3. [39m│ └─sf:::st_as_sf.data.frame(...)
    [90m  4. [39m│   ├─base::`$<-`(...)
    [90m  5. [39m│   └─tibble:::`$<-.tbl_df`(...)
    [90m  6. [39m│     └─tibble:::col_recycle(value, x, name)
    [90m  7. [39m│       ├─base::tryCatch(...)
    [90m  8. [39m│       │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
    [90m  9. [39m│       │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
    [90m 10. [39m│       │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
    [90m 1
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         xmax = 910742.9, ymax = 1076667), class = "bbox"), class = c("sfc_POINT", "sfc"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      13: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 216 | SKIPPED: 3 | WARNINGS: 3 | FAILED: 6 ]
      1. Error: (unknown) (@test_load_year.R#47) 
      2. Error: (unknown) (@test_prep_year.R#79) 
      3. Failure: correctly specified functions execute without error (@test_projectXY.R#22) 
      4. Failure: correctly specified functions execute without error (@test_projectXY.R#23) 
      5. Failure: correctly specified functions execute without error (@test_projectXY.R#24) 
      6. Error: (unknown) (@test_projectXY.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# correlationfunnel

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/correlationfunnel
* URL: https://github.com/business-science/correlationfunnel
* BugReports: https://github.com/business-science/correlationfunnel/issues
* Date/Publication: 2019-08-06 09:30:09 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"correlationfunnel")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > library(correlationfunnel)
    > 
    > marketing_campaign_tbl %>%
    +     select(-ID) %>%
    +     binarize()
    Error: Argument 1 is a list, must contain atomic vectors
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: bake(x$steps[[i]], new_data = training)
      16: bake.step_dummy(x$steps[[i]], new_data = training)
      17: bind_cols(new_data, as_tibble(indicators))
      18: cbind_all(x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 3 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: Check binarize - numeric (@test-binarize.R#47) 
      2. Error: Check binarize - numeric - high skew (@test-binarize.R#57) 
      3. Error: Check binarize - categorical (@test-binarize.R#68) 
      4. Error: (unknown) (@test-correlate.R#15) 
      5. Error: (unknown) (@test-plot_correlation_funnel.R#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc    3.0Mb
        help   1.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# corrr

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/corrr
* URL: https://github.com/tidymodels/corrr
* BugReports: https://github.com/tidymodels/corrr/issues
* Date/Publication: 2019-07-12 19:00:02 UTC
* Number of recursive dependencies: 101

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
    [38;5;246m# A tibble: 6 x 6[39m
      rowname    mpg    cyl   disp     hp     wt
      [3m[38;5;246m<chr>[39m[23m    [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m
    [38;5;250m1[39m drat     0.681 -[31m0[39m[31m.[39m[31m700[39m -[31m0[39m[31m.[39m[31m710[39m -[31m0[39m[31m.[39m[31m449[39m -[31m0[39m[31m.[39m[31m712[39m
    [38;5;250m2[39m qsec     0.419 -[31m0[39m[31m.[39m[31m591[39m -[31m0[39m[31m.[39m[31m434[39m -[31m0[39m[31m.[39m[31m708[39m -[31m0[39m[31m.[39m[31m175[39m
    [38;5;250m3[39m vs       0.664 -[31m0[39m[31m.[39m[31m811[39m -[31m0[39m[31m.[39m[31m710[39m -[31m0[39m[31m.[39m[31m723[39m -[31m0[39m[31m.[39m[31m555[39m
    [38;5;250m4[39m am       0.600 -[31m0[39m[31m.[39m[31m523[39m -[31m0[39m[31m.[39m[31m591[39m -[31m0[39m[31m.[39m[31m243[39m -[31m0[39m[31m.[39m[31m692[39m
    [38;5;250m5[39m gear     0.480 -[31m0[39m[31m.[39m[31m493[39m -[31m0[39m[31m.[39m[31m556[39m -[31m0[39m[31m.[39m[31m126[39m -[31m0[39m[31m.[39m[31m583[39m
    [38;5;250m6[39m carb    -[31m0[39m[31m.[39m[31m551[39m  0.527  0.395  0.750  0.428
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
      10: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      11: vec_as_index_extract_compat(j, ncol(x), names = names(x), full_column = TRUE) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:394
      12: vec_as_index(j, n) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:437
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 77 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 6 ]
      1. Error: Network plot works (@test-plots.R#8) 
      2. Failure: Rearrange return correct order (@test-rearrange.R#8) 
      3. Error: Shave upper (@test-shave.R#8) 
      4. Error: Shave lower (@test-shave.R#15) 
      5. Error: Shave all (@test-shave.R#22) 
      6. Error: remove.dups works (@test-stretch.R#40) 
      
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
* Number of recursive dependencies: 59

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
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 34 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: return value of get_crime_data is a tibble or SF object (@test_get_crime_data.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# crosswalkr

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/crosswalkr
* URL: https://github.com/btskinner/crosswalkr
* BugReports: https://github.com/btskinner/crosswalkr/issues
* Date/Publication: 2019-03-04 15:20:03 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"crosswalkr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                  cenregnm = c('South','South','South'))
    > 
    > df_tbl <- tibble::as_data_frame(df)
    Warning: `as_data_frame()` is deprecated, use `as_tibble()` (but mind the new semantics).
    [90mThis warning is displayed once per session.[39m
    > 
    > cw <- get(data(stcrosswalk))
    > 
    > df$state2 <- encodefrom(df, state, cw, stname, stfips, stabbr)
    Error: Vector of length 7 cannot be recycled to length 51. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─crosswalkr::encodefrom(df, state, cw, stname, stfips, stabbr)
    [90m 2. [39m│ └─crosswalkr::encodefrom_(...) [90m00_pkg_src/crosswalkr/R/encodefrom.R:67:4[39m
    [90m 3. [39m│   ├─base::`[<-`(...) [90m00_pkg_src/crosswalkr/R/encodefrom.R:95:4[39m
    [90m 4. [39m│   └─tibble:::`[<-.tbl_df`(...) [90m00_pkg_src/crosswalkr/R/encodefrom.R:95:4[39m
    [90m 5. [39m│     └─tibble:::tbl_extract_assign(x, j, value)
    [90m 6. [39m│       └─vctrs::vec_recycle(value, vec_size(x))
    [90m 7. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 7L, size = 51L)
    [90m 8. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         "New Jersey", "Vermont", "District of Columbia", "North Dakota", "New Mexico", "West Virginia", 
         "Indiana", "Hawaii"), y = 1:51)) at /home/rstudio/tibble/revdep/checks/crosswalkr/new/crosswalkr.Rcheck/00_pkg_src/crosswalkr/R/renamefrom.R:96
      5: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      6: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      7: stop_recycle_incompatible_size(x_size = 2L, size = 51L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      8: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      9: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 26 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test-encodefrom.R#32) 
      2. Error: (unknown) (@test-renamefrom.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# customsteps

<details>

* Version: 0.7.1.0
* Source code: https://github.com/cran/customsteps
* URL: https://github.com/smaakage85/customsteps
* Date/Publication: 2018-12-03 10:12:42 UTC
* Number of recursive dependencies: 59

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
      [31m──[39m [31m1. Failure: end-to-end results for center-scale transformation (@test_custom_transfor[39m
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

* Version: 0.7.6
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-03-27 10:10:03 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(dplyr)
    
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
    Error: Tibble columns must have consistent lengths, only values of length one are recycled:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 39 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 45 ]
      1. Error: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#3) 
      2. Error: Cutpointr works with different data types (@test-cutpointr.R#19) 
      3. Error: Bootstrap does not return duplicate colnames (@test-cutpointr.R#78) 
      4. Error: Plotting with bootstrapping is silent (@test-cutpointr.R#94) 
      5. Error: AUC calculation is correct and works with Inf and -Inf (@test-cutpointr.R#110) 
      6. Error: Correct midpoints are found (@test-cutpointr.R#125) 
      7. Error: find_metric_name finds metric (@test-cutpointr.R#136) 
      8. Error: no duplicate column names are returned (@test-cutpointr.R#152) 
      9. Error: Correct cutpoints with example data (@test-cutpointr.R#188) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dbplyr

<details>

* Version: 1.4.2
* Source code: https://github.com/cran/dbplyr
* URL: https://dbplyr.tidyverse.org/, https://github.com/tidyverse/dbplyr
* BugReports: https://github.com/tidyverse/dbplyr/issues
* Date/Publication: 2019-06-17 20:00:04 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"dbplyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m5. Failure: results independent of chunk_size (@test-verb-do.R#54) [39m [31m─────────────────[39m
      nrows(mf, 10) not equal to c(1, 2, 3).
      Lengths differ: 9 is not 3
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 640 | SKIPPED: 12 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: named argument become list columns (@test-verb-do.R#14) 
      2. Failure: Results respect select (@test-verb-do.R#39) 
      3. Failure: results independent of chunk_size (@test-verb-do.R#52) 
      4. Failure: results independent of chunk_size (@test-verb-do.R#53) 
      5. Failure: results independent of chunk_size (@test-verb-do.R#54) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# describedata

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/describedata
* Date/Publication: 2019-08-02 11:50:02 UTC
* Number of recursive dependencies: 55

Run `revdep_details(,"describedata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘describedata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gladder
    > ### Title: Replica of Stata's gladder function
    > ### Aliases: gladder
    > 
    > ### ** Examples
    > 
    > gladder(iris$Sepal.Length)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# diffdf

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/diffdf
* URL: https://github.com/gowerc/diffdf
* BugReports: https://github.com/gowerc/diffdf/issues
* Date/Publication: 2019-03-12 12:16:21 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"diffdf")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 557 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 11 ]
      1. Failure: (unknown) (@test-print_output.R#51) 
      2. Failure: (unknown) (@test-print_output.R#51) 
      3. Failure: (unknown) (@test-print_output.R#51) 
      4. Failure: (unknown) (@test-print_output.R#51) 
      5. Failure: (unknown) (@test-print_output.R#51) 
      6. Failure: (unknown) (@test-print_output.R#51) 
      7. Failure: (unknown) (@test-print_output.R#51) 
      8. Failure: (unknown) (@test-print_output.R#51) 
      9. Failure: (unknown) (@test-print_output.R#51) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dotwhisker

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/dotwhisker
* BugReports: https://github.com/fsolt/dotwhisker/issues
* Date/Publication: 2018-06-27 19:19:32 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"dotwhisker")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # Generate a tidy data frame of regression results from six models
    > 
    > m <- list()
    > ordered_vars <- c("wt", "cyl", "disp", "hp", "gear", "am")
    > m[[1]] <- lm(mpg ~ wt, data = mtcars)
    > m123456_df <- m[[1]] %>% tidy %>% by_2sd(mtcars) %>%
    +   mutate(model = "Model 1")
    > 
    > for (i in 2:6) {
    +  m[[i]] <- update(m[[i-1]], paste(". ~ . +", ordered_vars[i]))
    +  m123456_df <- rbind(m123456_df, m[[i]] %>% tidy %>% by_2sd(mtcars) %>%
    +    mutate(model = paste("Model", i)))
    + }
    > 
    > # Generate a 'small multiple' plot
    > small_multiple(m123456_df)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# dplyr

<details>

* Version: 0.8.3
* Source code: https://github.com/cran/dplyr
* URL: http://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr
* BugReports: https://github.com/tidyverse/dplyr/issues
* Date/Publication: 2019-07-04 15:50:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"dplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [38;5;250m4[39m  21       6  160    110  3.9   2.88  17.0     0     1     4     4
    [38;5;250m5[39m  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
    [38;5;250m6[39m  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
    > 
    > models <- by_cyl %>% do(mod = lm(mpg ~ disp, data = .))
    > models
    Source: local data frame [3 x 2]
    Groups: <by row>
    
    [38;5;246m# A tibble: 3 x 2[39m
        cyl mod         
    [38;5;250m*[39m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<named list>[39m[23m
    [38;5;250m1[39m     4 [38;5;246m<list [3]>[39m  
    [38;5;250m2[39m     6 [38;5;246m<list [3]>[39m  
    [38;5;250m3[39m     8 [38;5;246m<list [3]>[39m  
    > 
    > summarise(models, rsq = summary(mod)$r.squared)
    Error in summary(mod)$r.squared : 
      $ operator is invalid for atomic vectors
    Calls: summarise -> summarise.tbl_df -> summarise_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1.  Failure: coercion doesn't copy vars (@test-copying.R#7) 
      2.  Failure: coercion doesn't copy vars (@test-copying.R#8) 
      3.  Error: named argument become list columns (@test-do.R#47) 
      4.  Failure: grouped do evaluates args in correct environment (@test-do.R#93) 
      5.  Failure: empty data frames give consistent outputs (@test-do.R#175) 
      6.  Failure: empty data frames give consistent outputs (@test-do.R#197) 
      7.  Failure: mutate does not strip names of list-columns (#2675) (@test-mutate.r#297) 
      8.  Error: mutate(rowwise_df) makes a rowwise_df (#463) (@test-mutate.r#332) 
      9.  Error: hybrid rank functions handle NA (#4427) (@test-mutate.r#484) 
      10. Error: rbind_all creates tbl_df object (@test-rbind.R#153) 
      
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

* Version: 7.6.1
* Source code: https://github.com/cran/drake
* URL: https://github.com/ropensci/drake
* BugReports: https://github.com/ropensci/drake/issues
* Date/Publication: 2019-08-19 18:00:08 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"drake")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   fit = lm(Sepal.Width ~ Petal.Width + Species, data)
    + )
    > file <- tempfile()
    > # Turn the plan into an R script a the given file path.
    > plan_to_code(plan, file)
    Loading required namespace: styler
    Error: Vector of length 6 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─drake::plan_to_code(plan, file)
    [90m  2. [39m│ ├─base::writeLines(text = plan_to_text(plan), con = con) [90m00_pkg_src/drake/R/drake_plan_helpers.R:828:2[39m
    [90m  3. [39m│ └─drake:::plan_to_text(plan) [90m00_pkg_src/drake/R/drake_plan_helpers.R:828:2[39m
    [90m  4. [39m│   └─styler::style_text(text) [90m00_pkg_src/drake/R/drake_plan_helpers.R:898:4[39m
    [90m  5. [39m│     └─styler:::transformer(text)
    [90m  6. [39m│       └─`%>%`(...)
    [90m  7. [39m│         ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  8. [39m│         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  9. [39m│           └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m 10. [39m│             └─styler:::`_fseq`(`_lhs`)
    [90m 11. [39m│             
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      39: `[<-`(`*tmp*`, attributes, value = list(NULL, NULL, NULL, NULL, NULL, NULL))
      40: `[<-.tbl_df`(`*tmp*`, attributes, value = list(NULL, NULL, NULL, NULL, NULL, NULL))
      41: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      42: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      43: stop_recycle_incompatible_size(x_size = 6L, size = 1L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      44: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      45: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 3846 | SKIPPED: 227 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: drake_plan_source() with character columns (@test-plans.R#488) 
      
      Error: testthat unit tests failed
      Execution halted
      Error while shutting down parallel: unable to terminate some child processes
    ```

# dssd

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/dssd
* BugReports: https://github.com/DistanceDevelopment/dssd/issues
* Date/Publication: 2019-08-05 13:00:02 UTC
* Number of recursive dependencies: 45

Run `revdep_details(,"dssd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > #Point transect example
    > shapefile.name <- system.file("extdata", "TrackExample.shp", package = "dssd")
    > region <- make.region(region.name = "study area",
    +                      shape = shapefile.name)
    Error: `x` must be a vector, not a `sfc_POLYGON/sfc` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─dssd::make.region(region.name = "study area", shape = shapefile.name)
    [90m  2. [39m│ └─sf::read_sf(shape) [90m00_pkg_src/dssd/R/Class.Constructors.R:70:6[39m
    [90m  3. [39m│   ├─sf::st_read(...)
    [90m  4. [39m│   └─sf:::st_read.character(...)
    [90m  5. [39m│     └─sf:::process_cpl_read_ogr(...)
    [90m  6. [39m│       ├─base::`[[<-`(...)
    [90m  7. [39m│       └─tibble:::`[[<-.tbl_df`(...)
    [90m  8. [39m│         └─tibble:::tbl_extract2_assign(x, j = i, value)
    [90m  9. [39m│           └─vctrs::vec_recycle(value, vec_size(x))
    [90m 10. [39m└─vctrs:::stop_scalar_type(...)
    [90m 11. [39m  └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

# easyalluvial

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-04-01 11:20:12 UTC
* Number of recursive dependencies: 129

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
      [ OK: 22 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 16 ]
      1. Error: alluvial_long (@test_alluvial_long.R#13) 
      2. Error: get_data_space (@test_alluvial_model_response.R#12) 
      3. Error: pdp_methods (@test_alluvial_model_response.R#36) 
      4. Error: alluvial_model_response (@test_alluvial_model_response.R#58) 
      5. Error: alluvial_model_response_caret (@test_alluvial_model_response.R#182) 
      6. Error: params_bin_numeric_pred (@test_alluvial_model_response.R#225) 
      7. Error: n_feats == degree (@test_alluvial_model_response.R#256) 
      8. Error: alluvial_wide (@test_alluvial_wide.R#11) 
      9. Error: manip_bin_numerics (@test_manip.R#27) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# egor

<details>

* Version: 0.19.1
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2019-02-01 16:43:22 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"egor")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 0.333333333333333, 1, 1, 1, 0.666666666666667, 0.666666666666667)), row.names = c(NA, 
                 -98L), class = "data.frame")), sexy = structure(1L, .Label = c("m", "w"), class = "factor")), row.names = 4L, class = c("tbl_df", 
             "tbl", "data.frame")), fpc = structure(list(sampsize = structure(32L, .Dim = c(1L, 1L
             ))), class = "survey_fpc"), pps = FALSE), class = c("survey.design2", "survey.design"
         )), alter_design = list(max = Inf), row.names = c(NA, -1L), class = c("egor", "tbl_df", "tbl", 
         "data.frame"))) at testthat/test_ei.R:88
      3: tbl_extract_assign2(x, i, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:363
      4: vec_as_index(i, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:368
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 70 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: comp_ei handles extreme values (only one group in alts) correctly (@test_ei.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# emuR

<details>

* Version: 2.0.2
* Source code: https://github.com/cran/emuR
* URL: https://github.com/IPS-LMU/emuR
* BugReports: https://github.com/IPS-LMU/emuR/issues
* Date/Publication: 2019-07-22 21:20:06 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"emuR")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        |=================================================================     |  93%
        |                                                                            
        |======================================================================| 100%
      Read 16 items
      Read 12 records
      Read 24 items
      Read 20 records
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 789 | SKIPPED: 40 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: export_seglistToTxtCollection works (@test_emuR-emuRsegs.R#31) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

# etl

<details>

* Version: 0.3.7
* Source code: https://github.com/cran/etl
* URL: http://github.com/beanumber/etl
* BugReports: https://github.com/beanumber/etl/issues
* Date/Publication: 2017-09-27 20:30:40 UTC
* Number of recursive dependencies: 110

Run `revdep_details(,"etl")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Content type 'text/plain; charset=utf-8' length 395 bytes
      ==================================================
      downloaded 395 bytes
      
      trying URL 'https://www.reddit.com/robots.txt'
      Content type 'text/plain; charset=utf-8' length 791 bytes
      ==================================================
      downloaded 791 bytes
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 28 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: default works (@test-etl.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'macleish', 'MonetDBLite'
    ```

# eurostat

<details>

* Version: 3.3.5
* Source code: https://github.com/cran/eurostat
* URL: https://ropengov.github.io/eurostat
* BugReports: https://github.com/ropengov/eurostat/issues
* Date/Publication: 2019-04-11 12:15:20 UTC
* Number of recursive dependencies: 129

Run `revdep_details(,"eurostat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    please contact EuroGeographics for 
    information regarding their licence agreements.
              
    No encoding supplied: defaulting to UTF-8.
    Error: Vector of length 7 cannot be recycled to length 363. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─eurostat::get_eurostat_geospatial(...)
    [90m  2. [39m│ ├─broom::tidy(nuts_sp) [90m00_pkg_src/eurostat/R/get_eurostat_geospatial.R:174:6[39m
    [90m  3. [39m│ └─broom:::tidy.SpatialPolygonsDataFrame(nuts_sp)
    [90m  4. [39m│   └─purrr::map_df(x@polygons, tidy)
    [90m  5. [39m│     └─purrr::map(.x, .f, ...)
    [90m  6. [39m│       ├─generics:::.f(.x[[i]], ...)
    [90m  7. [39m│       └─broom:::tidy.Polygons(.x[[i]], ...)
    [90m  8. [39m│         ├─base::within(...)
    [90m  9. [39m│         └─base::within.data.frame(...)
    [90m 10. [39m│           ├─base::`[<-`(...)
    [90m 11. [39m│           └─tibble:::`[<-.tbl_df`(...)
    [90m 12. [39m│             └─tibble:::tbl_extract_assign(x, j, value)
    [90m 13. [39m│               └─vctrs::vec_recycle(
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
         NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
         NA, NA, NA, NA, NA, NA), .Label = c("e", "b"), class = "factor"))) at /home/rstudio/tibble/revdep/checks/eurostat/new/eurostat.Rcheck/00_pkg_src/eurostat/R/tidy_eurostat.R:73
      5: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      6: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      7: stop_recycle_incompatible_size(x_size = 4L, size = 950L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      8: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      9: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 4 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-all.R#143) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables("return.labs") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘eurostat’:
     unable to load R code in package ‘RefManageR’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables("return.labs") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘RefManageR’
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
    Error in globalVariables("return.labs") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘RefManageR’
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 595 marked UTF-8 strings
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
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 116 | SKIPPED: 4 | WARNINGS: 2 | FAILED: 13 ]
      1. Error: Higher-level import_spreadsheet functions (@test-import.R#33) 
      2. Error: (unknown) (@test-load-data.R#16) 
      3. Error: SR model works as expected (@test-openfair.R#220) 
      4. Error: (unknown) (@test-reports.R#19) 
      5. Error: Simulation respects maximum ALE (@test-simulate.R#21) 
      6. Failure: Missing mandatory OpenFAIR factors are detected (@test-simulate.R#29) 
      7. Failure: Bad scenario parameters throw an error (@test-simulate.R#36) 
      8. Failure: Multiple simulations deprecates the simulation_count parameters (@test-simulate.R#56) 
      9. Error: Simulation summary handles NAs for tc/diff exceedance (@test-summarize.R#17) 
      1. ...
      
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
* Number of recursive dependencies: 78

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
      [31m──[39m [31m1. Failure: crit as data (@test-cv.R#4) [39m [31m────────────────────────────────────────────[39m
      `capture.output(print(crit))` threw an error.
      Message: Can't slice a scalar
      Class:   simpleError/error/condition
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 258 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
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

# ezplot

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/ezplot
* Date/Publication: 2019-07-20 21:20:03 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"ezplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > library(tsibbledata)
    > library(lubridate)
    
    Attaching package: ‘lubridate’
    
    The following object is masked from ‘package:base’:
    
        date
    
    > bar_plot(ansett, "year(Week)", "Passengers")
    > bar_plot(ansett, "year(Week)", "Passengers", "Class")
    > bar_plot(ansett, "Airports", c("Share of Passengers" = "Passengers"), "Class", position = "fill")
    > bar_plot(ansett, "Airports", "Passengers", "Class", use_theme = ggplot2::theme_bw)
    > bar_plot(ansett, "Airports", "Passengers", "Class", reorder = NULL, label_pos = "both")
    > bar_plot(ansett, "sub('-.*', '', Airports)", c("Total Passengers" = "Passengers"),
    +          "Class",
    +          "sub('.*-', '', Airports)")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in setMethod("plot", signature(x = "performance", y = "missing"),  : 
      no existing definition for function ‘plot’
    ```

# fabletools

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/fabletools
* URL: http://fabletools.tidyverts.org/
* BugReports: https://github.com/tidyverts/fabletools/issues
* Date/Publication: 2019-08-08 14:30:02 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"fabletools")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: x[i, j] at /home/rstudio/tibble/revdep/checks/fabletools/new/fabletools.Rcheck/00_pkg_src/fabletools/R/utils.R:170
      8: `[.tbl_ts`(x, i, j) at /home/rstudio/tibble/revdep/checks/fabletools/new/fabletools.Rcheck/00_pkg_src/fabletools/R/utils.R:170
      9: NextMethod()
      10: `[.tbl_df`(x, i, j)
      11: slice_df(x, i, j, drop = drop) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:225
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 104 | SKIPPED: 23 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: autoplot.tbl_ts() (@test-graphics.R#59) 
      2. Error: Model parsing variety (@test-parser.R#5) 
      3. Error: Model parsing scope (@test-parser.R#58) 
      4. Error: Model response identification (@test-parser.R#113) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(c(".", ".gaps")) : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘fabletools’:
     unable to load R code in package ‘tsibble’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables(c(".", ".gaps")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘tsibble’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error in globalVariables(c(".", ".gaps")) : 
      could not find function "globalVariables"
    Error:  unable to load R code in package ‘tsibble’
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: 'fable', 'feasts'
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
    Error in globalVariables(c(".", ".gaps")) : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘tsibble’
    Execution halted
    ```

# fastqcr

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/fastqcr
* URL: http://www.sthda.com/english/rpkgs/fastqcr/
* BugReports: https://github.com/kassambara/fastqcr/issues
* Date/Publication: 2019-01-03 00:20:16 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"fastqcr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Reading: /home/rstudio/tibble/revdep/checks/fastqcr/new/fastqcr.Rcheck/fastqcr/fastqc_results/S1_fastqc.zip
    Reading: /home/rstudio/tibble/revdep/checks/fastqcr/new/fastqcr.Rcheck/fastqcr/fastqc_results/S2_fastqc.zip
    Reading: /home/rstudio/tibble/revdep/checks/fastqcr/new/fastqcr.Rcheck/fastqcr/fastqc_results/S3_fastqc.zip
    Reading: /home/rstudio/tibble/revdep/checks/fastqcr/new/fastqcr.Rcheck/fastqcr/fastqc_results/S4_fastqc.zip
    Reading: /home/rstudio/tibble/revdep/checks/fastqcr/new/fastqcr.Rcheck/fastqcr/fastqc_results/S5_fastqc.zip
    > 
    > # Plot per sequence GC content
    > qc_plot_collection(qc, "Per sequence GC content")
    > 
    > # Per base sequence quality
    > qc_plot_collection(qc, "Per base sequence quality")
    > 
    > # Per sequence quality scores
    > qc_plot_collection(qc, "Per sequence quality scores")
    > 
    > # Per base sequence content
    > qc_plot_collection(qc, "Per base sequence content")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# fgeo.tool

<details>

* Version: 1.2.5
* Source code: https://github.com/cran/fgeo.tool
* URL: https://github.com/forestgeo/fgeo.tool
* BugReports: https://github.com/forestgeo/fgeo.tool/issues
* Date/Publication: 2019-06-17 19:30:03 UTC
* Number of recursive dependencies: 66

Run `revdep_details(,"fgeo.tool")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > library(fgeo.x)
    > 
    > example_path()
     [1] "csv"           "mixed_files"   "rdata"         "rdata_one"    
     [5] "rds"           "taxa.csv"      "tsv"           "vft_4quad.csv"
     [9] "view"          "weird"         "xl"           
    > 
    > file_vft <- example_path("view/vft_4quad.csv")
    > read_vft(file_vft)
    Error: Vector of length 32 cannot be recycled to length 500. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─fgeo.tool::read_vft(file_vft)
    [90m 2. [39m│ └─readr::type_convert(result, col_types = col_types) [90m00_pkg_src/fgeo.tool/R/read_fgeo.R:12:4[39m
    [90m 3. [39m│   ├─base::`[<-`(...)
    [90m 4. [39m│   └─tibble:::`[<-.tbl_df`(...)
    [90m 5. [39m│     └─tibble:::tbl_extract_assign(x, j, value)
    [90m 6. [39m│       └─vctrs::vec_recycle(value, vec_size(x))
    [90m 7. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 32L, size = 500L)
    [90m 8. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      5: stop_recycle_incompatible_size(x_size = 32L, size = 2L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      6: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      7: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 271 | SKIPPED: 9 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: read_vft fails gracefully if data has missing columns (@test-read_fgeo.R#5) 
      2. Error: read_vft guesses tab or comma separated file (@test-read_fgeo.R#12) 
      3. Error: read_vft guesses tab or comma separated file (@test-read_fgeo.R#22) 
      4. Error: read_taxa() guesses tab or comma separated file (@test-read_fgeo.R#53) 
      5. Error: (unknown) (@test-sanitize.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# finalfit

<details>

* Version: 0.9.4
* Source code: https://github.com/cran/finalfit
* URL: https://github.com/ewenharrison/finalfit
* BugReports: https://github.com/ewenharrison/finalfit/issues
* Date/Publication: 2019-07-19 11:00:02 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"finalfit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > colon_s %>%
    +   glmmulti(dependent, explanatory) %>%
    +   boot_predict(newdata, boot_compare = FALSE, R=100, condense=FALSE) -> plot
    > 
    >   library(ggplot2)
    >   theme_set(theme_bw())
    >   plot %>%
    +     ggplot(aes(x = nodes, y = estimate, ymin = estimate_conf.low,
    +         ymax = estimate_conf.high, fill=extent.factor))+
    +       geom_line(aes(colour = extent.factor))+
    +       geom_ribbon(alpha=0.1)+
    +       facet_grid(.~perfor.factor)+
    +       xlab("Number of postive lymph nodes")+
    +       ylab("Probability of death")+
    +       labs(fill = "Extent of tumour", colour = "Extent of tumour")+
    +       ggtitle("Probability of death by lymph node count")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 106 | SKIPPED: 0 | WARNINGS: 15 | FAILED: 17 ]
      1. Error: finalfit.glm with metrics gives data.frame (@test_all_in_one.R#12) 
      2. Error: finalfit mixed with metrics gives data.frame (@test_all_in_one.R#16) 
      3. Error: finalfit.glm with ff_remove_ref gives data.frame (@test_all_in_one.R#24) 
      4. Error: finalfit.glm with metrics gives data.frame (@test_all_in_one.R#47) 
      5. Error: finalfit mixed with metrics gives data.frame (@test_all_in_one.R#51) 
      6. Error: finalfit.glm with metrics gives data.frame (@test_all_in_one.R#55) 
      7. Error: finalfit mixed with metrics gives data.frame (@test_all_in_one.R#59) 
      8. Error: finalfit.glm with metrics gives list (@test_all_in_one.R#85) 
      9. Error: finalfit mixed with metrics gives list (@test_all_in_one.R#89) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking for missing documentation entries ... ERROR
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

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘finalfit’:
     unable to load R code in package ‘Hmisc’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘Hmisc’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
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
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
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
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rstan’
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

*   checking foreign function calls ... NOTE
    ```
    ...
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
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘Hmisc’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
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
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# fingertipscharts

<details>

* Version: 0.0.8
* Source code: https://github.com/cran/fingertipscharts
* BugReports: https://github.com/PublicHealthEngland/fingertipscharts/issues
* Date/Publication: 2019-07-18 16:30:02 UTC
* Number of recursive dependencies: 135

Run `revdep_details(,"fingertipscharts")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      19: as_tibble(data, .name_repair = "check_unique")
      20: as_tibble.data.frame(data, .name_repair = "check_unique") at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:83
      21: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:99
      22: lst_to_tibble(x, .rows, .name_repair, col_lengths(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:121
      23: check_valid_cols(x) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:126
      24: abort(error_column_must_be_vector(names_x[is_xd], classes)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:151
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 7 | SKIPPED: 26 | WARNINGS: 11 | FAILED: 3 ]
      1. Error: area profiles with domains draws correctly (@test-area-profiles.R#195) 
      2. Error: (unknown) (@test-examples.R#117) 
      3. Error: (unknown) (@test-map.R#14) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(c("Id", "ParentAreaID", "ParentAreaName", "ParentAreaTypeID",  : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘fingertipscharts’:
     unable to load R code in package ‘fingertipsR’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables(c("Id", "ParentAreaID", "ParentAreaName", "ParentAreaTypeID",  : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘fingertipsR’
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
    Error in globalVariables(c("Id", "ParentAreaID", "ParentAreaName", "ParentAreaTypeID",  : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘fingertipsR’
    Execution halted
    ```

# flatr

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/flatr
* Date/Publication: 2017-11-16 09:49:33 UTC
* Number of recursive dependencies: 27

Run `revdep_details(,"flatr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     Lung ~ Smoking
    +     ,family = binomial
    +     ,data = .
    +   )
    > 
    > goodness_of_fit(model = lung_logit, type = "Chisq")
    Error: Vector of length 2 cannot be recycled to length 8419. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─flatr::goodness_of_fit(model = lung_logit, type = "Chisq")
    [90m  2. [39m│ └─data %>% select(-Response) %>% unique() %>% tally() %>% as.numeric() [90m00_pkg_src/flatr/R/goodness_of_fit.R:80:4[39m
    [90m  3. [39m│   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m│       └─flatr:::`_fseq`(`_lhs`)
    [90m  7. [39m│         └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m│           └─function_list[[i]](value)
    [90m  9. [39m│             ├─base::unique(.)
    [90m 10. [39m│             └─base::unique.data.frame(.)
    [90m 11. [39m│               ├─x[!duplicated(x, fromLast = fromLast,
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 3, 3, 3, 3, 3, 3, 
         3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3)))
      29: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      30: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      31: stop_recycle_incompatible_size(x_size = 2L, size = 8419L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      32: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      33: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 3 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: Test Statistic matches what is expected (@test-goodness_of_fit.R#4) 
      2. Error: Degrees of freedom is what is expected (@test-goodness_of_fit.R#19) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# foieGras

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/foieGras
* Date/Publication: 2019-07-03 22:40:04 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"foieGras")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > fit <- fit_ssm(ellie, model = "rw", time.step = 24)
    
    prefiltering data...
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─foieGras::fit_ssm(ellie, model = "rw", time.step = 24)
    [90m  2. [39m│ └─`%>%`(...) [90m00_pkg_src/foieGras/R/fit_ssm.R:94:2[39m
    [90m  3. [39m│   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m│       └─foieGras:::`_fseq`(`_lhs`)
    [90m  7. [39m│         └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m│           ├─base::withVisible(function_list[[k]](value))
    [90m  9. [39m│           └─function_list[[k]](value)
    [90m 10. [39m│             ├─dplyr::do(...)
    [90m 11. [39m│             └─dplyr:::do.grouped_df(...)
    [90m 12. [39m│               └─rlang::eval_tidy(args[[j]], mask)
    [90m 13. [39m├─foieGras::prefilter(...)
    [90m 14. 
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             epsg = NA_integer_, proj4string = NA_character_), class = "crs"), bbox = structure(c(xmin = 70.36366, 
         ymin = -66.80241, xmax = 110.71693, ymax = -49.34699), class = "bbox"), class = c("sfc_POINT", 
         "sfc"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      12: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      13: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: (unknown) (@test-fit_ssm.R#13) 
      2. Error: (unknown) (@test-grab.R#6) 
      3. Error: (unknown) (@test-plot.R#6) 
      4. Error: (unknown) (@test-prefilter.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 29.8Mb
      sub-directories of 1Mb or more:
        libs  28.9Mb
    ```

# forestmangr

<details>

* Version: 0.9.1
* Source code: https://github.com/cran/forestmangr
* URL: https://github.com/sollano/forestmangr#readme
* BugReports: https://github.com/sollano/forestmangr/issues
* Date/Publication: 2019-01-02 23:10:27 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"forestmangr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    3384 14.8014097   5.00
    3385 13.6873251   4.00
    3386 13.2098603   4.00
    3387 12.0957757   4.00
    3388 11.1408460   4.00
    3389  9.8676065   4.00
    3390  8.5943669   4.00
    3391  7.3211274   3.00
    3392  5.7295780   3.00
    3393  4.1380285   2.00
    > 
    > # Get the data's average tree curve inserting the section diameter and height, total height
    > # and dbh variables: 
    > average_tree_curve(df = exfm7, d = "di_wb", dbh = "DBH", h = "hi", th = "TH")
    > 
    > # It's possible to get the average tree curve of each strata with the facet argument:
    > average_tree_curve(df = exfm7, d = "di_wb", dbh = "DBH", h = "hi", th = "TH", facet = "STRATA")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
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

# gapminder

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/gapminder
* URL: https://github.com/jennybc/gapminder, http://www.gapminder.org/data/, https://doi.org/10.5281/zenodo.594018
* BugReports: https://github.com/jennybc/gapminder/issues
* Date/Publication: 2017-10-31 13:25:11 UTC
* Number of recursive dependencies: 45

Run `revdep_details(,"gapminder")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + ggplot(gap_bit, aes(x = gdpPercap, y = lifeExp, size = pop)) +
    +   scale_x_log10(limits = c(150, 115000)) + ylim(c(16, 96)) +
    +   geom_point(pch = 21, color = 'grey20', show_guide = FALSE) +
    +   scale_size_area(max_size = 40) +
    +   facet_wrap(~ continent) + coord_fixed(ratio = 1/43) +
    +   aes(fill = country) + scale_fill_manual(values = country_colors) +
    +   theme_bw() + theme(strip.text = element_text(size = rel(1.1)))
    + }
    Loading required package: ggplot2
    Error: Vector of length 2 cannot be recycled to length 60. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─base::droplevels(subset(gapminder, country %in% h_countries))
    [90m 2. [39m├─base::droplevels.data.frame(subset(gapminder, country %in% h_countries))
    [90m 3. [39m│ ├─base::`[<-`(...)
    [90m 4. [39m│ └─tibble:::`[<-.tbl_df`(...)
    [90m 5. [39m│   └─tibble:::tbl_extract_assign(x, j, value)
    [90m 6. [39m│     └─vctrs::vec_recycle(value, vec_size(x))
    [90m 7. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 60L)
    [90m 8. [39m  └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# genio

<details>

* Version: 1.0.10
* Source code: https://github.com/cran/genio
* URL: https://github.com/OchoaLab/genio
* BugReports: https://github.com/OchoaLab/genio/issues
* Date/Publication: 2019-05-28 21:01:22 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"genio")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # write data into new BED/BIM/FAM files
    > file_out <- tempfile('delete-me-example')
    > write_plink(file_out, X, bim, fam)
    Writing: /tmp/RtmpGwyy86/delete-me-example1e73634e92df1.bed
    Writing: /tmp/RtmpGwyy86/delete-me-example1e73634e92df1.fam
    Error: Vector of length 6 cannot be recycled to length 10. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─genio::write_plink(file_out, X, bim, fam)
    [90m  2. [39m│ └─genio::write_fam(file, fam, verbose = verbose) [90m00_pkg_src/genio/R/write_plink.R:125:4[39m
    [90m  3. [39m│   └─genio:::write_tab_generic(...) [90m00_pkg_src/genio/R/write_fam.R:44:4[39m
    [90m  4. [39m│     └─readr::write_tsv(tib, file, col_names = FALSE) [90m00_pkg_src/genio/R/write_tab_generic.R:27:4[39m
    [90m  5. [39m│       └─readr::write_delim(...)
    [90m  6. [39m│         ├─base::`[<-`(...)
    [90m  7. [39m│         └─tibble:::`[<-.tbl_df`(...)
    [90m  8. [39m│           └─tibble:::tbl_extract_assign(x, j, value)
    [90m  9. [39m│             └─vctrs::vec_recycle(value, vec_size(x))
    [90m 10. [39m└─vctrs:::stop_recycle_incompatible_size(x_size = 6L, size = 10L)
    [90m 11. [39m  └─v
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      12: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 189 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 7 ]
      1. Error: write_fam works (@test-genio.R#319) 
      2. Error: write_bim works (@test-genio.R#369) 
      3. Error: write_ind works (@test-genio.R#419) 
      4. Error: write_snp works (@test-genio.R#469) 
      5. Error: make_fam works (@test-genio.R#525) 
      6. Error: make_bim works (@test-genio.R#567) 
      7. Error: write_plink works (@test-write_bed.R#173) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# getTBinR

<details>

* Version: 0.6.1
* Source code: https://github.com/cran/getTBinR
* URL: https://www.samabbott.co.uk/getTBinR, https://github.com/seabbs/getTBinR
* BugReports: https://github.com/seabbs/getTBinR/issues
* Date/Publication: 2019-06-05 09:50:02 UTC
* Number of recursive dependencies: 143

Run `revdep_details(,"getTBinR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > 
    > ## Get the WHO TB burden data and the data dictionary
    > tb_burden <- get_tb_burden()
    Loading data from: /tmp/RtmpRrnHkr/tb_burden.rds
    Loading data from: /tmp/RtmpRrnHkr/mdr_tb.rds
    Joining TB burden data and MDR TB data.
    > dict <- get_data_dict()
    Loading data from: /tmp/RtmpRrnHkr/dictionary.rds
    > 
    > ## Get a random sample of 9 countries
    > sample_countries <- sample(unique(tb_burden$country), 9)
    > 
    > ## Plot incidence rates in these countries
    > plot_tb_burden(df = tb_burden, dict = dict, facet = "country", countries = sample_countries)
    1 results found for your variable search for e_inc_100k
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# ggdag

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/ggdag
* URL: https://ggdag.netlify.com https://github.com/malcolmbarrett/ggdag
* BugReports: https://github.com/malcolmbarrett/ggdag/issues
* Date/Publication: 2018-03-27 19:13:32 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"ggdag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > tidy_dagitty(dag) %>% dag_adjustment_sets()
    [38;5;246m# A tibble: 36 x 10[39m
       name      x     y direction to     xend  yend circular adjusted   set       
       [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<fct>[39m[23m     [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<lgl>[39m[23m    [3m[38;5;246m<chr>[39m[23m      [3m[38;5;246m<chr>[39m[23m     
    [38;5;250m 1[39m v      23.5  16.9 ->        z1     22.6  16.0 FALSE    unadjusted w1, w2, z2
    [38;5;250m 2[39m v      23.5  16.9 ->        z2     24.5  15.9 FALSE    unadjusted w1, w2, z2
    [38;5;250m 3[39m w1     23.4  15.1 ->        x      22.5  14.7 FALSE    adjusted   w1, w2, z2
    [38;5;250m 4[39m w1     23.4  15.1 ->        y      23.9  14.6 FALSE    adjusted   w1, w2, z2
    [38;5;250m 5[39m w1     23.4  15.1 ->        z1     22.6  16.0 FALSE    adjusted   w1, w2, z2
    [38;5;250m 6[39m w1     23.4  15.1 <->       w2     24.8  14.9 FALSE    adjusted   w1, w2, z2
    [38;5;250m 7[39m w2     24.8  14.9 ->        y      23.9  14.6 FALSE    adjusted   w1, w2, z2
    [38;5;250m 8[39m w2     24.8  14.9 ->        z2     24.5  15.9 FALSE    adjusted   w1, w2, z2
    [38;5;250m 9[39m x      22.5  14.7 ->        y      23.9  14.6 FALSE    unadjusted w1, w2, z2
    [38;5;250m10[39m z1     22.6  16.0 ->        x      22.5  14.7 FALSE    unadjusted w1, w2, z2
    [38;5;246m# … with 26 more rows[39m
    > 
    > ggdag_adjustment_set(dag)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggforce’ ‘plyr’
      All declared Imports should be used.
    ```

# ggdistribute

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/ggdistribute
* URL: https://github.com/iamamutt/ggdistribute
* Date/Publication: 2018-11-15 19:10:04 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"ggdistribute")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggdistribute-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: label_plot
    > ### Title: Add labels to existing plot
    > ### Aliases: label_plot
    > 
    > ### ** Examples
    > 
    > example_plot()
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# ggfortify

<details>

* Version: 0.4.7
* Source code: https://github.com/cran/ggfortify
* URL: https://github.com/sinhrks/ggfortify
* BugReports: https://github.com/sinhrks/ggfortify/issues
* Date/Publication: 2019-05-26 05:20:05 UTC
* Number of recursive dependencies: 113

Run `revdep_details(,"ggfortify")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggfortify-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autoplot.aareg
    > ### Title: Autoplot 'survival::aareg'
    > ### Aliases: autoplot.aareg
    > 
    > ### ** Examples
    > 
    > library(survival)
    > autoplot(aareg(Surv(time, status) ~ age + sex + ph.ecog, data = lung, nmin = 1))
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# gghighlight

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/gghighlight
* URL: https://github.com/yutannihilation/gghighlight/
* BugReports: https://github.com/yutannihilation/gghighlight/issues
* Date/Publication: 2018-07-04 08:10:03 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"gghighlight")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: f(...)
      8: join_keys(facet_vals, layout, by = names(vars))
      9: id(joint, drop = TRUE)
      10: id_var(.variables[[1]], drop = drop)
      11: sort(unique(x), na.last = TRUE)
      12: sort.default(unique(x), na.last = TRUE)
      13: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      14: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 174 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: gghighligt_line() works with facets (@test-gghighligt_old_line.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gginnards

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/gginnards
* URL: https://www.r4photobiology.info, https://bitbucket.org/aphalo/gginnards
* BugReports: https://bitbucket.org/aphalo/gginnards/issues
* Date/Publication: 2019-03-25 08:50:14 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"gginnards")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # which vars are in the data member
    > data_vars(p)
     [1] "manufacturer" "model"        "displ"        "year"         "cyl"         
     [6] "trans"        "drv"          "cty"          "hwy"          "fl"          
    [11] "class"       
    > data_vars(p.dp)
    [1] "year"  "cty"   "hwy"   "class"
    > 
    > # which variables in data are used in the plot
    > mapped_vars(p)
    [1] "year"  "cty"   "hwy"   "class"
    > mapped_vars(p.dp)
    [1] "year"  "cty"   "hwy"   "class"
    > 
    > # the plots identical
    > p
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# ggplot2

<details>

* Version: 3.2.1
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Date/Publication: 2019-08-10 22:30:13 UTC
* Number of recursive dependencies: 142

Run `revdep_details(,"ggplot2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + ggplot(seal2,  aes(x = long, y = lat)) +
    +   annotation_map(usamap, fill = "NA", colour = "grey50") +
    +   geom_segment(aes(xend = long + delta_long, yend = lat + delta_lat)) +
    +   facet_grid(latr ~ longr, scales = "free", space = "free")
    + }
    Warning: Row indexes must be between 0 and the number of rows. Use `NA` as row index to obtain a row full of `NA` values.
    [90mThis warning is displayed once per session.[39m
    Error: Vector of length 2 cannot be recycled to length 60. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─(function (x, ...) ...
    [90m  2. [39m├─ggplot2:::print.ggplot(x)
    [90m  3. [39m│ ├─ggplot2::ggplot_build(x) [90m00_pkg_src/ggplot2/R/plot.r:168:2[39m
    [90m  4. [39m│ └─ggplot2:::ggplot_build.ggplot(x) [90m00_pkg_src/ggplot2/R/plot-build.r:24:2[39m
    [90m  5. [39m│   └─layout$setup(data, plot$data, plot$plot_env) [90m00_pkg_src/ggplot2/R/plot-build.r:55:2[39m
    [90m  6. [39m│     └─ggplot2:::f(..., self = self) [90m00_pkg_src/ggplot2/R/ggproto.r:177:4[39m
    [90m  7. [39m│       └─base::lapply(...) [90m00_pkg_src/ggplot2/R/layout.R:51:4[39m
    [90m  8. [39m│         └─ggplot2:::FUN(X[[i]], ...)
    [90m  9. [39m│           └─ggplot2:::f(...) [90m00_pkg_src/ggplot2/R/ggproto.r:179:4[39m
    [90m 10. [39m│             ├─base::`[<-`(...) [90m00_pkg_src/gg
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 918 | SKIPPED: 99 | WARNINGS: 1 | FAILED: 60 ]
      1. Failure: basic plot builds without error (@test-coord_sf.R#12) 
      2. Error: axis labels are correct for manual breaks (@test-coord_sf.R#38) 
      3. Error: axis labels can be set manually (@test-coord_sf.R#61) 
      4. Error: factors are treated like character labels and are not parsed (@test-coord_sf.R#89) 
      5. Error: expressions can be mixed with character labels (@test-coord_sf.R#117) 
      6. Error: degree labels are automatically parsed (@test-coord_sf.R#173) 
      7. Error: Inf is squished to range (@test-coord_sf.R#194) 
      8. Error: layers with empty data are silently omitted with facet_wrap (@test-empty-data.r#42) 
      9. Error: layers with empty data are silently omitted with facet_grid (@test-empty-data.r#53) 
      1. ...
      
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

# ggpmisc

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/ggpmisc
* URL: https://www.r4photobiology.info, https://bitbucket.org/aphalo/ggpmisc
* BugReports: https://bitbucket.org/aphalo/ggpmisc/issues
* Date/Publication: 2019-04-02 08:30:12 UTC
* Number of recursive dependencies: 66

Run `revdep_details(,"ggpmisc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Select and slice a tibble nested in 'data'
    > ### Aliases: stat_fmt_tb
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    > my.df <- tibble::tibble(x = c(1, 2),
    +                     y = c(0, 4),
    +                     group = c("A", "B"),
    +                     tbs = list(a = tibble::tibble(X = 1:6, Y = rep(c("x", "y"), 3)),
    +                                b = tibble::tibble(X = 1:3, Y = "x")))
    > 
    > ggplot(my.df, aes(x, y, label = tbs)) +
    +   stat_fmt_tb() +
    +   expand_limits(x = c(0,3), y = c(-2, 6))
    Warning in data.frame(fg_params, label = as.vector(label_matrix), stringsAsFactors = FALSE) :
      row names were found from a short variable and have been discarded
    Error in (function (label, parse = FALSE, col = "black", fontsize = 12,  : 
      unused arguments (label.X = dots[[5]][[1]], label.Y = dots[[6]][[1]])
    Calls: <Anonymous> ... <Anonymous> -> gtable_table -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘gginnards’
    ```

# ggspatial

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/ggspatial
* URL: https://github.com/paleolimbot/ggspatial
* BugReports: https://github.com/paleolimbot/ggspatial/issues
* Date/Publication: 2018-12-14 21:10:04 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"ggspatial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: annotation_map_tile GeomMapTile
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > load_longlake_data()
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─ggspatial::load_longlake_data()
    [90m  2. [39m│ └─sf::read_sf(system.file("longlake", package = "ggspatial"), "LongLakeDepthSurvey") [90m00_pkg_src/ggspatial/R/longlake-data.R:17:2[39m
    [90m  3. [39m│   ├─sf::st_read(...)
    [90m  4. [39m│   └─sf:::st_read.character(...)
    [90m  5. [39m│     └─sf:::process_cpl_read_ogr(...)
    [90m  6. [39m│       ├─base::`[[<-`(...)
    [90m  7. [39m│       └─tibble:::`[[<-.tbl_df`(...)
    [90m  8. [39m│         └─tibble:::tbl_extract2_assign(x, j = i, value)
    [90m  9. [39m│           └─vctrs::vec_recycle(value, vec_size(x))
    [90m 10. [39m└─vctrs:::stop_scalar_type(...)
    [90m 11. [39m  └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 23 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 12 ]
      1. Error: north arrow drawing works (@test-annotation-north-arrow.R#4) 
      2. Error: true north arrow points in the right direction (@test-annotation-north-arrow.R#52) 
      3. Error: certain parameters can be passed as aesthetics to show up on different panels (@test-annotation-north-arrow.R#135) 
      4. Error: scale bar parameters are generated correctly (@test-annotation-scale.R#4) 
      5. Error: annotation scale works as intended (@test-annotation-scale.R#44) 
      6. Error: certain parameters can be passed as aesthetics to show up on different panels (@test-annotation-scale.R#164) 
      7. Error: Spatial* objects are fortified correctly (@test-df_spatial.R#29) 
      8. Error: Raster* objects are converted properly by df_spatial (@test-df_spatial.R#106) 
      9. Error: polypath works as intended (@test-geom-polypath.R#4) 
      1. ...
      
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

# ggthemes

<details>

* Version: 4.2.0
* Source code: https://github.com/cran/ggthemes
* URL: http://github.com/jrnold/ggthemes
* BugReports: http://github.com/jrnold/ggthemes
* Date/Publication: 2019-05-13 09:10:03 UTC
* Number of recursive dependencies: 117

Run `revdep_details(,"ggthemes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: cleveland_shape_pal
    > ### Title: Shape palette from Cleveland "Elements of Graphing Data"
    > ###   (discrete).
    > ### Aliases: cleveland_shape_pal
    > 
    > ### ** Examples
    > 
    > ###   (discrete).
    > 
    > 
    > library("ggplot2")
    > p <- ggplot(mtcars) +
    +      geom_point(aes(x = wt, y = mpg, shape = factor(gear))) +
    +      facet_wrap(~am) +
    +      theme_bw()
    > # overlapping symbol palette
    > p + scale_shape_cleveland()
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: f(...)
      15: join_keys(facet_vals, layout, by = names(vars))
      16: id(joint, drop = TRUE)
      17: id_var(.variables[[1]], drop = drop)
      18: sort(unique(x), na.last = TRUE)
      19: sort.default(unique(x), na.last = TRUE)
      20: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      21: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 275 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: theme_few draws correctly (@test-few.R#65) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# glancedata

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/glancedata
* Date/Publication: 2019-05-16 12:50:08 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"glancedata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > plot_numerical_vars(iris, "pairwise")
    Error: Vector of length 2 cannot be recycled to length 16. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─(function (x, ...) ...
    [90m  2. [39m├─GGally:::print.ggmatrix(x)
    [90m  3. [39m│ └─GGally::ggmatrix_gtable(x, ...)
    [90m  4. [39m│   └─GGally:::plot_gtable(pm_fake)
    [90m  5. [39m│     ├─ggplot2::ggplot_gtable(ggplot_build(p))
    [90m  6. [39m│     ├─ggplot2::ggplot_build(p)
    [90m  7. [39m│     └─ggplot2:::ggplot_build.ggplot(p)
    [90m  8. [39m│       └─layout$setup(data, plot$data, plot$plot_env)
    [90m  9. [39m│         └─ggplot2:::f(..., self = self)
    [90m 10. [39m│           └─base::lapply(...)
    [90m 11. [39m│             └─ggplot2:::FUN(X[[i]], ...)
    [90m 12. [39m│               └─ggplot2:::f(...)
    [90m 13. [39m│                 ├─base::`[<-`(...)
    [90m 14. [39m│                 └─tibble:::`[<-.tbl_df`(...)
    [90m 15. [39m
    Execution halted
    ```

# groupedstats

<details>

* Version: 0.0.8
* Source code: https://github.com/cran/groupedstats
* URL: https://indrajeetpatil.github.io/groupedstats/, https://github.com/IndrajeetPatil/groupedstats/
* BugReports: https://github.com/IndrajeetPatil/groupedstats/issues/
* Date/Publication: 2019-08-07 04:50:06 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"groupedstats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   data = iris,
    +   grouping.vars = Species,
    +   measures = Sepal.Length:Petal.Width,
    +   measures.type = "numeric"
    + )
    Error: Vector of length 11 cannot be recycled to length 4. Only vectors of length one or of the same length can be recycled.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─groupedstats::grouped_summary(...)
    [90m  2. [39m│ └─`%>%`(...) [90m00_pkg_src/groupedstats/R/grouped_summary.R:109:2[39m
    [90m  3. [39m│   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m│       └─groupedstats:::`_fseq`(`_lhs`)
    [90m  7. [39m│         └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m│           └─function_list[[i]](value)
    [90m  9. [39m│             ├─dplyr::group_modify(...)
    [90m 10. [39m│             └─dplyr:::group_modify.grouped_df(...)
    [90m 11. [39m│               └─dplyr::group_map(.tbl, fun, ..., keep = keep)
    [90m 12. [39m│                 └─
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         "Whi: 13, Oth: 2, Bla: 2, Not: 0", "Pro: 7, No : 4, Non: 2, Chr: 1", "No : 6, Not: 5, Ref: 4, $20: 1"
         ), ordered = c("FALSE", "FALSE", "FALSE", "FALSE", "FALSE")))
      24: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      25: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      26: stop_recycle_incompatible_size(x_size = 6L, size = 5L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      27: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      28: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════
      [ OK: 72 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: grouped_summary with numeric measures (@test-grouped_summary.R#11) 
      2. Error: grouped_summary with factor measures (@test-grouped_summary.R#67) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking for missing documentation entries ... ERROR
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

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error: package or namespace load failed for ‘groupedstats’:
     unable to load R code in package ‘lme4’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘lme4’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
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
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
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
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
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

*   checking foreign function calls ... NOTE
    ```
    ...
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
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘lme4’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
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
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# haven

<details>

* Version: 2.1.1
* Source code: https://github.com/cran/haven
* URL: http://haven.tidyverse.org, https://github.com/tidyverse/haven, https://github.com/WizardMac/ReadStat
* BugReports: https://github.com/tidyverse/haven/issues
* Date/Publication: 2019-07-04 14:50:03 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"haven")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    # A tibble: 5 x 2
             x1        x2
      <int+lbl> <dbl+lbl>
    1  1 [good]  1 [good]
    2  2         2       
    3  3         3       
    4  4         4       
    5  5 [bad]   9 (NA)  
    > zap_label(df)
    Error: Vector of length 2 cannot be recycled to length 5. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─haven::zap_label(df)
     2. ├─haven:::zap_label.data.frame(df) 00_pkg_src/haven/R/zap_label.R:23:2
     3. │ ├─base::`[<-`(...) 00_pkg_src/haven/R/zap_label.R:39:2
     4. │ └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/haven/R/zap_label.R:39:2
     5. │   └─tibble:::tbl_extract_assign(x, j, value)
     6. │     └─vctrs::vec_recycle(value, vec_size(x))
     7. └─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 5L)
     8.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 139 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 68 ]
      1. Failure: value labels stored as labelled class (@test-read-sav.R#12) 
      2. Failure: value labels stored as labelled class (@test-read-sav.R#13) 
      3. Failure: Old %d format read into Date class (@test-read-stata.R#29) 
      4. Failure: can roundtrip basic types (@test-write-dta.R#5) 
      5. Failure: can roundtrip basic types (@test-write-dta.R#6) 
      6. Failure: can roundtrip basic types (@test-write-dta.R#7) 
      7. Failure: can roundtrip basic types (@test-write-dta.R#8) 
      8. Failure: can roundtrip missing values (as much as possible) (@test-write-dta.R#12) 
      9. Failure: can roundtrip missing values (as much as possible) (@test-write-dta.R#13) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

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
* Number of recursive dependencies: 107

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
             to_arg = to_arg, message = message, .subclass = .subclass)) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:235
      19: withOneRestart(expr, restarts[[1L]])
      20: doWithOneRestart(return(expr), restart)
      21: stop_lossy_cast(x = x, to = to, result = result, locations = locations, details = details, 
             ..., x_arg = x_arg, to_arg = to_arg, message = message, .subclass = .subclass) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:235
      22: stop_vctrs(message, x = x, y = to, to = to, result = result, locations = locations, 
             details = details, ..., .subclass = c(.subclass, "vctrs_error_cast_lossy")) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:275
      23: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
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

* Version: 0.4.0
* Source code: https://github.com/cran/heatwaveR
* URL: https://robwschlegel.github.io/heatwaveR/index.html, https://github.com/robwschlegel/heatwaveR
* BugReports: https://github.com/robwschlegel/heatwaveR/issues
* Date/Publication: 2019-07-11 20:43:03 UTC
* Number of recursive dependencies: 121

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
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 143 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 22 ]
      1. Error: category() returns the correct tibbles and columns (@test-category.R#6) 
      2. Error: The seasons by hemisphere come out correctly (@test-category.R#14) 
      3. Error: The name argument works correctly (@test-category.R#23) 
      4. Error: y = any existing column (@test-category.R#33) 
      5. Error: season splits work under all circumstances (@test-category.R#42) 
      6. Error: y = any existing column (@test-category.R#55) 
      7. Error: climatology = T causes a list output with the time series category data (@test-category.R#60) 
      8. Error: event_line() doesn't fall over (@test-graph_functions.R#13) 
      9. Error: event_line() does not require start and end dates to be provided (@test-graph_functions.R#20) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# heemod

<details>

* Version: 0.10.0
* Source code: https://github.com/cran/heemod
* URL: https://github.com/pierucci/heemod, https://pierucci.org
* BugReports: https://github.com/pierucci/heemod/issues
* Date/Publication: 2019-07-03 14:10:12 UTC
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
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 454 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 13 ]
      1. Error: Exactly match THR model (@test_dmhee.R#291) 
      2. Error: Same results using 1 core or 2. (@test_parallel.R#7) 
      3. Error: we can run construct_part_surv_tib (@test_part_surv.R#298) 
      4. Failure: making part_surv from survival fits works (@test_part_surv.R#366) 
      5. Error: define sensitivity (@test_sensitivity.R#5) 
      6. Error: run sensitivity (@test_sensitivity.R#101) 
      7. Error: discount rate as a parameter works (@test_sensitivity.R#173) 
      8. Error: sensitivity expression inputs (@test_sensitivity.R#236) 
      9. Error: can read multinomial parameters from file (@test_tabular_input.R#110) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# idmodelr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/idmodelr
* URL: http://www.samabbott.co.uk/idmodelr, https://github.com/seabbs/idmodelr
* BugReports: https://github.com/seabbs/idmodelr/issues
* Date/Publication: 2019-08-01 09:20:05 UTC
* Number of recursive dependencies: 123

Run `revdep_details(,"idmodelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > R_0 = 1.1
    > beta = R_0
    > 
    > ##Time for model to run over
    > tbegin = 0
    > tend = 50
    > times <- seq(tbegin, tend, 1)
    > 
    > ##Vectorise input
    > parameters <- as.matrix(c(beta = beta))
    > inits <- as.matrix(c(S = S_0, I = I_0))
    > 
    > sim <- solve_ode(model = SI_ode, inits, parameters, times, as.data.frame = TRUE)
    > 
    > plot_model(sim, facet = FALSE)
    > 
    > plot_model(sim, facet = TRUE)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         -1L), class = c("tbl_df", "tbl", "data.frame")), digits = 0)
      10: `[<-`(`*tmp*`, , value = list(time = 50, S = 0, I = 1e+05))
      11: `[<-.tbl_df`(`*tmp*`, , value = list(time = 50, S = 0, I = 1e+05))
      12: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      13: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      14: stop_recycle_incompatible_size(x_size = 3L, size = 1L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      15: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      16: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 52 | SKIPPED: 40 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-summarise-model.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# INDperform

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/INDperform
* URL: https://github.com/saskiaotto/INDperform
* BugReports: https://github.com/SaskiaAOtto/INDperform/issues
* Date/Publication: 2019-07-13 23:20:03 UTC
* Number of recursive dependencies: 74

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
    > scores_mat <- summary_sc(scores_tbl)$scores_matrix
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 10 whereas the index has size 120.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 461 | SKIPPED: 0 | WARNINGS: 12 | FAILED: 8 ]
      1. Error: (unknown) (@test_clust_sc.R#5) 
      2. Error: (unknown) (@test_dist_sc_group.R#5) 
      3. Error: (unknown) (@test_dist_sc.R#5) 
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

* Version: 0.0.4
* Source code: https://github.com/cran/inspectdf
* URL: http://github.com/alastairrushworth/inspectdf
* BugReports: http://github.com/alastairrushworth/inspectdf/issues
* Date/Publication: 2019-07-27 17:00:02 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"inspectdf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: inspect_types
    > ### Title: Summarise and compare column types in one or two dataframes.
    > ### Aliases: inspect_types
    > 
    > ### ** Examples
    > 
    > data("starwars", package = "dplyr")
    > # get tibble of column types for the starwars data
    > inspect_types(starwars)
    # A tibble: 4 x 4
      type        cnt  pcnt col_name 
      <chr>     <int> <dbl> <list>   
    1 character     7 53.8  <chr [7]>
    2 list          3 23.1  <chr [3]>
    3 numeric       2 15.4  <chr [2]>
    4 integer       1  7.69 <chr [1]>
    > # compare two data frames
    > inspect_types(starwars, starwars[, -1])
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
* Number of recursive dependencies: 80

Run `revdep_details(,"interactions")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ## Will first create a couple dichotomous factors to ensure full rank
    > mpg2 <- mpg
    > mpg2$auto <- "auto"
    > mpg2$auto[mpg2$trans %in% c("manual(m5)", "manual(m6)")] <- "manual"
    > mpg2$auto <- factor(mpg2$auto)
    > mpg2$fwd <- "2wd"
    > mpg2$fwd[mpg2$drv == "4"] <- "4wd"
    > mpg2$fwd <- factor(mpg2$fwd)
    > ## Drop the two cars with 5 cylinders (rest are 4, 6, or 8)
    > mpg2 <- mpg2[mpg2$cyl != "5",]
    > mpg2$cyl <- factor(mpg2$cyl)
    > ## Fit the model
    > fit3 <- lm(cty ~ cyl * fwd * auto, data = mpg2)
    > 
    > # The line geom looks good for an ordered factor predictor
    > cat_plot(fit3, pred = cyl, modx = fwd, mod2 = auto, geom = "line",
    +  interval = TRUE)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 107 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 28 ]
      1. Error: cat_plot does 3-way interactions (bar) (@test_cat_plot.R#150) 
      2. Error: cat_plot does intervals w/ 3-way interactions (bar) (@test_cat_plot.R#156) 
      3. Error: cat_plot does plot.points w/ 3-way interactions (bar) (@test_cat_plot.R#162) 
      4. Error: cat_plot does point.shape w/ 3-way interactions (bar) (@test_cat_plot.R#168) 
      5. Error: cat_plot does 3-way interactions (line) (@test_cat_plot.R#173) 
      6. Error: cat_plot does intervals w/ 3-way interactions (line) (@test_cat_plot.R#179) 
      7. Error: cat_plot does plot.points w/ 3-way interactions (line) (@test_cat_plot.R#185) 
      8. Error: cat_plot does point.shape w/ 3-way interactions (line) (@test_cat_plot.R#191) 
      9. Error: cat_plot does vary.lty w/ 3-way interactions (line) (@test_cat_plot.R#198) 
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
* Number of recursive dependencies: 98

Run `revdep_details(,"ipumsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data <- read_nhgis(
    +   csv_file,
    +   data_layer = contains("pmsa")
    + )
    Use of data from NHGIS is subject to conditions including that users should
    cite the data appropriately. Use command `ipums_conditions()` for more details.
    
    
    Reading data file...
    Error: Vector of length 17 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─ipumsr::read_nhgis(csv_file, data_layer = contains("pmsa"))
     2. │ └─readr::type_convert(data[1, ], col_types = readr::cols()) 00_pkg_src/ipumsr/R/nhgis_read.r:116:2
     3. │   ├─base::`[<-`(...)
     4. │   └─tibble:::`[<-.tbl_df`(...)
     5. │     └─tibble:::tbl_extract_assign(x, j, value)
     6. │       └─vctrs::vec_recycle(value, vec_size(x))
     7. └─vctrs:::stop_recycle_incompatible_size(x_size = 17L, size = 1L)
     8.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 160 | SKIPPED: 11 | WARNINGS: 0 | FAILED: 13 ]
      1. Error: Can read NHGIS extract (data only) (@test_nhgis.r#14) 
      2. Error: Can read NHGIS extract (with shape as sf) (@test_nhgis.r#31) 
      3. Error: Can read NHGIS extract (with shape as sf - 1 layer unzipped) (@test_nhgis.r#54) 
      4. Error: Can read NHGIS extract (with shape as sf - 2 layers unzipped) (@test_nhgis.r#93) 
      5. Error: Can read NHGIS extract (with shape as sp) (@test_nhgis.r#112) 
      6. Error: NHGIS - sf and sp polygon-data relationships didn't get scrambled in import (@test_nhgis.r#133) 
      7. Error: Basic join works (sf) (@test_shape_join.r#5) 
      8. Error: Basic join works (sp) (@test_shape_join.r#18) 
      9. Error: suffix argument works (sf) (@test_shape_join.r#29) 
      1. ...
      
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
* Number of recursive dependencies: 50

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

# jpmesh

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/jpmesh
* URL: https://github.com/uribo/jpmesh#readme
* BugReports: https://github.com/uribo/jpmesh/issues
* Date/Publication: 2019-05-09 07:50:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"jpmesh")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Export meshcode to geometry
    > ### Aliases: export_meshes
    > 
    > ### ** Examples
    > 
    > export_meshes("4128")
    Error: `x` must be a vector, not a `sfc_POLYGON/sfc` object
    Backtrace:
         █
      1. ├─jpmesh::export_meshes("4128")
      2. │ ├─base::`$<-`(...) 00_pkg_src/jpmesh/R/export_mesh.R:53:2
      3. │ └─tibble:::`$<-.tbl_df`(...) 00_pkg_src/jpmesh/R/export_mesh.R:53:2
      4. │   └─tibble:::col_recycle(value, x, name)
      5. │     ├─base::tryCatch(...)
      6. │     │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
      7. │     │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      8. │     │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
      9. │     └─vctrs::vec_recycle(value, vec_size(x))
     10. └─vctrs:::stop_scalar_type(...)
     11.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      19: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      20: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 133 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 7 ]
      1. Error: multiplication works (@test-administration_mesh.R#4) 
      2. Error: neighborhood meshes (@test-find.R#19) 
      3. Error: validate (@test-internal.R#52) 
      4. Error: Input XY sfg (@test-latlong_to_meshcode.R#103) 
      5. Error: return value (@test-neighborhood.R#25) 
      6. Error: success (@test-neighborhood.R#34) 
      7. Error: corners (@test-neighborhood.R#86) 
      
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
* Number of recursive dependencies: 89

Run `revdep_details(,"jpndistrict")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jpndistrict-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: jpn_cities
    > ### Title: Simple features for city area polygons
    > ### Aliases: jpn_cities
    > 
    > ### ** Examples
    > 
    > jpn_cities(jis_code = "08",
    +   admin_name = intToUtf8(c(12388, 12367, 12400, 24066)))
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 8 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 11 ]
      1. Error: (unknown) (@test-export.R#3) 
      2. Error: prefecture (@test-find_city.R#5) 
      3. Error: Failed (@test-find_city.R#38) 
      4. Error: city (@test-find_city.R#49) 
      5. Error: jpn_pref (@test-spdf_jpn.R#4) 
      6. Error: jpn_cities (@test-spdf_jpn.R#66) 
      7. Error: Collect administration offices data (@test-spdf_jpn.R#92) 
      8. Error: Data (@test-util.R#4) 
      9. Error: Administration code varidation (@test-util.R#31) 
      1. ...
      
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

* Version: 0.3.6
* Source code: https://github.com/cran/jstor
* URL: https://github.com/ropensci/jstor, https://ropensci.github.io/jstor/
* BugReports: https://github.com/ropensci/jstor/issues
* Date/Publication: 2018-12-12 23:20:04 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"jstor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # convert and write to file
    > jst_import(file_list, "article", out_path = tmp, .f = jst_get_article,
    +              n_batches = 2, show_progress = FALSE)
    Starting to import 2 file(s).
    Processing chunk 1/2
    Error: Vector of length 19 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─jstor::jst_import(...)
      2. │ └─purrr::pwalk(...) 00_pkg_src/jstor/R/batch_import_fun.R:207:2
      3. │   └─purrr::pmap(.l, .f, ...)
      4. │     └─jstor:::.f(...)
      5. │       └─readr::write_csv(...) 00_pkg_src/jstor/R/batch_import_fun.R:52:4
      6. │         └─readr::write_delim(...)
      7. │           ├─base::`[<-`(...)
      8. │           └─tibble:::`[<-.tbl_df`(...)
      9. │             └─tibble:::tbl_extract_assign(x, j, value)
     10. │               └─vctrs::vec_recycle(value, vec_size(x))
     11. └─vctrs:::stop_recycle_incompatible_size(x_size = 19L, size = 1L)
     12.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ OK: 218 | SKIPPED: 4 | WARNINGS: 6 | FAILED: 16 ]
      1. Failure: authors are correct (@test-books.R#115) 
      2. Error: jst_define_import returns correct class (@test-import-spec.R#4) 
      3. Error: jst_define_import validates input (@test-import-spec.R#11) 
      4. Error: jst_define_imports gives correct results (@test-import-spec.R#46) 
      5. Error: subsetting ngrams works (@test-ngram.R#32) 
      6. Error: writing correct results to file works (@test-writing-to-file.R#21) 
      7. Error: writing to file in parallel works (@test-writing-to-file.R#35) 
      8. Error: not writing column names works (@test-writing-to-file.R#48) 
      9. Error: writing error messages to file works (@test-writing-to-file.R#63) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
      Error while shutting down parallel: unable to terminate some child processes
    ```

# jtools

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/jtools
* URL: https://jtools.jacob-long.com
* BugReports: https://github.com/jacob-long/jtools/issues
* Date/Publication: 2019-04-08 21:30:11 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"jtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Plot simple effects in regression models
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
    Error: `j` must be a vector, not a symbol
    Backtrace:
     1. jtools::effect_plot(model = fit, pred = Murder)
     2. jtools:::plot_effect_continuous(...) 00_pkg_src/jtools/R/effect_plot.R:291:4
     5. tibble:::`[[.tbl_df`(d, pred) 00_pkg_src/jtools/R/effect_plot.R:390:2
     6. tibble:::tbl_extract2(x, i = NULL, j = i)
     7. vctrs::vec_assert(j, size = 1)
     8. vctrs:::stop_scalar_type(x, arg)
     9. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 240 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 37 ]
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

# landscapemetrics

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/landscapemetrics
* URL: https://r-spatialecology.github.io/landscapemetrics/
* BugReports: https://github.com/r-spatialecology/landscapemetrics/issues
* Date/Publication: 2019-08-07 08:20:03 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"landscapemetrics")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘landscapemetrics-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: show_cores
    > ### Title: Show core area
    > ### Aliases: show_cores show_cores.RasterLayer show_cores.RasterStack
    > ###   show_cores.RasterBrick show_cores.stars show_cores.list
    > 
    > ### ** Examples
    > 
    > # show "global" core area
    > show_cores(landscape, class = "global", labels = FALSE)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘stars’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        libs   4.6Mb
        R      1.3Mb
    ```

# LexisNexisTools

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/LexisNexisTools
* URL: https://github.com/JBGruber/LexisNexisTools
* BugReports: https://github.com/JBGruber/LexisNexisTools/issues
* Date/Publication: 2019-07-09 10:40:03 UTC
* Number of recursive dependencies: 123

Run `revdep_details(,"LexisNexisTools")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        |++++++++++++++++++++                              | 40% ~00s          
        |+++++++++++++++++++++++++                         | 50% ~00s          
        |++++++++++++++++++++++++++++++                    | 60% ~00s          
        |+++++++++++++++++++++++++++++++++++               | 70% ~00s          
        |++++++++++++++++++++++++++++++++++++++++          | 80% ~00s          
        |+++++++++++++++++++++++++++++++++++++++++++++     | 90% ~00s          
        |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed = 00s
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 51 | SKIPPED: 3 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Convert LNToutput to SQLite (@test-lnt_convert.R#109) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in packageVersion("quanteda") : 
      could not find function "packageVersion"
    Error: package or namespace load failed for ‘LexisNexisTools’:
     unable to load R code in package ‘quanteda’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in packageVersion("quanteda") : 
      could not find function "packageVersion"
    Error: unable to load R code in package ‘quanteda’
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
    Error in packageVersion("quanteda") : 
      could not find function "packageVersion"
    Error: unable to load R code in package ‘quanteda’
    Execution halted
    ```

# MachineShop

<details>

* Version: 1.5.0
* Source code: https://github.com/cran/MachineShop
* URL: https://brian-j-smith.github.io/MachineShop/
* BugReports: https://github.com/brian-j-smith/MachineShop/issues
* Date/Publication: 2019-08-01 17:30:02 UTC
* Number of recursive dependencies: 183

Run `revdep_details(,"MachineShop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    46                    1.4
    47                    1.4
    48                    1.4
    49                    1.7
    50                    1.7
    51                    1.7
    52                    2.0
    53                    2.0
    54                    2.0
    55                    2.2
    56                    2.2
    57                    2.2
    58                    2.5
    59                    2.5
    60                    2.5
    > plot(pd)
    $Petal.Length
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setClass("CovarianceMatrix", slots = c(covariance = "matrix")) : 
      could not find function "setClass"
    Error: package or namespace load failed for ‘MachineShop’:
     unable to load R code in package ‘coin’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("CovarianceMatrix", slots = c(covariance = "matrix")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘coin’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
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
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
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
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
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

*   checking foreign function calls ... NOTE
    ```
    ...
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
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("CovarianceMatrix", slots = c(covariance = "matrix")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘coin’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
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
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# matsindf

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/matsindf
* URL: https://github.com/MatthewHeun/matsindf
* BugReports: https://github.com/MatthewHeun/matsindf/issues
* Date/Publication: 2019-02-11 16:00:11 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"matsindf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                                   "i1",  "i2",  "i1",  "i2", NA, NA),
    +                   rowtypes  = c( ptype, ptype, ptype, ptype, ptype, itype, itype,
    +                                  ptype, ptype, ptype, ptype, NA, NA),
    +                   coltypes  = c(itype, itype, itype, itype, itype, ptype, ptype,
    +                                 itype, itype, itype, itype, NA, NA),
    +                   vals  = c(    11  ,  22,    11 ,   22 ,   23 ,   11 ,   22 ,
    +                                 11 ,   12 ,   11 ,   22,   0.2, 0.3)) %>%
    +   group_by(Country, Year, matrix)
    > mats <- collapse_to_matrices(tidy, matnames = "matrix", rownames = "row", colnames = "col",
    +                              rowtypes = "rowtypes", coltypes = "coltypes",
    +                              matvals = "vals") %>%
    +   ungroup()
    Warning: Factor `rowtypes` contains implicit NA, consider using `forcats::fct_explicit_na`
    Warning: Factor `coltypes` contains implicit NA, consider using `forcats::fct_explicit_na`
    > expand_to_tidy(mats, matnames = "matrix", matvals = "vals",
    +                      rownames = "rows", colnames = "cols",
    +                      rowtypes = "rt",   coltypes = "ct")
    Error in mat_to_rowcolval(.data[["vals"]][[1L]], rownames = rownames,  : 
      Unknown type of .matrix in mat_to_rowcolval 0.2 of class list and length 7Unknown type of .matrix in mat_to_rowcolval c(11, 0, 0, 22) of class list and length 7Unknown type of .matrix in mat_to_rowcolval c(11, 0, 0, 22) of class list and length 7Unknown type of .matrix in mat_to_rowcolval c(11, 0, 0, 22, 0, 23) of class list and length 7Unknown type of .matrix in mat_to_rowcolval 0.3 of class list and length 7Unknown type of .matrix in mat_to_rowcolval c(11, 12) of class list and length 7Unknown type of .matrix in mat_to_rowcolval c(11, 0, 0, 22) of class list and length 7
    Calls: expand_to_tidy ... <Anonymous> -> do.grouped_df -> eval_tidy -> mat_to_rowcolval
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 12 ]
      1. Failure: small example works as expected (@test_collapse.R#54) 
      2. Failure: small example works as expected (@test_collapse.R#58) 
      3. Error: small example works as expected (@test_collapse.R#62) 
      4. Failure: collapse_to_matrices works as expected (@test_collapse.R#117) 
      5. Failure: collapse_to_matrices works as expected (@test_collapse.R#118) 
      6. Failure: collapse_to_matrices works as expected (@test_collapse.R#121) 
      7. Failure: collapse_to_matrices works as expected (@test_collapse.R#123) 
      8. Failure: collapse_to_matrices works as expected (@test_collapse.R#129) 
      9. Failure: collapse_to_matrices works as expected (@test_collapse.R#131) 
      1. ...
      
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
* Number of recursive dependencies: 134

Run `revdep_details(,"metacoder")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      7: vec_as_index_extract_compat(j, ncol(x), names = names(x), full_column = TRUE) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:394
      8: vec_as_index(j, n) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:437
      
      ── 2. Failure: Parsing the UNITE general release fasta (@test--parsers_and_write
      result$data$tax_data$unite_seq[5] not equal to "CCAAATCATGTCTCCCGGCCGCAAGGCAGGTGCAGGCGTTTAACCCTTTGTGAACCAAAAAACCTTTCGCTTCGGCAGCAGCTCGGTTGGAGACAGCCTCTGTGTCAGCCTGCCGCTAGCACCAATTATCAAAACTTGCGGTTAGCAACATTGTCTGATTACCAAATTTTCGAATGAAAATCAAAACTTTCAACAACGGATCTCTTGGTTCCCGCATCGATGAAGAACGCAGCGAAACGCGATAGTTAATGTGAATTGCAGAATTCAGTGAATCATCGAGTCTTTGAACGCACATTGCGCCCATTGGTATTCCATTGGGCATGTCTGTTTGAGCGTCATTACAACCCTCGGTCACCACCGGTTTTGAGCGAGCAGGGTCTTCGGATCCAGCTGGCTTTAAAGTTGTAAGCTCTGCTGGCTGCTCGGCCCAACCAGAACATAGTAAAATCATGCTTGTTCAAGGTTCGCGGTCGAAGCGGTACGGCCTGAACAATACCTACCACCTCTTAGG".
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 91 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: Converting low counts to zero (@test--calculations.R#186) 
      2. Failure: Parsing the UNITE general release fasta (@test--parsers_and_writers.R#119) 
      
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

# mnreadR

<details>

* Version: 2.1.3
* Source code: https://github.com/cran/mnreadR
* URL: http://legge.psych.umn.edu/mnread-acuity-charts
* Date/Publication: 2019-07-19 10:10:03 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"mnreadR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # restrict dataset to two subject (s1 & s2) and plot the MNREAD curves using TWO GROUPING ARGUMENTS 
    > # (ie. subject and polarity) 
    > data_s2 <- data_low_vision %>%
    +    filter (subject == "s1" | subject == "s2")
    > 
    >  ## Not run:  mnreadCurve(data_s2, ps, vd, rt, err, subject, polarity)  
    > 
    > #------
    > 
    > # Once created, the MNREAD curve can be customized as needed using ggplot2, 
    > # for ex., by adding the number of errors for each sentence on top of the curve
    > 
    > # plot the MNREAD curve 
    > my.plot <- mnreadCurve(data_s1, ps, vd, rt, err, polarity)
    > 
    > # display my.plot
    > print(my.plot)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: print ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# modeldb

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/modeldb
* URL: https://github.com/tidymodels/modeldb
* BugReports: https://github.com/tidymodels/modeldb/issues
* Date/Publication: 2019-07-20 04:20:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"modeldb")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > mtcars %>%
    +   simple_kmeans_db(mpg, qsec, wt) %>%
    +   glimpse()
    Error in write.table(centroids, sfg, row.names = FALSE, col.names = TRUE,  : 
      unimplemented type 'list' in 'EncodeElement'
    Calls: %>% ... write.csv -> eval.parent -> eval -> eval -> write.table
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         30.0666666666667), wt = c(3.07214285714286, 4.05866666666667, 1.873)))
      17: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      18: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      19: stop_recycle_incompatible_size(x_size = 2L, size = 3L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      20: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      21: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 16 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: Specifying variables works (@test_kmeans.R#4) 
      2. Error: Not specifying variables works (@test_kmeans.R#11) 
      3. Error: Centroid argument is accepted (@test_kmeans.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# modelsummary

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/modelsummary
* URL: https://github.com/vincentarelbundock/modelsummary
* BugReports: https://github.com/vincentarelbundock/modelsummary/issues
* Date/Publication: 2019-07-15 10:20:03 UTC
* Number of recursive dependencies: 69

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

# morse

<details>

* Version: 3.2.4
* Source code: https://github.com/cran/morse
* URL: https://cran.r-project.org/package=morse
* BugReports: https://github.com/pveber/morse
* Date/Publication: 2019-06-21 15:00:07 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"morse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: plot.reproData
    > ### Title: Plotting method for 'reproData' objects
    > ### Aliases: plot.reproData
    > ### Keywords: plot
    > 
    > ### ** Examples
    > 
    > # (1) Load the data
    > data(cadmium1)
    > 
    > # (2) Create an object of class 'reproData'
    > cadmium1 <- reproData(cadmium1)
    > 
    > # (3) Plot the reproduction data
    > plot(cadmium1)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# MPTmultiverse

<details>

* Version: 0.2-0
* Source code: https://github.com/cran/MPTmultiverse
* URL: https://github.com/mpt-network/MPTmultiverse
* BugReports: https://github.com/mpt-network/MPTmultiverse/issues
* Date/Publication: 2019-03-11 23:52:42 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"MPTmultiverse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ##D   , core = CORE
    > ##D )
    > ##D 
    > ##D mpt_options(op) ## reset options  
    > ## End(Not run)
    > 
    > load(system.file("extdata", "prospective_memory_example.rda", package = "MPTmultiverse"))
    > 
    > # Although we requested all 10 methods, only 9 worked:
    > fit_all$method
    [1] "asymptotic"         "asymptotic"         "PB/MLE"            
    [4] "NPB/MLE"            "simple"             "simple"            
    [7] "trait"              "trait_uncorrelated" "betacpp"           
    > # Jags variant of beta MPT is missing.
    > 
    > # the returned method has a plot method. For example, for the group-level estimates:
    > plot(fit_all, which = "est")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 6 | SKIPPED: 3 | WARNINGS: 14 | FAILED: 17 ]
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

* Version: 1.0.6
* Source code: https://github.com/cran/mudata2
* URL: https://github.com/paleolimbot/mudata
* BugReports: https://github.com/paleolimbot/mudata/issues
* Date/Publication: 2019-03-16 17:30:09 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"mudata2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mudata2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: alta_lake
    > ### Title: Alta Lake Gravity Core Data
    > ### Aliases: alta_lake
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    > autoplot(alta_lake, y = "depth") + scale_y_reverse()
    Using x = "value"
    Using first 9 facets of 14. Use max_facets = FALSE to plot all facets
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 804 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 15 ]
      1. Error: read/write zip functions work (@test_mudata.io.R#47) 
      2. Error: write zip does not affect working directory (@test_mudata.io.R#58) 
      3. Error: recursive reading is apparent to the user (@test_mudata.io.R#109) 
      4. Error: autodetection of read function filename extension works (@test_mudata.io.R#192) 
      5. Error: invalid objects are not read (@test_mudata.io.R#220) 
      6. Error: retyping on read/write works (@test_mudata.io.R#234) 
      7. Error: mudata_prepare_column and mudata_parse_column are opposites (@test_mudata.io.R#244) 
      8. Error: mudata_prepare_tbl works as intended (@test_mudata.io.R#288) 
      9. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test_mudata.io.R#322) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# NACHO

<details>

* Version: 0.5.6
* Source code: https://github.com/cran/NACHO
* URL: https://mcanouil.github.io/NACHO
* BugReports: https://github.com/mcanouil/NACHO/issues
* Date/Publication: 2019-04-29 19:30:13 UTC
* Number of recursive dependencies: 90

Run `revdep_details(,"NACHO")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: normalise
    > ### Title: normalise
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
      [ OK: 28 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 11 ]
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

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# naniar

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/naniar
* URL: https://github.com/njtierney/naniar
* BugReports: https://github.com/njtierney/naniar/issues
* Date/Publication: 2019-02-15 14:30:03 UTC
* Number of recursive dependencies: 146

Run `revdep_details(,"naniar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     9     8      19  20.1    61     5     9 !NA      !NA       
    10    NA     194   8.6    69     5    10 NA       !NA       
    # … with 143 more rows
    > 
    > aq_shadow <- bind_shadow(airquality)
    > 
    > # explore missing data visually
    > library(ggplot2)
    > 
    > # using the bounded shadow to visualise Ozone according to whether Solar
    > # Radiation is missing or not.
    > 
    > ggplot(data = aq_shadow,
    +        aes(x = Ozone)) +
    +        geom_histogram() +
    +        facet_wrap(~Solar.R_NA,
    +        ncol = 1)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# ncappc

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/ncappc
* Date/Publication: 2018-08-24 20:30:03 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"ncappc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ncappc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ncappc
    > ### Title: Performs NCA calculations and population PK model diagnosis.
    > ### Aliases: ncappc
    > 
    > ### ** Examples
    > 
    > out <- ncappc(obsFile=system.file("extdata","pkdata.csv",package="ncappc"), 
    +   onlyNCA = TRUE,
    +   extrapolate = TRUE,
    +   printOut = FALSE,
    +   evid = FALSE,
    +   psnOut=FALSE)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: ncappc ... dv_vs_idv -> dv.plot -> suppressMessages -> withCallingHandlers
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘bookdown’
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
    ...
    > ### Aliases: JapanPrefMap
    > ### Keywords: Japan Japanese map Japanese Prefecture
    > 
    > ### ** Examples
    > 
    > JapanPrefMap()
    Error: `x` must be a vector, not a `sfc_POLYGON/sfc` object
    Backtrace:
         █
      1. ├─NipponMap::JapanPrefMap()
      2. │ └─sf::read_sf(shp) 00_pkg_src/NipponMap/R/JapanPrefMap.R:9:4
      3. │   ├─sf::st_read(...)
      4. │   └─sf:::st_read.character(...)
      5. │     └─sf:::process_cpl_read_ogr(...)
      6. │       ├─base::`[[<-`(...)
      7. │       └─tibble:::`[[<-.tbl_df`(...)
      8. │         └─tibble:::tbl_extract2_assign(x, j = i, value)
      9. │           └─vctrs::vec_recycle(value, vec_size(x))
     10. └─vctrs:::stop_scalar_type(...)
     11.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
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

# nlrx

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/nlrx
* URL: https://github.com/nldoc/nlrx/
* BugReports: https://github.com/nldoc/nlrx/issues/
* Date/Publication: 2019-03-28 14:20:03 UTC
* Number of recursive dependencies: 89

Run `revdep_details(,"nlrx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > nl <- nl_spatial
    > 
    > # Convert turtle metrics (pxcor/pycor) to spatial point objects:
    > results.sf <- nl_to_points(nl, coords="px")
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
         █
      1. ├─nlrx::nl_to_points(nl, coords = "px")
      2. │ ├─sf::st_as_sf(turtles_dat, coords = which(coord_ind == TRUE)) 00_pkg_src/nlrx/R/nl_to_points.R:78:2
      3. │ └─sf:::st_as_sf.data.frame(...)
      4. │   ├─base::`$<-`(...)
      5. │   └─tibble:::`$<-.tbl_df`(...)
      6. │     └─tibble:::col_recycle(value, x, name)
      7. │       ├─base::tryCatch(...)
      8. │       │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
      9. │       │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     10. │       │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
     11. │       └─vctrs::vec_recycle(value, vec_size(x))
     12. └─vctrs:::stop_scalar_type(...)
     13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         128.096, 71.119, 134.509, 67.884, 113.325, 56.495, 147.513, 92.722), `initial-number-wolves` = c(100.459, 
         84.533, 77.248, 53.789, 64.925, 144.226, 96.077, 114.575, 132.017, 125.765)))
      6: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      7: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      8: stop_recycle_incompatible_size(x_size = 2L, size = 10L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      9: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      10: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 103 | SKIPPED: 8 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: Class setter and getter (@test_class_setget.R#51) 
      2. Error: Simdesign objects are created properly (@test_simdesign_helper.R#67) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# nls.multstart

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/nls.multstart
* Date/Publication: 2018-03-06 19:14:58 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"nls.multstart")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +  geom_point(aes(temp, ln.rate, col = process)) +
    +  facet_wrap(~ growth.temp + flux)
    Error: Vector of length 2 cannot be recycled to length 649. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─(function (x, ...) ...
      2. ├─ggplot2:::print.ggplot(x)
      3. │ ├─ggplot2::ggplot_build(x)
      4. │ └─ggplot2:::ggplot_build.ggplot(x)
      5. │   └─layout$setup(data, plot$data, plot$plot_env)
      6. │     └─ggplot2:::f(..., self = self)
      7. │       └─base::lapply(...)
      8. │         └─ggplot2:::FUN(X[[i]], ...)
      9. │           └─ggplot2:::f(...)
     10. │             ├─base::`[<-`(...)
     11. │             └─tibble:::`[<-.tbl_df`(...)
     12. │               └─tibble:::tbl_extract_assign(x, j, value)
     13. │                 └─vctrs::vec_recycle(value, vec_size(x))
     14. └─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 649L)
     15.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# nullabor

<details>

* Version: 0.3.5
* Source code: https://github.com/cran/nullabor
* URL: http://github.com/dicook/nullabor
* BugReports: http://github.com/dicook/nullabor/issues
* Date/Publication: 2018-09-23 22:20:03 UTC
* Number of recursive dependencies: 114

Run `revdep_details(,"nullabor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nullabor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lineup
    > ### Title: The line-up protocol.
    > ### Aliases: lineup
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    > ggplot(lineup(null_permute('mpg'), mtcars), aes(mpg, wt)) +
    +   geom_point() +
    +   facet_wrap(~ .sample)
    decrypt("jWvm cEOE Kh 8FxKOKFh 00")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking for missing documentation entries ... ERROR
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

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in signature("psi_func") : could not find function "signature"
    Error: package or namespace load failed for ‘nullabor’:
     unable to load R code in package ‘robustbase’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in signature("psi_func") : could not find function "signature"
    Error: unable to load R code in package ‘robustbase’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
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
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
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
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
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

*   checking foreign function calls ... NOTE
    ```
    ...
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
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in signature("psi_func") : could not find function "signature"
    Error: unable to load R code in package ‘robustbase’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
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
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# olsrr

<details>

* Version: 0.5.2
* Source code: https://github.com/cran/olsrr
* URL: https://olsrr.rsquaredacademy.com/, https://github.com/rsquaredacademy/olsrr
* BugReports: https://github.com/rsquaredacademy/olsrr/issues
* Date/Publication: 2018-11-22 17:30:03 UTC
* Number of recursive dependencies: 161

Run `revdep_details(,"olsrr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
             wt    -3.801         1.066       -0.617    -3.565    0.001    -5.985    -1.617 
    ----------------------------------------------------------------------------------------
    > 
    > # if model includes interaction terms set iterm to TRUE
    > ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)
    Error: No variables or terms were selected.
    Backtrace:
         █
      1. ├─olsrr::ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)
      2. └─olsrr:::ols_regress.default(mpg ~ disp * wt, data = mtcars, iterm = TRUE) 00_pkg_src/olsrr/R/ols-regression.R:68:15
      3.   └─olsrr:::reg_comp(object, data, conf.level, iterm, title) 00_pkg_src/olsrr/R/ols-regression.R:109:2
      4.     ├─recipes::prep(standardized, training = data) 00_pkg_src/olsrr/R/ols-regress_compute.R:54:4
      5.     └─recipes:::prep.recipe(standardized, training = data)
      6.       ├─recipes::prep(x$steps[[i]], training = training, info = x$term_info)
      7.       └─recipes:::prep.step_scale(...)
      8.         └─recipes::terms_select(x$terms, info = info)
      9.           └─rlang::with_handlers(...)
     10.             └─base::tryCatch(...)
     11.               └─base:::tryCatchList(expr, classes, parentenv, handlers)
     12.                 └─base:::tryCatchOne(expr, names, parentenv, handlers
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

# pak

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/pak
* URL: https://pak.r-lib.org/
* BugReports: https://github.com/r-lib/pak/issues
* Date/Publication: 2019-02-19 18:50:08 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"pak")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-pkgdepends.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 485 | SKIPPED: 32 | WARNINGS: 11 | FAILED: 33 ]
      1. Error: res_add_df_entries (@test-resolution-df.R#48) 
      2. Error: resolving with a list (@test-resolution.R#20) 
      3. Error: resolving with a tibble (@test-resolution.R#51) 
      4. Error: unknown deps are pushed in the queue (@test-resolution.R#82) 
      5. Error: unknown deps, tibble (@test-resolution.R#113) 
      6. Error: error (@test-resolution.R#143) 
      7. Error: installed refs are also resolved (@test-resolution.R#192) 
      8. Error: dependencies are honoured (@test-resolution.R#291) 
      9. Error: error if cannot find package (@test-resolution.R#330) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pammtools

<details>

* Version: 0.1.11
* Source code: https://github.com/cran/pammtools
* URL: https://github.com/adibender/pammtools
* BugReports: https://github.com/adibender/pammtools/issues
* Date/Publication: 2019-04-18 08:30:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"pammtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +  geom_step(col=2, lty = 2, direction="vh")
    Error: Vector of length 4 cannot be recycled to length 20. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─(function (x, ...) ...
      2. ├─ggplot2:::print.ggplot(x)
      3. │ ├─ggplot2::ggplot_build(x)
      4. │ └─ggplot2:::ggplot_build.ggplot(x)
      5. │   └─ggplot2:::by_layer(function(l, d) l$compute_geom_2(d))
      6. │     └─ggplot2:::f(l = layers[[i]], d = data[[i]])
      7. │       └─l$compute_geom_2(d)
      8. │         └─ggplot2:::f(..., self = self)
      9. │           └─self$geom$use_defaults(data, self$aes_params)
     10. │             └─ggplot2:::f(..., self = self)
     11. │               ├─base::`[<-`(...)
     12. │               └─tibble:::`[<-.tbl_df`(...)
     13. │                 └─tibble:::tbl_extract_assign(x, j, value)
     14. │                   └─vctrs::vec_recycle(value, vec_size(x))
     15. └─vctrs:::stop_recycle_incompatible_size(x_size = 4L, size = 20L)
     16.   └─vctr
    Execution halted
    ```

# panelr

<details>

* Version: 0.7.1
* Source code: https://github.com/cran/panelr
* URL: https://panelr.jacob-long.com
* BugReports: https://github.com/jacob-long/panelr
* Date/Publication: 2019-07-12 17:30:03 UTC
* Number of recursive dependencies: 163

Run `revdep_details(,"panelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘panelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: heise
    > ### Title: Estimate Heise stability and reliability coefficients
    > ### Aliases: heise
    > 
    > ### ** Examples
    > 
    > data("WageData")
    > wages <- panel_data(WageData, id = id, wave = t)
    > heise(wages, wks, lwage) # will use waves 1, 4, and 7 by default
    Using waves 1, 4, and 7
    Error: Vector of length 0 cannot be recycled to length 1785. Only vectors of length one or of the same length can be recycled.
    Backtrace:
      1. panelr::heise(wages, wks, lwage)
     11. vctrs:::stop_recycle_incompatible_size(x_size = 0L, size = 1785L)
     12. vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             "▁▂▅▇▆▂▁▁")))
      20: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      21: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      22: stop_recycle_incompatible_size(x_size = 11L, size = 14L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      23: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      24: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 268 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 3 ]
      1. Error: (unknown) (@test_wbm.R#283) 
      2. Error: widen_panel works (@test-utils.R#46) 
      3. Error: summary.panel_data works (@test-utils.R#291) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘lme4’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘brms’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error in globalVariables(c("lastFuncGrad", "lastFuncParam")) : 
      could not find function "globalVariables"
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘lme4’
    Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘AER’, ‘brms’
    ```

# partition

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/partition
* URL: https://uscbiostats.github.io/partition/, https://github.com/USCbiostats/partition
* BugReports: https://github.com/USCbiostats/partition/issues
* Date/Publication: 2019-05-17 07:00:04 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"partition")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘partition-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_permutation
    > ### Title: Plot permutation tests
    > ### Aliases: plot_permutation
    > 
    > ### ** Examples
    > 
    > set.seed(123)
    > df <- simulate_block_data(c(3, 4, 5), lower_corr = .4, upper_corr = .6, n = 100)
    > 
    > test_permutation(df, partitioner = part_pc1(), nperm = 5) %>%
    +   plot_permutation("nclusters")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: f(...)
      11: join_keys(facet_vals, layout, by = names(vars))
      12: id(joint, drop = TRUE)
      13: id_var(.variables[[1]], drop = drop)
      14: sort(unique(x), na.last = TRUE)
      15: sort.default(unique(x), na.last = TRUE)
      16: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      17: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 151 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: plots are plotting (@test-plots-are-plotting.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        libs   5.9Mb
    ```

# perccalc

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/perccalc
* Date/Publication: 2018-08-24 16:20:03 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"perccalc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # perc_diff(toy_data, type, score)
    > # type is not an ordered factor!
    > 
    > toy_data <-
    + toy_data %>%
    + mutate(type = factor(type, levels = unique(type), ordered = TRUE))
    > 
    > 
    > perc_diff(toy_data, type, score, percentiles = c(90, 10))
    Error: Vector of length 20 cannot be recycled to length 1000. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─perccalc::perc_diff(...)
     2. │ └─perccalc:::category_summary(...) 00_pkg_src/perccalc/R/perc_diff.R:58:2
     3. │   ├─base::`[<-`(...) 00_pkg_src/perccalc/R/perc_diff.R:139:2
     4. │   └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/perccalc/R/perc_diff.R:139:2
     5. │     └─tibble:::tbl_extract_assign(x, j, value)
     6. │       └─vctrs::vec_recycle(value, vec_size(x))
     7. └─vctrs:::stop_recycle_incompatible_size(x_size = 20L, size = 1000L)
     8.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# phenofit

<details>

* Version: 0.2.5-2
* Source code: https://github.com/cran/phenofit
* URL: https://github.com/kongdd/phenofit
* BugReports: https://github.com/kongdd/phenofit/issues
* Date/Publication: 2019-06-07 08:00:08 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"phenofit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     plotdat = d, IsPlot = IsPlot, print = FALSE, IsPlot.OnlyBad = FALSE)
    > # Fine fitting
    > fit <- curvefits(
    +     INPUT, brks2,
    +     methods = c("AG", "Beck", "Elmore", "Zhang"), #,"klos", "Gu"
    +     wFUN = wFUN,
    +     nextend = 2, maxExtendMonth = 2, minExtendMonth = 1, minPercValid = 0.2,
    +     print = TRUE, verbose = FALSE)
    [	[curvefits] ] running 1 ...
    [	[curvefits] ] running 2 ...
    [	[curvefits] ] running 3 ...
    [	[curvefits] ] running 4 ...
    > ## visualization
    > df_fit <- get_fitting(fit)
    > g <- plot_phenofit(df_fit, brks2)
    Warning: Row indexes must be between 0 and the number of rows. Use `NA` as row index to obtain a row full of `NA` values.
    This warning is displayed once per session.
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: plot_phenofit ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: f(...)
      23: join_keys(facet_vals, layout, by = vars)
      24: id(joint, drop = TRUE)
      25: id_var(.variables[[1]], drop = drop)
      26: sort(unique(x), na.last = TRUE)
      27: sort.default(unique(x), na.last = TRUE)
      28: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      29: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 46 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-PhenoExtract.R#35) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking for missing documentation entries ... ERROR
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

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setClass(Class = "spam", slots = c(entries = "numeric", colindices = "numeric",  : 
      could not find function "setClass"
    Error: package or namespace load failed for ‘phenofit’:
     unable to load R code in package ‘spam’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass(Class = "spam", slots = c(entries = "numeric", colindices = "numeric",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘spam’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
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
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
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
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
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

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        libs    3.0Mb
        shiny   1.5Mb
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

*   checking foreign function calls ... NOTE
    ```
    ...
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
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass(Class = "spam", slots = c(entries = "numeric", colindices = "numeric",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘spam’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
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
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# phylopath

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/phylopath
* URL: http://Ax3man.github.io/phylopath/
* BugReports: https://github.com/Ax3man/phylopath/issues
* Date/Publication: 2019-07-12 21:30:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"phylopath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    c 0 1 0 0
    b 0 0 1 0
    a 0 0 0 1
    d 0 0 0 0
    attr(,"class")
    [1] "matrix" "DAG"   
    
    $B
      a d b c
    a 0 1 1 0
    d 0 0 0 0
    b 0 0 0 1
    c 0 0 0 0
    attr(,"class")
    [1] "matrix" "DAG"   
    
    > plot_model_set(m)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# PlackettLuce

<details>

* Version: 0.2-6
* Source code: https://github.com/cran/PlackettLuce
* URL: https://hturner.github.io/PlackettLuce/
* BugReports: https://github.com/hturner/PlackettLuce/issues
* Date/Publication: 2019-04-01 21:40:11 UTC
* Number of recursive dependencies: 149

Run `revdep_details(,"PlackettLuce")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             17.2500000000001, 17.2500000000001, 17.2500000000001, 17.2500000000001, 17.2500000000001, 
             19.2525, 20.71, 19.225, 19.225, 19.225, 19.2525, 19.225, 19.225, 19.2525, 17.2500000000001, 
             17.2500000000001, 17.2500000000001)))
      5: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      6: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      7: stop_recycle_incompatible_size(x_size = 12L, size = 842L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      8: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      9: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 153 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-psycho.R#136) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘PLMIX’
    ```

# plotly

<details>

* Version: 4.9.0
* Source code: https://github.com/cran/plotly
* URL: https://plotly-r.com, https://github.com/ropensci/plotly#readme, https://plot.ly/r
* BugReports: https://github.com/ropensci/plotly/issues
* Date/Publication: 2019-04-10 19:33:05 UTC
* Number of recursive dependencies: 144

Run `revdep_details(,"plotly")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > layout(p, annotations = list(x = ~date, y = ~rate, text = "peak"))
    > 
    > # use group_by() + do() + subplot() for trellis displays 
    > d <- group_by(mpg, drv)
    > plots <- do(d, p = plot_ly(., x = ~cty, name = ~drv))
    > subplot(plots[["p"]], nrows = 3, shareX = TRUE)
    Warning: 'layout' objects don't have these attributes: 'NA'
    Valid attributes include:
    'font', 'title', 'autosize', 'width', 'height', 'margin', 'paper_bgcolor', 'plot_bgcolor', 'separators', 'hidesources', 'showlegend', 'colorway', 'colorscale', 'datarevision', 'uirevision', 'editrevision', 'selectionrevision', 'template', 'modebar', 'meta', 'transition', '_deprecated', 'clickmode', 'dragmode', 'hovermode', 'hoverdistance', 'spikedistance', 'hoverlabel', 'selectdirection', 'grid', 'calendar', 'xaxis', 'yaxis', 'ternary', 'scene', 'geo', 'mapbox', 'polar', 'radialaxis', 'angularaxis', 'direction', 'orientation', 'editType', 'legend', 'annotations', 'shapes', 'images', 'updatemenus', 'sliders', 'metasrc', 'barmode', 'bargap', 'mapType'
    
    > 
    > # arrange displays by their mean
    > means <- summarise(d, mn = mean(cty, na.rm = TRUE))
    > means %>%
    +   dplyr::left_join(plots) %>%
    +   arrange(mn) %>%
    +   subplot(nrows = NROW(.), shareX = TRUE)
    Joining, by = "drv"
    Error: If you supply a tibble to subplot(), 
    it must have _one_ column with a list of plotly objects
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1252 | SKIPPED: 45 | WARNINGS: 53 | FAILED: 33 ]
      1. Error: sf works with crosstalk (@test-animate-highlight.R#389) 
      2. Error: scatter facet -> 2 traces (@test-cookbook-lines.R#176) 
      3. Error: geom_hline -> 2 more traces (@test-cookbook-lines.R#185) 
      4. Error: geom_vline -> 2 more traces (@test-cookbook-lines.R#204) 
      5. Error: Basic annotation_raster() example works (@test-ggplot-annotation_.R#15) 
      6. Error: multi-panel fixed coordinates (@test-ggplot-coord-fixed.R#29) 
      7. Error: 6 facets becomes 6 panels (@test-ggplot-facets.R#20) 
      8. Error: 3 facets becomes 3 panels (@test-ggplot-facets.R#40) 
      9. Error: facet_wrap(..., scales = 'free') creates interior scales (@test-ggplot-facets.R#60) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        htmlwidgets   3.4Mb
        R             1.1Mb
    ```

# poio

<details>

* Version: 0.0-3
* Source code: https://github.com/cran/poio
* URL: https://github.com/RL10N/poio
* BugReports: https://github.com/RL10N/poio/issues
* Date/Publication: 2017-01-29 10:16:13
* Number of recursive dependencies: 75

Run `revdep_details(,"poio")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      10: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 33 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 7 ]
      1. Error: read_po works on an empty POT file (@test-empty.R#50) 
      2. Error: fix_metadata works on an empty pot file (@test-empty.R#106) 
      3. Error: fix_metadata works with user-specified metadata (@test-empty.R#172) 
      4. Error: generate_po_from_pot can convert empty pot file to po file (@test-empty.R#237) 
      5. Error: read_po works on a complicated POT file (@test-summerof69.R#110) 
      6. Error: fix_metadata works on a complicated POT file (@test-summerof69.R#226) 
      7. Error: generate_po_from_pot can convert complicated pot file to po file (@test-summerof69.R#369) 
      
      Error: testthat unit tests failed
      Execution halted
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

# PopED

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/PopED
* URL: http://poped.sourceforge.net
* BugReports: https://github.com/andrewhooker/PopED/issues
* Date/Publication: 2018-09-10 09:40:03 UTC
* Number of recursive dependencies: 95

Run `revdep_details(,"PopED")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                                   d=c(V=0.09,KA=0.09,CL=0.25^2,E0=0.09), 
    +                                   sigma=c(0.04,5e-6,0.09,100),
    +                                   notfixed_sigma=c(0,0,0,0),
    +                                   xt=c( 1,2,8,240,240,1,2,8,240,240),
    +                                   minxt=c(0,0,0,240,240,0,0,0,240,240),
    +                                   maxxt=c(10,10,10,248,248,10,10,10,248,248),
    +                                   G_xt=c(1,2,3,4,5,1,2,3,4,5),
    +                                   model_switch=c(1,1,1,1,1,2,2,2,2,2),
    +                                   a=cbind(c(20,40,0),c(24,24,24)),
    +                                   bUseGrouped_xt=1,
    +                                   ourzero=0,
    +                                   maxa=c(200,40),
    +                                   mina=c(0,2))
    > 
    > 
    > ##  create plot of model without variability 
    > plot_model_prediction(poped.db,facet_scales="free")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Logical indices must have length 1 or be as long as the indexed vector.
      The vector has size 6 whereas the index has size 54.
      1: shrinkage(poped.db) at testthat/test_evaluate_design.R:227
      2: `[<-`(`*tmp*`, data_tmp == 1, value = NA) at /home/rstudio/tibble/revdep/checks/PopED/new/PopED.Rcheck/00_pkg_src/PopED/R/shrinkage.R:174
      3: `[<-.tbl_df`(`*tmp*`, data_tmp == 1, value = NA) at /home/rstudio/tibble/revdep/checks/PopED/new/PopED.Rcheck/00_pkg_src/PopED/R/shrinkage.R:174
      4: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      5: vec_as_index_extract_compat(j, ncol(x), names = names(x), full_column = TRUE) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:394
      6: vec_as_index(j, n) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:437
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 181 | SKIPPED: 1 | WARNINGS: 10 | FAILED: 1 ]
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

* Version: 0.2.6
* Source code: https://github.com/cran/portalr
* URL: https://weecology.github.io/portalr/, https://github.com/weecology/portalr
* BugReports: https://github.com/weecology/portalr/issues
* Date/Publication: 2019-07-10 16:53:53 UTC
* Number of recursive dependencies: 125

Run `revdep_details(,"portalr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1: `[<-`(`*tmp*`, is.na(data), value = -999999) at testthat/test-99-regression.R:162
      2: `[<-.tbl_df`(`*tmp*`, is.na(data), value = -999999) at testthat/test-99-regression.R:162
      3: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      4: vec_as_index_extract_compat(j, ncol(x), names = names(x), full_column = TRUE) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:394
      5: vec_as_index(j, n) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:437
      
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

* Version: 1.3.0
* Source code: https://github.com/cran/projects
* URL: https://www.github.com/NikKrieger/projects
* Date/Publication: 2019-05-23 17:20:03 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"projects")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    New author's affiliations:
    # A tibble: 4 x 4
      affiliation_id department_name       institution_name    address              
               <int> <chr>                 <chr>               <chr>                
    1              1 Math Dept.            Springfield College 123 College St, Spri…
    2             42 Art Department        Springfield College 321 University Boule…
    3              2 Central Intelligence… United States Gove… 888 Classified Dr, W…
    4              3 Pyrotechnics          ACME                <NA>                 
    > new_project(title = "Test project 1", current_owner = "Plato", stage = 1)
    # A tibble: 3 x 7
         id given_names last_name title degree email phone
      <int> <chr>       <chr>     <chr> <chr>  <chr> <chr>
    1    13 Spiro       Agnew     <NA>  LLB    <NA>  <NA> 
    2   303 Plato       <NA>      <NA>  <NA>   <NA>  <NA> 
    3     1 Condoleezza Rice      <NA>  <NA>   <NA>  <NA> 
    Error in validate_unique_entry(x = x, table = authors_table, what = "author",  : 
      
    The entry NA matches multiple authors, seen above.
    Calls: new_project ... validate_special_authors -> sapply -> lapply -> FUN -> validate_unique_entry
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# ProjectTemplate

<details>

* Version: 0.9.0
* Source code: https://github.com/cran/ProjectTemplate
* URL: http://projecttemplate.net
* BugReports: https://github.com/johnmyleswhite/ProjectTemplate/issues
* Date/Publication: 2019-02-26 19:30:08 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"ProjectTemplate")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/run-all.R’ failed.
    Last 13 lines of output:
      [1] FALSE
      [1] FALSE
      [1] FALSE
      [1] FALSE
      [1] TRUE
      [1] FALSE
      [1] FALSE
      [1] FALSE
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 836 | SKIPPED: 4 | WARNINGS: 281 | FAILED: 2 ]
      1. Error: auto loaded data is cached by default (@test-load.R#60) 
      2. Error: ignored data files are not loaded (@test-load.R#164) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# quantable

<details>

* Version: 0.3.6
* Source code: https://github.com/cran/quantable
* URL: https://github.com/protViz/quantable
* BugReports: https://github.com/protViz/quantable/issues
* Date/Publication: 2018-05-15 21:03:41 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"quantable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘quantable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multigroupVolcano
    > ### Title: plot volcano given multiple conditions
    > ### Aliases: multigroupVolcano
    > 
    > ### ** Examples
    > 
    > data(multigroupFCDATA)
    > colnames(multigroupFCDATA)
    [1] "logFC"     "adj.P.Val" "Condition" "colour"    "Name"     
    > multigroupVolcano(multigroupFCDATA,effect="logFC",
    + type="adj.P.Val",condition="Condition",colour="colour",label="Name" )
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# quanteda

<details>

* Version: 1.5.1
* Source code: https://github.com/cran/quanteda
* URL: https://quanteda.io
* BugReports: https://github.com/quanteda/quanteda/issues
* Date/Publication: 2019-07-30 09:30:02 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"quanteda")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
         1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
         1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = "american", class = "factor")))
      11: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      12: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      13: stop_recycle_incompatible_size(x_size = 2L, size = 163L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      14: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      15: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 2933 | SKIPPED: 21 | WARNINGS: 140 | FAILED: 1 ]
      1. Error: test plot.kwic facet order parameter (@test-textplot.R#54) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘stm’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 23.1Mb
      sub-directories of 1Mb or more:
        data   1.3Mb
        libs  18.8Mb
        R      1.6Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 71 marked UTF-8 strings
    ```

# radiant.data

<details>

* Version: 1.0.6
* Source code: https://github.com/cran/radiant.data
* URL: https://github.com/radiant-rstats/radiant.data, https://radiant-rstats.github.io/radiant.data, https://radiant-rstats.github.io/docs
* BugReports: https://github.com/radiant-rstats/radiant.data/issues
* Date/Publication: 2019-08-22 06:30:08 UTC
* Number of recursive dependencies: 143

Run `revdep_details(,"radiant.data")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘radiant.data-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.pivotr
    > ### Title: Plot method for the pivotr function
    > ### Aliases: plot.pivotr
    > 
    > ### ** Examples
    > 
    > pivotr(diamonds, cvars = "cut") %>% plot()
    > pivotr(diamonds, cvars = c("cut", "clarity")) %>% plot()
    > pivotr(diamonds, cvars = c("cut", "clarity", "color")) %>% plot()
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             5L, 2L, 2L, 3L, 4L, 1L, 4L, 1L, 5L), .Label = c("E", "F", "G", "H", "I"), class = "factor")))
      6: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      7: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      8: stop_recycle_incompatible_size(x_size = 3L, size = 14L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      9: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      10: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 29 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: filter (@test_funs.R#69) 
      2. Error: filter_data (@test_funs.R#74) 
      3. Error: filter_data factor (@test_funs.R#80) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘radiant.data’:
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

# rbin

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/rbin
* URL: https://github.com/rsquaredacademy/rbin, https://rbin.rsquaredacademy.com
* BugReports: https://github.com/rsquaredacademy/rbin/issues
* Date/Publication: 2019-01-04 11:20:04 UTC
* Number of recursive dependencies: 128

Run `revdep_details(,"rbin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rbin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rbin_create
    > ### Title: Create dummy variables
    > ### Aliases: rbin_create
    > 
    > ### ** Examples
    > 
    > k <- rbin_manual(mbank, y, age, c(29, 39, 56))
    > rbin_create(mbank, age, k)
    Error: Argument 1 is a list, must contain atomic vectors
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      # A tibble: 4 x 7
        level     bin_count  good   bad    woe      iv entropy
        <fct>         <int> <int> <int>  <dbl>   <dbl>   <dbl>
      1 tertiary       1299   195  1104 -0.313 0.0318    0.610
      2 secondary      2352   231  2121  0.170 0.0141    0.463
      3 unknown         179    25   154 -0.229 0.00227   0.583
      4 primary         691    66   625  0.201 0.00572   0.455══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 9 | SKIPPED: 5 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: output from rbin_create is as expected as expected (@test-bins.R#30) 
      2. Error: output from rbin_factor_create is as expected (@test-bins.R#48) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rdiversity

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/rdiversity
* URL: https://github.com/boydorr/rdiversity
* BugReports: https://github.com/boydorr/rdiversity/issues
* Date/Publication: 2018-06-19 14:53:02 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"rdiversity")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > # Define metacommunity
    > pop <- data.frame(a = c(1,3), b = c(1,1))
    > row.names(pop) <- paste0("sp", 1:2)
    > pop <- pop/sum(pop)
    > meta <- metacommunity(pop)
    > 
    > # Calculate subcommunity beta diversity (takes the relative entropy)
    > b <- raw_beta(meta)
    > res <- subdiv(b, 0:2)
    > plot_diversity(res)
    > 
    > # Calculate all measures of subcommunity diversity
    > res <- subdiv(meta, 0:2)
    > plot_diversity(res)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in packageVersion("phangorn") : 
      could not find function "packageVersion"
    Error: package or namespace load failed for ‘rdiversity’:
     unable to load R code in package ‘phytools’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in packageVersion("phangorn") : 
      could not find function "packageVersion"
    Error: unable to load R code in package ‘phytools’
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
    Error in packageVersion("phangorn") : 
      could not find function "packageVersion"
    Error: unable to load R code in package ‘phytools’
    Execution halted
    ```

# readr

<details>

* Version: 1.3.1
* Source code: https://github.com/cran/readr
* URL: http://readr.tidyverse.org, https://github.com/tidyverse/readr
* BugReports: https://github.com/tidyverse/readr/issues
* Date/Publication: 2018-12-21 09:40:02 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"readr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      disp = col_double(),
      hp = col_double(),
      drat = col_double(),
      wt = col_double(),
      qsec = col_double(),
      vs = col_double(),
      am = col_double(),
      gear = col_double(),
      carb = col_double()
    )
    Error: Vector of length 11 cannot be recycled to length 32. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─readr::type_convert(data)
     2. │ ├─base::`[<-`(...) 00_pkg_src/readr/R/type_convert.R:60:2
     3. │ └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/readr/R/type_convert.R:60:2
     4. │   └─tibble:::tbl_extract_assign(x, j, value)
     5. │     └─vctrs::vec_recycle(value, vec_size(x))
     6. └─vctrs:::stop_recycle_incompatible_size(x_size = 11L, size = 32L)
     7.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      8: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      9: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      10: stop_recycle_incompatible_size(x_size = 2L, size = 3L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      11: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      12: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 723 | SKIPPED: 6 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: does not writes a tailing .0 for whole number doubles (@test-write.R#88) 
      2. Error: write_csv can write to compressed files (@test-write.R#108) 
      3. Error: write_csv2 and format_csv2 writes ; sep and , decimal mark (@test-write.R#136) 
      4. Error: write_csv2 and format_csv2 writes NA appropriately (@test-write.R#147) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.4Mb
      sub-directories of 1Mb or more:
        libs  13.5Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
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

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: rws_read.SQLiteConnection
    > 
    > ### ** Examples
    > 
    > conn <- rws_connect()
    > rws_write(rws_data, exists = FALSE, conn = conn)
    > rws_write(rws_data[c("date", "ordered")], 
    +   x_name = "data2", exists = FALSE, conn = conn)
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
        █
     1. ├─readwritesqlite::rws_write(...)
     2. ├─rws_data[c("date", "ordered")] 00_pkg_src/readwritesqlite/R/write.R:52:2
     3. ├─sf:::`[.sf`(rws_data, c("date", "ordered")) 00_pkg_src/readwritesqlite/R/write.R:52:2
     4. │ ├─base::`[[<-`(...)
     5. │ └─tibble:::`[[<-.tbl_df`(...)
     6. │   └─tibble:::tbl_extract2_assign(x, j = i, value)
     7. │     └─vctrs::vec_recycle(value, vec_size(x))
     8. └─vctrs:::stop_scalar_type(...)
     9.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 403 | SKIPPED: 0 | WARNINGS: 27 | FAILED: 16 ]
      1. Error: init makes table (@test-init.R#27) 
      2. Error: meta reads all classes (@test-meta.R#161) 
      3. Error: meta sfc different types (@test-meta.R#434) 
      4. Error: rws_get_sqlite_query works with meta = FALSE (@test-query.R#10) 
      5. Error: rws_get_sqlite_query works with meta = TRUE and logical (@test-query.R#48) 
      6. Error: rws_read with meta = FALSE  (@test-read.R#59) 
      7. Error: sf data frames with single geometry passed back (@test-write.R#515) 
      8. Error: sf data frames with two geometries and correct one passed back (@test-write.R#524) 
      9. Error: sf can change sf_column (@test-write.R#544) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# recipes

<details>

* Version: 0.1.6
* Source code: https://github.com/cran/recipes
* URL: https://github.com/tidymodels/recipes
* BugReports: https://github.com/tidymodels/recipes/issues
* Date/Publication: 2019-07-02 21:20:05 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"recipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > impute_rec <- rec %>%
    +   step_bagimpute(Status, Home, Marital, Job, Income, Assets, Debt)
    > 
    > imp_models <- prep(impute_rec, training = credit_tr)
    Error: Lossy cast from `value` <double> to `x` <integer>.
    Locations: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,...
    Backtrace:
         █
      1. ├─recipes::prep(impute_rec, training = credit_tr)
      2. ├─recipes:::prep.recipe(impute_rec, training = credit_tr) 00_pkg_src/recipes/R/recipe.R:279:10
      3. │ ├─recipes::bake(x$steps[[i]], new_data = training) 00_pkg_src/recipes/R/recipe.R:411:8
      4. │ └─recipes:::bake.step_bagimpute(x$steps[[i]], new_data = training) 00_pkg_src/recipes/R/recipe.R:480:8
      5. │   ├─base::`[<-`(...) 00_pkg_src/recipes/R/bag_imp.R:240:8
      6. │   └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/recipes/R/bag_imp.R:240:8
      7. │     └─tibble:::tbl_extract_assign2(x, i, j, value)
      8. │       └─tibble:::map(...)
      9. │         └─base::lapply(.x, .f, ...)
     10. │           └─tibble:::FUN(X[[i]], ...)
     11. │             └─vctrs::`vec_slice<-`(`*tmp*`, i, value = value)
     12. ├─vctrs:::vec_cast_dis
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1095 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 41 ]
      1. Error: detect_step function works (@test_basics.R#73) 
      2. Error: bake without newdata (@test_basics.R#117) 
      3. Error: correct basis functions (@test_bs.R#18) 
      4. Error: printing (@test_bs.R#58) 
      5. Failure: correct means and std devs (@test_center_scale_norm.R#43) 
      6. Failure: correct means and std devs (@test_center_scale_norm.R#49) 
      7. Error: (unknown) (@test_data.frame.R#20) 
      8. Error: dummy variables with factor inputs (@test_dummies.R#21) 
      9. Error: create all dummy variables (@test_dummies.R#87) 
      1. ...
      
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
    
    > ### Name: re_exec
    > ### Title: Extract Data From First Regular Expression Match Into a Data
    > ###   Frame
    > ### Aliases: re_exec $.rematch_records $.rematch_allrecords
    > 
    > ### ** Examples
    > 
    > name_rex <- paste0(
    +   "(?<first>[[:upper:]][[:lower:]]+) ",
    +   "(?<last>[[:upper:]][[:lower:]]+)"
    + )
    > notables <- c(
    +   "  Ben Franklin and Jefferson Davis",
    +   "\tMillard Fillmore"
    + )
    > # Match first occurrence
    > pos <- re_exec(notables, name_rex)
    > pos
    Error: Can't slice a scalar
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: `[[<-`(`*tmp*`, i, value = structure(list(), class = "rematch_allrecords")) at /home/rstudio/tibble/revdep/checks/rematch2/new/rematch2.Rcheck/00_pkg_src/rematch2/R/exec-all.R:44
      3: `[[<-.tbl_df`(`*tmp*`, i, value = structure(list(), class = "rematch_allrecords")) at /home/rstudio/tibble/revdep/checks/rematch2/new/rematch2.Rcheck/00_pkg_src/rematch2/R/exec-all.R:44
      4: tbl_extract2_assign(x, j = i, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:161
      5: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:185
      6: stop_scalar_type(.Primitive("quote")(structure(list(), class = "rematch_allrecords")), 
             "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      7: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      8: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: corner cases (@test-exec-all.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# reReg

<details>

* Version: 1.1.6
* Source code: https://github.com/cran/reReg
* URL: http://github.com/stc04003/reReg
* BugReports: http://github.com/stc04003/reReg/issues
* Date/Publication: 2018-10-22 19:40:03 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"reReg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘reReg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotCSM
    > ### Title: Produce Cumulative Sample Mean Function Plots
    > ### Aliases: plotCSM
    > ### Keywords: Plots
    > 
    > ### ** Examples
    > 
    > data(readmission, package = "frailtypack")
    > plotCSM(reSurv(t.stop, id, event, death) ~ 1, data = readmission)
    > plotCSM(reSurv(t.stop, id, event, death) ~ sex, data = readmission)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# rfPermute

<details>

* Version: 2.1.7
* Source code: https://github.com/cran/rfPermute
* URL: https://github.com/EricArcher/rfPermute
* BugReports: https://github.com/EricArcher/rfPermute/issues
* Date/Publication: 2019-04-22 05:00:03 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"rfPermute")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rfPermute-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotImpVarDist
    > ### Title: Plot Important Variable Distribution
    > ### Aliases: plotImpVarDist
    > 
    > ### ** Examples
    > 
    > data(mtcars)
    > df <- mtcars
    > df$am <- factor(df$am)
    > 
    > rf <- randomForest(am ~ ., df, importance = TRUE)
    > plotImpVarDist(rf, df, "am")
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: plotImpVarDist ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘plyr’
      All declared Imports should be used.
    ```

# rmapzen

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/rmapzen
* URL: https://tarakc02.github.io/rmapzen/
* BugReports: https://github.com/tarakc02/rmapzen/issues
* Date/Publication: 2019-08-19 21:10:06 UTC
* Number of recursive dependencies: 72

Run `revdep_details(,"rmapzen")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             epsg = 4326L, proj4string = "+proj=longlat +datum=WGS84 +no_defs"), class = "crs"), class = c("sfc_POINT", 
         "sfc"), precision = 0, bbox = structure(c(xmin = -122.285374, ymin = 37.737424, xmax = -122.174909, 
         ymax = 37.84632), class = "bbox"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      13: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 197 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: as_sf converts search results to sf (@test-as-sf.R#4) 
      2. Error: as_sf converts isochrone results to sf (@test-as-sf.R#9) 
      3. Error: as_sf converts vector tile layers to sf (@test-as-sf.R#17) 
      4. Error: mz_bbox works for sf and sp objects (@test-mz-bbox.R#59) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘tidyr::one_of’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
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
    +               climatology_end = "2012-12-31")
    Error: Can't cast <double[,31]> to <double>.
    Can not decrease dimensions
    Backtrace:
         █
      1. ├─RmarineHeatWaves::detect(...)
      2. │ ├─base::`[<-`(...) 00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4
      3. │ └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/RmarineHeatWaves/R/RmarineHeatWaves.R:265:4
      4. │   └─tibble:::tbl_extract_assign2(x, i, j, value)
      5. │     └─tibble:::map(...)
      6. │       └─base::lapply(.x, .f, ...)
      7. │         └─tibble:::FUN(X[[i]], ...)
      8. │           └─vctrs::`vec_slice<-`(`*tmp*`, i, value = value)
      9. ├─vctrs:::vec_cast_dispatch(x = x, to = to, x_arg = x_arg, to_arg = to_arg)
     10. ├─vctrs::vec_cast.double(x = x, to = to, x_arg = x_arg, to_arg = to_arg)
     11. └─vctrs:::vec_cast.double.double(...)
     12.   └─vctrs:::shape_broadcast(x, to)
     13.     └─vctrs::stop_incompatible_cast(x, to, details = "Can not decrease dimensions")
     14.       └─vctrs:::stop_incompatible(...)
     15.         
    Execution halted
    ```

# rmweather

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/rmweather
* URL: https://github.com/skgrange/rmweather
* BugReports: https://github.com/skgrange/rmweather/issues
* Date/Publication: 2018-11-12 10:00:14 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"rmweather")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Make a prediction with the examples
    > vector_prediction <- rmw_predict(
    +   model_london, 
    +   df = rmw_prepare_data(data_london, value = "no2")
    + )
    Error: Vector of length 7 cannot be recycled to length 7473. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─rmweather::rmw_predict(...)
      2. ├─rmweather::rmw_prepare_data(data_london, value = "no2") 00_pkg_src/rmweather/R/rmw_predict.R:39:2
      3. │ └─`%>%`(...) 00_pkg_src/rmweather/R/rmw_prepare_data.R:54:2
      4. │   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      5. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6. │     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      7. │       └─rmweather:::`_fseq`(`_lhs`)
      8. │         └─magrittr::freduce(value, `_function_list`)
      9. │           └─function_list[[i]](value)
     10. │             └─rmweather:::impute_values(., na.rm = na.rm)
     11. │               ├─base::`[<-`(...) 00_pkg_src/rmweather/R/rmw_prepare_data.R:112:2
     12. │               └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/rmweather/R/rmw_prepare_data.R:1
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      24: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 13 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Error: Test data preparation function (@test_02_rmw_functions.R#13) 
      2. Error: Test data preparation function with custom arguments (@test_02_rmw_functions.R#32) 
      3. Error: Test training function (@test_02_rmw_functions.R#51) 
      4. Error: Test normalising function (@test_02_rmw_functions.R#100) 
      5. Error: Test normalising function with standard error calculation (@test_02_rmw_functions.R#140) 
      6. Error: Test `rmw_do_all` function (@test_02_rmw_functions.R#181) 
      7. Error: Test `rmw_do_all` function and use varable_sample argument (@test_02_rmw_functions.R#219) 
      8. Error: Test `rmw_clip` function (@test_02_rmw_functions.R#263) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rnoaa

<details>

* Version: 0.8.4
* Source code: https://github.com/cran/rnoaa
* URL: https://github.com/ropensci/rnoaa
* BugReports: https://github.com/ropensci/rnoaa/issues
* Date/Publication: 2019-01-14 23:10:03 UTC
* Number of recursive dependencies: 137

Run `revdep_details(,"rnoaa")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Loading required package: rnoaa
      ── 1. Error: Valid ggplot object is produced (@test-vis_miss.R#5)  ─────────────
      Argument 7 must be length 29251, not 117004
      1: meteo_pull_monitors(monitors) at testthat/test-vis_miss.R:5
      2: suppressWarnings(dplyr::bind_rows(all_monitors_out)) at /home/rstudio/tibble/revdep/checks/rnoaa/new/rnoaa.Rcheck/00_pkg_src/rnoaa/R/helpers_ghcnd.R:104
      3: withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
      4: dplyr::bind_rows(all_monitors_out) at /home/rstudio/tibble/revdep/checks/rnoaa/new/rnoaa.Rcheck/00_pkg_src/rnoaa/R/helpers_ghcnd.R:104
      5: bind_rows_(x, .id)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 92 | SKIPPED: 51 | WARNINGS: 21 | FAILED: 1 ]
      1. Error: Valid ggplot object is produced (@test-vis_miss.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rsample

<details>

* Version: 0.0.5
* Source code: https://github.com/cran/rsample
* URL: https://tidymodels.github.io/rsample
* BugReports: https://github.com/tidymodels/rsample/issues
* Date/Publication: 2019-07-12 22:20:11 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"rsample")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Tidy Resampling Object
    > ### Aliases: tidy.rsplit tidy.rset tidy.vfold_cv tidy.nested_cv
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    > theme_set(theme_bw())
    > 
    > set.seed(4121)
    > cv <- tidy(vfold_cv(mtcars, v = 5))
    > ggplot(cv, aes(x = Fold, y = Row, fill = Data)) +
    +   geom_tile() + scale_fill_brewer()
    > 
    > set.seed(4121)
    > rcv <- tidy(vfold_cv(mtcars, v = 5, repeats = 2))
    > ggplot(rcv, aes(x = Fold, y = Row, fill = Data)) +
    +   geom_tile() + facet_wrap(~Repeat) + scale_fill_brewer()
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

# RSDA

<details>

* Version: 2.0.8
* Source code: https://github.com/cran/RSDA
* URL: http://www.oldemarrodriguez.com
* Date/Publication: 2018-10-10 23:00:10 UTC
* Number of recursive dependencies: 108

Run `revdep_details(,"RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     [70] "PctPersOwnOccup"       "PctPersDenseHous"      "PctHousLess3BR"       
     [73] "MedNumBR"              "HousVacant"            "PctHousOccup"         
     [76] "PctHousOwnOcc"         "PctVacantBoarded"      "PctVacMore6Mos"       
     [79] "MedYrHousBuilt"        "PctHousNoPhone"        "PctWOFullPlumb"       
     [82] "OwnOccLowQuart"        "OwnOccMedVal"          "OwnOccHiQuart"        
     [85] "RentLowQ"              "RentMedian"            "RentHighQ"            
     [88] "MedRent"               "MedRentPctHousInc"     "MedOwnCostPctInc"     
     [91] "MedOwnCostPctIncNoMtg" "NumInShelters"         "NumStreet"            
     [94] "PctForeignBorn"        "PctBornSameState"      "PctSameHouse85"       
     [97] "PctSameCity85"         "PctSameState85"        "LandArea"             
    [100] "PopDens"               "PctUsePubTrans"        "LemasPctOfficDrugUn"  
    [103] "ViolentCrimesPerPop"  
    > nrow(us.crime)
    [1] 1994
    > result  <- classic.to.sym(us.crime, concept='state',
    +                           variables =c(NumInShelters, NumImmig),
    +                           variables.types =c(NumInShelters = type.histogram(),
    +                            NumImmig = type.histogram()))
    Error in sum(.$hist[[1]]) : invalid 'type' (list) of argument
    Calls: classic.to.sym ... <Anonymous> -> <Anonymous> -> map -> .f -> as.data.frame -> t
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘randomcoloR’
      All declared Imports should be used.
    ```

# rstatix

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/rstatix
* URL: https://rpkgs.datanovia.com/rstatix/
* BugReports: https://github.com/kassambara/rstatix/issues
* Date/Publication: 2019-08-03 05:30:03 UTC
* Number of recursive dependencies: 111

Run `revdep_details(,"rstatix")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Use formula
    > 
    > 
    > # or use character vector
    > df %>% anova_test(dv = len, wid = id, within = c(supp, dose))
    Error: Vector of length 3 cannot be recycled to length 60. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─df %>% anova_test(dv = len, wid = id, within = c(supp, dose))
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         ├─base::withVisible(function_list[[k]](value))
      8. │         └─function_list[[k]](value)
      9. │           └─rstatix::anova_test(., dv = len, wid = id, within = c(supp, dose))
     10. │             └─rstatix:::car_anova(.args) 00_pkg_src/rstatix/R/anova_test.R:153:4
     11. │               └─rstatix::factorial_design(...) 00_pkg_src/rstatix/R/anova_test.R:397:4
     12. │                 └─`%>%`(...) 00_pkg_src/rstatix/R/factorial_design.R:60
    Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘rstatix’:
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

# rtimicropem

<details>

* Version: 1.4.0
* Source code: https://github.com/cran/rtimicropem
* URL: https://github.com/ropensci/rtimicropem, https://docs.ropensci.org/rtimicropem/
* BugReports: https://github.com/ropensci/rtimicropem/issues
* Date/Publication: 2019-05-15 09:40:03 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"rtimicropem")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rtimicropem-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: convert_output
    > ### Title: Uses output file from MicroPEM to create a 'micropem' object.
    > ### Aliases: convert_output
    > 
    > ### ** Examples
    > 
    > micropem_example <- convert_output(system.file('extdata', 'CHAI.csv', package = 'rtimicropem'))
    > micropem_example$plot()
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
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
    > # do many more
    > ale_dev <- assess_reference_mc(alewife, 17, 5)
    Error: Vector of length 4 cannot be recycled to length 970. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─rubias::assess_reference_mc(alewife, 17, 5)
      2. │ ├─`%>%`(...) 00_pkg_src/rubias/R/assess_reference_mc.R:132:2
      3. │ │ └─base::eval(lhs, parent, parent)
      4. │ │   └─base::eval(lhs, parent, parent)
      5. │ └─base::lapply(...)
      6. │   └─rubias:::FUN(X[[i]], ...)
      7. │     └─`%>%`(...) 00_pkg_src/rubias/R/assess_reference_mc.R:150:4
      8. │       ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      9. │       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     10. │         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     11. │           └─rubias:::`_fseq`(`_lhs`)
     12. │             └─magrittr::freduce(value, `_function_list`)
     13. │               └─function_list[[i]](value)
     14. │                 ├─base::droplevels(.)
     15. │                 
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
* Number of recursive dependencies: 50

Run `revdep_details(,"ruler")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: `[[<-.tbl_df`(`*tmp*`, 1, value = function (x, ...) 
         UseMethod("mean")) at testthat/test-exposure.R:166
      3: tbl_extract2_assign(x, j = i, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:161
      4: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:185
      5: stop_scalar_type(.Primitive("quote")(function (x, ...) 
         UseMethod("mean")), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      6: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      7: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 304 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: is_exposure works (@test-exposure.R#166) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# RxODE

<details>

* Version: 0.9.1-3
* Source code: https://github.com/cran/RxODE
* URL: https://nlmixrdevelopment.github.io/RxODE/
* BugReports: https://github.com/nlmixrdevelopment/RxODE/issues
* Date/Publication: 2019-08-06 15:20:05 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"RxODE")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ── Initial Conditions (qd.cp$inits): ───────────────────────────────────────────
    depot centr  peri   eff 
        0     0     0     1 
    ── First part of data (object): ────────────────────────────────────────────────
    # A tibble: 37 x 7
       time    C2    C3  depot centr  peri   eff
        [h] <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl>
    1     0   0   0     10000     0     0   1   
    2     1  44.0 0.911  7475. 1769.  271.  1.08
    3     2  54.5 2.65   5588. 2191.  787.  1.18
    4     3  51.7 4.42   4177. 2076. 1314.  1.23
    5     4  44.4 5.94   3122. 1784. 1765.  1.23
    6     5  36.5 7.14   2334. 1466. 2120.  1.21
    # … with 31 more rows
    ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂
    > 
    > plot(qd.cp)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘installr’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 19.2Mb
      sub-directories of 1Mb or more:
        doc    1.3Mb
        libs  16.3Mb
        R      1.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘n1qn1’
      All declared Imports should be used.
    ```

# sabre

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/sabre
* URL: https://github.com/Nowosad/sabre
* BugReports: https://github.com/Nowosad/sabre/issues
* Date/Publication: 2019-07-18 12:00:04 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"sabre")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sabre-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mapcurves_calc
    > ### Title: Mapcurves calculation
    > ### Aliases: mapcurves_calc mapcurves_calc.sf mapcurves_calc.RasterLayer
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.5.1, GDAL 2.1.2, PROJ 4.9.3
    > data("regions1")
    > data("regions2")
    > 
    > mc = mapcurves_calc(x = regions1, y = regions2, x_name = z, y_name = z)
    Error: All columns in a tibble must be 1d or 2d objects:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: tbl_df(.data)
      13: as_tibble(data, .name_repair = "check_unique")
      14: as_tibble.data.frame(data, .name_repair = "check_unique") at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:83
      15: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:99
      16: lst_to_tibble(x, .rows, .name_repair, col_lengths(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:121
      17: check_valid_cols(x) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:126
      18: abort(error_column_must_be_vector(names_x[is_xd], classes)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:151
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
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
* Number of recursive dependencies: 42

Run `revdep_details(,"SanzCircos")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > links <- make_circos_links(links_df, "chrom", "band", "link", "start", "end", status = TRUE)
    Error: Lossy cast from `value` <character> to `x` <logical>.
    Locations: 1
    Backtrace:
         █
      1. ├─SanzCircos::make_circos_links(...)
      2. │ ├─dplyr::bind_rows(...) 00_pkg_src/SanzCircos/R/make_circos_links.R:50:5
      3. │ │ ├─dplyr:::flatten_bindable(dots_values(...))
      4. │ │ └─rlang::dots_values(...)
      5. │ └─pbapply::pblapply(...)
      6. │   └─base::lapply(X, FUN, ...)
      7. │     └─SanzCircos:::FUN(X[[i]], ...)
      8. │       ├─base::`[<-`(`*tmp*`, 1, 2, value = "chr1") 00_pkg_src/SanzCircos/R/generate_searchable_links.R:34:6
      9. │       └─tibble:::`[<-.tbl_df`(`*tmp*`, 1, 2, value = "chr1") 00_pkg_src/SanzCircos/R/generate_searchable_links.R:34:6
     10. │         └─tibble:::tbl_extract_assign2(x, i, j, value)
     11. │           └─tibble:::map(...)
     12. │             └─base::lapply(.x, .f, ...)
     13. │               └─tibble:::FUN(X[[i]], ...)
     14. │                 └─vctrs::`vec_slice<-`(`*tmp*`, i, val
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘tidyr’
      All declared Imports should be used.
    ```

# sapfluxnetr

<details>

* Version: 0.0.7
* Source code: https://github.com/cran/sapfluxnetr
* URL: https://github.com/sapfluxnet/sapfluxnetr
* BugReports: https://github.com/sapfluxnet/sapfluxnetr/issues
* Date/Publication: 2019-05-01 10:40:03 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"sapfluxnetr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: plot method for sfn_data class
    > ### Aliases: sfn_plot
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    > 
    > # data
    > data('ARG_TRE', package = 'sapfluxnetr')
    > 
    > # plotting directly
    > sfn_plot(ARG_TRE, type = 'sapf')
    > 
    > # this could be noisy, you can facet by "Tree" (for sapflow) or by
    > # "Variable" (for environmental data):
    > sfn_plot(ARG_TRE, type = 'sapf') +
    +   facet_wrap(~ Tree)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# sf

<details>

* Version: 0.7-7
* Source code: https://github.com/cran/sf
* URL: https://github.com/r-spatial/sf/, https://r-spatial.github.io/sf/
* BugReports: https://github.com/r-spatial/sf/issues/
* Date/Publication: 2019-07-24 10:30:02 UTC
* Number of recursive dependencies: 137

Run `revdep_details(,"sf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    st_red> x = read_sf(geojson_txt)
    Error: `x` must be a vector, not a `sfc_MULTIPOINT/sfc` object
    Backtrace:
         █
      1. ├─utils::example(st_read)
      2. │ └─base::source(...)
      3. │   ├─base::withVisible(eval(ei, envir))
      4. │   └─base::eval(ei, envir)
      5. │     └─base::eval(ei, envir)
      6. ├─sf::read_sf(geojson_txt) /tmp/RtmpnpZhHz/Rexbea516bbbf77:34:0
      7. │ ├─sf::st_read(...) 00_pkg_src/sf/R/read.R:232:8
      8. │ └─sf:::st_read.character(...) 00_pkg_src/sf/R/read.R:112:10
      9. │   └─sf:::process_cpl_read_ogr(...) 00_pkg_src/sf/R/read.R:214:8
     10. │     ├─base::`[[<-`(...) 00_pkg_src/sf/R/read.R:174:8
     11. │     └─tibble:::`[[<-.tbl_df`(...) 00_pkg_src/sf/R/read.R:174:8
     12. │       └─tibble:::tbl_extract2_assign(x, j = i, value)
     13. │         └─vctrs::vec_recycle(value, vec_size(x))
     14. └─vctrs:::stop_scalar_type(...)
     15.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
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
           █
        1. └─nc %>% filter(AREA > 0.1) %>% plot()
        2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
        3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
        4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
        5.       └─`_fseq`(`_lhs`)
        6.         └─magrittr::freduce(value, `_function_list`)
        7.           └─function_list[[i]](value)
        8.             ├─dplyr::filter(., AREA > 0.1)
        9.             ├─sf:::filter.sf(., AREA > 0.1)
       10.             │ └─sf:::.re_sf(...) /home/rstudio/tibble/revdep/checks/sf/new/sf.Rcheck/00_pkg_src/sf/R/tidyverse.R:25:8
       11.             │   └─base::stopifnot(...) /home/rstudio/tibble/revdep/checks/sf/new/sf.Rcheck/00_pkg_src/sf/R/tidyverse.R:55:8
       12.             ├─base::NextMethod() /home/rstudio/tibble/revdep/checks/sf/new/sf.Rcheck/00_pkg_src/sf/R/tidyverse.R:25:8
       13.   
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 25.7Mb
      sub-directories of 1Mb or more:
        doc     12.0Mb
        libs     9.2Mb
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
    ...
    > ###   ct_triangulate ct_triangulate.sfc ct_triangulate ct_triangulate.sf
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.5.1, GDAL 2.1.2, PROJ 4.9.3
    > nc <- read_sf(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
    Error: `x` must be a vector, not a `sfc_MULTIPOLYGON/sfc` object
    Backtrace:
         █
      1. ├─sf::read_sf(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
      2. │ ├─sf::st_read(...)
      3. │ └─sf:::st_read.character(...)
      4. │   └─sf:::process_cpl_read_ogr(...)
      5. │     ├─base::`[[<-`(...)
      6. │     └─tibble:::`[[<-.tbl_df`(...)
      7. │       └─tibble:::tbl_extract2_assign(x, j = i, value)
      8. │         └─vctrs::vec_recycle(value, vec_size(x))
      9. └─vctrs:::stop_scalar_type(...)
     10.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 34.312614440918, 34.2848167419434, 34.2827987670898, 34.2678833007812, 34.2616806030273, 
                 34.2433624267578, 34.2422866821289, 34.1892433166504, 33.9925804138184, 33.9142913818359, 
                 33.8819923400879, 33.948673248291), .Dim = c(27L, 2L)))), class = c("XY", 
             "MULTIPOLYGON", "sfg"))), n_empty = 0L, crs = structure(list(epsg = 4267L, proj4string = "+proj=longlat +datum=NAD27 +no_defs"), class = "crs"), class = c("sfc_MULTIPOLYGON", 
         "sfc"), precision = 0, bbox = structure(c(xmin = -84.3238525390625, ymin = 33.8819923400879, 
         xmax = -75.4569778442383, ymax = 36.5896492004395), class = "bbox"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      10: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      11: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-basic-ct.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simrel

<details>

* Version: 2.0
* Source code: https://github.com/cran/simrel
* URL: https://simulatr.github.io/simrel/
* BugReports: https://github.com/simulatr/simrel/issues
* Date/Publication: 2019-04-01 18:00:09 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"simrel")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > gridExtra::grid.arrange(p1, p2, p3, ncol = 3)
    Error: Vector of length 2 cannot be recycled to length 169. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─gridExtra::grid.arrange(p1, p2, p3, ncol = 3)
      2. │ └─gridExtra::arrangeGrob(...)
      3. │   └─base::lapply(grobs[toconv], ggplot2::ggplotGrob)
      4. │     └─ggplot2:::FUN(X[[i]], ...)
      5. │       ├─ggplot2::ggplot_gtable(ggplot_build(x))
      6. │       ├─ggplot2::ggplot_build(x)
      7. │       └─ggplot2:::ggplot_build.ggplot(x)
      8. │         └─layout$setup(data, plot$data, plot$plot_env)
      9. │           └─ggplot2:::f(..., self = self)
     10. │             └─base::lapply(...)
     11. │               └─ggplot2:::FUN(X[[i]], ...)
     12. │                 └─ggplot2:::f(...)
     13. │                   ├─base::`[<-`(...)
     14. │                   └─tibble:::`[<-.tbl_df`(...)
     15. │                     └─tibble:::tbl_extract_assign(x, j, value)
     16. │              
    Execution halted
    ```

# simTool

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/simTool
* URL: https://github.com/MarselScheer/simTool
* BugReports: https://github.com/MarselScheer/simTool/issues
* Date/Publication: 2019-03-22 14:00:02 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"simTool")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    36 6 6 rnorm 100     NA     NA nor.q 0.050       5% -1.6618754 0.15134804
    > ggplot(a, aes(x=fun, y=mean, color=proc)) + geom_point(size=I(3)) + facet_grid(probs ~ n)
    Error: Vector of length 2 cannot be recycled to length 36. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─(function (x, ...) ...
      2. ├─ggplot2:::print.ggplot(x)
      3. │ ├─ggplot2::ggplot_build(x)
      4. │ └─ggplot2:::ggplot_build.ggplot(x)
      5. │   └─layout$setup(data, plot$data, plot$plot_env)
      6. │     └─ggplot2:::f(..., self = self)
      7. │       └─base::lapply(...)
      8. │         └─ggplot2:::FUN(X[[i]], ...)
      9. │           └─ggplot2:::f(...)
     10. │             ├─base::`[<-`(...)
     11. │             └─tibble:::`[<-.tbl_df`(...)
     12. │               └─tibble:::tbl_extract_assign(x, j, value)
     13. │                 └─vctrs::vec_recycle(value, vec_size(x))
     14. └─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 36L)
     15.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      names for target but not for current
      
      [1] "Estimated replications per hour:  15598651"
      [1] "Estimated replications per hour:  12796181"
      [1] "Estimated replications per hour:  37907"
      [1] "Estimated replications per hour:  788390"
      [1] "Estimated replications per hour:  214624"
      [1] "Estimated replications per hour:  1054404"
      [1] "Estimated replications per hour:  207838"
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 119 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: Two groups for summary_fun. Results were created and stored in simulation (@test_eval_tibbles.R#825) 
      
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
* Number of recursive dependencies: 53

Run `revdep_details(,"skimr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > skim(iris)
    Skim summary statistics
     n obs: 150 
     n variables: 5 
    Error: Vector of length 6 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─(function (x, ...) ...
      2. ├─skimr:::print.skim_df(x)
      3. │ ├─dplyr::do(grouped, skim_render(., grps, print_impl, ...)) 00_pkg_src/skimr/R/skim_print.R:27:2
      4. │ └─dplyr:::do.grouped_df(...)
      5. │   └─rlang::eval_tidy(args[[j]], mask)
      6. ├─skimr:::skim_render(., grps, print_impl, ...)
      7. │ ├─base::`[<-`(...) 00_pkg_src/skimr/R/skim_print.R:89:4
      8. │ └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/skimr/R/skim_print.R:89:4
      9. │   └─tibble:::tbl_extract_assign(x, j, value)
     10. │     └─vctrs::vec_recycle(value, vec_size(x))
     11. └─vctrs:::stop_recycle_incompatible_size(x_size = 6L, size = 1L)
     12.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 350 | SKIPPED: 2 | WARNINGS: 1 | FAILED: 14 ]
      1. Error: A class with an empty function list returns nothing (@test-functions.R#144) 
      2. Error: Skim prints a header for the entire output and each type (@test-skim_print.R#6) 
      3. Error: Skim prints a special header for grouped data frames (@test-skim_print.R#19) 
      4. Error: Skim prints a special header for vectors (@test-skim_print.R#27) 
      5. Error: Skim collapses counts and other multivalue stats into one cell (@test-skim_print.R#35) 
      6. Error: Skim aligns numeric vectors at the decimal point by default (@test-skim_print.R#40) 
      7. Error: Skimr kable prints as expected, 64-bit (@test-skim_print.R#56) 
      8. Error: skimr::pander prints as expected (@test-skim_print.R#130) 
      9. Error: Using skim_tee returns the object (@test-skim.R#36) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# socviz

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/socviz
* URL: https://github.com/kjhealy/socviz
* BugReports: https://github.com/kjhealy/socviz/issues
* Date/Publication: 2019-04-23 12:00:03 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"socviz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: center_df
    > ### Title: center_df
    > ### Aliases: center_df
    > 
    > ### ** Examples
    > 
    > head(center_df(organdata))
    Error: Vector of length 13 cannot be recycled to length 238. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─utils::head(center_df(organdata))
     2. ├─socviz::center_df(organdata)
     3. │ ├─base::`[<-`(...) 00_pkg_src/socviz/R/utility_functions.r:274:4
     4. │ └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/socviz/R/utility_functions.r:274:4
     5. │   └─tibble:::tbl_extract_assign(x, j, value)
     6. │     └─vctrs::vec_recycle(value, vec_size(x))
     7. └─vctrs:::stop_recycle_incompatible_size(x_size = 13L, size = 238L)
     8.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

# spbabel

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/spbabel
* URL: https://mdsumner.github.io/spbabel
* BugReports: https://github.com/mdsumner/spbabel/issues
* Date/Publication: 2019-01-08 18:10:10 UTC
* Number of recursive dependencies: 92

Run `revdep_details(,"spbabel")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 34.2433624267578, 34.2422866821289, 34.1892433166504, 33.9925804138184, 33.9142913818359, 
                 33.8819923400879, 33.948673248291), .Dim = c(27L, 2L)))), class = c("XY", 
             "MULTIPOLYGON", "sfg"))), n_empty = 0L, crs = structure(list(epsg = 4267L, proj4string = "+proj=longlat +datum=NAD27 +no_defs"), class = "crs"), class = c("sfc_MULTIPOLYGON", 
         "sfc"), precision = 0, bbox = structure(c(xmin = -84.3238525390625, ymin = 33.8819923400879, 
         xmax = -75.4569778442383, ymax = 36.5896492004395), class = "bbox"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      10: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      11: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 70 | SKIPPED: 3 | WARNINGS: 3 | FAILED: 2 ]
      1. Error: sf conversion works (@test-sf.R#31) 
      2. Error: (unknown) (@test-sf.R#66) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# srvyr

<details>

* Version: 0.3.5
* Source code: https://github.com/cran/srvyr
* URL: http://gdfe.co/srvyr, https://github.com/gergness/srvyr
* BugReports: https://github.com/gergness/srvyr/issues
* Date/Publication: 2019-07-09 12:10:03 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"srvyr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Incompatible type for column `survey_total_upp`: x numeric, y matrix
      
      ── 3. Failure: deff and df work for grouped survey total  ──────────────────────
      `x` not equal to `y`.
      Incompatible type for column `survey_ratio_low`: x numeric, y matrix
      Incompatible type for column `survey_ratio_upp`: x numeric, y matrix
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 0 | WARNINGS: 6 | FAILED: 3 ]
      1. Failure: deff and df work for grouped survey mean 
      2. Failure: deff and df work for grouped survey total 
      3. Failure: deff and df work for grouped survey total 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# staRdom

<details>

* Version: 1.0.14
* Source code: https://github.com/cran/staRdom
* URL: https://cran.r-project.org/package=staRdom
* BugReports: https://github.com/MatthiasPucher/staRdom/issues
* Date/Publication: 2019-06-27 08:30:07 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"staRdom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > data(eem_list)
    > eem_list <- eem_exclude(eem_list[1:5] %>%
    + `class<-`("eemlist"), exclude = list(em = c(318,322,326,550,438), ex = c(270,275))) %>%
    + eem_bind(eem_list[6:15] %>% `class<-`("eemlist"))
    > ggeem(eem_list)
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in globalVariables(".groups") : 
      could not find function "globalVariables"
    Error: package or namespace load failed for ‘staRdom’:
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

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        doc   3.3Mb
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

# statVisual

<details>

* Version: 1.1.8
* Source code: https://github.com/cran/statVisual
* Date/Publication: 2019-06-03 14:10:03 UTC
* Number of recursive dependencies: 157

Run `revdep_details(,"statVisual")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
           probeid      gene chr
    probe1  probe1 fakeGene1   1
    probe2  probe2 fakeGene2   1
    > 
    > # choose the first probe which is over-expressed in cases
    > pDat$probe1 = dat[1,]
    > 
    > # check histograms of probe 1 expression in cases and controls
    > print(table(pDat$grp, useNA = "ifany"))
    
     0  1 
    10 10 
    > 
    > statVisual(type = 'Den', 
    +            data = pDat, 
    +            y = 'probe1', 
    +            group = 'grp') 
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("ProgressBarText", representation(steps = "integer",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘affy’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gbm’ ‘ggfortify’ ‘multigroup’ ‘tibble’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("ProgressBarText", representation(steps = "integer",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘affy’
    Execution halted
    ```

# stlcsb

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/stlcsb
* URL: https://github.com/slu-openGIS/stlcsb
* BugReports: https://github.com/slu-openGIS/stlcsb/issues
* Date/Publication: 2019-02-22 00:20:02 UTC
* Number of recursive dependencies: 116

Run `revdep_details(,"stlcsb")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > csb <- dplyr::filter(csb, missing == FALSE)
    > 
    > # project data
    > csb_projectXY(csb, srx, sry)
    Error: `x` must be a vector, not a `sfc_POINT/sfc` object
    Backtrace:
         █
      1. ├─stlcsb::csb_projectXY(csb, srx, sry)
      2. │ ├─sf::st_as_sf(.data, coords = c(x = varXN, y = varYN), crs = "+proj=tmerc +lat_0=35.83333333333334 +lon_0=-90.5 +k=0.9999333333333333 +x_0=250000 +y_0=0 +datum=NAD83 +units=us-ft +no_defs ") 00_pkg_src/stlcsb/R/csb_projectXY.R:61:2
      3. │ └─sf:::st_as_sf.data.frame(...)
      4. │   ├─base::`$<-`(...)
      5. │   └─tibble:::`$<-.tbl_df`(...)
      6. │     └─tibble:::col_recycle(value, x, name)
      7. │       ├─base::tryCatch(...)
      8. │       │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
      9. │       │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     10. │       │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
     11. │       └─vctrs::vec_recycle(value, vec_size(x))
     12. └─vctrs:::stop_scalar_type(...)
     13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_sc
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             1023786.973), class = c("XY", "POINT", "sfg")), structure(c(886745.714, 1000976.339
             ), class = c("XY", "POINT", "sfg")), structure(c(886745.714, 1000976.339), class = c("XY", 
             "POINT", "sfg"))), n_empty = 0L, precision = 0, crs = structure(list(epsg = NA_integer_, 
             proj4string = NA_character_), class = "crs"), bbox = structure(c(xmin = 872868.084, 
         ymin = 985130.701, xmax = 910286.755, ymax = 1061922.056), class = "bbox"), class = c("sfc_POINT", 
         "sfc"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      13: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      14: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
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

# styler

<details>

* Version: 1.1.1
* Source code: https://github.com/cran/styler
* URL: https://github.com/r-lib/styler
* BugReports: https://github.com/r-lib/styler/issues
* Date/Publication: 2019-05-06 21:50:03 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"styler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   code <- "a <- function(x) { if(x > 1) { 1+1 } else {x} }"
    +   nested_pd <- styler:::compute_parse_data_nested(code)
    +   initialized <- styler:::pre_visit(nested_pd, c(default_style_guide_attributes))
    +   styler:::create_node_from_nested_root(initialized, structure_only = FALSE)
    + }
    Error: Vector of length 6 cannot be recycled to length 1. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─styler:::pre_visit(nested_pd, c(default_style_guide_attributes))
      2. │ └─styler:::visit_one(pd_nested, funs) 00_pkg_src/styler/R/visit.R:23:2
      3. │   └─purrr::reduce(funs, function(x, fun) fun(x), .init = pd_flat) 00_pkg_src/styler/R/visit.R:51:2
      4. │     └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
      5. │       └─styler:::fn(out, elt, ...)
      6. │         └─styler:::fun(x) 00_pkg_src/styler/R/visit.R:51:2
      7. │           └─`%>%`(...) 00_pkg_src/styler/R/initialize.R:14:2
      8. │             ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      9. │             └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     10. │               └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     11. │                 └─styler:::`_fseq`(`_lhs`)
     12. │              
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 2 | WARNINGS: 41 | FAILED: 120 ]
      1. Error: create_trees outputs identical structure if trees have same structure (@test-create_tree.R#7) 
      2. Error: create_trees outputs are not identical structure if trees have different structure (@test-create_tree.R#17) 
      3. Error: non-ASCII characters are handled properly for text styling (@test-encoding.R#4) 
      4. Error: reindent function declaration (@test-fun_dec.R#2) 
      5. Error: indention on one-liner curley only is not changed (@test-indention_curly.R#4) 
      6. Error: indention with multi-line curley only is correct (@test-indention_curly.R#11) 
      7. Error: indention with multi-line curley and round is correct (@test-indention_curly.R#19) 
      8. Error: complete styling via top level api is correct (round, curly, spacing) (@test-indention_curly.R#29) 
      9. Error: edge cases work (@test-indention_fun_calls.R#4) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suddengains

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/suddengains
* URL: https://github.com/milanwiedemann/suddengains
* BugReports: https://github.com/milanwiedemann/suddengains/issues
* Date/Publication: 2019-08-20 12:40:02 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"suddengains")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Create a data set with one gain per person
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
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 22 whereas the index has size 946.
    Execution halted
    ```

# survminer

<details>

* Version: 0.4.5
* Source code: https://github.com/cran/survminer
* URL: http://www.sthda.com/english/rpkgs/survminer/
* BugReports: https://github.com/kassambara/survminer/issues
* Date/Publication: 2019-08-03 09:00:02 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"survminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    OV death         0.21875000 0.3437500 0.3750000 0.3750000
    BRCA progression 0.34482759 0.4137931 0.4137931 0.4137931
    LUNG progression 0.25641026 0.3589744 0.3846154 0.3846154
    OV progression   0.18750000 0.2812500 0.2812500 0.2812500
    
    $var
                               1           2           3           4
    BRCA no event    0.005277565 0.007933520 0.007933520 0.007933520
    LUNG no event    0.005083701 0.005740953 0.005740953 0.006209164
    OV no event      0.004338366 0.006323011 0.007854783 0.007854783
    BRCA death       0.006783761 0.007478906 0.007478906 0.007478906
    LUNG death       0.001887310 0.004961788 0.004961788 0.004961788
    OV death         0.005593145 0.007641923 0.008089627 0.008089627
    BRCA progression 0.008299977 0.009699862 0.009699862 0.009699862
    LUNG progression 0.005097395 0.006324651 0.006608777 0.006608777
    OV progression   0.004972034 0.006833076 0.006833076 0.006833076
    
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# sweep

<details>

* Version: 0.2.1.1
* Source code: https://github.com/cran/sweep
* URL: https://github.com/business-science/sweep
* BugReports: https://github.com/business-science/sweep/issues
* Date/Publication: 2018-08-19 08:51:40 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"sweep")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     forecast(level = c(80, 95, 99)) %>%
    +     sw_sweep()
    Error: Vector of length 0 cannot be recycled to length 72. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─`%>%`(...)
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         ├─base::withVisible(function_list[[k]](value))
      8. │         └─function_list[[k]](value)
      9. │           ├─sweep::sw_sweep(.)
     10. │           └─sweep:::sw_sweep.forecast(.) 00_pkg_src/sweep/R/sw_sweep.R:51:4
     11. │             ├─timetk::tk_tbl(...) 00_pkg_src/sweep/R/sw_sweep.R:82:8
     12. │             └─timetk:::tk_tbl.ts(...)
     13. │               ├─timetk::tk_tbl(...)
     14. │               └─timetk:::tk_tbl.zooreg(...)
     15. │                 ├─timetk::tk_tbl(...
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 92 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 10 ]
      1.  Error: sw_sweep test returns tibble with correct rows and columns. (@test_sw_sweep.R#11) 
      2.  Error: sw_*.Arima test returns tibble with correct rows and columns. (@test_tidiers_arima.R#86) 
      3.  Error: sw_*.bats test returns tibble with correct rows and columns. (@test_tidiers_bats_tbats.R#58) 
      4.  Error: sw_*.decomposed.ts test returns tibble with correct rows and columns. (@test_tidiers_decomposed_ts.R#16) 
      5.  Error: sw_*.ets test returns tibble with correct rows and columns. (@test_tidiers_ets.R#37) 
      6.  Error: sw_*.HoltWinters test returns tibble with correct rows and columns. (@test_tidiers_hw.R#28) 
      7.  Error: sw_*.nnetar test returns tibble with correct rows and columns. (@test_tidiers_nnetar.R#31) 
      8.  Error: sw_*.robets test returns tibble with correct rows and columns. (@test_tidiers_robets.R#38) 
      9.  Error: sw_*.stl test returns tibble with correct rows and columns. (@test_tidiers_stl.R#16) 
      10. Error: sw_*.StructTS test returns tibble with correct rows and columns. (@test_tidiers_StructTS.R#40) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# taxa

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/taxa
* URL: https://github.com/ropensci/taxa
* BugReports: https://github.com/ropensci/taxa/issues
* Date/Publication: 2019-01-02 22:40:04 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"taxa")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         1, 3, 2, 4, 1, 3, 2, 4, 1, 3, 2)))
      8: `[<-.tbl_df`(`*tmp*`, i, value = list(tax = c(1, 2, 3, 4, 1, 5, 6, 7, 1, 2, 8, 9), 
             my_rank = c(4, 1, 3, 2, 4, 1, 3, 2, 4, 1, 3, 2)))
      9: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      10: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      11: stop_recycle_incompatible_size(x_size = 2L, size = 12L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      12: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      13: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 592 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#69) 
      
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

# textfeatures

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/textfeatures
* URL: https://github.com/mkearney/textfeatures
* BugReports: https://github.com/mkearney/textfeatures/issues
* Date/Publication: 2019-04-12 17:52:46 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"textfeatures")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > textfeatures(trump_tweets)
    [32m↪[39m [38;5;244mCounting features in text...[39m
    [32m↪[39m [38;5;244mSentiment analysis...[39m
    [32m↪[39m [38;5;244mParts of speech...[39m
    [32m↪[39m [38;5;244mWord dimensions estimated[39m
    [32m↪[39m [38;5;244mNormalizing data[39m
    Error: Vector of length 32 cannot be recycled to length 5. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─textfeatures::textfeatures(trump_tweets)
      2. ├─textfeatures:::textfeatures.character(trump_tweets) 00_pkg_src/textfeatures/R/textfeatures.R:60:2
      3. │ ├─textfeatures::scale_normal(scale_count(o)) 00_pkg_src/textfeatures/R/textfeatures.R:123:4
      4. │ │ └─purrr::map_lgl(x, is.numeric) 00_pkg_src/textfeatures/R/scale.R:49:2
      5. │ └─textfeatures::scale_count(o) 00_pkg_src/textfeatures/R/textfeatures.R:123:4
      6. │   ├─base::`[<-`(...) 00_pkg_src/textfeatures/R/scale.R:19:2
      7. │   └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/textfeatures/R/scale.R:19:2
      8. │     └─tibble:::tbl_extract_assign(x, j, value)
      9. │       └─vctrs::vec_recycle(value, vec_size(x))
     10. └─vctrs:::stop_recycle_incompatible_size(x_size = 32L, size = 5L)
     11.   └─vctrs:::stop_vctrs(message = message, .subcla
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             0, 0, 0), n_third_person = c(0, 0, 0, 0), n_tobe = c(0.301029995663981, 0, 0, 
             0), n_prepositions = c(0.301029995663981, 0, 0, 0), w1 = c(0, 0, 0, 0), w2 = c(0.301029995663981, 
             0, 0.301029995663981, 0.301029995663981))) at /home/rstudio/tibble/revdep/checks/textfeatures/new/textfeatures.Rcheck/00_pkg_src/textfeatures/R/scale.R:19
      8: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      9: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      10: stop_recycle_incompatible_size(x_size = 35L, size = 4L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      11: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      12: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: main textfeatures function (@test-main.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# textrecipes

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/textrecipes
* URL: https://github.com/tidymodels/textrecipes
* BugReports: https://github.com/tidymodels/textrecipes/issues
* Date/Publication: 2018-12-17 23:30:03 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"textrecipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > juice(okc_obj, essay0) %>% 
    +   slice(1:2)
    # A tibble: 2 x 1
      essay0     
      <list>     
    1 <chr [184]>
    2 <chr [24]> 
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
    # A tibble: 1 x 3
      terms  value id        
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: abort(error_column_must_be_vector(names_x[is_xd], classes)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:151
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 49 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Error: hashing gives double outputs (@test-hashing.R#31) 
      2. Error: stemming is done correctly (@test-stem.R#32) 
      3. Error: stopwords are removed correctly (@test-stopwords.R#33) 
      4. Error: step_tf works as intended (@test-tf.R#47) 
      5. Error: step_tfidf works as intended (@test-tfidf.R#48) 
      6. Error: tokenfilter removes words correctly using min_times and max_times (@test-tokenfilter.R#47) 
      7. Error: tokenization is done correctly (@test-tokenize.R#40) 
      8. Error: output is not a list (@test-untokenize.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# tidybayes

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/tidybayes
* URL: http://mjskay.github.io/tidybayes, https://github.com/mjskay/tidybayes
* BugReports: https://github.com/mjskay/tidybayes/issues/new
* Date/Publication: 2019-06-02 21:10:03 UTC
* Number of recursive dependencies: 191

Run `revdep_details(,"tidybayes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
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
    # A tibble: 3 x 8
    # Groups:   i [3]
      i         j     b   .lower .upper .width .point .interval
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'rstan', 'rstanarm', 'brms'
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘brms’, ‘rstanarm’, ‘rstan’
    ```

# tidycells

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/tidycells
* URL: https://r-rudra.github.io/tidycells/, https://github.com/r-rudra/tidycells
* BugReports: https://github.com/r-rudra/tidycells/issues
* Date/Publication: 2019-08-20 10:30:02 UTC
* Number of recursive dependencies: 110

Run `revdep_details(,"tidycells")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   "block 1", "", "C", "D", "", "block 2", "", "C",
    +   "D", "", "A", "1", "2", "", "", "A", "10", "20", "", "B", "3",
    +   "4", "", "", "B", "30", "40"
    + ), .Dim = c(9L, 3L))
    > d <- as.data.frame(d)
    > cd <- as_cell_df(d) %>% numeric_values_classifier()
    Error: `data_type == "chr" ~ as.character(chr)`, `data_type == "cplx" ~ as.character(cplx)`, `data_type == "dbl" ~ as.character(dbl)`, `data_type == "int" ~ as.character(int)`, `data_type == "lgl" ~ as.character(lgl)`, ... must be length 27 or one, not 4, 5, 6, 7, 8, 9, 10, 11
    Backtrace:
         █
      1. ├─as_cell_df(d) %>% numeric_values_classifier()
      2. │ └─base::eval(lhs, parent, parent)
      3. │   └─base::eval(lhs, parent, parent)
      4. ├─tidycells::as_cell_df(d)
      5. ├─tidycells:::as_cell_df.data.frame(d) 00_pkg_src/tidycells/R/as_cell_df.R:35:2
      6. │ └─d %>% attach_intermediate_class() %>% as_cell_df_internal(...) 00_pkg_src/tidycells/R/as_cell_df.R:40:2
      7. │   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      8. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      9. │     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     10. │       └─tidycells:::`_fseq`(`_lhs`)
     11. │         └─magrittr::freduce(value, `_func
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 68 | SKIPPED: 3 | WARNINGS: 4 | FAILED: 15 ]
      1. Error: analyze_cell works: base (@test-analyze_cells.R#8) 
      2. Error: analyze_cell works: tidyxl (@test-analyze_cells.R#38) 
      3. Error: as_cell_df() works on unpivotr::as_cells (@test-as_cell_df.R#44) 
      4. Error: as_cell_df() works on data.frame (@test-as_cell_df.R#52) 
      5. Error: cell_df to DF (and vice versa) works (@test-cells_to_df.R#3) 
      6. Error: etc works (@test-etc.R#43) 
      7. Error: etc 2 works (@test-etc.R#125) 
      8. Error: optional_package dependency test (@test-optional_package.R#15) 
      9. Error: print cell-analysis works works (@test-print_cell_analysis.R#3) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyLPA

<details>

* Version: 1.0.4
* Source code: https://github.com/cran/tidyLPA
* URL: https://data-edu.github.io/tidyLPA/
* BugReports: https://github.com/data-edu/tidyLPA/issues
* Date/Publication: 2019-08-19 18:50:05 UTC
* Number of recursive dependencies: 106

Run `revdep_details(,"tidyLPA")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: f(...)
      17: join_keys(facet_vals, layout, by = vars)
      18: id(joint, drop = TRUE)
      19: id_var(.variables[[1]], drop = drop)
      20: sort(unique(x), na.last = TRUE)
      21: sort.default(unique(x), na.last = TRUE)
      22: sort.int(x, na.last = na.last, decreasing = decreasing, ...)
      23: stop("'x' must be atomic")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 10 | SKIPPED: 13 | WARNINGS: 2 | FAILED: 1 ]
      1. Error: (unknown) (@test-plot-mixtures.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mix’
      All declared Imports should be used.
    ```

# tidync

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/tidync
* URL: https://github.com/ropensci/tidync
* BugReports: https://github.com/ropensci/tidync/issues
* Date/Publication: 2019-05-23 11:10:03 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"tidync")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: hyper_filter
    > ### Title: Subset NetCDF variable by expression
    > ### Aliases: hyper_filter hyper_filter.tidync
    > 
    > ### ** Examples
    > 
    > f <- "S20080012008031.L3m_MO_CHL_chlor_a_9km.nc"
    > l3file <- system.file("extdata/oceandata", f, package= "tidync")
    > ## filter by value
    > tidync(l3file) %>% hyper_filter(lon = lon < 100)
    
    Data Source (1): S20080012008031.L3m_MO_CHL_chlor_a_9km.nc ...
    
    Grids (4) <dimension family> : <associated variables> 
    
    [1]   D1,D0 : chlor_a    **ACTIVE GRID** ( 9331200  values per variable)
    [2]   D3,D2 : palette
    [3]   D0    : lat
    [4]   D1    : lon
    Error: Columns `V2`, `V1` must have a unique name
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      21: mutate_impl(.data, dots, caller_env())
      
      ── 3. Failure: utils work (@test-utils.R#52)  ──────────────────────────────────
      `hd` not equal to hyper_dims(tnc).
      Cols in y but not x: `active`, `count.x`, `start.x`, `count.y`, `start.y`. 
      Cols in x but not y: `start`, `count`. 
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 69 | SKIPPED: 5 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: nc_char is handled gracefully (@test-nc_char.R#9) 
      2. Error: print works (@test-print.R#8) 
      3. Failure: utils work (@test-utils.R#52) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidypmc

<details>

* Version: 1.7
* Source code: https://github.com/cran/tidypmc
* URL: https://github.com/cstubben/tidypmc
* BugReports: https://github.com/ropensci/tidypmc/issues
* Date/Publication: 2019-08-01 10:40:02 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"tidypmc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > doc <- xml2::read_xml(system.file("extdata/PMC2231364.xml",
    +   package = "tidypmc"
    + ))
    > x <- pmc_table(doc)
    Parsing 4 tables
    Error: Vector of length 5 cannot be recycled to length 39. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─tidypmc::pmc_table(doc)
      2. │ └─base::lapply(...) 00_pkg_src/tidypmc/R/pmc_table.R:45:4
      3. │   └─tidypmc:::FUN(X[[i]], ...)
      4. │     ├─base::suppressMessages(repeat_sub(x)) 00_pkg_src/tidypmc/R/pmc_table.R:191:6
      5. │     │ └─base::withCallingHandlers(expr, message = function(c) invokeRestart("muffleMessage"))
      6. │     └─tidypmc:::repeat_sub(x) 00_pkg_src/tidypmc/R/pmc_table.R:191:6
      7. │       ├─base::suppressMessages(readr::type_convert(y)) 00_pkg_src/tidypmc/R/repeat_sub.R:56:6
      8. │       │ └─base::withCallingHandlers(expr, message = function(c) invokeRestart("muffleMessage"))
      9. │       └─readr::type_convert(y) 00_pkg_src/tidypmc/R/repeat_sub.R:56:6
     10. │         ├─base::`[<-`(...)
     11. │         └─tibble:::`[<-.tbl_df`(...)
     12. │           └─t
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         "Degradation and transport/binding of amino acids", "Degradation and transport/binding of amino acids", 
         "others", "others", "others", "others", "others", "others", "others", "others", "others", 
         "others", "others", "others", "others", "others")))
      12: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      13: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      14: stop_recycle_incompatible_size(x_size = 5L, size = 39L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      15: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      16: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 23 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@tests-pmc_table.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyquant

<details>

* Version: 0.5.6
* Source code: https://github.com/cran/tidyquant
* URL: https://github.com/business-science/tidyquant
* BugReports: https://github.com/business-science/tidyquant/issues
* Date/Publication: 2019-04-22 19:30:03 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"tidyquant")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # coord_x_date
    > AAPL <- tq_get("AAPL")
    Error: Vector of length 0 cannot be recycled to length 2678. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─tidyquant::tq_get("AAPL")
      2. │ └─tidyquant:::tq_get_base(...) 00_pkg_src/tidyquant/R/tq_get.R:159:8
      3. │   └─tidyquant:::tq_get_util_1(x, get, ...) 00_pkg_src/tidyquant/R/tq_get.R:276:4
      4. │     └─`%>%`(...) 00_pkg_src/tidyquant/R/tq_get.R:475:8
      5. │       ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      6. │       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      7. │         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      8. │           └─tidyquant:::`_fseq`(`_lhs`)
      9. │             └─magrittr::freduce(value, `_function_list`)
     10. │               └─function_list[[i]](value)
     11. │                 ├─timetk::tk_tbl(...)
     12. │                 └─timetk:::tk_tbl.xts(...)
     13. │                   ├─timetk::tk_tbl(...)
     14. │            
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 29 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 9 ]
      1. Error: (unknown) (@test_tq_get_compound_getters.R#7) 
      2. Error: (unknown) (@test_tq_get_dividends.R#7) 
      3. Error: (unknown) (@test_tq_get_economic_data.R#7) 
      4. Error: (unknown) (@test_tq_get_splits.R#7) 
      5. Error: (unknown) (@test_tq_get_stock_prices.R#7) 
      6. Error: (unknown) (@test_tq_mutate.R#5) 
      7. Error: (unknown) (@test_tq_performance.R#8) 
      8. Error: (unknown) (@test_tq_portfolio.R#8) 
      9. Error: (unknown) (@test_tq_transmute.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

# tidyr

<details>

* Version: 0.8.3
* Source code: https://github.com/cran/tidyr
* URL: http://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Date/Publication: 2019-03-01 23:00:03 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"tidyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     $ Sepal.Length: Factor w/ 6 levels "1","2","5.1",..: 3 4
     $ Species     : Factor w/ 6 levels "1","2","5.1",..: 5 6
     $ Species_num : Factor w/ 6 levels "1","2","5.1",..: 1 2
    > df %>% spread(var, value, convert = TRUE) %>% str
    Error: Vector of length 3 cannot be recycled to length 2. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─df %>% spread(var, value, convert = TRUE) %>% str
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         └─function_list[[i]](value)
      8. │           ├─tidyr::spread(., var, value, convert = TRUE)
      9. │           └─tidyr:::spread.data.frame(., var, value, convert = TRUE) 00_pkg_src/tidyr/R/spread.R:50:2
     10. │             ├─base::`[<-`(...) 00_pkg_src/tidyr/R/spread.R:114:4
     11. │             └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/tidyr/R/spread.R:114:4
     12. │               └─tibble:::tbl_extract_assign(x, j, value)
     13. │                 └
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 321 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 19 ]
      1. Failure: can handle collapsed rows (@test-separate-rows.R#5) 
      2. Failure: can handle empty data frames (#308) (@test-separate-rows.R#11) 
      3. Failure: default pattern does not split decimals in nested strings (@test-separate-rows.R#16) 
      4. Error: drops grouping when needed (@test-separate-rows.R#30) 
      5. Error: convert produces integers etc (@test-separate-rows.R#41) 
      6. Failure: leaves list columns intact (#300) (@test-separate-rows.R#53) 
      7. Failure: leaves list columns intact (#300) (@test-separate-rows.R#54) 
      8. Failure: convert turns strings into integers (@test-spread.R#21) 
      9. Error: spread can produce mixed variable types (#118) (@test-spread.R#115) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# tidystats

<details>

* Version: 0.3
* Source code: https://github.com/cran/tidystats
* Date/Publication: 2019-01-03 01:10:08 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"tidystats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Add output to the results list
    > results <- results %>%
    +   add_stats(model1, identifier = "M1") %>%
    +   add_stats(model2, identifier = "M2")
    > 
    > # Save the results
    > dir <- tempdir()
    > write_stats(results, file.path(dir, "results.txt"))
    Error: Vector of length 5 cannot be recycled to length 15. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─tidystats::write_stats(results, file.path(dir, "results.txt"))
     2. │ └─readr::write_csv(df, path = path, na = "") 00_pkg_src/tidystats/R/write_stats.R:49:2
     3. │   └─readr::write_delim(...)
     4. │     ├─base::`[<-`(...)
     5. │     └─tibble:::`[<-.tbl_df`(...)
     6. │       └─tibble:::tbl_extract_assign(x, j, value)
     7. │         └─vctrs::vec_recycle(value, vec_size(x))
     8. └─vctrs:::stop_recycle_incompatible_size(x_size = 5L, size = 15L)
     9.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Error in setClass("lmList4", representation(call = "call", pool = "logical",  : 
      could not find function "setClass"
    ```

# tidytransit

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/tidytransit
* URL: https://github.com/r-transit/tidytransit
* BugReports: https://github.com/r-transit/tidytransit
* Date/Publication: 2019-06-29 18:00:03 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"tidytransit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: get_route_geometry
    > 
    > ### ** Examples
    > 
    > data(gtfs_obj)
    > routes_sf <- get_route_geometry(gtfs_obj)
    Error: `x` must be a vector, not a `sfc_MULTILINESTRING/sfc` object
    Backtrace:
         █
      1. ├─tidytransit::get_route_geometry(gtfs_obj)
      2. │ ├─base::`$<-`(...) 00_pkg_src/tidytransit/R/spatial.R:37:2
      3. │ └─tibble:::`$<-.tbl_df`(...) 00_pkg_src/tidytransit/R/spatial.R:37:2
      4. │   └─tibble:::col_recycle(value, x, name)
      5. │     ├─base::tryCatch(...)
      6. │     │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
      7. │     │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      8. │     │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
      9. │     └─vctrs::vec_recycle(value, vec_size(x))
     10. └─vctrs:::stop_scalar_type(...)
     11.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             epsg = NA_integer_, proj4string = NA_character_), class = "crs"), bbox = structure(c(xmin = -78.95535554, 
         ymin = 35.994104, xmax = -78.9037367360214, ymax = 36.021022), class = "bbox"), class = c("sfc_POINT", 
         "sfc"))), "x") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      16: stop_vctrs(msg, "vctrs_error_scalar_type", actual = x) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:368
      17: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 61 | SKIPPED: 9 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: Can convert a gtfsr routes dataframe 
                to a simple features dataframe (@test-spatial.R#7) 
      2. Error: Can convert a gtfsr stops dataframe 
                to a simple features dataframe (@test-spatial.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
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

* Version: 0.1.1.1
* Source code: https://github.com/cran/timetk
* URL: https://github.com/business-science/timetk
* BugReports: https://github.com/business-science/timetk/issues
* Date/Publication: 2018-08-19 08:51:43 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"timetk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    3 -8.36     3
    4 16.0      2
    5  3.30     1
    > tk_tbl(data_ts, timetk_idx = TRUE)  # Returns time-based tbl
    Error: Vector of length 0 cannot be recycled to length 5. Only vectors of length one or of the same length can be recycled.
    Backtrace:
         █
      1. ├─timetk::tk_tbl(data_ts, timetk_idx = TRUE)
      2. ├─timetk:::tk_tbl.ts(data_ts, timetk_idx = TRUE) 00_pkg_src/timetk/R/tk_tbl.R:90:4
      3. │ └─`%>%`(...) 00_pkg_src/timetk/R/tk_tbl.R:226:12
      4. │   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      5. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6. │     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      7. │       └─timetk:::`_fseq`(`_lhs`)
      8. │         └─magrittr::freduce(value, `_function_list`)
      9. │           ├─base::withVisible(function_list[[k]](value))
     10. │           └─function_list[[k]](value)
     11. │             ├─timetk::tk_tbl(...)
     12. │             └─timetk:::tk_tbl.xts(...) 00_pkg_src/timetk/R/tk_tbl.R:90:4
     13. │               ├─timetk::tk_tbl(...) 00_pkg_src/timetk/R/tk_tbl.R:13
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 86 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 14 ]
      1. Error: (unknown) (@test_tk_index.R#8) 
      2. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#64) 
      3. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#71) 
      4. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#78) 
      5. Failure: tk_make_future_timeseries(date) test returns correct format. (@test_tk_make_future_timeseries.R#100) 
      6. Failure: tk_make_future_timeseries(predict_every_two) test returns correct format. (@test_tk_make_future_timeseries.R#312) 
      7. Failure: tk_make_future_timeseries(predict_every_three) test returns correct format. (@test_tk_make_future_timeseries.R#351) 
      8. Failure: tk_make_future_timeseries(predict_every_four) test returns correct format. (@test_tk_make_future_timeseries.R#389) 
      9. Failure: tk_make_future_timeseries(predict_random) test returns correct format. (@test_tk_make_future_timeseries.R#433) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# units

<details>

* Version: 0.6-4
* Source code: https://github.com/cran/units
* URL: https://github.com/r-quantities/units/
* BugReports: https://github.com/r-quantities/units/issues/
* Date/Publication: 2019-08-22 06:30:02 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"units")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 1. Error: mixed units work (@test_mixed.R#46)  ──────────────────────────────
      All columns in a tibble must be 1d or 2d objects:
      * Column `m` is mixed_units
      1: print(tibble::tibble(m)) at testthat/test_mixed.R:46
      2: tibble::tibble(m)
      3: lst_to_tibble(xlq$output, .rows, .name_repair, lengths = xlq$lengths) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/tibble.R:140
      4: check_valid_cols(x) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:126
      5: abort(error_column_must_be_vector(names_x[is_xd], classes)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/as_tibble.R:151
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 422 | SKIPPED: 5 | WARNINGS: 13 | FAILED: 1 ]
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
* Number of recursive dependencies: 87

Run `revdep_details(,"unpivotr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Levels: c < d
    
    > 
    > # HTML tables can be extracted from the output of xml2::read_html().  These
    > # are returned as a list of tables, similar to rvest::html_table().  The
    > # value of each cell is its standalone HTML string, which can contain
    > # anything -- even another table.
    > 
    > colspan <- system.file("extdata", "colspan.html", package = "unpivotr")
    > rowspan <- system.file("extdata", "rowspan.html", package = "unpivotr")
    > nested <- system.file("extdata", "nested.html", package = "unpivotr")
    > 
    > ## Not run: 
    > ##D browseURL(colspan)
    > ##D browseURL(rowspan)
    > ##D browseURL(nestedspan)
    > ## End(Not run)
    > 
    > as_cells(xml2::read_html(colspan))
    Error: Columns `5`, `6`, `7` cannot have NA as name
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: lapply(tables, as_cells) at /home/rstudio/tibble/revdep/checks/unpivotr/new/unpivotr.Rcheck/00_pkg_src/unpivotr/R/as_cells.R:233
      12: FUN(X[[i]], ...)
      13: as_cells.xml_node(X[[i]], ...) at /home/rstudio/tibble/revdep/checks/unpivotr/new/unpivotr.Rcheck/00_pkg_src/unpivotr/R/as_cells.R:88
      14: dplyr::arrange(out, col, row) at /home/rstudio/tibble/revdep/checks/unpivotr/new/unpivotr.Rcheck/00_pkg_src/unpivotr/R/as_cells.R:227
      15: arrange.tbl_df(out, col, row)
      16: arrange_impl(.data, dots, environment())
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 245 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 3 ]
      1. Error: as_cells() works with html tables (@test-as_cells.R#53) 
      2. Error: behead() handles headers of mixed data types including dates (@test-behead.R#106) 
      3. Error: tidy_table works with html tables (@test-tidy_table.R#52) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# utile.tables

<details>

* Version: 0.1.5
* Source code: https://github.com/cran/utile.tables
* Date/Publication: 2019-07-01 11:10:03 UTC
* Number of recursive dependencies: 35

Run `revdep_details(,"utile.tables")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > data_lung <- lung %>%
    +   as_tibble() %>%
    +   mutate_at(vars(inst, status, sex), as.factor) %>%
    +   mutate(status = case_when(status == 1 ~ 0, status == 2 ~ 1))
    > 
    > # Stand-alone row
    > build_event_row(
    +    label = 'Meal calories',
    +    col = 'meal.cal',
    +    fit = coxph(Surv(time, status) ~ meal.cal, data = data_lung)
    + )
    # A tibble: 1 x 6
      Variable      Subjects Events    HR    `[95%CI]` p     
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: .replace_na(table) at /home/rstudio/tibble/revdep/checks/utile.tables/new/utile.tables.Rcheck/00_pkg_src/utile.tables/R/build_row.R:135
      6: replace(x, is.na(x), "") at /home/rstudio/tibble/revdep/checks/utile.tables/new/utile.tables.Rcheck/00_pkg_src/utile.tables/R/utils.R:415
      7: `[<-`(`*tmp*`, list, value = "")
      8: `[<-.tbl_df`(`*tmp*`, list, value = "")
      9: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      10: vec_as_index_extract_compat(j, ncol(x), names = names(x), full_column = TRUE) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:394
      11: vec_as_index(j, n) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:437
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 5 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: build_row: factor (@test-build_row.R#41) 
      2. Error: build_row: factor, by (@test-build_row.R#52) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘magrittr’ ‘tidyr’
      All declared Imports should be used.
    ```

# utile.tools

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/utile.tools
* Date/Publication: 2019-07-01 08:20:03 UTC
* Number of recursive dependencies: 30

Run `revdep_details(,"utile.tools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(tibble)
    > library(survival)
    > 
    > # coxph() Object
    > coxph_data <- as_tibble(cgd)
    > 
    > tabulate_model(
    +    fit = coxph(
    +       Surv(tstart, tstop, status) ~ age + center + sex,
    +       data = coxph_data
    +    )
    +  )
    Warning in fitter(X, Y, strats, offset, init, control, weights = weights,  :
      Loglik converged before variable  2,3,4,5,6,7,9,10,11,12,13 ; beta may be infinite. 
    Warning in fitter(X, Y, strats, offset, init, control, weights = weights,  :
      Loglik converged before variable  2,3,4,5,6,7,9,10,11,12,13 ; beta may be infinite. 
    Error: Logical indices must have length 1 or be as long as the indexed vector.
    The vector has size 6 whereas the index has size 96.
    Execution halted
    ```

# valr

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/valr
* URL: http://github.com/rnabioco/valr, http://rnabioco.github.io/valr
* BugReports: https://github.com/rnabioco/valr/issues
* Date/Publication: 2019-01-03 16:20:04 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"valr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Identify closest intervals.
    > ### Aliases: bed_closest
    > 
    > ### ** Examples
    > 
    > x <- trbl_interval(
    +   ~chrom, ~start, ~end,
    +   'chr1', 100,    125
    + )
    > 
    > y <- trbl_interval(
    +   ~chrom, ~start, ~end,
    +   'chr1', 25,     50,
    +   'chr1', 140,    175
    + )
    > 
    > bed_glyph(bed_closest(x, y))
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.9Mb
      sub-directories of 1Mb or more:
        libs  10.8Mb
    ```

# vcfR

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/vcfR
* URL: https://github.com/knausb/vcfR, https://knausb.github.io/vcfR_documentation/
* Date/Publication: 2018-04-17 17:11:27 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"vcfR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data("vcfR_test")
    > vcf <- vcfR_test
    > 
    > 
    > # extract all the INFO and FORMAT fields into a list of tidy
    > # data frames: fix, gt, and meta. Here we don't coerce columns
    > # to integer or numeric types...
    > Z <- vcfR2tidy(vcf)
    Error: Vector of length 2 cannot be recycled to length 5. Only vectors of length one or of the same length can be recycled.
    Backtrace:
        █
     1. ├─vcfR::vcfR2tidy(vcf)
     2. │ ├─base::do.call(what = extract_info_tidy, args = info_dots) 00_pkg_src/vcfR/R/vcfR_to_tidy_functions.R:263:2
     3. │ └─(function (x, info_fields = NULL, info_types = TRUE, info_sep = ";") ...
     4. │   ├─base::`[<-`(...) 00_pkg_src/vcfR/R/vcfR_to_tidy_functions.R:405:6
     5. │   └─tibble:::`[<-.tbl_df`(...) 00_pkg_src/vcfR/R/vcfR_to_tidy_functions.R:405:6
     6. │     └─tibble:::tbl_extract_assign(x, j, value)
     7. │       └─vctrs::vec_recycle(value, vec_size(x))
     8. └─vctrs:::stop_recycle_incompatible_size(x_size = 2L, size = 5L)
     9.   └─vctrs:::stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         11L, 10L, 13L, 9L))) at /home/rstudio/tibble/revdep/checks/vcfR/new/vcfR.Rcheck/00_pkg_src/vcfR/R/vcfR_to_tidy_functions.R:405
      4: tbl_extract_assign(x, j, value) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:361
      5: vec_recycle(value, vec_size(x)) at /tmp/RtmppNSSyb/R.INSTALL6682cb965c/tibble/R/subsetting.R:392
      6: stop_recycle_incompatible_size(x_size = 2L, size = 5L) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/recycle.R:43
      7: stop_vctrs(message = message, .subclass = "vctrs_error_recycle_incompatible_size") at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:379
      8: abort(message, .subclass = c(.subclass, "vctrs_error"), ...) at /tmp/RtmpPWU0EU/R.INSTALL51b4d72789e/vctrs/R/conditions.R:44
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 466 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 3 ]
      1. Error: extract_gt_tidy works for all elements (@test_vcfRtidy.R#70) 
      2. Error: vcfR2tidy works (@test_vcfRtidy.R#80) 
      3. Error: extract_info_tidy works with Flags (@test_vcfRtidy.R#116) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.1Mb
      sub-directories of 1Mb or more:
        libs   8.1Mb
    ```

# vctrs

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/vctrs
* URL: https://github.com/r-lib/vctrs
* BugReports: https://github.com/r-lib/vctrs/issues
* Date/Publication: 2019-07-05 23:00:04 UTC
* Number of recursive dependencies: 68

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

# vroom

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/vroom
* URL: https://github.com/r-lib/vroom
* BugReports: https://github.com/r-lib/vroom/issues
* Date/Publication: 2019-06-28 07:50:03 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"vroom")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2. Error: vroom works with many connections (@test-multi-file.R#79) 
      3. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#87) 
      4. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#89) 
      5. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#91) 
      6. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#93) 
      7. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#95) 
      8. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#97) 
      9. Failure: does not writes a trailing .0 for whole number doubles (@test-vroom_write.R#99) 
      1. ...
      
      Error: testthat unit tests failed
      In addition: Warning messages:
      1: closing unused connection 4 (/tmp/Rtmp73TouC/file17d0e7bf0d244/1.csv.gz) 
      2: closing unused connection 4 (/tmp/Rtmp73TouC/mtcars.csv.bz2) 
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.5Mb
      sub-directories of 1Mb or more:
        libs  13.5Mb
    ```

# xpose

<details>

* Version: 0.4.4
* Source code: https://github.com/cran/xpose
* URL: https://github.com/UUPharmacometrics/xpose
* BugReports: https://github.com/UUPharmacometrics/xpose/issues
* Date/Publication: 2019-03-21 17:10:03 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"xpose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xpose-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: amt_vs_idv
    > ### Title: Compartment kinetics
    > ### Aliases: amt_vs_idv
    > 
    > ### ** Examples
    > 
    > amt_vs_idv(xpdb_ex_pk)
    Using data from $prob no.1
    Tidying data by ID, SEX, MED1, MED2, AMT ... and 20 more variables
    Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) : 
      'x' must be atomic
    Calls: <Anonymous> ... join_keys -> id -> id_var -> sort -> sort.default -> sort.int
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 346 | SKIPPED: 4 | WARNINGS: 1 | FAILED: 16 ]
      1. Error: (unknown) (@test-list_nm_tables.R#24) 
      2. Error: (unknown) (@test-manual_import.R#7) 
      3. Error: (unknown) (@test-plots.R#23) 
      4. Error: warnings and errors are properly returned (@test-print_xpose_plots.R#20) 
      5. Error: read_nm_files handles one file with inappropriate format (@test-read_nm_files.R#36) 
      6. Error: properly parses a model given via the file and dir arguments (@test-read_nm_model.R#21) 
      7. Error: properly parses a model given via the runno and dir arguments (@test-read_nm_model.R#25) 
      8. Error: properly handles missing code in output file (@test-read_nm_model.R#29) 
      9. Error: problem record is present even if no text has been supplied (@test-read_nm_model.R#35) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc    2.9Mb
        help   1.1Mb
    ```

