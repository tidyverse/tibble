# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.3 (2017-03-06) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-03-31                   |

## Packages

|package        |*  |version    |date       |source                           |
|:--------------|:--|:----------|:----------|:--------------------------------|
|assertthat     |   |0.1        |2013-12-06 |cran (@0.1)                      |
|knitr          |   |1.15.1     |2016-11-22 |cran (@1.15.1)                   |
|lazyeval       |   |0.2.0      |2016-06-12 |cran (@0.2.0)                    |
|microbenchmark |   |1.4-2.1    |2015-11-25 |cran (@1.4-2.1)                  |
|nycflights13   |   |0.2.2      |2017-01-27 |cran (@0.2.2)                    |
|Rcpp           |   |0.12.10    |2017-03-31 |Github (RcppCore/Rcpp@886f5df)   |
|rmarkdown      |   |1.4        |2017-03-24 |cran (@1.4)                      |
|testthat       |   |1.0.2.9000 |2017-02-27 |Github (hadley/testthat@b72a228) |
|tibble         |   |1.2        |2016-08-26 |cran (@1.2)                      |
|withr          |   |1.0.2      |2016-06-20 |CRAN (R 3.3.1)                   |

# Check results

11 packages with problems

|package       |version | errors| warnings| notes|
|:-------------|:-------|------:|--------:|-----:|
|dat           |0.1.0   |      1|        0|     0|
|flextable     |0.1.0   |      0|        1|     0|
|FSelectorRcpp |0.1.2   |      1|        0|     2|
|ggimage       |0.0.4   |      1|        0|     0|
|haven         |1.0.0   |      2|        0|     1|
|hddtools      |0.6     |      1|        0|     0|
|heemod        |0.8.0   |      1|        1|     1|
|highcharter   |0.5.0   |      0|        1|     1|
|officer       |0.1.1   |      2|        1|     0|
|plotly        |4.5.6   |      1|        0|     0|
|refimpact     |0.1.0   |      1|        0|     0|

## dat (0.1.0)
Maintainer: Sebastian Warnholz <wahani@gmail.com>  
Bug reports: https://github.com/wahani/dat/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [10s/10s]
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
  OK: 107 SKIPPED: 0 FAILED: 1
  1. Failure: Package Style (@test-lintr.R#5) 
  
  Error: testthat unit tests failed
  Execution halted
```

## flextable (0.1.0)
Maintainer: David Gohel <david.gohel@ardata.fr>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Loading required package: officer

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
Quitting from lines 39-41 (format.Rmd) 
Error: processing vignette 'format.Rmd' failed with diagnostics:
cannot open the connection
Execution halted

```

## FSelectorRcpp (0.1.2)
Maintainer: Zygmunt Zawadzki <zygmunt@zstat.pl>  
Bug reports: https://github.com/mi2-warsaw/FSelectorRcpp/issues

1 error  | 0 warnings | 2 notes

```
checking examples ... ERROR
Running examples in ‘FSelectorRcpp-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: feature_search
> ### Title: General Feature Searching Engine
> ### Aliases: feature_search
> 
> ### ** Examples
> 
> 
> # Enable parallelization in examples
>  library(doSNOW) # doSNOW has an option for progress bar
Loading required package: foreach
Loading required package: iterators
Loading required package: snow
>  cl <- makeCluster(2)
Loading required namespace: Rmpi
Error in Rmpi::mpi.comm.spawn(slave = mpitask, slavearg = args, nslaves = count,  : 
  MPI_Comm_spawn is not supported.
Calls: makeCluster -> makeMPIcluster -> <Anonymous>
Execution halted

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘RTCGA.rnaseq’

checking installed package size ... NOTE
  installed size is  9.7Mb
  sub-directories of 1Mb or more:
    doc    2.2Mb
    libs   7.3Mb
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

2 errors | 0 warnings | 1 note 

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
... 14 lines ...
8          5.0        3.4         1.5        0.2  setosa
9          4.4        2.9         1.4        0.2  setosa
10         4.9        3.1         1.5        0.1  setosa
# ... with 140 more rows
> 
> tmp <- tempfile(fileext = ".dta")
> write_dta(mtcars, tmp)
Error in write_dta_(data, normalizePath(path, mustWork = FALSE), version = stata_file_format(version)) : 
  Writing failure: Unable to write data.
Calls: write_dta -> write_dta_ -> .Call
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
```

## hddtools (0.6)
Maintainer: Claudia Vitolo <cvitolodev@gmail.com>  
Bug reports: https://github.com/ropensci/hddtools/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [13s/24s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  3: stop(gettextf("unable to find an inherited method for function %s for signature %s", 
         sQuote(fdef@generic), sQuote(cnames)), domain = NA)
  
  trying URL 'ftp://ftp.bafg.de/pub/REFERATE/GRDC/ltdata/africa.zip'
  ftp data connection made, file length 2730333 bytes
  ==================================================
  downloaded 2.6 MB
  
  testthat results ================================================================
  OK: 55 SKIPPED: 1 FAILED: 2
  1. Error: Test TRMM function using dates in the past (@test-TRMM.R#15) 
  2. Error: Test TRMM function using 3-hourly dates in the past (@test-TRMM.R#58) 
  
  Error: testthat unit tests failed
  Execution halted
```

## heemod (0.8.0)
Maintainer: Antoine Filipovic-Pierucci <pierucci@gmail.com>  
Bug reports: https://github.com/pierucci/heemod/issues

1 error  | 1 warning  | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’ [32s/36s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  5: as.data.frame(flexsurv::summary.flexsurvreg(x, t = times_surv, type = "cumhaz"))
  6: flexsurv::summary.flexsurvreg
  7: getExportedValue(pkg, name)
  8: stop(gettextf("'%s' is not an exported object from 'namespace:%s'", name, getNamespaceName(ns)), 
         call. = FALSE, domain = NA)
  
      .model        from                 to prob
  1 standard RevisionTHR SuccessfulRevision <NA>
  2      new RevisionTHR SuccessfulRevision <NA>
  testthat results ================================================================
  OK: 346 SKIPPED: 0 FAILED: 1
  1. Error: (unknown) (@test_survival.R#23) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
'colour', which will replace the existing scale.
Scale for 'colour' is already present. Adding another scale for
'colour', which will replace the existing scale.
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
... 8 lines ...
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Error in mutate_impl(.data, dots) : 
  'summary.flexsurvreg' is not an exported object from 'namespace:flexsurv'
Quitting from lines 42-83 (j-survival.Rmd) 
Error: processing vignette 'j-survival.Rmd' failed with diagnostics:
Error in parameter: p2.
Execution halted

checking dependencies in R code ... NOTE
Missing or unexported object: ‘flexsurv::summary.flexsurvreg’
```

## highcharter (0.5.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

0 errors | 1 warning  | 1 note 

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Highcharts (www.highcharts.com) is a Highsoft software product which is
not free for commercial and Governmental use
Quitting from lines 45-46 (charting-data-frames.Rmd) 
Error: processing vignette 'charting-data-frames.Rmd' failed with diagnostics:
cannot open the connection
Execution halted


checking installed package size ... NOTE
  installed size is 16.5Mb
  sub-directories of 1Mb or more:
    doc          13.7Mb
    htmlwidgets   1.9Mb
```

## officer (0.1.1)
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
  Running ‘testthat.R’ [20s/20s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  9: ph_with_img(., type = "body", src = img.file, height = 1.06, width = 1.39)
  10: external_img(src, width = width, height = height)
  11: stopifnot(file.exists(src))
  12: stop(sprintf(ngettext(length(r), "%s is not TRUE", "%s are not all TRUE"), ch), call. = FALSE, 
         domain = NA)
  
  testthat results ================================================================
  OK: 317 SKIPPED: 0 FAILED: 4
  1. Error: image add  (@test-docx-add.R#68) 
  2. Error: pml fp_border (@test-fp_cell.R#75) 
  3. Error: css fp_border (@test-fp_cell.R#165) 
  4. Error: add img into placeholder (@test-pptx-add.R#67) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Quitting from lines 181-191 (powerpoint.Rmd) 
Error: processing vignette 'powerpoint.Rmd' failed with diagnostics:
file.exists(src) is not TRUE
Execution halted

```

## plotly (4.5.6)
Maintainer: Carson Sievert <cpsievert1@gmail.com>  
Bug reports: https://github.com/ropensci/plotly/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [44s/45s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  [1] "Running test: plotly-group-within-trace"
  [1] "Running test: plotly-alpha-blending"
  [1] "Running test: plotly-alpha-no-color"
  [1] "Running test: plotly-factor-axis"
  [1] "Running test: plotly-character-axis"
  [1] "Running test: plotly-histogram"
  [1] "Running test: plotly-histogram-vert"
  [1] "Running test: plotly-inherit-FALSE"
  [1] "Running test: plotly-time-series-summary"
  testthat results ================================================================
  OK: 813 SKIPPED: 17 FAILED: 1
  1. Error: datetimes are converted to e.g. 2013-01-02 05:00:00 (@test-ggplot-date.R#11) 
  
  Error: testthat unit tests failed
  Execution halted
```

## refimpact (0.1.0)
Maintainer: Perry Stephenson <perry.stephenson+cran@gmail.com>  
Bug reports: https://github.com/perrystephenson/refimpact/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [1s/22s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  7: parseJSON(txt, bigint_as_char) at /tmp/RtmptEsk2b/devtools8d9d52fae03/jsonlite/R/fromJSON.R:115
  8: parse_con(txt, bigint_as_char) at /tmp/RtmptEsk2b/devtools8d9d52fae03/jsonlite/R/parseJSON.R:3
  9: open(con, "rb") at /tmp/RtmptEsk2b/devtools8d9d52fae03/jsonlite/R/push_parser.R:6
  10: open.connection(con, "rb")
  
  testthat results ================================================================
  OK: 21 SKIPPED: 0 FAILED: 5
  1. Error: get_institutions() returns a tibble (@test_institutions.R#6) 
  2. Error: Function returns sensible data frames for sensible queries (@test_search_case_studies.R#6) 
  3. Error: get_tag_types() returns a tibble (@test_tag_types.R#6) 
  4. Error: get_tag_value() returns a tibble (@test_tag_values.R#6) 
  5. Error: get_units_of_assessment() returns a tibble (@test_units_of_assessment.R#6) 
  
  Error: testthat unit tests failed
  Execution halted
```

