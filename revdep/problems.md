# abjutils

Version: 0.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘httr’
      All declared Imports should be used.
    ```

# afmToolkit

Version: 0.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘assertthat’ ‘tibble’
      All declared Imports should be used.
    ```

# alphavantager

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# anomalyDetection

Version: 0.2.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘caret’
      All declared Imports should be used.
    ```

# antaresViz

Version: 0.11

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘geojsonio’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# babynames

Version: 0.3.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        data   8.9Mb
    ```

# banR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# batchtools

Version: 0.9.6

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Rmpi’
    ```

# bikedata

Version: 0.0.4

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
     9: timing_fn(handle(ev <- withCallingHandlers(withVisible(eval(expr,     envir, enclos)), warning = wHandler, error = eHandler, message = mHandler)))
    10: evaluate_call(expr, parsed$src[[i]], envir = envir, enclos = enclos,     debug = debug, last = i == length(out), use_try = stop_on_error !=         2L, keep_warning = keep_warning, keep_message = keep_message,     output_handler = output_handler, include_timing = include_timing)
    11: evaluate(code, envir = env, new_device = FALSE, keep_warning = !isFALSE(options$warning),     keep_message = !isFALSE(options$message), stop_on_error = if (options$error &&         options$include) 0L else 2L, output_handler = knit_handlers(options$render,         options))
    12: in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,     keep_warning = !isFALSE(options$warning), keep_message = !isFALSE(options$message),     stop_on_error = if (options$error && options$include) 0L else 2L,     output_handler = knit_handlers(options$render, options)))
    13: block_exec(params)
    14: call_block(x)
    15: process_group.block(group)
    16: process_group(group)
    17: withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        setwd(wd)        cat(res, sep = "\n", file = output %n% "")        message("Quitting from lines ", paste(current_lines(i),             collapse = "-"), " (", knit_concord$get("infile"),             ") ")    })
    18: process_file(text, output)
    19: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet,     encoding = encoding)
    20: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv())
    21: vweave_rmarkdown(...)
    22: engine$weave(file, quiet = quiet, encoding = enc)
    23: doTryCatch(return(expr), name, parentenv, handler)
    24: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    25: tryCatchList(expr, classes, parentenv, handlers)
    26: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    find_vignette_product(name, by = "weave", engine = engine)}, error = function(e) {    stop(gettextf("processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)), domain = NA, call. = FALSE)})
    27: buildVignettes(dir = "/home/muelleki/git/R/tibble/revdep/checks/bikedata/new/bikedata.Rcheck/vign_test/bikedata")
    An irrecoverable exception occurred. R is aborting now ...
    Segmentation fault (core dumped)
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        libs   5.5Mb
    ```

# billboard

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 660 marked UTF-8 strings
    ```

# bioCancer

Version: 1.4.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'bioCancer.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘magrittr’ ‘ggplot2’ ‘lubridate’ ‘tidyr’ ‘cgdsr’ ‘RCurl’ ‘XML’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 22.3Mb
      sub-directories of 1Mb or more:
        base        6.9Mb
        bioCancer   3.1Mb
        doc         2.8Mb
        quant       7.7Mb
    ```

# biomartr

Version: 0.5.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             download_url, "' currently available?", call. = FALSE)
      
      trying URL 'ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/overview.txt'
      Content type 'unknown' length 2921876 bytes (2.8 MB)
      ==================================================
      trying URL 'ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/metagenomes/assembly_summary.txt'
      Content type 'unknown' length 362999 bytes (354 KB)
      ==================================================
      testthat results ================================================================
      OK: 40 SKIPPED: 0 FAILED: 1
      1. Error: The getAssemblyStats() downloads assembly stats file and reads raw
                input: NCBI Genbank .. (@test-getAssemblyStats.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# blkbox

Version: 1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘bigrf’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘glmnet’ ‘gtools’ ‘knitr’ ‘nnet’ ‘parallel’ ‘rJava’ ‘reshape’
      ‘rmarkdown’ ‘shinyjs’
      All declared Imports should be used.
    Missing or unexported object: ‘xgboost::predict’
    ```

# bold

Version: 0.5.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      1. Failure: bold_specimens returns the correct dimensions or values (@test-bold_specimens.R#16) 
      a$recordID inherits from `NULL` not `integer`.
      
      
      2. Failure: bold_specimens returns the correct dimensions or values (@test-bold_specimens.R#17) 
      a$processid inherits from `NULL` not `character`.
      
      
      testthat results ================================================================
      OK: 80 SKIPPED: 0 FAILED: 2
      1. Failure: bold_specimens returns the correct dimensions or values (@test-bold_specimens.R#16) 
      2. Failure: bold_specimens returns the correct dimensions or values (@test-bold_specimens.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# breathtestcore

Version: 0.4.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# breathteststan

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 28.9Mb
      sub-directories of 1Mb or more:
        libs  28.7Mb
    ```

# bsam

Version: 1.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rworldxtra’ ‘sp’
      All declared Imports should be used.
    ```

# caffsim

Version: 0.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘markdown’
      All declared Imports should be used.
    ```

# cepR

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 287 marked UTF-8 strings
    ```

# childsds

Version: 0.6.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20 marked UTF-8 strings
    ```

# congressbr

Version: 0.1.1

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 43-44 (chamber.Rmd) 
    Error: processing vignette 'chamber.Rmd' failed with diagnostics:
    Timeout was reached: Resolving timed out after 10000 milliseconds
    Execution halted
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘congressbr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sen_bills
    > ### Title: Downloads and tidies information on the legislation in the
    > ###   Federal Senate
    > ### Aliases: sen_bills
    > 
    > ### ** Examples
    > 
    > pls_5_2010 <- sen_bills(type = "PLS", number = 5, year = 2010)
    Error in curl::curl_fetch_memory(url, handle = handle) : 
      Timeout was reached: Resolving timed out after 10001 milliseconds
    Calls: sen_bills ... request_fetch -> request_fetch.write_memory -> <Anonymous> -> .Call
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# countyweather

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# crosswalkr

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# dat

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                                    ^
      tests/testthat/test-trunc-mat.R:5:3: style: Variable and function names should not be longer than 25 characters.
        print_arg_names_without_ellipsis <- setdiff(print_arg_names, "...")
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      tests/testthat/test-trunc-mat.R:9:16: style: Variable and function names should not be longer than 25 characters.
        expect_equal(print_arg_names_without_ellipsis, trunc_mat_arg_names)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
      
      testthat results ================================================================
      OK: 108 SKIPPED: 0 FAILED: 1
      1. Failure: Package Style (@test-lintr.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dataonderivatives

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `df2` inherits from `NULL` not `data.frame`.
      
      
      3. Failure: BSDR API accesible (@test-bsdr.R#9) --------------------------------
      nrow(df1) <= nrow(df2) isn't true.
      
      
      testthat results ================================================================
      OK: 24 SKIPPED: 0 FAILED: 3
      1. Failure: BSDR API accesible (@test-bsdr.R#6) 
      2. Failure: BSDR API accesible (@test-bsdr.R#8) 
      3. Failure: BSDR API accesible (@test-bsdr.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stats’
      All declared Imports should be used.
    ```

# datapasta

Version: 2.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(datapasta)
      > 
      > test_check("datapasta")
      1. Error: .rs.readUiPref() returns an integer (@test_rstudio.R#7) --------------
      could not find function ".rs.readUiPref"
      1: expect_type(.rs.readUiPref("num_spaces_for_tab"), type = "integer") at testthat/test_rstudio.R:7
      2: typeof(object)
      
      testthat results ================================================================
      OK: 12 SKIPPED: 17 FAILED: 1
      1. Error: .rs.readUiPref() returns an integer (@test_rstudio.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dbplyr

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[12]: "1          4.3         3.0          1.1         0.1  setosa"
      
      
      testthat results ================================================================
      OK: 388 SKIPPED: 10 FAILED: 5
      1. Failure: ungrouped output (@test-output.R#14) 
      2. Failure: ungrouped output (@test-output.R#14) 
      3. Failure: ungrouped output (@test-output.R#14) 
      4. Failure: ungrouped output (@test-output.R#14) 
      5. Failure: ungrouped output (@test-output.R#14) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# dotwhisker

Version: 0.3.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘arm’
    ```

# dplyr

Version: 0.7.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 32.9Mb
      sub-directories of 1Mb or more:
        libs  31.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# enigma

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: stop("need an API key for the Enigma API")
      
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 8
      1. Error: enigma_data column selection works correctly (@test-enigma_data.R#8) 
      2. Error: enigma_data works correctly for sorting data (@test-enigma_data.R#20) 
      3. Error: enigma_data works correctly to get data subset (@test-enigma_data.R#33) 
      4. Error: enigma_metadata basic functionality works (@test-enigma_metadata.R#10) 
      5. Error: enigma_metadata parent node data differs from child node data (@test-enigma_metadata.R#21) 
      6. Error: enigma_stats works correctly with varchar column (@test-enigma_stats.R#9) 
      7. Error: enigma_stats works correctly with numeric column (@test-enigma_stats.R#20) 
      8. Error: enigma_stats works correctly with date column (@test-enigma_stats.R#32) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# esc

Version: 0.4.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘metafor’
    ```

# evaluator

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggalt’ ‘pander’ ‘psych’
      All declared Imports should be used.
    Missing or unexported object: ‘purrr::by_row’
    ```

# exifr

Version: 0.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        exiftool  12.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# flextable

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: pmap_chr(x, function(image_src, width, height) {
             format(external_img(src = image_src, width = width, height = height), type = type)
         })
      7: .f(image_src = .l[[c(1L, i)]], width = .l[[c(2L, i)]], height = .l[[c(3L, i)]], ...)
      8: format(external_img(src = image_src, width = width, height = height), type = type)
      9: external_img(src = image_src, width = width, height = height)
      10: stopifnot(file.exists(src))
      11: stop(msg, call. = FALSE, domain = NA)
      
      testthat results ================================================================
      OK: 67 SKIPPED: 0 FAILED: 1
      1. Error: images (@test-images.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading required package: officer
    Quitting from lines 323-336 (format.Rmd) 
    Error: processing vignette 'format.Rmd' failed with diagnostics:
    file.exists(src) is not TRUE
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# foghorn

Version: 0.4.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      testthat results ================================================================
      OK: 51 SKIPPED: 0 FAILED: 8
      1. Failure: output of summary cran results (@test-foghorn.R#176) 
      2. Failure: output of summary cran results (@test-foghorn.R#178) 
      3. Failure: output of summary cran results (@test-foghorn.R#189) 
      4. Failure: output of summary cran results (@test-foghorn.R#201) 
      5. Failure: output of summary cran results (@test-foghorn.R#213) 
      6. Failure: output of summary cran results (@test-foghorn.R#226) 
      7. Failure: output of summary cran results (@test-foghorn.R#233) 
      8. Failure: output of summary cran results (@test-foghorn.R#239) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# FSelectorRcpp

Version: 0.1.8

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        doc    2.2Mb
        libs   8.7Mb
    ```

# ftDK

Version: 1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 39 marked UTF-8 strings
    ```

# gastempt

Version: 0.4.01

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 58.6Mb
      sub-directories of 1Mb or more:
        libs  58.2Mb
    ```

# geojson

Version: 0.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘jqr’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# GerminaR

Version: 1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘shinydashboard’
      All declared Imports should be used.
    ```

# ggalt

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘plotly’
      All declared Imports should be used.
    ```

# ggconf

Version: 0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# ggenealogy

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2356 marked UTF-8 strings
    ```

# ggfortify

Version: 0.4.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘ggfortify-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gglagplot
    > ### Title: Plot time series against lagged versions of themselves
    > ### Aliases: gglagplot
    > 
    > ### ** Examples
    > 
    > gglagplot(AirPassengers)
    Error: `x` must be a vector, not a ts object, do you want `stats::lag()`?
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
        expect_equal(nrow(iris_tbl[-(1:10), 0]), nrow_iris - 10)
                                    ^
      
      
      testthat results ================================================================
      OK: 1616 SKIPPED: 0 FAILED: 6
      1. Failure: autoplot.aareg works for lung (@test-surv.R#220) 
      2. Failure: autoplot.aareg works for lung (@test-surv.R#221) 
      3. Failure: autoplot.aareg works for lung (@test-surv.R#222) 
      4. Failure: autoplot.aareg works for lung (@test-surv.R#223) 
      5. Error: gglagplot (@test-tslib.R#103) 
      6. Failure: Code Lint (@test_lint.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.0Mb
    ```

# ggguitar

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gridExtra’ ‘lazyeval’ ‘readr’
      All declared Imports should be used.
    ```

# ggimage

Version: 0.0.7

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘magick’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggplot2

Version: 2.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘reshape2’
      All declared Imports should be used.
    ```

# ggplotAssist

Version: 0.1.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gcookbook’ ‘ggthemes’ ‘moonBook’ ‘tidyverse’
      All declared Imports should be used.
    ```

# ggraptR

Version: 1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > if (Sys.getenv("NOT_CRAN") == "true") {  # like global skip_on_cran
      +   Sys.setenv("R_TESTS" = "")  # accroding to https://github.com/hadley/testthat/issues/144
      +   test_check("ggraptR")
      + }
      
      Initial plotError in file(filename, "r", encoding = encoding) : 
        cannot open the connection
      Calls: test_check ... source -> withVisible -> eval -> eval -> source -> file
      In addition: Warning message:
      In file(filename, "r", encoding = encoding) :
        cannot open file '../../inst/ggraptR/functions/helper.R': No such file or directory
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘GGally’ ‘RColorBrewer’ ‘Rcpp’ ‘assertthat’ ‘backports’
      ‘colorspace’ ‘colourpicker’ ‘evaluate’ ‘futile.options’ ‘gdtools’
      ‘gtable’ ‘htmltools’ ‘htmlwidgets’ ‘httpuv’ ‘labeling’ ‘lambda.r’
      ‘lazyeval’ ‘magrittr’ ‘miniUI’ ‘munsell’ ‘plyr’ ‘reshape’ ‘rprojroot’
      ‘scales’ ‘stringi’ ‘stringr’ ‘svglite’ ‘tibble’ ‘xtable’ ‘yaml’
      All declared Imports should be used.
    ```

# googleLanguageR

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             else {
                 stop(ex$message, call. = FALSE)
             }
         })
      3: tryCatchList(expr, classes, parentenv, handlers)
      4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      5: value[[3L]](cond)
      6: stop(ex$message, call. = FALSE)
      
      testthat results ================================================================
      OK: 30 SKIPPED: 7 FAILED: 1
      1. Error: Translation works (@test_unit.R#181) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# haven

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘hms’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# hddtools

Version: 0.7

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      trying URL 'ftp://ftp.bafg.de/pub/REFERATE/GRDC/ltdata/africa.zip'
      Content type 'unknown' length 10558875 bytes (10.1 MB)
      ==================================================
      1. Error: Test tsGRDC function (@test-tsGRDC.R#6) ------------------------------
      cannot open the connection
      1: tsGRDC(stationID = 1107700) at testthat/test-tsGRDC.R:6
      2: readLines(fpath)
      3: file(con, "r")
      
      testthat results ================================================================
      OK: 25 SKIPPED: 0 FAILED: 1
      1. Error: Test tsGRDC function (@test-tsGRDC.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# highcharter

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.5Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.9Mb
    ```

# huxtable

Version: 1.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: withCallingHandlers(withVisible(code), warning = handle_warning, message = handle_message)
      5: withVisible(code)
      6: rmarkdown::render("table-tester-2.Rmd", quiet = TRUE, output_format = "pdf_document")
      7: convert(output_file, run_citeproc)
      8: pandoc_convert(utf8_input, pandoc_to, output_format$pandoc$from, output, citeproc, 
             output_format$pandoc$args, !quiet)
      9: stop("pandoc document conversion failed with error ", result, call. = FALSE)
      
      testthat results ================================================================
      OK: 289 SKIPPED: 48 FAILED: 2
      1. Error: Row heights do not screw up LaTeX multicol (@test-with-pandoc.R#20) 
      2. Error: table-tester-2.Rmd renders without errors in LaTeX (@test-with-pandoc.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘xtable’
    ```

# incgraph

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# influxdbr

Version: 0.14.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 12
      1. Error: connection (@test_query.R#12) 
      2. Error: single query no chunking (@test_query.R#24) 
      3. Error: multiple query no chunking (@test_query.R#65) 
      4. Error: single query with chunking (@test_query.R#84) 
      5. Error: multiple query with chunking (@test_query.R#101) 
      6. Error: multiple query with chunking and xts result (@test_query.R#118) 
      7. Error: connection (@test_schema_exploration.R#12) 
      8. Error: show commands (@test_schema_exploration.R#25) 
      9. Error: connection (@test_write.R#12) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# IONiseR

Version: 2.0.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:base':
    
        apply
    
    
    Attaching package: 'GenomicAlignments'
    
    The following object is masked from 'package:dplyr':
    
        last
    
    
    Attaching package: 'ShortRead'
    
    The following object is masked from 'package:dplyr':
    
        id
    
    Error: processing vignette 'IONiseR.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc       3.6Mb
        extdata   1.5Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘start_time’
    readFast5Summary.mc: no visible binding for global variable ‘duration’
    readFast5Summary.mc: no visible binding for global variable
      ‘num_events’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘baseCalledTemplate’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘baseCalledComplement’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘component’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘idx’
    show,Fast5Summary: no visible binding for global variable ‘full_2D’
    show,Fast5Summary: no visible binding for global variable ‘pass’
    Undefined global functions or variables:
      := AAAAA TTTTT accumulation baseCalledComplement baseCalledTemplate
      bases_called category channel circleFun component duration error freq
      full_2D group hour idx matrixCol matrixRow meanZValue mean_value
      median_signal minute mux name nbases new_reads num_events oddEven
      pass pentamer rbindlist readIDs seq_length start_time time_bin
      time_group x y zvalue
    ```

# jaod

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 23 SKIPPED: 0 FAILED: 9
      1. Error: jaod_article many inputs (@test-jaod_article.R#23) 
      2. Failure: jaod_article fails well (@test-jaod_article.R#38) 
      3. Error: jaod_article_search works (@test-jaod_article_search.R#6) 
      4. Error: jaod_article_search - params work (@test-jaod_article_search.R#25) 
      5. Error: jaod_journal works (@test-jaod_journal.R#6) 
      6. Error: jaod_journal many inputs (@test-jaod_journal.R#23) 
      7. Failure: jaod_journal fails well (@test-jaod_journal.R#38) 
      8. Error: jaod_journal_search works (@test-jaod_journal_search.R#6) 
      9. Error: jaod_journal_search - params work (@test-jaod_journal_search.R#29) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jpmesh

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# jpndistrict

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 188 marked UTF-8 strings
    ```

# kokudosuuchi

Version: 0.4.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringi’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52458 marked UTF-8 strings
    ```

# KraljicMatrix

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘tibble’
      All declared Imports should be used.
    ```

# microdemic

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      3: check_key(key)
      4: stop("API key needed for Microsoft Academic")
      
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 7
      1. Error: ma_evaluate works as expected (@test-abstract.R#7) 
      2. Error: ma_calchist works as expected (@test-calchist.R#7) 
      3. Error: ma_evaluate works as expected (@test-evaluate.R#7) 
      4. Error: ma_graph_search works as expected (@test-graph_search.R#19) 
      5. Error: ma_interpret works as expected (@test-interpret.R#7) 
      6. Error: ma_search works as expected (@test-search.R#7) 
      7. Error: ma_similarity works as expected (@test-similarity.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# mnis

Version: 0.2.7

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat-a.R’ failed.
    Last 13 lines of output:
      1. Failure: mnis_additional returns expected format (@test_additional.R#80) ----
      `xi` has length 296, not length 285.
      
      
      2. Failure: mnis_extra returns expected format (@test_extra.R#10) --------------
      `xmnise` has length 192, not length 188.
      
      
      testthat results ================================================================
      OK: 97 SKIPPED: 0 FAILED: 2
      1. Failure: mnis_additional returns expected format (@test_additional.R#80) 
      2. Failure: mnis_extra returns expected format (@test_extra.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# modelr

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# modeval

Version: 0.1.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning: Deprecated
    Quitting from lines 112-115 (modeval.Rmd) 
    Error: processing vignette 'modeval.Rmd' failed with diagnostics:
    the argument has already been evaluated
    Execution halted
    ```

# monkeylearn

Version: 0.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             out$push(condition)
             invokeRestart("muffleMessage")
         })
      4: monkeylearn_extract(request = c("  ", "I do not know what the horse is doing in the house"))
      5: monkeylearn_check(output)
      6: stop("HTTP failure: ", req$status_code, "\n", content(req)$detail, call. = FALSE)
      
      testthat results ================================================================
      OK: 4 SKIPPED: 0 FAILED: 3
      1. Error: monkeylearn_parse returns a data.frame with a data.frame as attribute (@test_output.R#7) 
      2. Error: No error if no results from the extractor call (@test_output.R#55) 
      3. Error: Blank texts are handled properly (@test_text_size.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# mosaicModel

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘caret’ ‘ggformula’ ‘knitr’ ‘testthat’ ‘tidyverse’
      All declared Imports should be used.
    ```

# mregions

Version: 0.1.6

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘geojsonio’
    
    Package which this enhances but not available for checking: ‘leaflet’
    ```

# mrgsolve

Version: 0.8.10

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        libs   5.7Mb
    ```

# mudata2

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘hms’ ‘methods’
      All declared Imports should be used.
    ```

# myTAI

Version: 0.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        data   2.0Mb
        doc    2.7Mb
    ```

# nandb

Version: 0.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘autothresholdr’ ‘EBImage’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# natserv

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      3: cli$get(query = query)
      4: private$make_url(self$url, self$handle, path, query)
      5: add_query(query, url)
      6: check_key(key)
      7: getOption("NatureServeKey", stop("You need an API key for NatureServe"))
      8: stop("You need an API key for NatureServe")
      
      testthat results ================================================================
      OK: 14 SKIPPED: 0 FAILED: 3
      1. Error: ns_data works as expected (@test-ns_data.R#6) 
      2. Error: ns_images works as expected (@test-ns_images.R#6) 
      3. Error: ns_search works as expected (@test-ns_search.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# nneo

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > test_check("nneo")
      Loading required package: nneo
      1. Error: nneo_data works as expected (@test-nneo_wrangle.R#6) -----------------
      subscript out of bounds
      1: nneo_wrangle(site_code = "BART", time_start = "2016-06-20", time_end = "2016-09-21", 
             data_var = "radiation") at testthat/test-nneo_wrangle.R:6
      2: do.call("rbind", lapply(data_all, "[[", i))
      3: lapply(data_all, "[[", i)
      
      testthat results ================================================================
      OK: 9 SKIPPED: 0 FAILED: 1
      1. Error: nneo_data works as expected (@test-nneo_wrangle.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# noaastormevents

Version: 0.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘XML’ ‘choroplethr’ ‘choroplethrMaps’ ‘data.table’
      ‘forcats’ ‘hurricaneexposure’ ‘plyr’
      All declared Imports should be used.
    ```

# nycflights13

Version: 0.2.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        data   6.9Mb
    ```

# oai

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 109 SKIPPED: 0 FAILED: 9
      1. Error: count_identifiers - basic functionality (@test-count_identifiers.R#6) 
      2. Error: count_identifiers - works with many input urls (@test-count_identifiers.R#17) 
      3. Error: count_identifiers - prefix param works (@test-count_identifiers.R#32) 
      4. Failure: badArgument is triggered (@test-handle_errors.R#28) 
      5. Error: list_identifiers - from (@test-list_identifiers.R#6) 
      6. Error: list_identifiers - from & until (@test-list_identifiers.R#18) 
      7. Error: list_identifiers - set (@test-list_identifiers.R#30) 
      8. Error: list_metadataformats - no formats avail. vs. avail (@test-list_metadataformats.R#19) 
      9. Error: list_records works (@test-list_records.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# observer

Version: 0.1.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ensurer’, ‘validate’
    ```

# odbc

Version: 1.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Failure: odbcListDrivers() returns available drivers (@test-drivers.R#7) ----
      nrow(res) >= 1 isn't true.
      
      
      2. Failure: odbcListDataSources() returns available data sources (@test-drivers.R#14) 
      nrow(res) >= 1 isn't true.
      
      
      testthat results ================================================================
      OK: 5 SKIPPED: 3 FAILED: 2
      1. Failure: odbcListDrivers() returns available drivers (@test-drivers.R#7) 
      2. Failure: odbcListDataSources() returns available data sources (@test-drivers.R#14) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        libs   5.7Mb
    ```

# officer

Version: 0.1.8

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘officer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: slip_in_img
    > ### Title: append an image
    > ### Aliases: slip_in_img
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    > img.file <- file.path( Sys.getenv("R_HOME"), "doc", "html", "logo.jpg" )
    > x <- read_docx() %>%
    +   body_add_par("R logo: ", style = "Normal") %>%
    +   slip_in_img(src = img.file, style = "strong", width = .3, height = .3)
    Error: file.exists(src) is not TRUE
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: freduce(value, `_function_list`)
      7: withVisible(function_list[[k]](value))
      8: function_list[[k]](value)
      9: ph_with_img(., type = "body", src = img.file, height = 1.06, width = 1.39)
      10: external_img(src, width = width/914400, height = height/914400)
      11: stopifnot(file.exists(src))
      12: stop(msg, call. = FALSE, domain = NA)
      
      testthat results ================================================================
      OK: 341 SKIPPED: 1 FAILED: 2
      1. Error: image add  (@test-docx-add.R#68) 
      2. Error: add img into placeholder (@test-pptx-add.R#67) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 180-190 (powerpoint.Rmd) 
    Error: processing vignette 'powerpoint.Rmd' failed with diagnostics:
    file.exists(src) is not TRUE
    Execution halted
    ```

# openadds

Version: 0.2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > library("testthat")
      > test_check("openadds")
      Loading required package: openadds
      1. Failure: oa_search works (@test-oa_search.R#39) -----------------------------
      length(dd$city) not equal to 2.
      1/1 mismatches
      [1] 3 - 2 == 1
      
      
      testthat results ================================================================
      OK: 47 SKIPPED: 0 FAILED: 1
      1. Failure: oa_search works (@test-oa_search.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pangaear

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > library("testthat")
      > test_check("pangaear")
      Loading required package: pangaear
      1. Failure: fails well (@test-oai_functions.R#72) ------------------------------
      error$message does not match "Invalid datestamp".
      Actual value: "OAI-PMH errors: badArgument: from/until invalid: Text '3' could not be parsed at index 0"
      
      
      testthat results ================================================================
      OK: 72 SKIPPED: 0 FAILED: 1
      1. Failure: fails well (@test-oai_functions.R#72) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# parlitools

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13 marked UTF-8 strings
    ```

# perccalc

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘devtools’ ‘ggplot2’ ‘haven’ ‘tidyverse’
      All declared Imports should be used.
    ```

# petro.One

Version: 0.1.1

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(petro.One)
      > 
      > test_check("petro.One")
      1. Failure: when read_multidoc gets almost 3000 rows (@test_multipage.R#20) ----
      nrow(df) is not more than 2756. Difference: -565
      
      
      testthat results ================================================================
      OK: 80 SKIPPED: 0 FAILED: 1
      1. Failure: when read_multidoc gets almost 3000 rows (@test_multipage.R#20) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rgraphviz’ ‘cluster’ ‘graph’
      All declared Imports should be used.
    ```

# PKPDmisc

Version: 2.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# pointblank

Version: 0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Hmisc’ ‘digest’ ‘htmltools’ ‘knitr’ ‘lazyWeave’ ‘lubridate’ ‘rJava’
      All declared Imports should be used.
    ```

# poio

Version: 0.0-3

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ISOcodes’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# prisonbrief

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# psychmeta

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
    ```

# railtrails

Version: 0.0.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4483 marked UTF-8 strings
    ```

# rbhl

Version: 0.8.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 28
      1. Error: bhl_authorsearch returns (@test-bhl_authorsearch.R#7) 
      2. Error: bhl_bioherlib returns (@test-bhl_bioherlib.R#7) 
      3. Error: bhl_booksearch returns the correct class (@test-bhl_booksearch.R#7) 
      4. Error: bhl_getauthorities returns the correct class (@test-bhl_getauthorities.R#7) 
      5. Error: bhl_collection returns the correct class (@test-bhl_getcollections.R#7) 
      6. Error: bhl_getitembyidentifier returns the correct class (@test-bhl_getitembyidentifier.R#7) 
      7. Error: bhl_getitemmetadata returns the correct class (@test-bhl_getitemmetadata.R#7) 
      8. Error: bhl_getitempages returns the correct class (@test-bhl_getitempages.R#7) 
      9. Error: bhl_getlanguages returns the correct class (@test-bhl_getlanguages.R#7) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rcongresso

Version: 0.2.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(rcongresso)
      > 
      > test_check("rcongresso")
      Error: Column `id` must be a 1d atomic vector or a list
      In addition: Warning message:
      Unknown or uninitialised column: 'id'. 
      testthat results ================================================================
      OK: 18 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 45-50 (introducao-rcongresso.Rmd) 
    Error: processing vignette 'introducao-rcongresso.Rmd' failed with diagnostics:
    Column `id` must be a 1d atomic vector or a list
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rcv

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6543 marked UTF-8 strings
    ```

# rdpla

Version: 0.2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 5 SKIPPED: 0 FAILED: 24
      1. Error: dpla_collections basic functionality works (@test-dpla_collections.R#6) 
      2. Error: dpla_items - pagination works (@test-dpla_collections.R#20) 
      3. Error: dpla_items - fields requests work (@test-dpla_collections.R#35) 
      4. Failure: dpla_items fails well (@test-dpla_collections.R#46) 
      5. Failure: dpla_items fails well (@test-dpla_collections.R#49) 
      6. Error: dpla_collections_ basic functionality works (@test-dpla_collections_.R#6) 
      7. Error: dpla_items - pagination works (@test-dpla_collections_.R#22) 
      8. Error: dpla_items - fields requests work (@test-dpla_collections_.R#37) 
      9. Failure: dpla_items fails well (@test-dpla_collections_.R#48) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# readr

Version: 1.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        libs  12.8Mb
    ```

*   checking compiled code ... NOTE
    ```
    File ‘readr/libs/readr.so’:
      Found non-API calls to R: ‘R_GetConnection’, ‘R_WriteConnection’
    
    Compiled code should not call non-API entry points in R.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# readtext

Version: 0.50

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘antiword’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# readxl

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        libs   4.3Mb
    ```

# REDCapR

Version: 0.9.8

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 542 SKIPPED: 0 FAILED: 42
      1. Failure: All Records -Raw (@test-metadata-read.R#115) 
      2. Failure: All Records -Raw and DAG (@test-metadata-read.R#161) 
      3. Failure: All Records -label and DAG (@test-metadata-read.R#214) 
      4. Failure: All Records -label (@test-metadata-read.R#266) 
      5. Failure: All Records -Default (@test-read-batch-simple.R#70) 
      6. Failure: All Records -Default (@test-read-batch-simple.R#85) 
      7. Failure: All Records -Raw (@test-read-batch-simple.R#130) 
      8. Failure: All Records -Raw (@test-read-batch-simple.R#145) 
      9. Failure: All Records -Raw and DAG (@test-read-batch-simple.R#191) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# refimpact

Version: 1.0.0

## Newly fixed

*   R CMD check timed out
    

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘curl’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 85 marked UTF-8 strings
    ```

# repurrrsive

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

# rerddap

Version: 0.4.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 91 SKIPPED: 0 FAILED: 15
      1. Failure: ed_search_adv fails well (@test-ed_search_adv.R#58) 
      2. Failure: ed_search_adv fails well (@test-ed_search_adv.R#59) 
      3. Error: griddap returns the correct class (@test-griddap.r#6) 
      4. Error: griddap fixes incorrect user inputs (@test-griddap.r#24) 
      5. Error: griddap fields parameter works, and fails correctly (@test-griddap.r#65) 
      6. Failure: griddap fails well, in addition to above failure tests (@test-griddap.r#85) 
      7. Failure: griddap fails well, in addition to above failure tests (@test-griddap.r#86) 
      8. Failure: griddap fails well, in addition to above failure tests (@test-griddap.r#89) 
      9. Error: info returns the correct (@test-info.R#6) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘taxize’
    ```

# rif

Version: 0.2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 22
      1. Error: federation_data (@test-federation_data.R#6) 
      2. Error: federation_facet (@test-federation_facet.R#6) 
      3. Error: federation_search (@test-federation_search.R#6) 
      4. Error: lexical_chunks (@test-lexical_chunks.R#6) 
      5. Error: lexical_entities (@test-lexical_entities.R#6) 
      6. Error: lexical_pmchunks (@test-lexical_pmchunks.R#6) 
      7. Error: lexical_pmentities (@test-lexical_pmentities.R#6) 
      8. Error: lexical_pos (@test-lexical_pos.R#6) 
      9. Error: lexical_sentences (@test-lexical_sentences.R#6) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rmapzen

Version: 0.3.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘geojsonio’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rmarkdown

Version: 1.7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        rmd   6.1Mb
    ```

# rnoaa

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 177 SKIPPED: 1 FAILED: 10
      1.  Error: check_response returns an error (@test-check_response.r#7) 
      2.  Error: check_response returns the correct error messages (@test-check_response.r#26) 
      3.  Error: ncdc returns the correct ... (@test-ncdc.r#8) 
      4.  Error: ncdc_datacats returns the correct ... (@test-ncdc_datacats.r#7) 
      5.  Error: ncdc_datasets returns the correct class (@test-ncdc_datasets.r#7) 
      6.  Error: ncdc_datatypes returns the correct class (@test-ncdc_datatypes.r#7) 
      7.  Error: ncdc_locs returns the correct class (@test-ncdc_locs.r#7) 
      8.  Error: ncdc_locs_cats returns the correct ... (@test-ncdc_locs_cats.r#7) 
      9.  Error: ncdc_stations returns the correct... (@test-ncdc_stations.r#7) 
      10. Error: seaice functions work (@test-seaice.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rodham

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 59 marked UTF-8 strings
    ```

# rorcid

Version: 0.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      3. Failure: orcid_doi paging parameters works as expected (@test-orcid_doi.R#38) 
      NROW(pg2[[1]]) not equal to 3.
      1/1 mismatches
      [1] 2 - 3 == -1
      
      
      testthat results ================================================================
      OK: 99 SKIPPED: 0 FAILED: 3
      1. Failure: identifiers works with output from orcid() call (@test-identifiers.R#51) 
      2. Failure: orcid fails well (@test-orcid.R#60) 
      3. Failure: orcid_doi paging parameters works as expected (@test-orcid_doi.R#38) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rtimes

Version: 0.5.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      6: Filter(Negate(is.null), x)
      7: unlist(lapply(x, f))
      8: lapply(x, f)
      9: check_key(key)
      10: stop("need an API key for ", y, call. = FALSE)
      
      testthat results ================================================================
      OK: 2 SKIPPED: 0 FAILED: 4
      1. Error: returns the correct stuff (@test-as_search.R#8) 
      2. Error: returns the correct stuff (@test-geo_search.R#8) 
      3. Failure: fails well (@test-geo_search.R#48) 
      4. Error: fails well (@test-geo_search.R#50) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rtimicropem

Version: 1.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# RxODE

Version: 0.6-1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[21]: "   time     depot    centr      peri      eff       C2        C3"
      
      x[22]: "  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>"
      y[22]: "  <dbl>     <dbl>    <dbl>     <dbl>    <dbl>    <dbl>     <dbl>"
      
      x[23]: "1  0    10000     0     0  1.00   0   0    "
      y[23]: "1     0 10000.000    0.000    0.0000 1.000000  0.00000 0.0000000"
      
      
      testthat results ================================================================
      OK: 384 SKIPPED: 0 FAILED: 1
      1. Failure: print(pred); RxODE.display.tbl = TRUE (@test-print.R#262) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘SnakeCharmR’
    ```

# SanFranBeachWater

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# scanstatistics

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        libs   6.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

# sf

Version: 0.5-5

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 194-197 (sf5.Rmd) 
    Error: processing vignette 'sf5.Rmd' failed with diagnostics:
    cannot open the connection
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 20.2Mb
      sub-directories of 1Mb or more:
        doc     10.7Mb
        libs     5.7Mb
        sqlite   1.5Mb
    ```

# sjlabelled

Version: 1.0.5

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sjPlot’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘sjPlot’
    ```

# sjmisc

Version: 2.6.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sjPlot’
    ```

# sjPlot

Version: 2.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘prediction’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# sjstats

Version: 0.12.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘sjPlot’, ‘MuMIn’, ‘piecewiseSEM’
    ```

# solrium

Version: 1.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 163 SKIPPED: 0 FAILED: 28
      1. Error: add works with a list and data.frame (@test-add.R#6) 
      2. Error: add works with new interface (@test-add.R#30) 
      3. Error: collections works - no collections (@test-collections.R#5) 
      4. Error: collections works - with some collections (@test-collections.R#19) 
      5. Error: collections works - new way of using (@test-collections.R#33) 
      6. Error: core_create works (@test-core_create.R#6) 
      7. Error: delete by  (@test-delete.R#6) 
      8. Error: delete by many ids (@test-delete.R#36) 
      9. Error: ping works (@test-ping.R#4) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘XML’
    ```

# splashr

Version: 0.4.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘magick’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# spocc

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      testthat results ================================================================
      OK: 248 SKIPPED: 0 FAILED: 8
      1. Failure: occ works for each data source (@test-occ.R#53) 
      2. Failure: occ works for each data source (@test-occ.R#59) 
      3. Failure: passing in options to occ works (@test-options.R#36) 
      4. Failure: passing in options to occ works (@test-options.R#37) 
      5. Failure: passing in options to occ works (@test-options.R#39) 
      6. Failure: passing in options to occ works (@test-options.R#40) 
      7. Failure: taxize based searches works with get_tsn input (@test-taxize-integration.R#64) 
      8. Failure: taxize based searches works with get_tsn input (@test-taxize-integration.R#66) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# statsDK

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggplot2’ ‘stringr’
      All declared Imports should be used.
    ```

# survminer

Version: 0.4.0

## In both

*   checking examples ... ERROR
    ```
    ...
    LUNG no event    0.004340703 0.007643672 0.007643672 0.007643672
    OV no event      0.004994699 0.007767270 0.008089927 0.008089927
    BRCA death       0.003828336 0.005337151 0.005930541 0.005930541
    LUNG death       0.006637210 0.007337434 0.007337434 0.007337434
    OV death         0.004504398 0.005133510 0.005133510 0.005133510
    BRCA progression 0.004378377 0.006110680 0.006110680 0.006110680
    LUNG progression 0.006700958 0.008631668 0.009219678 0.009771658
    OV progression   0.005033271 0.006681731 0.006681731 0.006681731
    
    > ggcompetingrisks(fit)
    > ggcompetingrisks(fit, multiple_panels = FALSE)
    > ggcompetingrisks(fit, conf.int = TRUE)
    > ggcompetingrisks(fit, multiple_panels = FALSE, conf.int = TRUE)
    > 
    > # handles survfitms objects
    > library(survival)
    > df <- data.frame(time = ss, group = gg, status = cc, strt)
    > fit2 <- survfit(Surv(time, status, type="mstate") ~ 1, data=df)
    > ggcompetingrisks(fit2)
    Error: Aesthetics must be either length 1 or the same as the data (300): x, y, fill
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

# sweep

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# taxa

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    ...
      4 data sets:
        info:
          # A tibble: 4 x 4
            name   n_legs dangerous taxon_id
            <fctr>  <dbl> <lgl>     <chr>   
          1 cat      4.00 F         n       
          2 mole     4.00 F         o       
          3 tomato   0    F         q       
          # ... with 1 more row
        phylopic_ids:  e148eabb-f138-43c6-b1e4-5cda2180485a ... 63604565-0406-460b-8cb8-1abe954b3f3a
        foods: a list with 6 items
        And 1 more data sets: abund
      1 functions:
     reaction
    > 
    > # Remove taxa whose obserservation were filtered out
    > filter_obs(ex_taxmap, "info", dangerous == FALSE, drop_taxa = TRUE)
    Error in names(selection) <- self$taxon_ids() : 
      'names' attribute [17] must be the same length as the vector [2]
    Calls: filter_obs ... filter_obs.Taxmap -> <Anonymous> -> <Anonymous> -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 317 SKIPPED: 0 FAILED: 31
      1. Error: NSE values can be found (@test--taxmap.R#214) 
      2. Error: All valid NSE values can be found (@test--taxmap.R#224) 
      3. Error: Mapping between table observations and the edge list works (@test--taxmap.R#233) 
      4. Error: Mapping between a subset of observations and the edge list works (@test--taxmap.R#242) 
      5. Error: Mapping non-recursivly between observations and the edge list works (@test--taxmap.R#247) 
      6. Error: Mapping simplification between observations and the edge list works (@test--taxmap.R#253) 
      7. Error: Mapping observations in external tables (@test--taxmap.R#259) 
      8. Error: Default taxon filtering works (@test--taxmap.R#271) 
      9. Error: Subtaxa can be included when filtering taxa (@test--taxmap.R#279) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 258-259 (taxa-vignette.Rmd) 
    Error: processing vignette 'taxa-vignette.Rmd' failed with diagnostics:
    'names' attribute [14] must be the same length as the vector [2]
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘lazyeval’ ‘rlang’
      All declared Imports should be used.
    ```

# taxize

Version: 0.9.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      1: testthat results ================================================================
      OK: 712 SKIPPED: 0 FAILED: 10
      1.  Error: get_boldid returns the correct value (@test-get_boldid.R#8) 
      2.  Failure: get_natservid fails well (@test-get_natservid.R#36) 
      3.  Failure: get_natservid fails well (@test-get_natservid.R#38) 
      4.  Error: iucn_id returns the correct class (@test-iucn_id.R#7) 
      5.  Error: iucn_id fails well (@test-iucn_id.R#24) 
      6.  Error: iucn_summary returns the correct value (@test-iucn_summary.R#7) 
      7.  Error: iucn_summary gives expected result for lots of names (@test-iucn_summary.R#22) 
      8.  Failure: iucn_summary and iucn_summary_id fail well (@test-iucn_summary.R#59) 
      9.  Error: iucn_summary and iucn_summary_id fail well (@test-iucn_summary.R#61) 
      10. Error: gbif_ping returns the correct value (@test-ping.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# TCGAbiolinks

Version: 2.5.9

## In both

*   checking examples ... ERROR
    ```
    ...
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    |NA                          |NA                                  |NA                   |NA                           |
    Error in checkProjectInput(project) : 
      Please set a valid project argument from the column id above. Project TCGA-ACC was not found.
    Calls: GDCquery -> checkProjectInput
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 123 SKIPPED: 0 FAILED: 15
      1. Error: TCGAanalyze_survival creates pdf (@test-analyse.R#4) 
      2. Error: GDCdownload API method for two files is working  (@test-prepare-download.R#4) 
      3. Error: GDCdownload API method for one files is working  (@test-prepare-download.R#20) 
      4. Error: GDCprepare accepts more than one project (@test-prepare-download.R#50) 
      5. Error: Accecpts more than one platform (@test-prepare-download.R#68) 
      6. Error: GDCquery can filter by data.category (@test-query.R#5) 
      7. Error: GDCquery accepts more than one project (@test-query.R#11) 
      8. Error: GDCquery can filter by sample.type (@test-query.R#23) 
      9. Error: GDCquery can filter by barcode (@test-query.R#46) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following objects are masked from 'package:S4Vectors':
    
        first, intersect, rename, setdiff, setequal, union
    
    The following objects are masked from 'package:BiocGenerics':
    
        combine, intersect, setdiff, union
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 16-20 (clinical.Rmd) 
    Error: processing vignette 'clinical.Rmd' failed with diagnostics:
    there is no package called 'DT'
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 61.0Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        data   2.3Mb
        doc   57.4Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘limmacontrasts.fit’
    TCGAanalyze_analyseGRN: no visible global function definition for
      ‘knnmi.cross’
    TCGAanalyze_networkInference: no visible global function definition for
      ‘c3net’
    TCGAanalyze_networkInference: no visible global function definition for
      ‘minet’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dNetInduce’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dNetPipeline’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dCommSignif’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘visNet’
    TCGAvisualize_oncoprint: no visible binding for global variable ‘value’
    getTSS: no visible global function definition for ‘promoters’
    Undefined global functions or variables:
      c3net dCommSignif dNetInduce dNetPipeline knnmi.cross
      limmacontrasts.fit limmamakeContrasts minet portions promoters value
      visNet
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    'library' or 'require' call not declared from: ‘DT’
    ```

# tidyquant

Version: 0.5.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      testthat results ================================================================
      OK: 179 SKIPPED: 0 FAILED: 3
      1. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#15) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#17) 
      3. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#19) 
      
      Error: testthat unit tests failed
      In addition: Warning messages:
      1: In download.file(url, destfile = tmp, quiet = TRUE) :
        cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': HTTP status was '403 Forbidden'
      2: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
       
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': HTTP status was '403 Forbidden'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
    
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': HTTP status was '403 Forbidden'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing AAPL.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': HTTP status was '403 Forbidden'
    Warning: x = 'FB', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing FB.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': HTTP status was '403 Forbidden'
    Warning: x = 'GOOG', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing GOOG.
    Warning in value[[3L]](cond) : Returning as nested data frame.
    Quitting from lines 211-214 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    object 'Ask' not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# tidyr

Version: 0.7.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 23 marked UTF-8 strings
    ```

# tidyRSS

Version: 1.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# tidyverse

Version: 1.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# timetk

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# valr

Version: 0.3.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 15.5Mb
      sub-directories of 1Mb or more:
        libs  14.0Mb
    ```

# waccR

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lubridate’ ‘tibble’
      All declared Imports should be used.
    ```

# wikitaxa

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      1: wt_data("Mimulus foliatus", property = prop) at testthat/test-wt_data.R:7
      2: wt_data.default("Mimulus foliatus", property = prop)
      3: data_wiki(x[[1]]$id, property = property, ...)
      4: stop("No matching properties", call. = FALSE)
      
      testthat results ================================================================
      OK: 120 SKIPPED: 0 FAILED: 5
      1. Failure: wt_wikicommons_search works (@test-wikicommons.R#80) 
      2. Failure: wt_wikipedia returns non-empty results (@test-wikipedia.R#26) 
      3. Failure: wt_wikipedia_search works (@test-wikipedia.R#86) 
      4. Failure: wt_wikispecies_search works (@test-wikispecies.R#80) 
      5. Error: wt_data returns the correct class (@test-wt_data.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 166 marked UTF-8 strings
    ```

# XKCDdata

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# zeligverse

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Amelia’ ‘MatchIt’ ‘WhatIf’
      All declared Imports should be used.
    ```

# zFactor

Version: 0.1.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rootSolve’
      All declared Imports should be used.
    ```

