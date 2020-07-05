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
|date     |2016-07-03                   |

## Packages

|package        |*  |version |date       |source                   |
|:--------------|:--|:-------|:----------|:------------------------|
|assertthat     |   |0.1     |2013-12-06 |CRAN (R 3.2.3)           |
|knitr          |   |1.13    |2016-05-09 |cran (@1.13)             |
|Lahman         |   |4.0-1   |2015-09-15 |CRAN (R 3.2.4)           |
|lazyeval       |   |0.2.0   |2016-06-12 |cran (@0.2.0)            |
|microbenchmark |   |1.4-2.1 |2015-11-25 |CRAN (R 3.2.3)           |
|Rcpp           |   |0.12.5  |2016-05-14 |cran (@0.12.5)           |
|rmarkdown      |   |0.9.6   |2016-05-01 |cran (@0.9.6)            |
|testthat       |   |1.0.2   |2016-04-23 |cran (@1.0.2)            |
|tibble         |   |1.1     |2016-07-03 |local (hadley/tibble@NA) |
|withr          |   |1.0.2   |2016-06-20 |cran (@1.0.2)            |

# Check results
10 packages

## dplyr (0.5.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/dplyr/issues

0 errors | 1 warning  | 2 notes

```
checking Rd cross-references ... WARNING
package ‘microbenchmark’ exists but was not installed under R >= 2.10.0 so xrefs cannot be checked

checking installed package size ... NOTE
  installed size is 15.9Mb
  sub-directories of 1Mb or more:
    libs  13.8Mb

checking dependencies in R code ... NOTE
Missing or unexported object: ‘RSQLite::rsqliteVersion’
```

## feather (0.0.1)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/wesm/feather/issues

0 errors | 0 warnings | 0 notes

## ggpmisc (0.2.9)
Maintainer: Pedro J. Aphalo <pedro.aphalo@helsinki.fi>  
Bug reports: https://bitbucket.org/aphalo/ggpmisc

0 errors | 0 warnings | 0 notes

## pangaear (0.2.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/pangaear/issues

0 errors | 0 warnings | 0 notes

## photobiologyInOut (0.4.6)
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

## randNames (0.2.3)
Maintainer: Karthik Ram <karthik.ram@gmail.com>  
Bug reports: https://github.com/karthik/randNames/issues

0 errors | 0 warnings | 0 notes

## rgbif (0.9.4)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/rgbif/issues

0 errors | 0 warnings | 0 notes

## ritis (0.5.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/ritis/issues

0 errors | 0 warnings | 0 notes

## spocc (0.5.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/spocc/issues

0 errors | 0 warnings | 0 notes

## tidyr (0.5.1)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/tidyr/issues

0 errors | 0 warnings | 0 notes

