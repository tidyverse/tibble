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
|date     |2017-05-12                   |

## Packages

|package        |*  |version    |date       |source                            |
|:--------------|:--|:----------|:----------|:---------------------------------|
|assertthat     |   |0.2.0      |2017-04-11 |cran (@0.2.0)                     |
|covr           |   |2.2.2      |2017-01-05 |cran (@2.2.2)                     |
|dplyr          |   |0.5.0.9004 |2017-05-12 |Github (tidyverse/dplyr@f12d245)  |
|knitr          |   |1.15.1     |2016-11-22 |cran (@1.15.1)                    |
|microbenchmark |   |1.4-2.1    |2015-11-25 |cran (@1.4-2.1)                   |
|nycflights13   |   |0.2.2      |2017-01-27 |cran (@0.2.2)                     |
|Rcpp           |   |0.12.10    |2017-03-19 |CRAN (R 3.4.0)                    |
|rlang          |   |0.1        |2017-05-06 |CRAN (R 3.4.0)                    |
|rmarkdown      |   |1.5        |2017-04-26 |cran (@1.5)                       |
|testthat       |   |1.0.2      |2016-04-23 |cran (@1.0.2)                     |
|tibble         |   |1.3.0.9002 |2017-05-12 |Github (tidyverse/tibble@9103a30) |
|withr          |   |1.0.2      |2016-06-20 |CRAN (R 3.4.0)                    |

# Check results

27 packages with problems

|package       |version | errors| warnings| notes|
|:-------------|:-------|------:|--------:|-----:|
|atlantistools |0.4.1   |      0|        1|     1|
|datastepr     |0.0.2   |      0|        1|     0|
|dat           |0.2.0   |      1|        0|     0|
|dplyr         |0.5.0   |      1|        0|     2|
|ecoseries     |0.1.3   |      1|        0|     0|
|filesstrings  |0.4.0   |      1|        0|     0|
|FSelectorRcpp |0.1.3   |      1|        0|     2|
|ggfortify     |0.4.1   |      2|        0|     1|
|ggimage       |0.0.4   |      1|        0|     0|
|haven         |1.0.0   |      2|        0|     2|
|highcharter   |0.5.0   |      1|        1|     1|
|huxtable      |0.2.2   |      1|        1|     0|
|monkeylearn   |0.1.1   |      0|        1|     0|
|mrgsolve      |0.8.6   |      0|        1|     1|
|myTAI         |0.5.0   |      1|        1|     1|
|officer       |0.1.3   |      2|        1|     0|
|parlitools    |0.0.2   |      0|        1|     0|
|readr         |1.1.0   |      1|        0|     1|
|rif           |0.1.0   |      1|        0|     0|
|rio           |0.5.0   |      2|        1|     0|
|sf            |0.4-2   |      2|        0|     1|
|sjPlot        |2.3.1   |      0|        1|     1|
|sjstats       |0.10.0  |      1|        0|     1|
|spdplyr       |0.1.2   |      1|        0|     0|
|tidyr         |0.6.2   |      1|        0|     0|
|unpivotr      |0.1.1   |      1|        0|     0|
|valr          |0.2.0   |      2|        1|     1|

## atlantistools (0.4.1)
Maintainer: Alexander Keth <alexander.keth@uni-hamburg.de>  
Bug reports: https://github.com/alketh/atlantistools/issues

0 errors | 1 warning  | 1 note 

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘model-calibration.pdf’ from 766Kb to 493Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

checking installed package size ... NOTE
  installed size is  5.6Mb
  sub-directories of 1Mb or more:
    doc       1.5Mb
    extdata   3.0Mb
```

## datastepr (0.0.2)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>  
Bug reports: https://github.com/bramtayl/datastepr/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
          recursively.

_E_x_a_m_p_l_e_s:

     step = dataStepClass$new()
     
     frame = data.frame(x = 1:10)
... 8 lines ...
     }
     
     stairs()
     
     step$results
     

Quitting from lines 51-70 (datastepping.Rmd) 
Error: processing vignette 'datastepping.Rmd' failed with diagnostics:
Column `lagx` can't be converted from logical to integer
Execution halted
```

## dat (0.2.0)
Maintainer: Sebastian Warnholz <wahani@gmail.com>  
Bug reports: https://github.com/wahani/dat/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [12s/12s]
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
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  
  testthat results ================================================================
  OK: 1501 SKIPPED: 1 FAILED: 8
  1. Failure: duplicated column name is explicit about which column (#996) (@test-arrange.r#139) 
  2. Failure: duplicated column name is explicit about which column (#996) (@test-arrange.r#143) 
  3. Failure: filter uses the white list (#566) (@test-filter.r#193) 
  4. Failure: ungrouped output (@test-output.R#10) 
  5. Failure: ungrouped output (@test-output.R#10) 
  6. Failure: ungrouped output (@test-output.R#10) 
  7. Failure: ungrouped output (@test-output.R#10) 
  8. Failure: ungrouped output (@test-output.R#10) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is 23.4Mb
  sub-directories of 1Mb or more:
    libs  21.3Mb

checking compiled code ... NOTE
File ‘dplyr/libs/dplyr.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## ecoseries (0.1.3)
Maintainer: Fernando Teixeira <fernando.teixeira@fgv.br>  
Bug reports: https://github.com/fernote7/ecoseries/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘ecoseries-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: series_sidra
> ### Title: A function to extract Sidra series using their API
> ### Aliases: series_sidra
> ### Keywords: sidra
> 
> ### ** Examples
> 
> sidra=series_sidra(x = c(1612), from = 1990, to = 2015, territory = "brazil")
Error in function (type, msg, asError = TRUE)  : 
  Failed to connect to api.sidra.ibge.gov.br port 80: Connection timed out
Calls: series_sidra ... <Anonymous> -> curlPerform -> .Call -> <Anonymous> -> fun
Execution halted
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
  Running ‘testthat.R’
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
  installed size is  9.6Mb
  sub-directories of 1Mb or more:
    doc    2.2Mb
    libs   7.2Mb
```

## ggfortify (0.4.1)
Maintainer: Masaaki Horikoshi <sinhrks@gmail.com>  
Bug reports: https://github.com/sinhrks/ggfortify/issues

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘ggfortify-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: gglagplot
> ### Title: Plot time series against lagged versions of themselves
> ### Aliases: gglagplot
> 
> ### ** Examples
> 
> gglagplot(AirPassengers)
Error: `x` must be a vector, not a ts object, do you want `stats::lag()`?
Execution halted

checking tests ... ERROR
  Running ‘test-all.R’ [43s/43s]
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  8: eval_bare(dot$expr, dot$env) at /tmp/RtmpP23LWr/R.INSTALL9ef31c41273/rlang/R/dots.R:79
  9: lapply(seq(1:lags), .lag)
  10: FUN(X[[i]], ...)
  11: as.vector(lag(ts, k))
  12: lag(ts, k)
  13: bad_args("x", "must be a vector, not a ts object, do you want `stats::lag()`?") at /tmp/RtmpbbcT3W/devtoolsabb6f0bcc27/tidyverse-dplyr-f12d245/R/lead-lag.R:65
  14: glubort(fmt_args(args), ..., .envir = .envir) at /tmp/RtmpbbcT3W/devtoolsabb6f0bcc27/tidyverse-dplyr-f12d245/R/error.R:20
  15: .abort(text) at /tmp/RtmpbbcT3W/devtoolsabb6f0bcc27/tidyverse-dplyr-f12d245/R/error.R:50
  
  testthat results ================================================================
  OK: 1442 SKIPPED: 9 FAILED: 1
  1. Error: gglagplot (@test-tslib.R#103) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  5.7Mb
  sub-directories of 1Mb or more:
    doc   5.0Mb
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
Invalid timestamp string (length=17): 12 Mai 2017 22:06
Error in df_parse_dta_file(spec, encoding) : 
  Failed to parse /tmp/RtmpJkt82z/fileea3449d2b820.dta: The file's timestamp string is invalid.
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

## highcharter (0.5.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

1 error  | 1 warning  | 1 note 

```
checking examples ... ERROR
Running examples in ‘highcharter-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: hcboxplot
> ### Title: Shortcut to make a boxplot
> ### Aliases: hcboxplot
> 
> ### ** Examples
> 
> hcboxplot(x = iris$Sepal.Length, var = iris$Species, color = "red")
Error in mutate_impl(.data, dots) : 
  Column `data` must be length 1 (the group size), not 5
Calls: hcboxplot ... transmute.default -> mutate -> mutate.tbl_df -> mutate_impl -> .Call
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Highcharts (www.highcharts.com) is a Highsoft software product which is
not free for commercial and Governmental use

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

Quitting from lines 98-104 (charting-data-frames.Rmd) 
Error: processing vignette 'charting-data-frames.Rmd' failed with diagnostics:
not compatible with STRSXP
Execution halted


checking installed package size ... NOTE
  installed size is 16.5Mb
  sub-directories of 1Mb or more:
    doc          13.7Mb
    htmlwidgets   1.9Mb
```

## huxtable (0.2.2)
Maintainer: David Hugh-Jones <davidhughjones@gmail.com>  
Bug reports: https://github.com/hughjonesd/huxtable/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  21: eval(exprs, env)
  22: source_file(path, new.env(parent = env), chdir = TRUE)
  23: force(code)
  24: with_reporter(reporter = reporter, start_end_reporter = start_end_reporter,     {        lister$start_file(basename(path))        source_file(path, new.env(parent = env), chdir = TRUE)        end_context()    })
  25: FUN(X[[i]], ...)
  26: lapply(paths, test_file, env = env, reporter = current_reporter,     start_end_reporter = FALSE, load_helpers = FALSE)
  27: force(code)
  28: with_reporter(reporter = current_reporter, results <- lapply(paths,     test_file, env = env, reporter = current_reporter, start_end_reporter = FALSE,     load_helpers = FALSE))
  29: test_files(paths, reporter = reporter, env = env, ...)
  30: test_dir(test_path, reporter = reporter, env = env, filter = filter,     ...)
  31: with_top_env(env, {    test_dir(test_path, reporter = reporter, env = env, filter = filter,         ...)})
  32: run_tests(package, test_path, filter, reporter, ...)
  33: test_check("huxtable")
  An irrecoverable exception occurred. R is aborting now ...
  Segmentation fault (core dumped)

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 320-337 (huxtable.Rmd) 
Error: processing vignette 'huxtable.Rmd' failed with diagnostics:
is.data.frame(df) is not TRUE
Execution halted

```

## monkeylearn (0.1.1)
Maintainer: Maëlle Salmon <maelle.salmon@yahoo.se>  
Bug reports: http://github.com/ropenscilabs/monkeylearn/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
pandoc: Could not fetch http://ropensci.org/public_images/github_footer.png
TlsExceptionHostPort (HandshakeFailed Error_EOF) "ropensci.org" 80
Error: processing vignette 'monkeylearn_intro.Rmd' failed with diagnostics:
pandoc document conversion failed with error 67
Execution halted

```

## mrgsolve (0.8.6)
Maintainer: Kyle T Baron  <kyleb@metrumrg.com>  
Bug reports: https://github.com/metrumresearchgroup/mrgsolve/issues

0 errors | 1 warning  | 1 note 

```
checking examples ... WARNING
Found the following significant warnings:

  Warning: `mutate_each()` is deprecated.
  Warning: `mutate_each()` is deprecated.
Deprecated functions may be defunct as soon as of the next release of
R.
See ?Deprecated.

checking installed package size ... NOTE
  installed size is  6.2Mb
  sub-directories of 1Mb or more:
    libs   5.0Mb
```

## myTAI (0.5.0)
Maintainer: Hajk-Georg Drost <hgd23@cam.ac.uk>  
Bug reports: https://github.com/HajkD/myTAI/issues

1 error  | 1 warning  | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’ [43s/44s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  testthat results ================================================================
  OK: 195 SKIPPED: 1 FAILED: 2
  1. Failure: PlotContribution() works properly with PhyloExpressionSet input... (@test-PlotContribution.R#11) 
  2. Failure: PlotContribution() works properly with DivergenceExpressionSet input... (@test-PlotContribution.R#16) 
  
  Error: testthat unit tests failed
  In addition: Warning messages:
  1: `summarise_each()` is deprecated.
  Use `summarise_all()`, `summarise_at()` or `summarise_if()` instead.
  To map `funs` over all variables, use `summarise_all()` 
  2: `summarise_each()` is deprecated.
  Use `summarise_all()`, `summarise_at()` or `summarise_if()` instead.
  To map `funs` over all variables, use `summarise_all()` 
  Execution halted

checking examples ... WARNING
Found the following significant warnings:

  Warning: `summarise_each()` is deprecated.
  Warning: `summarise_each()` is deprecated.
  Warning: `summarise_each()` is deprecated.
  Warning: `summarise_each()` is deprecated.
  Warning: `summarise_each()` is deprecated.
Deprecated functions may be defunct as soon as of the next release of
R.
See ?Deprecated.

checking installed package size ... NOTE
  installed size is  5.3Mb
  sub-directories of 1Mb or more:
    data   2.0Mb
    doc    2.3Mb
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
  Running ‘testthat.R’ [159s/159s]
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

## parlitools (0.0.2)
Maintainer: Evan Odell <evanodell91@gmail.com>  
Bug reports: https://github.com/EvanOdell/parlitools/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Linking to GEOS 3.5.0, GDAL 2.1.0, proj.4 4.9.2

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

Downloading constituency data
Quitting from lines 19-56 (introduction.Rmd) 
Error: processing vignette 'introduction.Rmd' failed with diagnostics:
argument is not a character vector
Execution halted

```

## readr (1.1.0)
Maintainer: Jim Hester <james.hester@rstudio.com>  
Bug reports: https://github.com/tidyverse/readr/issues

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  Actual value: "Column `b` must be length 1 or 3, not 2"
  
  
  2. Failure: fwf_cols throws error when arguments are not length 1 or 2 (@test-read-fwf.R#152) 
  error$message does not match "Variables must be length 1 or .*".
  Actual value: "Column `a` must be length 1 or 2, not 0"
  
  
  testthat results ================================================================
  OK: 488 SKIPPED: 2 FAILED: 2
  1. Failure: fwf_cols throws error when arguments are not length 1 or 2 (@test-read-fwf.R#151) 
  2. Failure: fwf_cols throws error when arguments are not length 1 or 2 (@test-read-fwf.R#152) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is 12.5Mb
  sub-directories of 1Mb or more:
    libs  11.8Mb
```

## rif (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus+r@gmail.com>  
Bug reports: https://github.com/ropensci/rif/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘test-all.R’
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  19: eval(exprs, env)
  20: source_file(path, new.env(parent = env), chdir = TRUE)
  21: force(code)
  22: with_reporter(reporter = reporter, start_end_reporter = start_end_reporter,     {        lister$start_file(basename(path))        source_file(path, new.env(parent = env), chdir = TRUE)        end_context()    })
  23: FUN(X[[i]], ...)
  24: lapply(paths, test_file, env = env, reporter = current_reporter,     start_end_reporter = FALSE, load_helpers = FALSE)
  25: force(code)
  26: with_reporter(reporter = current_reporter, results <- lapply(paths,     test_file, env = env, reporter = current_reporter, start_end_reporter = FALSE,     load_helpers = FALSE))
  27: test_files(paths, reporter = reporter, env = env, ...)
  28: test_dir(test_path, reporter = reporter, env = env, filter = filter,     ...)
  29: with_top_env(env, {    test_dir(test_path, reporter = reporter, env = env, filter = filter,         ...)})
  30: run_tests(package, test_path, filter, reporter, ...)
  31: test_check("rif")
  An irrecoverable exception occurred. R is aborting now ...
  Segmentation fault (core dumped)
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
Invalid timestamp string (length=17): 12 Mai 2017 22:22
Error in df_parse_dta_file(spec, encoding) : 
  Failed to parse /home/muelleki/git/R/tibble/revdep/checks/rio.Rcheck/mtcars.dta: The file's timestamp string is invalid.
Calls: convert ... standardize_attributes -> read_dta -> df_parse_dta_file -> .Call
Execution halted

checking tests ... ERROR
  Running ‘test-all.R’
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

## sf (0.4-2)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/sfr/issues/

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘sf-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: dplyr
> ### Title: Dplyr verb methods for sf objects
> ### Aliases: dplyr filter_.sf dplyr filter.sf dplyr arrange_.sf dplyr
> ###   arrange.sf dplyr distinct_.sf dplyr distinct.sf dplyr group_by_.sf
> ###   dplyr group_by.sf dplyr mutate_.sf dplyr mutate.sf dplyr
... 29 lines ...
epsg (SRID):    4267
proj4string:    +proj=longlat +datum=NAD27 +no_defs
> nc %>% filter(AREA > .1) %>% plot()
Warning: plotting the first 10 out of 14 attributes; use max.plot = 14 to plot all
> # plot 10 smallest counties in grey:
> st_geometry(nc) %>% plot()
> nc %>% select(AREA) %>% arrange(AREA) %>% slice(1:10) %>% plot(add = TRUE, col = 'grey')
Error in select.sf(., AREA) : 
  requires dplyr > 0.5.0: install that first, then reinstall sf
Calls: %>% ... _fseq -> freduce -> <Anonymous> -> select -> select.sf
Execution halted

checking tests ... ERROR
  Running ‘cast.R’
  Comparing ‘cast.Rout’ to ‘cast.Rout.save’ ...4c4
< Linking to GEOS 3.5.0, GDAL 2.1.0, proj.4 4.9.2
---
> Linking to GEOS 3.5.1, GDAL 2.1.3, proj.4 4.9.2
  Running ‘crs.R’
  Comparing ‘crs.Rout’ to ‘crs.Rout.save’ ... OK
  Running ‘dist.R’
  Comparing ‘dist.Rout’ to ‘dist.Rout.save’ ... OK
... 8 lines ...
  Warning message:
  plotting the first 10 out of 14 attributes; use max.plot = 14 to plot all 
  > 
  > # plot 10 smallest counties in grey:
  > nc %>% 
  +   select(BIR74, geometry) %>% 
  +   plot()
  Error in select.sf(., BIR74, geometry) : 
    requires dplyr > 0.5.0: install that first, then reinstall sf
  Calls: %>% ... _fseq -> freduce -> <Anonymous> -> select -> select.sf
  Execution halted

checking installed package size ... NOTE
  installed size is 10.3Mb
  sub-directories of 1Mb or more:
    doc    4.0Mb
    libs   4.2Mb
```

## sjPlot (2.3.1)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

0 errors | 1 warning  | 1 note 

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
39: buildVignettes(dir = "/home/muelleki/git/R/tibble/revdep/checks/sjPlot.Rcheck/vign_test/sjPlot")
An irrecoverable exception occurred. R is aborting now ...
Segmentation fault (core dumped)

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘plm’
```

## sjstats (0.10.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/strengejacke/sjstats/issues

1 error  | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘sjstats-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: check_assumptions
> ### Title: Check model assumptions
> ### Aliases: check_assumptions outliers heteroskedastic autocorrelation
> ###   normality multicollin
> 
... 62 lines ...
+   mutate(models = lapply(.$strap, function(x) {
+     lm(neg_c_7 ~ e42dep + c12hour + c161sex, data = x)
+   }))
> 
> # for list-variables, argument 'model.column' is the
> # quoted name of the list-variable with fitted models
> tmp %>% heteroskedastic("models")
Error in eval(data, envir = environment(formula(model))) : 
  object 'x' not found
Calls: %>% ... .Call -> .f -> <Anonymous> -> ncvTest.lm -> eval -> eval
Execution halted

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘piecewiseSEM’
```

## spdplyr (0.1.2)
Maintainer: Michael D. Sumner <mdsumner@gmail.com>  
Bug reports: https://github.com/mdsumner/spdplyr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  Loading required package: sp
  > 
  > test_check("spdplyr")
  Checking rgeos availability: TRUE
  1. Failure: joins work (@test-basic-dplyr.R#134) -------------------------------
  `warnings` does not match "joining character".
  Actual value: "Column `NAME`/`ent` joining factor and character vector, coercing into character vector"
  
  
  testthat results ================================================================
  OK: 29 SKIPPED: 3 FAILED: 1
  1. Failure: joins work (@test-basic-dplyr.R#134) 
  
  Error: testthat unit tests failed
  Execution halted
```

## tidyr (0.6.2)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/tidyverse/tidyr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > library(testthat)
  > library(tidyr)
  > 
  > test_check("tidyr")
  1. Failure: errors are raised (@test-drop_na.R#53) -----------------------------
  error$message does not match "Unknown column".
  Actual value: "Column `z` not found"
  
  
  testthat results ================================================================
  OK: 192 SKIPPED: 0 FAILED: 1
  1. Failure: errors are raised (@test-drop_na.R#53) 
  
  Error: testthat unit tests failed
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

## valr (0.2.0)
Maintainer: Jay Hesselberth <jay.hesselberth@gmail.com>  
Bug reports: https://github.com/rnabioco/valr/issues

2 errors | 1 warning  | 1 note 

```
checking examples ... ERROR
Running examples in ‘valr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: bed_intersect
> ### Title: Identify intersecting intervals.
> ### Aliases: bed_intersect
> 
> ### ** Examples
... 63 lines ...
> z <- trbl_interval(
+   ~chrom, ~start, ~end, ~value,
+   "chr1", 150,    400,  100,
+   "chr1", 500,    550,  100,
+   "chr2", 230,    430,  200,
+   "chr2", 750,    900,  400
+ )
> 
> bed_intersect(x, y, z)
Error: Variable context not set
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’ [12s/12s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 252 SKIPPED: 3 FAILED: 14
  1. Error: tbls grouped by strand are processed (@test_intersect.r#181) 
  2. Error: multiple y tbl_intervals can be passed to bed_intersect (#220) (@test_intersect.r#229) 
  3. Error: groups are respected when passing multiple y tbl_intervals  (@test_intersect.r#266) 
  4. Error: same intervals are reported with single and multiple intersection (@test_intersect.r#297) 
  5. Error: window IDs are generated (@test_makewindows.r#17) 
  6. Error: win_size fwd (@test_makewindows.r#23) 
  7. Error: win_size rev (@test_makewindows.r#34) 
  8. Error: win_size +step_size fwd (@test_makewindows.r#45) 
  9. Error: win_size +step_size rev (@test_makewindows.r#57) 
  1. ...
  
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

Quitting from lines 181-206 (interval-stats.Rmd) 
Error: processing vignette 'interval-stats.Rmd' failed with diagnostics:
Column `projection` must be length 1 (the group size), not 4
Execution halted


checking installed package size ... NOTE
  installed size is 12.5Mb
  sub-directories of 1Mb or more:
    libs  10.8Mb
```

