## Test environments
* ubuntu 12.04 (on travis-ci), R 3.3.1, R-devel and R-oldrel
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note (about the MIT license)

## Reverse dependencies

I checked all 30 reverse dependencies for version 1.0 and for the current release,
and compared the results. They were identical, except for the `bigrf` package
which failed memory allocation in both cases but for two different reasons.
