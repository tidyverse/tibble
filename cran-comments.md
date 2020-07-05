Major update with breaking changes.

## Test environments

* local install, R 3.5.1
* ubuntu 14.04 (on travis-ci), R 3.1, R 3.2, R-oldrel, R-release and R-devel
* win-builder
* r-hub

## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

We checked all direct and indirect reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package. We saw several problems, notified the maintainers of most affected packages on November 28, and prepared a blog post on https://www.tidyverse.org/articles/2018/11/tibble-2.0.0-pre-announce/. We also individually notified maintainers of affected packages where we did not send an e-mail. We failed to check some packages.

In total we are aware of 14 packages that now show more problems with R CMD check than before.

The affected packages where a fix is incoming are listed below:

* diffdf: maintainers are aware, https://github.com/gowerc/diffdf/issues/16
* feather: fixed in the dev version, https://github.com/wesm/feather/pull/365
* metacoder: likely a problem in the taxa package which has been updated on CRAN since then
* RCzechia: fixed in the dev version, https://github.com/jlacko/RCzechia/issues/10
* rsample: maintainers are aware, https://github.com/tidymodels/rsample/issues/74
* segregation: fixed in the dev version, https://github.com/elbersb/segregation/issues/1
* taxa: updated on CRAN
* tidypredict: updated on CRAN

For the following packages, maintainers were notified on November 28 (and sometimes individually) but no response has been received:

* corrr, https://github.com/drsimonj/corrr/issues/68
* docxtractr
* frequencies, https://github.com/DataInsightPartners/frequencies/issues/4
* portalr
* simTool, https://github.com/MarselScheer/simTool/issues/1

For the following package, the maintainer was notified only a few days ago, because the problem was detected only very late:

* readabs: https://github.com/zmeers/readabs/issues/1
