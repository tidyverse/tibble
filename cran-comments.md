Hotfix for two problems discovered after release of tibble 2.0.0.

## Test environments

* local install, R 3.5.1
* ubuntu 14.04 (on travis-ci), R 3.1, R 3.2, R-oldrel, R-release and R-devel
* win-builder
* r-hub

## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

We checked all direct reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.  Check results were identical, except for codemetar (unrelated to this change, the package accesses a remote API) and pkgcache (which is broken by tibble 2.0.0 and fixed with the release at hand).
