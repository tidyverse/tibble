Resubmission with slightly improved documentation.

## Test environments
* local install, R 3.4.3
* ubuntu 12.04 (on travis-ci), R 3.1, R 3.2, R-oldrel, R-release and R-devel
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

Checked all 292 downstream packages on CRAN and BioConductor. Two of them (dbplyr and xpose) now have failing tests, because these packages compare tibble output verbatim, and the output has changed. The maintainers have been notified and/or the development versions of these packages already include these fixes, which will be pushed to CRAN at the maintainers' earliest.

- dbplyr: https://github.com/tidyverse/dbplyr/pull/52
- xpose: https://github.com/UUPharmacometrics/xpose/issues/80
