# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.2 (2016-10-31) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-01-10                   |

## Packages

|package        |*  |version    |date       |source                           |
|:--------------|:--|:----------|:----------|:--------------------------------|
|assertthat     |   |0.1        |2013-12-06 |cran (@0.1)                      |
|dplyr          |   |0.5.0      |2016-06-24 |CRAN (R 3.3.2)                   |
|knitr          |   |1.15.1     |2016-11-22 |cran (@1.15.1)                   |
|lazyeval       |   |0.2.0      |2016-06-12 |cran (@0.2.0)                    |
|microbenchmark |   |1.4-2.1    |2015-11-25 |cran (@1.4-2.1)                  |
|nycflights13   |   |0.2.1      |2016-12-30 |cran (@0.2.1)                    |
|Rcpp           |   |0.12.8     |2016-11-17 |cran (@0.12.8)                   |
|rmarkdown      |   |1.3        |2016-12-21 |cran (@1.3)                      |
|testthat       |   |1.0.2.9000 |2016-12-24 |Github (hadley/testthat@3b2f225) |
|tibble         |   |1.2        |2016-08-26 |cran (@1.2)                      |
|withr          |   |1.0.2      |2016-06-20 |CRAN (R 3.3.1)                   |

# Check results

8 packages with problems

|package           |version | errors| warnings| notes|
|:-----------------|:-------|------:|--------:|-----:|
|dat               |0.1.0   |      1|        0|     0|
|highcharter       |0.4.0   |      0|        1|     0|
|jpmesh            |0.3.0   |      1|        0|     0|
|photobiologyInOut |0.4.12  |      1|        0|     0|
|plotly            |4.5.6   |      1|        0|     0|
|rbgm              |0.0.4   |      0|        1|     0|
|sf                |0.2-8   |      1|        0|     1|
|tidyquant         |0.2.0   |      1|        0|     0|

## dat (0.1.0)
Maintainer: Sebastian Warnholz <wahani@gmail.com>  
Bug reports: https://github.com/wahani/dat/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
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

## highcharter (0.4.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Quitting from lines 58-81 (replicating-highcharts-demos.Rmd) 
Error: processing vignette 'replicating-highcharts-demos.Rmd' failed with diagnostics:
cannot open the connection
Execution halted

```

## jpmesh (0.3.0)
Maintainer: Shinya Uryu <suika1127@gmail.com>  
Bug reports: https://github.com/uribo/jpmesh/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘jpmesh’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/jpmesh.Rcheck/00install.out’ for details.
```

## photobiologyInOut (0.4.12)
Maintainer: Pedro J. Aphalo <pedro.aphalo@helsinki.fi>  
Bug reports: https://bitbucket.org/aphalo/photobiologyinout/

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  as.numeric(getWhenMeasured(ss.spct), tz = "CET") not equal to as.numeric(ymd_hms("2013-05-06 15:13:40", tz = "CET"), tz = "CET").
  1/1 mismatches
  [1] 1.37e+09 - 1.37e+09 == 3450400
  
  
  Read 4 items
  testthat results ================================================================
  OK: 214 SKIPPED: 0 FAILED: 2
  1. Failure: SpectraSuite (@test-oo.R#76) 
  2. Failure: SpectraSuite (@test-oo.R#158) 
  
  Error: testthat unit tests failed
  Execution halted
```

## plotly (4.5.6)
Maintainer: Carson Sievert <cpsievert1@gmail.com>  
Bug reports: https://github.com/ropensci/plotly/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  [1] "Running test: plotly-alpha-no-color"
  [1] "Running test: plotly-factor-axis"
  [1] "Running test: plotly-character-axis"
  [1] "Running test: plotly-histogram"
  [1] "Running test: plotly-histogram-vert"
  [1] "Running test: plotly-inherit-FALSE"
  [1] "Running test: plotly-time-series-summary"
  testthat results ================================================================
  OK: 808 SKIPPED: 17 FAILED: 1
  1. Error: datetimes are converted to e.g. 2013-01-02 05:00:00 (@test-ggplot-date.R#11) 
  
  Error: testthat unit tests failed
  Execution halted
```

## rbgm (0.0.4)
Maintainer: Michael D. Sumner <mdsumner@gmail.com>  
Bug reports: https://github.com/AustralianAntarcticDivision/rbgm/issues/

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Loading required package: sp

Attaching package: 'dplyr'

The following objects are masked from 'package:raster':
... 8 lines ...
The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/home/muelleki/R/x86_64-pc-linux-gnu-library/3.3/rgdal/libs/rgdal.so':
  libgdal.so.1: cannot open shared object file: No such file or directory
Quitting from lines 16-24 (BGM_Spatial.Rmd) 
Error: processing vignette 'BGM_Spatial.Rmd' failed with diagnostics:
package or namespace load failed for 'rgdal'
Execution halted
```

## sf (0.2-8)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/sfr/issues/

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > test_check("sf")
  1. Error: st_transform works (@test_gdal.R#11) ---------------------------------
  package rgdal is required for spTransform methods
  1: spTransform(sp, CRS(toCrs)) at testthat/test_gdal.R:11
  2: spTransform(sp, CRS(toCrs)) at /tmp/RtmpvuUUir/devtools345049746f77/sp/R/Spatial-methods.R:93
  3: stop("package rgdal is required for spTransform methods") at /tmp/RtmpvuUUir/devtools345049746f77/sp/R/Spatial-methods.R:97
  
  testthat results ================================================================
  OK: 190 SKIPPED: 0 FAILED: 1
  1. Error: st_transform works (@test_gdal.R#11) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  8.5Mb
  sub-directories of 1Mb or more:
    doc    4.0Mb
    libs   3.7Mb
```

## tidyquant (0.2.0)
Maintainer: Matt Dancho <mdancho@gmail.com>  
Bug reports: https://github.com/mdancho84/tidyquant/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         AAPL %>% tq_mutate_(ohlc_fun = "close", mutate_fun = mutate_fun)
     }, paste0("fun = ", mutate_fun, " not a valid option.")) at testthat/test_tq_transform.R:118
  2: paste0("fun = ", mutate_fun, " not a valid option.") at /tmp/RtmpGs2f8Q/devtools11166987ba25/hadley-testthat-3b2f225/R/expect-output.R:147
  
  testthat results ================================================================
  OK: 133 SKIPPED: 1 FAILED: 4
  1. Error: Test error on invalid ohlc_fun, x and y inputs. (@test_tq_mutate.R#133) 
  2. Error: Test error on invalid ohlc_fun, x and y inputs. (@test_tq_mutate.R#151) 
  3. Error: Test error on invalid ohlc_fun, x and y inputs. (@test_tq_transform.R#100) 
  4. Error: Test error on invalid ohlc_fun, x and y inputs. (@test_tq_transform.R#118) 
  
  Error: testthat unit tests failed
  Execution halted
```

