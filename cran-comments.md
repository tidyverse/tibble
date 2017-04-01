## Test environments
* ubuntu 12.04 (on travis-ci), R 3.3.2, R-devel and R-oldrel
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note (about the MIT license)

## Reverse dependencies

I checked all 118 reverse dependencies on CRAN and Bioconductor for version 1.2
and for the current release, and compared the outputs of R CMD check. They were
identical for all packages.

The compatibility error in the `readr` package is now finally resolved.
The test error for the `refimpact` package seems to occur only sporadically,
this looks like an unstable test to me, and not like a regression caused by `tibble`.
