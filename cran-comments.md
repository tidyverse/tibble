## Test environments
* local install, R 3.3.3
* ubuntu 12.04 (on travis-ci), R 3.4.0, R-devel and R-oldrel
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

I checked all 151 reverse dependencies on CRAN and Bioconductor for version 1.3.0 and for the current release, and compared the outputs of R CMD check. They were identical for all packages, except for:

- dplyr, an update will be released very soon

- filesstrings: Test failure resolved on GitHub, https://github.com/rorynolan/filesstrings/pull/3

- readr: Pull request submitted to GitHub, https://github.com/tidyverse/readr/pull/676

- unpivotr: Pull request submitted to GitHub, https://github.com/nacnudus/unpivotr/pull/4

Check differences in other packages are not related to tibble. Full test results are at https://github.com/tidyverse/tibble/blob/r-1.3.1/revdep/README.md .
