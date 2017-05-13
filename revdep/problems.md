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
|date     |2017-05-13                   |

## Packages

|package        |*  |version    |date       |source                            |
|:--------------|:--|:----------|:----------|:---------------------------------|
|dplyr          |   |0.5.0      |2016-06-24 |cran (@0.5.0)                     |
|knitr          |   |1.15.1     |2016-11-22 |cran (@1.15.1)                    |
|lazyeval       |   |0.2.0      |2016-06-12 |cran (@0.2.0)                     |
|microbenchmark |   |1.4-2.1    |2015-11-25 |cran (@1.4-2.1)                   |
|nycflights13   |   |0.2.2      |2017-01-27 |cran (@0.2.2)                     |
|Rcpp           |   |0.12.10    |2017-03-19 |CRAN (R 3.4.0)                    |
|rmarkdown      |   |1.5        |2017-04-26 |cran (@1.5)                       |
|testthat       |   |1.0.2      |2016-04-23 |cran (@1.0.2)                     |
|tibble         |   |1.3.0.9002 |2017-05-13 |Github (tidyverse/tibble@afeafd9) |
|withr          |   |1.0.2      |2016-06-20 |CRAN (R 3.4.0)                    |

# Check results

11 packages with problems

|package       |version | errors| warnings| notes|
|:-------------|:-------|------:|--------:|-----:|
|atlantistools |0.4.1   |      0|        1|     1|
|dat           |0.2.0   |      1|        0|     0|
|ecoseries     |0.1.3   |      1|        0|     0|
|FSelectorRcpp |0.1.3   |      1|        0|     2|
|ggimage       |0.0.4   |      1|        0|     0|
|haven         |1.0.0   |      2|        0|     2|
|huxtable      |0.2.2   |      1|        0|     0|
|monkeylearn   |0.1.1   |      0|        1|     0|
|officer       |0.1.3   |      2|        1|     0|
|rif           |0.1.0   |      1|        1|     0|
|rio           |0.5.0   |      2|        1|     0|

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

## dat (0.2.0)
Maintainer: Sebastian Warnholz <wahani@gmail.com>  
Bug reports: https://github.com/wahani/dat/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [11s/12s]
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
Invalid timestamp string (length=17): 13 Mai 2017 09:06
Error in df_parse_dta_file(spec, encoding) : 
  Failed to parse /tmp/RtmplyEUmM/file6101c7013dc.dta: The file's timestamp string is invalid.
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

## huxtable (0.2.2)
Maintainer: David Hugh-Jones <davidhughjones@gmail.com>  
Bug reports: https://github.com/hughjonesd/huxtable/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [10s/13s]
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
  OK: 203 SKIPPED: 14 FAILED: 1
  1. Error: Row heights do not screw up latex multicol (@test-with-pandoc.R#20) 
  
  Error: testthat unit tests failed
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
  Running ‘testthat.R’ [23s/24s]
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

## rif (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus+r@gmail.com>  
Bug reports: https://github.com/ropensci/rif/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
  Running ‘test-all.R’ [0m/48m]
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 0 SKIPPED: 0 FAILED: 22
  1. Error: federation_data (@test-federation_data.R#4) 
  2. Error: federation_facet (@test-federation_facet.R#4) 
  3. Error: federation_search (@test-federation_search.R#4) 
  4. Error: lexical_chunks (@test-lexical_chunks.R#4) 
  5. Error: lexical_entities (@test-lexical_entities.R#4) 
  6. Error: lexical_pmchunks (@test-lexical_pmchunks.R#4) 
  7. Error: lexical_pmentities (@test-lexical_pmentities.R#4) 
  8. Error: lexical_pos (@test-lexical_pos.R#4) 
  9. Error: lexical_sentences (@test-lexical_sentences.R#4) 
  1. ...
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 51-53 (rif_vignette.Rmd) 
Error: processing vignette 'rif_vignette.Rmd' failed with diagnostics:
Service Unavailable (HTTP 503)
Execution halted

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
Invalid timestamp string (length=17): 13 Mai 2017 09:21
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

