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
30 packages

## blkbox (1.0)
Maintainer: Boris Guennewig <b.guennewig@garvan.org.au>

0 errors | 0 warnings | 2 notes

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘bigrf’

checking dependencies in R code ... NOTE
Error occurred during initialization of VM
Could not allocate metaspace: 1073741824 bytes
```

## cellranger (1.1.0)
Maintainer: Jennifer Bryan <jenny@stat.ubc.ca>  
Bug reports: https://github.com/rsheets/cellranger/issues

0 errors | 0 warnings | 0 notes

## corrr (0.2.0)
Maintainer: Simon Jackson <drsimonjackson@gmail.com>  
Bug reports: https://github.com/drsimonj/corrr/issues

0 errors | 0 warnings | 0 notes

## docxtractr (0.2.0)
Maintainer: Bob Rudis <bob@rudis.net>

0 errors | 0 warnings | 0 notes

## dplyr (0.5.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/dplyr/issues

0 errors | 0 warnings | 2 notes

```
checking installed package size ... NOTE
  installed size is 15.9Mb
  sub-directories of 1Mb or more:
    libs  13.9Mb

checking dependencies in R code ... NOTE
Missing or unexported object: ‘RSQLite::rsqliteVersion’
```

## easyformatr (0.1.2)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>  
Bug reports: https://github.com/bramtayl/easyformatr/issues

0 errors | 0 warnings | 0 notes

## feather (0.0.1)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/wesm/feather/issues

0 errors | 0 warnings | 0 notes

## getlandsat (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropenscilabs/getlandsat/issues

0 errors | 0 warnings | 0 notes

## ggpmisc (0.2.10)
Maintainer: Pedro J. Aphalo <pedro.aphalo@helsinki.fi>  
Bug reports: https://bitbucket.org/aphalo/ggpmisc

0 errors | 0 warnings | 0 notes

## highcharter (0.4.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘highcharter’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/highcharter.Rcheck/00install.out’ for details.
```

## knitr (1.14)
Maintainer: Yihui Xie <xie@yihui.name>  
Bug reports: https://github.com/yihui/knitr/issues

0 errors | 0 warnings | 0 notes

## manifestoR (1.2.3)
Maintainer: Jirka Lewandowski <jirka.lewandowski@wzb.eu>  
Bug reports: https://github.com/ManifestoProject/manifestoR/issues

0 errors | 0 warnings | 0 notes

## mregions (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropenscilabs/mregions/issues

0 errors | 0 warnings | 0 notes

## openadds (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/sckott/openadds/issues

0 errors | 0 warnings | 0 notes

## pangaear (0.2.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/pangaear/issues

0 errors | 0 warnings | 0 notes

## photobiology (0.9.9)
Maintainer: Pedro J. Aphalo <pedro.aphalo@helsinki.fi>  
Bug reports: https://bitbucket.org/aphalo/photobiology/issues

0 errors | 0 warnings | 0 notes

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

## randNames (0.2.3)
Maintainer: Karthik Ram <karthik.ram@gmail.com>  
Bug reports: https://github.com/karthik/randNames/issues

0 errors | 0 warnings | 0 notes

## rbgm (0.0.4)
Maintainer: Michael D. Sumner <mdsumner@gmail.com>  
Bug reports: https://github.com/AustralianAntarcticDivision/rbgm/issues/

0 errors | 0 warnings | 0 notes

## readr (1.0.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/readr/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  8.0Mb
  sub-directories of 1Mb or more:
    libs   7.4Mb
```

## rgbif (0.9.4)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/rgbif/issues

0 errors | 0 warnings | 0 notes

## ritis (0.5.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/ritis/issues

0 errors | 0 warnings | 0 notes

## sjPlot (2.0.2)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘sjPlot’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/tibble/revdep/checks/sjPlot.Rcheck/00install.out’ for details.
```

## sjstats (0.3.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/sjstats/issues

0 errors | 0 warnings | 0 notes

## spbabel (0.4.0)
Maintainer: Michael D. Sumner <mdsumner@gmail.com>  
Bug reports: https://github.com/mdsumner/spbabel/issues

0 errors | 0 warnings | 0 notes

## spdplyr (0.1.2)
Maintainer: Michael D. Sumner <mdsumner@gmail.com>  
Bug reports: https://github.com/mdsumner/spdplyr/issues

0 errors | 0 warnings | 0 notes

## spocc (0.5.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/spocc/issues

0 errors | 0 warnings | 0 notes

## tidyr (0.6.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/tidyr/issues

0 errors | 0 warnings | 0 notes

## wand (0.2.0)
Maintainer: Bob Rudis <bob@rud.is>  
Bug reports: https://github.com/hrbrmstr/wand/issues

0 errors | 0 warnings | 0 notes

