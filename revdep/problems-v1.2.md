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
|date     |2017-01-04                   |

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

16 packages with problems

|package           |version | errors| warnings| notes|
|:-----------------|:-------|------:|--------:|-----:|
|bsam              |1.1.1   |      1|        0|     0|
|easyformatr       |0.1.2   |      1|        0|     0|
|geojson           |0.1.0   |      1|        0|     0|
|highcharter       |0.4.0   |      0|        1|     0|
|jpmesh            |0.3.0   |      1|        0|     0|
|pdfsearch         |0.1.1   |      1|        0|     0|
|photobiologyInOut |0.4.12  |      1|        0|     0|
|phylopath         |0.2.1   |      1|        0|     0|
|plotly            |4.5.6   |      1|        0|     0|
|radiant.data      |0.6.0   |      1|        0|     0|
|rgbif             |0.9.6   |      1|        0|     0|
|sf                |0.2-7   |      1|        0|     0|
|spocc             |0.6.0   |      1|        0|     0|
|tidyquant         |0.1.0   |      1|        0|     0|
|units             |0.4-1   |      1|        0|     0|
|valr              |0.1.1   |      1|        0|     0|

## bsam (1.1.1)
Maintainer: Ian Jonsen <ian.jonsen@mq.edu.au>  
Bug reports: https://github.com/ianjonsen/bsam/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘rjags’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## easyformatr (0.1.2)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>  
Bug reports: https://github.com/bramtayl/easyformatr/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘easyformatr’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/easyformatr.Rcheck/00install.out’ for details.
```

## geojson (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/geojson/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘protolite’

Package suggested but not available for checking: ‘geojsonlint’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
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
checking package dependencies ... ERROR
Package required but not available: ‘geojsonio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## pdfsearch (0.1.1)
Maintainer: Brandon LeBeau <lebebr01+pdfsearch@gmail.com>  
Bug reports: https://github.com/lebebr01/pdfsearch/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘pdftools’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
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

## phylopath (0.2.1)
Maintainer: Wouter van der Bijl <wouter.van.der.bijl@zoologi.su.se>  
Bug reports: https://github.com/Ax3man/phylopath/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘phylopath-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: DAG
> ### Title: Directed acyclic graphs (DAGs)
> ### Aliases: DAG
> 
> ### ** Examples
> 
>   # Use formula notation to create DAGs:
>   plot(DAG(A~B, B~C))
Error in `[.data.frame`(nodes_df, , i) : undefined columns selected
Calls: plot -> plot.DAG -> <Anonymous> -> [ -> [.data.frame
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

## radiant.data (0.6.0)
Maintainer: Vincent Nijs <radiant@rady.ucsd.edu>  
Bug reports: https://github.com/radiant-rstats/radiant.data/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘radiant.data-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: dtab.explore
> ### Title: Make a tabel of summary statistics in DT
> ### Aliases: dtab.explore
> 
> ### ** Examples
> 
> tab <- explore("diamonds", "price:x") %>% dtab
Error in loadNamespace(name) : there is no package called ‘crosstalk’
Calls: %>% ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
```

## rgbif (0.9.6)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/rgbif/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘V8’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## sf (0.2-7)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/sfr/issues/

1 error  | 0 warnings | 0 notes

```
checking whether package ‘sf’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/sf.Rcheck/00install.out’ for details.
```

## spocc (0.6.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/spocc/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available: ‘rgbif’ ‘V8’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
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

## units (0.4-1)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/units/issues/

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘udunits2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## valr (0.1.1)
Maintainer: Jay Hesselberth <jay.hesselberth@gmail.com>  
Bug reports: https://github.com/jayhesselberth/valr/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘valr’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/valr.Rcheck/00install.out’ for details.
```

