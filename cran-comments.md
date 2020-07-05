Fix for a problem with the new name repair, discovered after release of tibble 2.0.1.

## Test environments

* local install, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.1, R 3.2, R 3.3, R-oldrel, R-release and R-devel
* win-builder
* r-hub

## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

We checked all direct and indirect reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.  Check results were identical, except for readxl (update already on CRAN) and ggstatsplot (already fixed in the development version: https://github.com/IndrajeetPatil/ggstatsplot/issues/183).
