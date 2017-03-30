## Test environments
* ubuntu 12.04 (on travis-ci), R 3.3.2, R-devel and R-oldrel
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note (about the MIT license)

## Reverse dependencies

I checked all 118 reverse dependencies on CRAN and Bioconductor for version 1.2
and for the current release, and compared the outputs of R CMD check. They were
identical for all packages.

The previous attempt to release didn't cover an error in the `readr` package
due to a missing dependency, this should be fixed in `readr` 1.1.0.
