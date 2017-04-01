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
|date     |2017-01-05                   |

## Packages

|package        |*  |version    |date       |source                           |
|:--------------|:--|:----------|:----------|:--------------------------------|
|assertthat     |   |0.1        |2013-12-06 |cran (@0.1)                      |
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

6 packages with problems

|package           |version | errors| warnings| notes|
|:-----------------|:-------|------:|--------:|-----:|
|highcharter       |0.4.0   |      0|        1|     0|
|photobiologyInOut |0.4.12  |      1|        0|     0|
|plotly            |4.5.6   |      1|        0|     0|
|taxize            |0.8.0   |      1|        0|     0|
|tidyquant         |0.1.0   |      1|        0|     0|
|tidyr             |0.6.0   |      1|        0|     0|

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

## taxize (0.8.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/taxize/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  Not Found (HTTP 404).
  1: get_gbifid("Satyrium", phylum = "Tracheophyta", rows = 1, verbose = FALSE) at testthat/test-get_gbifid.R:34
  2: lapply(as.character(sciname), fun, ask, verbose, rows, ...)
  3: FUN(X[[i]], ...)
  4: gbif_name_backbone(sciname, ...)
  5: stop_for_status(temp)
  
  testthat results ================================================================
  OK: 24 SKIPPED: 138 FAILED: 1
  1. Error: get_gbifid phylum/class/order/family parameters work (@test-get_gbifid.R#34) 
  
  Error: testthat unit tests failed
  Execution halted
```

## tidyquant (0.1.0)
Maintainer: Matt Dancho <mdancho@gmail.com>  
Bug reports: https://github.com/mdancho84/tidyquant/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         AAPL %>% tq_mutate_(x_fun = "close", mutate_fun = mutate_fun)
     }, paste0("fun = ", mutate_fun, " not a valid option.")) at testthat/test_tq_transform.R:118
  2: paste0("fun = ", mutate_fun, " not a valid option.") at /tmp/RtmpGs2f8Q/devtools11166987ba25/hadley-testthat-3b2f225/R/expect-output.R:147
  
  testthat results ================================================================
  OK: 125 SKIPPED: 1 FAILED: 4
  1. Error: Test error on invalid x_fun, .x and .y inputs. (@test_tq_mutate.R#115) 
  2. Error: Test error on invalid x_fun, .x and .y inputs. (@test_tq_mutate.R#133) 
  3. Error: Test error on invalid x_fun, .x and .y inputs. (@test_tq_transform.R#100) 
  4. Error: Test error on invalid x_fun, .x and .y inputs. (@test_tq_transform.R#118) 
  
  Error: testthat unit tests failed
  Execution halted
```

## tidyr (0.6.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/tidyr/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > 
  > test_check("tidyr")
  1. Failure: errors are raised (@test-drop_na.R#53) -----------------------------
  error\$message does not match "Unknown columns".
  Actual value: "Unknown column: 'z'"
  
  
  testthat results ================================================================
  OK: 192 SKIPPED: 0 FAILED: 1
  1. Failure: errors are raised (@test-drop_na.R#53) 
  
  Error: testthat unit tests failed
  Execution halted
```

