# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.4.0 (2017-04-21) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-05-27                   |

## Packages

|package        |*  |version |date       |source                           |
|:--------------|:--|:-------|:----------|:--------------------------------|
|assertthat     |   |0.2.0   |2017-04-11 |cran (@0.2.0)                    |
|covr           |   |2.2.2   |2017-01-05 |cran (@2.2.2)                    |
|dplyr          |   |0.5.0   |2016-06-24 |CRAN (R 3.4.0)                   |
|knitr          |   |1.16    |2017-05-18 |cran (@1.16)                     |
|microbenchmark |   |1.4-2.1 |2015-11-25 |cran (@1.4-2.1)                  |
|nycflights13   |   |0.2.2   |2017-01-27 |cran (@0.2.2)                    |
|Rcpp           |   |0.12.11 |2017-05-22 |cran (@0.12.11)                  |
|rlang          |   |0.1.1   |2017-05-18 |Github (tidyverse/rlang@684221a) |
|rmarkdown      |   |1.5     |2017-04-26 |cran (@1.5)                      |
|testthat       |   |1.0.2   |2016-04-23 |cran (@1.0.2)                    |
|tibble         |   |1.3.2   |2017-05-27 |local                            |
|withr          |   |1.0.2   |2016-06-20 |CRAN (R 3.4.0)                   |

# Check results

15 packages with problems

|package       |version | errors| warnings| notes|
|:-------------|:-------|------:|--------:|-----:|
|dat           |0.2.0   |      1|        0|     0|
|dplyr         |0.5.0   |      1|        0|     2|
|filesstrings  |0.4.0   |      1|        0|     0|
|FSelectorRcpp |0.1.3   |      1|        0|     2|
|ggimage       |0.0.4   |      1|        0|     0|
|haven         |1.0.0   |      2|        0|     2|
|huxtable      |0.3.0   |      1|        0|     0|
|officer       |0.1.3   |      2|        1|     0|
|olsrr         |0.1.0   |      0|        1|     0|
|rbcb          |0.1.1   |      1|        0|     0|
|readtext      |0.50    |      1|        0|     0|
|rio           |0.5.0   |      2|        1|     0|
|tidyquant     |0.5.1   |      2|        1|     1|
|timekit       |0.3.0   |      1|        0|     0|
|unpivotr      |0.1.1   |      1|        0|     0|

## dat (0.2.0)
Maintainer: Sebastian Warnholz <wahani@gmail.com>  
Bug reports: https://github.com/wahani/dat/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [13s/26s]
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

## dplyr (0.5.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/dplyr/issues

1 error  | 0 warnings | 2 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [9s/19s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 1499 SKIPPED: 1 FAILED: 10
  1.  Failure: duplicated column name is explicit about which column (#996) (@test-arrange.r#139) 
  2.  Failure: duplicated column name is explicit about which column (#996) (@test-arrange.r#143) 
  3.  Failure: filter uses the white list (#566) (@test-filter.r#193) 
  4.  Failure: ungrouped output (@test-output.R#10) 
  5.  Failure: ungrouped output (@test-output.R#10) 
  6.  Failure: ungrouped output (@test-output.R#10) 
  7.  Failure: ungrouped output (@test-output.R#10) 
  8.  Failure: ungrouped output (@test-output.R#10) 
  9.  Failure: summarise gives proper errors (#153) (@test-summarise.r#61) 
  10. Failure: summarise gives proper errors (#153) (@test-summarise.r#62) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is 23.9Mb
  sub-directories of 1Mb or more:
    libs  21.8Mb

checking compiled code ... NOTE
File ‘dplyr/libs/dplyr.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## filesstrings (0.4.0)
Maintainer: Rory Nolan <rorynoolan@gmail.com>  
Bug reports: https://www.github.com/rorynolan/filesstrings/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  Attributes: < Length mismatch: comparison on first 2 components >
  
  
  2. Failure: MergeTablesOnDisk works (@test_files.R#82) -------------------------
  readr::read_csv("merged.csv") not equal to tibble::tibble(x = c(1.5, 1.5), y = c(2.5, 29.5)).
  Attributes: < Length mismatch: comparison on first 2 components >
  
  
  testthat results ================================================================
  OK: 141 SKIPPED: 0 FAILED: 2
  1. Failure: MergeTablesOnDisk works (@test_files.R#80) 
  2. Failure: MergeTablesOnDisk works (@test_files.R#82) 
  
  Error: testthat unit tests failed
  Execution halted
```

## FSelectorRcpp (0.1.3)
Maintainer: Zygmunt Zawadzki <zygmunt@zstat.pl>  
Bug reports: https://github.com/mi2-warsaw/FSelectorRcpp/issues

1 error  | 0 warnings | 2 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [4s/11s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  The following objects are masked from 'package:base':
  
      intersect, setdiff, setequal, union
  
  > library(entropy)
  
  Attaching package: 'entropy'
  
  The following object is masked from 'package:FSelectorRcpp':
  
      discretize
  
  > 
  > test_check("FSelectorRcpp")
  Segmentation fault (core dumped)

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘RTCGA.rnaseq’

checking installed package size ... NOTE
  installed size is 10.5Mb
  sub-directories of 1Mb or more:
    doc    2.2Mb
    libs   8.1Mb
```

## ggimage (0.0.4)
Maintainer: Guangchuang Yu <guangchuangyu@gmail.com>  
Bug reports: https://github.com/GuangchuangYu/ggimage/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available: ‘EBImage’ ‘gridGraphics’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## haven (1.0.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/haven/issues

2 errors | 0 warnings | 2 notes

```
checking examples ... ERROR
Running examples in ‘haven-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: read_dta
> ### Title: Read and write Stata DTA files.
> ### Aliases: read_dta read_stata write_dta
> 
> ### ** Examples
... 16 lines ...
10         4.9        3.1         1.5        0.1  setosa
# ... with 140 more rows
> 
> tmp <- tempfile(fileext = ".dta")
> write_dta(mtcars, tmp)
> read_dta(tmp)
Invalid timestamp string (length=17): 27 Mai 2017 21:35
Error in df_parse_dta_file(spec, encoding) : 
  Failed to parse /tmp/Rtmp0MLkSO/file86b5375208f.dta: The file's timestamp string is invalid.
Calls: read_dta -> df_parse_dta_file -> .Call
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  testthat results ================================================================
  OK: 132 SKIPPED: 0 FAILED: 9
  1. Error: can roundtrip basic types (@test-write-dta.R#5) 
  2. Error: can roundtrip missing values (as much as possible) (@test-write-dta.R#12) 
  3. Error: can roundtrip date times (@test-write-dta.R#23) 
  4. Error: infinity gets converted to NA (@test-write-dta.R#28) 
  5. Error: factors become labelleds (@test-write-dta.R#33) 
  6. Error: labels are preserved (@test-write-dta.R#44) 
  7. Error: labelleds are round tripped (@test-write-dta.R#52) 
  8. Error: factors become labelleds (@test-write-dta.R#59) 
  9. Error: labels are converted to utf-8 (@test-write-dta.R#73) 
  
  Error: testthat unit tests failed
  Execution halted

checking for GNU extensions in Makefiles ... NOTE
GNU make is a SystemRequirements.

checking compiled code ... NOTE
File ‘haven/libs/haven.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## huxtable (0.3.0)
Maintainer: David Hugh-Jones <davidhughjones@gmail.com>  
Bug reports: https://github.com/hughjonesd/huxtable/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [11s/20s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         message = handle_message)) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/evaluate-promise.R:42
  4: withCallingHandlers(withVisible(code), warning = handle_warning, message = handle_message) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/evaluate-promise.R:42
  5: withVisible(code) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/evaluate-promise.R:42
  6: rmarkdown::render("rowheight-multicol-test.Rmd", quiet = TRUE) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/evaluate-promise.R:42
  7: convert(output_file, run_citeproc) at /tmp/Rtmp2UybSq/devtoolsc0a2aa8de4c/rmarkdown/R/render.R:655
  8: pandoc_convert(utf8_input, pandoc_to, output_format$pandoc$from, output, citeproc, 
         output_format$pandoc$args, !quiet) at /tmp/Rtmp2UybSq/devtoolsc0a2aa8de4c/rmarkdown/R/render.R:585
  9: stop("pandoc document conversion failed with error ", result, call. = FALSE) at /tmp/Rtmp2UybSq/devtoolsc0a2aa8de4c/rmarkdown/R/pandoc.R:100
  
  testthat results ================================================================
  OK: 208 SKIPPED: 14 FAILED: 1
  1. Error: Row heights do not screw up latex multicol (@test-with-pandoc.R#20) 
  
  Error: testthat unit tests failed
  Execution halted
```

## officer (0.1.3)
Maintainer: David Gohel <david.gohel@ardata.fr>  
Bug reports: https://github.com/davidgohel/officer/issues

2 errors | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘officer-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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

checking tests ... ERROR
  Running ‘testthat.R’ [174s/262s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  8: function_list[[k]](value) at /tmp/RtmpT6Czo8/R.INSTALL13c163d710cb/magrittr/R/freduce.R:20
  9: ph_with_img(., type = "body", src = img.file, height = 1.06, width = 1.39)
  10: external_img(src, width = width, height = height)
  11: stopifnot(file.exists(src))
  12: stop(msg, call. = FALSE, domain = NA)
  
  testthat results ================================================================
  OK: 341 SKIPPED: 0 FAILED: 4
  1. Error: image add  (@test-docx-add.R#68) 
  2. Error: pml fp_border (@test-fp_cell.R#75) 
  3. Error: css fp_border (@test-fp_cell.R#165) 
  4. Error: add img into placeholder (@test-pptx-add.R#67) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
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

## olsrr (0.1.0)
Maintainer: Aravind Hebbali <hebbali.aravind@gmail.com>  
Bug reports: https://github.com/rsquaredacademy/olsrr/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
17: eval(expr, envir, enclos)
18: withVisible(eval(expr, envir, enclos))
19: withCallingHandlers(withVisible(eval(expr, envir, enclos)), warning = wHandler,     error = eHandler, message = mHandler)
20: handle(ev <- withCallingHandlers(withVisible(eval(expr, envir,     enclos)), warning = wHandler, error = eHandler, message = mHandler))
21: timing_fn(handle(ev <- withCallingHandlers(withVisible(eval(expr,     envir, enclos)), warning = wHandler, error = eHandler, message = mHandler)))
22: evaluate_call(expr, parsed$src[[i]], envir = envir, enclos = enclos,     debug = debug, last = i == length(out), use_try = stop_on_error !=         2L, keep_warning = keep_warning, keep_message = keep_message,     output_handler = output_handler, include_timing = include_timing)
23: evaluate(code, envir = env, new_device = FALSE, keep_warning = !isFALSE(options$warning),     keep_message = !isFALSE(options$message), stop_on_error = if (options$error &&         options$include) 0L else 2L, output_handler = knit_handlers(options$render,         options))
... 8 lines ...
31: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet,     encoding = encoding)
32: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv())
33: vweave_rmarkdown(...)
34: engine$weave(file, quiet = quiet, encoding = enc)
35: doTryCatch(return(expr), name, parentenv, handler)
36: tryCatchOne(expr, names, parentenv, handlers[[1L]])
37: tryCatchList(expr, classes, parentenv, handlers)
38: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    find_vignette_product(name, by = "weave", engine = engine)}, error = function(e) {    stop(gettextf("processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)), domain = NA, call. = FALSE)})
39: buildVignettes(dir = "/home/muelleki/git/R/tibble/revdep/checks/olsrr.Rcheck/vign_test/olsrr")
An irrecoverable exception occurred. R is aborting now ...
Segmentation fault (core dumped)
```

## rbcb (0.1.1)
Maintainer: Wilson Freitas <wilson.freitas@gmail.com>  
Bug reports: https://github.com/wilsonfreitas/rbcb/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [2s/350s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1: get_series(1, start_date = "2017-03-01", end_date = "2017-03-01", as = "text") at testthat/test-get_series.R:4
  2: stop("BCB API Request error, status code = ", res$status_code)
  
  2. Error: it should get one series as data.frame (@test-get_series.R#11) -------
  BCB API Request error, status code = 502
  1: get_series(1, last = 10) at testthat/test-get_series.R:11
  2: stop("BCB API Request error, status code = ", res$status_code)
  
  testthat results ================================================================
  OK: 22 SKIPPED: 0 FAILED: 2
  1. Error: it should get series json (@test-get_series.R#4) 
  2. Error: it should get one series as data.frame (@test-get_series.R#11) 
  
  Error: testthat unit tests failed
  Execution halted
```

## readtext (0.50)
Maintainer: Kenneth Benoit <kbenoit@lse.ac.uk>  
Bug reports: https://github.com/kbenoit/readtext/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘antiword’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## rio (0.5.0)
Maintainer: Thomas J. Leeper <thosjleeper@gmail.com>  
Bug reports: https://github.com/leeper/rio/issues

2 errors | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘rio-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: convert
> ### Title: Convert from one file format to another
> ### Aliases: convert
> 
> ### ** Examples
> 
> # create a file to convert
> export(mtcars, "mtcars.dta")
> 
> # convert Stata to CSV and open converted file
> convert("mtcars.dta", "mtcars.csv")
Invalid timestamp string (length=17): 27 Mai 2017 22:06
Error in df_parse_dta_file(spec, encoding) : 
  Failed to parse /home/muelleki/git/R/tibble/revdep/checks/rio.Rcheck/mtcars.dta: The file's timestamp string is invalid.
Calls: convert ... standardize_attributes -> read_dta -> df_parse_dta_file -> .Call
Execution halted

checking tests ... ERROR
  Running ‘test-all.R’ [8s/14s]
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  
  3. Error: Data identical (haven formats) (@test_identical.R#27) ----------------
  Failed to parse /home/muelleki/git/R/tibble/revdep/checks/rio.Rcheck/tests/testthat/mtcars.dta: The file's timestamp string is invalid.
  1: expect_equivalent(import(export(mtcars, "mtcars.dta")), mtcars) at testthat/test_identical.R:27
  2: compare(object, expected, check.attributes = FALSE) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/expect-equality.R:71
  3: import(export(mtcars, "mtcars.dta")) at /tmp/Rtmpf6YF8j/devtools1eed5a0addc9/testthat/R/compare.R:12
  4: .import(file = file, ...)
  5: .import.rio_dta(file = file, ...)
  6: standardize_attributes(read_dta(file = file))
  7: read_dta(file = file)
  8: df_parse_dta_file(spec, encoding) at /tmp/RtmpuKlkGu/devtools18334695b5a3/haven/R/haven.R:149
  
  DONE ===========================================================================
  Error: Test failures
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 88-97 (rio.Rmd) 
Error: processing vignette 'rio.Rmd' failed with diagnostics:
Failed to parse /home/muelleki/git/R/tibble/revdep/checks/rio.Rcheck/vign_test/rio/vignettes/mtcars.dta: The file's timestamp string is invalid.
Execution halted

```

## tidyquant (0.5.1)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/tidyquant/issues

2 errors | 1 warning  | 1 note 

```
checking examples ... ERROR
Running examples in ‘tidyquant-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: as_tibble
> ### Title: Coerce to tibble. Enable preserving row names when coercing
> ###   matrix and time-series-like objects with row names.
> ### Aliases: as_tibble
> 
... 22 lines ...

 This message is shown once per session and may be disabled by setting 
 options("getSymbols.warning4.0"=FALSE). See ?getSymbols for more details.
Warning in if (as.character(sc[[1]]) != calling.fun) return() :
  the condition has length > 1 and only the first element will be used
Warning in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m,  :
  cannot open URL 'https://ichart.finance.yahoo.com/table.csv?s=AAPL&a=0&b=01&c=2007&d=4&e=27&f=2017&g=d&q=q&y=0&z=AAPL&x=.csv': HTTP status was '404 Not Found'
Error in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m,  : 
  cannot open URL 'https://ichart.finance.yahoo.com/table.csv?s=AAPL&a=0&b=01&c=2007&d=4&e=27&f=2017&g=d&q=q&y=0&z=AAPL&x=.csv'
Calls: %>% ... <Anonymous> -> do.call -> getSymbols.yahoo -> download.file
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
      As of 0.4-0, 'getSymbols' uses env=parent.frame() and
   auto.assign=TRUE by default.
  
   This  behavior  will be  phased out in 0.5-0  when the call  will
   default to use auto.assign=FALSE. getOption("getSymbols.env") and 
   getOptions("getSymbols.auto.assign") are now checked for alternate defaults
  
   This message is shown once per session and may be disabled by setting 
   options("getSymbols.warning4.0"=FALSE). See ?getSymbols for more details.
  Error in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m,  : 
    cannot open URL 'https://ichart.finance.yahoo.com/table.csv?s=AAPL&a=0&b=01&c=2007&d=4&e=27&f=2017&g=d&q=q&y=0&z=AAPL&x=.csv'
  Calls: test_check ... with_reporter -> force -> source_file -> eval -> eval
  testthat results ================================================================
  OK: 0 SKIPPED: 0 FAILED: 0
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
The following object is masked from 'package:tibble':

    as_tibble

Getting data...

Warning in value[[3L]](cond) :
... 8 lines ...
Warning: x = 'AAPL', get = 'splits': Error in download.file(paste(yahoo.URL, Symbol.name, "&a=", from.m, "&b=", : cannot open URL 'https://ichart.finance.yahoo.com/x?s=AAPL&a=0&b=01&c=1990&d=4&e=27&f=2017&g=v&y=0&z=30000'

additional arguments ignored in warning()
Warning: x = 'AAPL', get = 'stock.prices': Error in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m, : cannot open URL 'https://ichart.finance.yahoo.com/table.csv?s=AAPL&a=4&b=27&c=2005&d=4&e=27&f=2017&g=d&q=q&y=0&z=AAPL&x=.csv'

Warning: x = 'AAPL', get = 'key.ratios': Error in value[[3L]](cond): object 'key_ratios' not found

Quitting from lines 176-179 (TQ01-core-functions-in-tidyquant.Rmd) 
Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
no applicable method for 'filter_' applied to an object of class "logical"
Execution halted

checking installed package size ... NOTE
  installed size is  5.2Mb
  sub-directories of 1Mb or more:
    doc   4.5Mb
```

## timekit (0.3.0)
Maintainer: Matt Dancho <mdancho@business-science.io>  
Bug reports: https://github.com/business-science/timekit/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
      as_tibble
  
  Error in xts::xts(data, ...) : 
    order.by requires an appropriate time-based object
  Calls: test_check ... tk_xts -> tk_xts_ -> tk_xts_.default -> <Anonymous>
  In addition: Warning messages:
  1: x = 'AAPL', get = 'stock.prices': Error in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m, : cannot open URL 'https://ichart.finance.yahoo.com/table.csv?s=AAPL&a=0&b=01&c=2015&d=11&e=31&f=2016&g=d&q=q&y=0&z=AAPL&x=.csv'
   
  2: In tk_xts_.default(data = data, select = select, date_var = date_var,  :
    `select` is only applicable to data.frame and tibble objects.
  3: In tk_xts_.default(data = data, select = select, date_var = date_var,  :
    `date_var` is only applicable to data.frame and tibble objects.
  testthat results ================================================================
  OK: 39 SKIPPED: 0 FAILED: 0
  Execution halted
```

## unpivotr (0.1.1)
Maintainer: Duncan Garmonsway <nacnudus@gmail.com>  
Bug reports: https://github.com/nacnudus/unpivotr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  The following objects are masked from 'package:stats':
  
      filter, lag
  
  The following objects are masked from 'package:base':
  
      intersect, setdiff, setequal, union
  
  testthat results ================================================================
  OK: 119 SKIPPED: 0 FAILED: 1
  1. Failure: 'cross' works (@test-anchor.R#19) 
  
  Error: testthat unit tests failed
  Execution halted
```

