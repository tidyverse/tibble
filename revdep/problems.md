# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.1 (2016-06-21) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |en_US:en                     |
|collate  |en_US.UTF-8                  |
|tz       |Europe/Zurich                |
|date     |2016-08-19                   |

## Packages

|package        |*  |version |date       |source                   |
|:--------------|:--|:-------|:----------|:------------------------|
|assertthat     |   |0.1     |2013-12-06 |cran (@0.1)              |
|knitr          |   |1.14    |2016-08-13 |cran (@1.14)             |
|lazyeval       |   |0.2.0   |2016-06-12 |cran (@0.2.0)            |
|microbenchmark |   |1.4-2.1 |2015-11-25 |cran (@1.4-2.1)          |
|nycflights13   |   |0.2.0   |2016-04-30 |cran (@0.2.0)            |
|Rcpp           |   |0.12.6  |2016-07-19 |cran (@0.12.6)           |
|rmarkdown      |   |1.0     |2016-07-08 |cran (@1.0)              |
|testthat       |   |1.0.2   |2016-04-23 |cran (@1.0.2)            |
|tibble         |   |1.1-8   |2016-08-19 |local (hadley/tibble@NA) |
|withr          |   |1.0.2   |2016-06-20 |cran (@1.0.2)            |

# Check results
4 packages with problems

## highcharter (0.4.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘highcharter’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/highcharter.Rcheck/00install.out’ for details.
```

## photobiologyInOut (0.4.9)
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
  OK: 202 SKIPPED: 0 FAILED: 2
  1. Failure: SpectraSuite (@test-oo.R#76) 
  2. Failure: SpectraSuite (@test-oo.R#158) 
  
  Error: testthat unit tests failed
  Execution halted
```

## pollstR (1.4.0)
Maintainer: Jeffrey B. Arnold <jeffrey.arnold@gmail.com>  
Bug reports: https://github.com/rOpenGov/pollstR/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Segmentation fault
Error: processing vignette 'introduction.Rmd' failed with diagnostics:
pandoc document conversion failed with error 139
Execution halted

```

## sjPlot (2.0.2)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘sjPlot’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/sjPlot.Rcheck/00install.out’ for details.
```

