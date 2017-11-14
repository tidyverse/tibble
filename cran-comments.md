## Test environments
* local install, R 3.4.2
* ubuntu 12.04 (on travis-ci), R 3.1, R 3.2, R-oldrel, R-release and R-devel

## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

Checked all 265 downstream packages on CRAN and BioConductor. Two of them (dbplyr and RxODE) now have failing tests, because these packages compare tibble output verbatim, and the output has changed. The development versions of these packages already include these fixes, which will be pushed to CRAN at the maintainers' earliest.

- dbplyr: https://github.com/tidyverse/dbplyr/pull/52
- RxODE: https://github.com/nlmixrdevelopment/RxODE/issues/9
