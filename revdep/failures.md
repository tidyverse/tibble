# accept

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/accept
* Date/Publication: 2023-02-06 20:52:31 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "accept")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/accept/new/accept.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘accept/DESCRIPTION’ ... OK
* this is package ‘accept’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘accept’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/accept/new/accept.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/accept/old/accept.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘accept/DESCRIPTION’ ... OK
* this is package ‘accept’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘accept’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/accept/old/accept.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# autoTS

<details>

* Version: 0.9.11
* GitHub: https://github.com/vivienroussez/autots
* Source code: https://github.com/cran/autoTS
* Date/Publication: 2020-06-05 12:20:06 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "autoTS")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/autoTS/new/autoTS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoTS/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘autoTS’ version ‘0.9.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/autoTS/old/autoTS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoTS/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘autoTS’ version ‘0.9.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# bayesian

<details>

* Version: 0.0.9
* GitHub: https://github.com/hsbadr/bayesian
* Source code: https://github.com/cran/bayesian
* Date/Publication: 2022-06-16 23:00:02 UTC
* Number of recursive dependencies: 187

Run `revdepcheck::cloud_details(, "bayesian")` for more info

</details>

## In both

*   checking whether package ‘bayesian’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bayesian/new/bayesian.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rstan’
    ```

## Installation

### Devel

```
* installing *source* package ‘bayesian’ ...
** package ‘bayesian’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesian’
* removing ‘/tmp/workdir/bayesian/new/bayesian.Rcheck/bayesian’


```
### CRAN

```
* installing *source* package ‘bayesian’ ...
** package ‘bayesian’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesian’
* removing ‘/tmp/workdir/bayesian/old/bayesian.Rcheck/bayesian’


```
# bayesnec

<details>

* Version: 2.1.0.2
* GitHub: https://github.com/open-aims/bayesnec
* Source code: https://github.com/cran/bayesnec
* Date/Publication: 2023-02-21 00:30:03 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "bayesnec")` for more info

</details>

## In both

*   checking whether package ‘bayesnec’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bayesnec/new/bayesnec.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rstan’
    ```

## Installation

### Devel

```
* installing *source* package ‘bayesnec’ ...
** package ‘bayesnec’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘brms’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
...
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesnec’
* removing ‘/tmp/workdir/bayesnec/new/bayesnec.Rcheck/bayesnec’


```
### CRAN

```
* installing *source* package ‘bayesnec’ ...
** package ‘bayesnec’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘brms’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
...
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesnec’
* removing ‘/tmp/workdir/bayesnec/old/bayesnec.Rcheck/bayesnec’


```
# bayesplot

<details>

* Version: 1.10.0
* GitHub: https://github.com/stan-dev/bayesplot
* Source code: https://github.com/cran/bayesplot
* Date/Publication: 2022-11-16 22:00:08 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "bayesplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bayesplot/new/bayesplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bayesplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bayesplot’ version ‘1.10.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘graphical-ppcs.Rmd’ using ‘UTF-8’... OK
  ‘plotting-mcmc-draws.Rmd’ using ‘UTF-8’... OK
  ‘visual-mcmc-diagnostics.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/bayesplot/old/bayesplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bayesplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bayesplot’ version ‘1.10.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘graphical-ppcs.Rmd’ using ‘UTF-8’... OK
  ‘plotting-mcmc-draws.Rmd’ using ‘UTF-8’... OK
  ‘visual-mcmc-diagnostics.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# BayesPostEst

<details>

* Version: 0.3.2
* GitHub: https://github.com/ShanaScogin/BayesPostEst
* Source code: https://github.com/cran/BayesPostEst
* Date/Publication: 2021-11-11 08:10:05 UTC
* Number of recursive dependencies: 159

Run `revdepcheck::cloud_details(, "BayesPostEst")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/BayesPostEst/new/BayesPostEst.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BayesPostEst/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘BayesPostEst’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/BayesPostEst/old/BayesPostEst.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BayesPostEst/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘BayesPostEst’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# bayesrules

<details>

* Version: 0.0.2
* GitHub: https://github.com/bayes-rules/bayesrules
* Source code: https://github.com/cran/bayesrules
* Date/Publication: 2021-09-25 04:30:07 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "bayesrules")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bayesrules/new/bayesrules.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bayesrules/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bayesrules’ version ‘0.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/bayesrules/old/bayesrules.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bayesrules/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bayesrules’ version ‘0.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# beadplexr

<details>

* Version: 0.4.1
* GitHub: NA
* Source code: https://github.com/cran/beadplexr
* Date/Publication: 2022-03-05 13:50:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "beadplexr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/beadplexr/new/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/beadplexr/old/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# blocs

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/blocs
* Date/Publication: 2022-11-23 11:20:06 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "blocs")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/blocs/new/blocs.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘blocs/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘blocs’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘mgcv’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/blocs/old/blocs.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘blocs/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘blocs’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘mgcv’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# breathtestcore

<details>

* Version: 0.8.6
* GitHub: https://github.com/dmenne/breathtestcore
* Source code: https://github.com/cran/breathtestcore
* Date/Publication: 2023-02-13 14:00:07 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "breathtestcore")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/breathtestcore/new/breathtestcore.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘breathtestcore/DESCRIPTION’ ... OK
* this is package ‘breathtestcore’ version ‘0.8.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘data_formats.Rmd’ using ‘UTF-8’... OK
  ‘methods_and_concepts.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/breathtestcore/old/breathtestcore.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘breathtestcore/DESCRIPTION’ ... OK
* this is package ‘breathtestcore’ version ‘0.8.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘data_formats.Rmd’ using ‘UTF-8’... OK
  ‘methods_and_concepts.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# broom.helpers

<details>

* Version: 1.12.0
* GitHub: https://github.com/larmarange/broom.helpers
* Source code: https://github.com/cran/broom.helpers
* Date/Publication: 2023-02-09 17:00:02 UTC
* Number of recursive dependencies: 226

Run `revdepcheck::cloud_details(, "broom.helpers")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/broom.helpers/new/broom.helpers.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.helpers/DESCRIPTION’ ... OK
* this is package ‘broom.helpers’ version ‘1.12.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 29 | WARN 0 | SKIP 89 | PASS 381 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/broom.helpers/old/broom.helpers.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.helpers/DESCRIPTION’ ... OK
* this is package ‘broom.helpers’ version ‘1.12.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# broom.mixed

<details>

* Version: 0.2.9.4
* GitHub: https://github.com/bbolker/broom.mixed
* Source code: https://github.com/cran/broom.mixed
* Date/Publication: 2022-04-17 17:42:29 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "broom.mixed")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/broom.mixed/new/broom.mixed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.mixed/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘broom.mixed’ version ‘0.2.9.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘broom_mixed_intro.rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/broom.mixed/old/broom.mixed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.mixed/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘broom.mixed’ version ‘0.2.9.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘broom_mixed_intro.rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# cinaR

<details>

* Version: 0.2.3
* GitHub: https://github.com/eonurk/cinaR
* Source code: https://github.com/cran/cinaR
* Date/Publication: 2022-05-18 14:00:09 UTC
* Number of recursive dependencies: 178

Run `revdepcheck::cloud_details(, "cinaR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/cinaR/new/cinaR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cinaR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cinaR’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChIPseeker’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/cinaR/old/cinaR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cinaR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cinaR’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChIPseeker’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# CRE

<details>

* Version: 0.2.0
* GitHub: https://github.com/NSAPH-Software/CRE
* Source code: https://github.com/cran/CRE
* Date/Publication: 2023-01-19 20:20:02 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "CRE")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/CRE/new/CRE.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CRE/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘CRE’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘CRE.Rmd’ using ‘UTF-8’... OK
  ‘Contribution.Rmd’ using ‘UTF-8’... OK
  ‘Testing-the-Package.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/CRE/old/CRE.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CRE/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘CRE’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘CRE.Rmd’ using ‘UTF-8’... OK
  ‘Contribution.Rmd’ using ‘UTF-8’... OK
  ‘Testing-the-Package.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# eflm

<details>

* Version: 0.3.0
* GitHub: https://github.com/pachadotdev/eflm
* Source code: https://github.com/cran/eflm
* Date/Publication: 2021-05-31 21:20:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "eflm")` for more info

</details>

## Newly broken

*   checking whether package ‘eflm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/eflm/new/eflm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘eflm’
Execution halted
ERROR: lazy loading failed for package ‘eflm’
* removing ‘/tmp/workdir/eflm/new/eflm.Rcheck/eflm’


```
### CRAN

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (eflm)


```
# embed

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/embed
* Source code: https://github.com/cran/embed
* Date/Publication: 2022-07-02 16:50:02 UTC
* Number of recursive dependencies: 183

Run `revdepcheck::cloud_details(, "embed")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/embed/new/embed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘embed/DESCRIPTION’ ... OK
* this is package ‘embed’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  i In index: 1.
  i With name: x3.
  Caused by error in `.f()`:
  ! The package `rstanarm` is required.
  
  [ FAIL 1 | WARN 2 | SKIP 56 | PASS 162 ]
  Error: Test failures
  Execution halted
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/embed/old/embed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘embed/DESCRIPTION’ ... OK
* this is package ‘embed’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  i In index: 1.
  i With name: x3.
  Caused by error in `.f()`:
  ! The package `rstanarm` is required.
  
  [ FAIL 1 | WARN 2 | SKIP 56 | PASS 162 ]
  Error: Test failures
  Execution halted
* DONE
Status: 1 ERROR, 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# escalation

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/escalation
* Date/Publication: 2020-10-18 21:40:06 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "escalation")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/escalation/new/escalation.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘escalation/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘escalation’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘trialr’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/escalation/old/escalation.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘escalation/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘escalation’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘trialr’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# ESTER

<details>

* Version: 0.2.0
* GitHub: https://github.com/lnalborczyk/ESTER
* Source code: https://github.com/cran/ESTER
* Date/Publication: 2017-12-10 14:21:14 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "ESTER")` for more info

</details>

## In both

*   checking whether package ‘ESTER’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ESTER/new/ESTER.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ESTER’ ...
** package ‘ESTER’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ESTER’
* removing ‘/tmp/workdir/ESTER/new/ESTER.Rcheck/ESTER’


```
### CRAN

```
* installing *source* package ‘ESTER’ ...
** package ‘ESTER’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ESTER’
* removing ‘/tmp/workdir/ESTER/old/ESTER.Rcheck/ESTER’


```
# fable.prophet

<details>

* Version: 0.1.0
* GitHub: https://github.com/mitchelloharawild/fable.prophet
* Source code: https://github.com/cran/fable.prophet
* Date/Publication: 2020-08-20 09:30:03 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "fable.prophet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/fable.prophet/new/fable.prophet.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fable.prophet/DESCRIPTION’ ... OK
* this is package ‘fable.prophet’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/fable.prophet/old/fable.prophet.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fable.prophet/DESCRIPTION’ ... OK
* this is package ‘fable.prophet’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# FAMetA

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/FAMetA
* Date/Publication: 2023-01-11 09:33:11 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "FAMetA")` for more info

</details>

## In both

*   checking whether package ‘FAMetA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/FAMetA’


```
### CRAN

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/old/FAMetA.Rcheck/FAMetA’


```
# finnts

<details>

* Version: 0.2.2
* GitHub: https://github.com/microsoft/finnts
* Source code: https://github.com/cran/finnts
* Date/Publication: 2023-02-12 00:40:02 UTC
* Number of recursive dependencies: 210

Run `revdepcheck::cloud_details(, "finnts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/finnts/new/finnts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘finnts/DESCRIPTION’ ... OK
* this is package ‘finnts’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
  ‘best-model-selection.Rmd’ using ‘UTF-8’... OK
  ‘external-regressors.Rmd’ using ‘UTF-8’... OK
  ‘feature-engineering.Rmd’ using ‘UTF-8’... OK
  ‘finnts.Rmd’ using ‘UTF-8’... OK
  ‘hierarchical-forecasting.Rmd’ using ‘UTF-8’... OK
  ‘models-used-in-finnts.Rmd’ using ‘UTF-8’... OK
  ‘parallel-processing.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/finnts/old/finnts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘finnts/DESCRIPTION’ ... OK
* this is package ‘finnts’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
  ‘best-model-selection.Rmd’ using ‘UTF-8’... OK
  ‘external-regressors.Rmd’ using ‘UTF-8’... OK
  ‘feature-engineering.Rmd’ using ‘UTF-8’... OK
  ‘finnts.Rmd’ using ‘UTF-8’... OK
  ‘hierarchical-forecasting.Rmd’ using ‘UTF-8’... OK
  ‘models-used-in-finnts.Rmd’ using ‘UTF-8’... OK
  ‘parallel-processing.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# genekitr

<details>

* Version: 1.1.3
* GitHub: https://github.com/GangLiLab/genekitr
* Source code: https://github.com/cran/genekitr
* Date/Publication: 2023-03-01 09:00:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "genekitr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/genekitr/new/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/genekitr/old/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# geocmeans

<details>

* Version: 0.3.3
* GitHub: https://github.com/JeremyGelb/geocmeans
* Source code: https://github.com/cran/geocmeans
* Date/Publication: 2023-02-07 01:02:31 UTC
* Number of recursive dependencies: 197

Run `revdepcheck::cloud_details(, "geocmeans")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/geocmeans/new/geocmeans.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘geocmeans/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘geocmeans’ version ‘0.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘rasters.Rmd’

SUMMARY: processing the following file failed:
  ‘introduction.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 2 ERRORs, 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/geocmeans/old/geocmeans.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘geocmeans/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘geocmeans’ version ‘0.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘rasters.Rmd’

SUMMARY: processing the following file failed:
  ‘introduction.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 2 ERRORs, 1 WARNING, 1 NOTE





```
# ggPMX

<details>

* Version: 1.2.8
* GitHub: https://github.com/ggPMXdevelopment/ggPMX
* Source code: https://github.com/cran/ggPMX
* Date/Publication: 2022-06-17 23:10:02 UTC
* Number of recursive dependencies: 177

Run `revdepcheck::cloud_details(, "ggPMX")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggPMX/new/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggPMX/old/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
# ggstatsplot

<details>

* Version: 0.11.0
* GitHub: https://github.com/IndrajeetPatil/ggstatsplot
* Source code: https://github.com/cran/ggstatsplot
* Date/Publication: 2023-02-15 15:30:02 UTC
* Number of recursive dependencies: 169

Run `revdepcheck::cloud_details(, "ggstatsplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggstatsplot/new/ggstatsplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggstatsplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggstatsplot’ version ‘0.11.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘additional.Rmd’ using ‘UTF-8’... OK
  ‘ggstatsplot.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggstatsplot/old/ggstatsplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggstatsplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggstatsplot’ version ‘0.11.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘additional.Rmd’ using ‘UTF-8’... OK
  ‘ggstatsplot.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# healthyR.ai

<details>

* Version: 0.0.12
* GitHub: https://github.com/spsanderson/healthyR.ai
* Source code: https://github.com/cran/healthyR.ai
* Date/Publication: 2023-02-01 18:40:06 UTC
* Number of recursive dependencies: 189

Run `revdepcheck::cloud_details(, "healthyR.ai")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/healthyR.ai/new/healthyR.ai.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ai/DESCRIPTION’ ... OK
* this is package ‘healthyR.ai’ version ‘0.0.12’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘auto-kmeans.Rmd’ using ‘UTF-8’... OK
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘kmeans-umap.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/healthyR.ai/old/healthyR.ai.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ai/DESCRIPTION’ ... OK
* this is package ‘healthyR.ai’ version ‘0.0.12’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘auto-kmeans.Rmd’ using ‘UTF-8’... OK
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘kmeans-umap.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# healthyR.ts

<details>

* Version: 0.2.7
* GitHub: https://github.com/spsanderson/healthyR.ts
* Source code: https://github.com/cran/healthyR.ts
* Date/Publication: 2023-01-28 14:50:02 UTC
* Number of recursive dependencies: 191

Run `revdepcheck::cloud_details(, "healthyR.ts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/healthyR.ts/new/healthyR.ts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ts/DESCRIPTION’ ... OK
* this is package ‘healthyR.ts’ version ‘0.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
Calls: %>% -> ts_event_analysis_plot
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘using-tidy-fft.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/healthyR.ts/old/healthyR.ts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ts/DESCRIPTION’ ... OK
* this is package ‘healthyR.ts’ version ‘0.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘using-tidy-fft.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# healthyverse

<details>

* Version: 1.0.3
* GitHub: https://github.com/spsanderson/healthyverse
* Source code: https://github.com/cran/healthyverse
* Date/Publication: 2023-02-21 20:40:02 UTC
* Number of recursive dependencies: 207

Run `revdepcheck::cloud_details(, "healthyverse")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/healthyverse/new/healthyverse.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyverse/DESCRIPTION’ ... OK
* this is package ‘healthyverse’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/healthyverse/old/healthyverse.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyverse/DESCRIPTION’ ... OK
* this is package ‘healthyverse’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# historicalborrowlong

<details>

* Version: 0.0.5
* GitHub: https://github.com/wlandau/historicalborrowlong
* Source code: https://github.com/cran/historicalborrowlong
* Date/Publication: 2022-09-13 10:20:06 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "historicalborrowlong")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/historicalborrowlong/new/historicalborrowlong.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘historicalborrowlong/DESCRIPTION’ ... OK
* this is package ‘historicalborrowlong’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'trialr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/historicalborrowlong/old/historicalborrowlong.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘historicalborrowlong/DESCRIPTION’ ... OK
* this is package ‘historicalborrowlong’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'trialr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# immcp

<details>

* Version: 1.0.3
* GitHub: https://github.com/YuanlongHu/immcp
* Source code: https://github.com/cran/immcp
* Date/Publication: 2022-05-12 05:50:02 UTC
* Number of recursive dependencies: 194

Run `revdepcheck::cloud_details(, "immcp")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/immcp/new/immcp.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/immcp/old/immcp.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# incidence2

<details>

* Version: 1.2.3
* GitHub: https://github.com/reconverse/incidence2
* Source code: https://github.com/cran/incidence2
* Date/Publication: 2021-11-07 22:00:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "incidence2")` for more info

</details>

## Newly broken

*   checking whether package ‘incidence2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘incidence2’
Execution halted
ERROR: lazy loading failed for package ‘incidence2’
* removing ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/incidence2’


```
### CRAN

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (incidence2)


```
# INSPECTumours

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/INSPECTumours
* Date/Publication: 2022-05-06 12:10:02 UTC
* Number of recursive dependencies: 175

Run `revdepcheck::cloud_details(, "INSPECTumours")` for more info

</details>

## In both

*   checking whether package ‘INSPECTumours’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/INSPECTumours/new/INSPECTumours.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘INSPECTumours’ ...
** package ‘INSPECTumours’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘INSPECTumours’
* removing ‘/tmp/workdir/INSPECTumours/new/INSPECTumours.Rcheck/INSPECTumours’


```
### CRAN

```
* installing *source* package ‘INSPECTumours’ ...
** package ‘INSPECTumours’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘INSPECTumours’
* removing ‘/tmp/workdir/INSPECTumours/old/INSPECTumours.Rcheck/INSPECTumours’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# IRexamples

<details>

* Version: 0.0.2
* GitHub: https://github.com/vinhdizzo/IRexamples
* Source code: https://github.com/cran/IRexamples
* Date/Publication: 2022-08-15 07:10:19 UTC
* Number of recursive dependencies: 184

Run `revdepcheck::cloud_details(, "IRexamples")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/IRexamples/new/IRexamples.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘IRexamples/DESCRIPTION’ ... OK
* this is package ‘IRexamples’ version ‘0.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/IRexamples/old/IRexamples.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘IRexamples/DESCRIPTION’ ... OK
* this is package ‘IRexamples’ version ‘0.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# loon.tourr

<details>

* Version: 0.1.3
* GitHub: https://github.com/z267xu/loon.tourr
* Source code: https://github.com/cran/loon.tourr
* Date/Publication: 2021-10-27 14:10:05 UTC
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "loon.tourr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.tourr/new/loon.tourr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.tourr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.tourr’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'loon', 'loon.ggplot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/loon.tourr/old/loon.tourr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.tourr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.tourr’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'loon', 'loon.ggplot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# MACP

<details>

* Version: 0.1.0
* GitHub: https://github.com/mrbakhsh/MACP
* Source code: https://github.com/cran/MACP
* Date/Publication: 2023-02-28 17:32:30 UTC
* Number of recursive dependencies: 235

Run `revdepcheck::cloud_details(, "MACP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/MACP/new/MACP.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MACP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MACP’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘MACP_tutorial.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/MACP/old/MACP.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MACP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MACP’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘MACP_tutorial.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# MarketMatching

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/MarketMatching
* Date/Publication: 2021-01-08 20:10:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "MarketMatching")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/MarketMatching/new/MarketMatching.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MarketMatching/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MarketMatching’ version ‘1.2.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'CausalImpact', 'bsts', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/MarketMatching/old/MarketMatching.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MarketMatching/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MarketMatching’ version ‘1.2.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'CausalImpact', 'bsts', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# merTools

<details>

* Version: 0.5.2
* GitHub: NA
* Source code: https://github.com/cran/merTools
* Date/Publication: 2020-06-23 10:30:12 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "merTools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/merTools/new/merTools.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘merTools/DESCRIPTION’ ... OK
* this is package ‘merTools’ version ‘0.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Using_predictInterval.Rmd’ using ‘UTF-8’... OK
  ‘imputation.Rmd’ using ‘UTF-8’... OK
  ‘marginal_effects.Rmd’ using ‘UTF-8’... OK
  ‘merToolsIntro.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/merTools/old/merTools.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘merTools/DESCRIPTION’ ... OK
* this is package ‘merTools’ version ‘0.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Using_predictInterval.Rmd’ using ‘UTF-8’... OK
  ‘imputation.Rmd’ using ‘UTF-8’... OK
  ‘marginal_effects.Rmd’ using ‘UTF-8’... OK
  ‘merToolsIntro.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# modeltime

<details>

* Version: 1.2.5
* GitHub: https://github.com/business-science/modeltime
* Source code: https://github.com/cran/modeltime
* Date/Publication: 2023-02-07 19:32:30 UTC
* Number of recursive dependencies: 253

Run `revdepcheck::cloud_details(, "modeltime")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime/new/modeltime.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime/DESCRIPTION’ ... OK
* this is package ‘modeltime’ version ‘1.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime/old/modeltime.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime/DESCRIPTION’ ... OK
* this is package ‘modeltime’ version ‘1.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# modeltime.ensemble

<details>

* Version: 1.0.2
* GitHub: https://github.com/business-science/modeltime.ensemble
* Source code: https://github.com/cran/modeltime.ensemble
* Date/Publication: 2022-10-18 23:02:40 UTC
* Number of recursive dependencies: 223

Run `revdepcheck::cloud_details(, "modeltime.ensemble")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.ensemble/new/modeltime.ensemble.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.ensemble/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.ensemble’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘recursive-ensembles.Rmd’

SUMMARY: processing the following file failed:
  ‘getting-started-with-modeltime-ensemble.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.ensemble/old/modeltime.ensemble.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.ensemble/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.ensemble’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘recursive-ensembles.Rmd’

SUMMARY: processing the following file failed:
  ‘getting-started-with-modeltime-ensemble.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
# modeltime.gluonts

<details>

* Version: 0.1.0
* GitHub: https://github.com/business-science/modeltime.gluonts
* Source code: https://github.com/cran/modeltime.gluonts
* Date/Publication: 2020-11-30 09:40:02 UTC
* Number of recursive dependencies: 214

Run `revdepcheck::cloud_details(, "modeltime.gluonts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.gluonts/new/modeltime.gluonts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.gluonts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.gluonts’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.gluonts/old/modeltime.gluonts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.gluonts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.gluonts’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# modeltime.h2o

<details>

* Version: 0.1.1
* GitHub: https://github.com/business-science/modeltime.h2o
* Source code: https://github.com/cran/modeltime.h2o
* Date/Publication: 2021-04-05 14:40:03 UTC
* Number of recursive dependencies: 214

Run `revdepcheck::cloud_details(, "modeltime.h2o")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.h2o/new/modeltime.h2o.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.h2o/DESCRIPTION’ ... OK
* this is package ‘modeltime.h2o’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.h2o/old/modeltime.h2o.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.h2o/DESCRIPTION’ ... OK
* this is package ‘modeltime.h2o’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
# modeltime.resample

<details>

* Version: 0.2.2
* GitHub: https://github.com/business-science/modeltime.resample
* Source code: https://github.com/cran/modeltime.resample
* Date/Publication: 2022-10-18 03:00:06 UTC
* Number of recursive dependencies: 221

Run `revdepcheck::cloud_details(, "modeltime.resample")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.resample/new/modeltime.resample.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.resample/DESCRIPTION’ ... OK
* this is package ‘modeltime.resample’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
--- failed re-building ‘panel-data.Rmd’

SUMMARY: processing the following file failed:
  ‘panel-data.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.resample/old/modeltime.resample.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.resample/DESCRIPTION’ ... OK
* this is package ‘modeltime.resample’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
--- failed re-building ‘panel-data.Rmd’

SUMMARY: processing the following file failed:
  ‘panel-data.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# mpower

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/mpower
* Date/Publication: 2022-09-21 08:50:05 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "mpower")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/mpower/new/mpower.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mpower/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘mpower’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/mpower/old/mpower.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mpower/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘mpower’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# multibiasmeta

<details>

* Version: 0.1.0
* GitHub: https://github.com/mathurlabstanford/multibiasmeta
* Source code: https://github.com/cran/multibiasmeta
* Date/Publication: 2023-02-08 09:40:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "multibiasmeta")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/multibiasmeta/new/multibiasmeta.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘multibiasmeta/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘multibiasmeta’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- failed re-building ‘tutorial.Rmd’

SUMMARY: processing the following file failed:
  ‘tutorial.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/multibiasmeta/old/multibiasmeta.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘multibiasmeta/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘multibiasmeta’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- failed re-building ‘tutorial.Rmd’

SUMMARY: processing the following file failed:
  ‘tutorial.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 WARNING, 1 NOTE





```
# nlmixr2rpt

<details>

* Version: 0.1.0
* GitHub: https://github.com/nlmixr2/nlmixr2rpt
* Source code: https://github.com/cran/nlmixr2rpt
* Date/Publication: 2022-12-05 10:40:02 UTC
* Number of recursive dependencies: 221

Run `revdepcheck::cloud_details(, "nlmixr2rpt")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/nlmixr2rpt/new/nlmixr2rpt.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘nlmixr2rpt/DESCRIPTION’ ... OK
* this is package ‘nlmixr2rpt’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'nlmixr2extra', 'xpose.nlmixr2'

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/nlmixr2rpt/old/nlmixr2rpt.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘nlmixr2rpt/DESCRIPTION’ ... OK
* this is package ‘nlmixr2rpt’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'nlmixr2extra', 'xpose.nlmixr2'

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# numbat

<details>

* Version: 1.2.2
* GitHub: https://github.com/kharchenkolab/numbat
* Source code: https://github.com/cran/numbat
* Date/Publication: 2023-02-14 18:20:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "numbat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/numbat/new/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/numbat/old/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# OlinkAnalyze

<details>

* Version: 3.3.1
* GitHub: NA
* Source code: https://github.com/cran/OlinkAnalyze
* Date/Publication: 2023-02-27 20:22:30 UTC
* Number of recursive dependencies: 202

Run `revdepcheck::cloud_details(, "OlinkAnalyze")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/new/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/old/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# OncoBayes2

<details>

* Version: 0.8-8
* GitHub: NA
* Source code: https://github.com/cran/OncoBayes2
* Date/Publication: 2023-03-03 22:50:15 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "OncoBayes2")` for more info

</details>

## In both

*   checking whether package ‘OncoBayes2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/OncoBayes2/new/OncoBayes2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OncoBayes2’ ...
** package ‘OncoBayes2’ successfully unpacked and MD5 sums checked
** using staged installation
Info: Found int division at 'string', line 82, column 14 to column 21:
  current / base
Values will be rounded towards zero. If rounding is not desired you can write
the division as
  current * 1.0 / base
If rounding is intended please use the integer division operator %/%.
Info: Found int division at 'string', line 175, column 14 to column 36:
...
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:23:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.1.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_blrm_exnex_namespace::model_blrm_exnex; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.1.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stanExports_blrm_exnex.o] Error 1
ERROR: compilation failed for package ‘OncoBayes2’
* removing ‘/tmp/workdir/OncoBayes2/new/OncoBayes2.Rcheck/OncoBayes2’


```
### CRAN

```
* installing *source* package ‘OncoBayes2’ ...
** package ‘OncoBayes2’ successfully unpacked and MD5 sums checked
** using staged installation
Info: Found int division at 'string', line 82, column 14 to column 21:
  current / base
Values will be rounded towards zero. If rounding is not desired you can write
the division as
  current * 1.0 / base
If rounding is intended please use the integer division operator %/%.
Info: Found int division at 'string', line 175, column 14 to column 36:
...
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:23:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.1.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_blrm_exnex_namespace::model_blrm_exnex; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.1.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stanExports_blrm_exnex.o] Error 1
ERROR: compilation failed for package ‘OncoBayes2’
* removing ‘/tmp/workdir/OncoBayes2/old/OncoBayes2.Rcheck/OncoBayes2’


```
# ordbetareg

<details>

* Version: 0.7.0
* GitHub: https://github.com/saudiwin/ordbetareg_pack
* Source code: https://github.com/cran/ordbetareg
* Date/Publication: 2023-02-12 11:30:02 UTC
* Number of recursive dependencies: 201

Run `revdepcheck::cloud_details(, "ordbetareg")` for more info

</details>

## In both

*   checking whether package ‘ordbetareg’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ordbetareg/new/ordbetareg.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ordbetareg’ ...
** package ‘ordbetareg’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘fit_imputed’
Warning: namespace ‘ordbetareg’ is not available and has been replaced
by .GlobalEnv when processing object ‘fit_imputed’
...
by .GlobalEnv when processing object ‘ord_fit_phi’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_phi’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘ordbetareg’
* removing ‘/tmp/workdir/ordbetareg/new/ordbetareg.Rcheck/ordbetareg’


```
### CRAN

```
* installing *source* package ‘ordbetareg’ ...
** package ‘ordbetareg’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘fit_imputed’
Warning: namespace ‘ordbetareg’ is not available and has been replaced
by .GlobalEnv when processing object ‘fit_imputed’
...
by .GlobalEnv when processing object ‘ord_fit_phi’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_phi’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘ordbetareg’
* removing ‘/tmp/workdir/ordbetareg/old/ordbetareg.Rcheck/ordbetareg’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Platypus

<details>

* Version: 3.4.1
* GitHub: NA
* Source code: https://github.com/cran/Platypus
* Date/Publication: 2022-08-15 07:20:20 UTC
* Number of recursive dependencies: 356

Run `revdepcheck::cloud_details(, "Platypus")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Platypus/new/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Platypus/old/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# promotionImpact

<details>

* Version: 0.1.5
* GitHub: https://github.com/ncsoft/promotionImpact
* Source code: https://github.com/cran/promotionImpact
* Date/Publication: 2021-04-13 15:00:05 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "promotionImpact")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/promotionImpact/new/promotionImpact.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘promotionImpact/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘promotionImpact’ version ‘0.1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/promotionImpact/old/promotionImpact.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘promotionImpact/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘promotionImpact’ version ‘0.1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# PsychWordVec

<details>

* Version: 0.3.1
* GitHub: https://github.com/psychbruce/PsychWordVec
* Source code: https://github.com/cran/PsychWordVec
* Date/Publication: 2023-03-03 20:20:11 UTC
* Number of recursive dependencies: 231

Run `revdepcheck::cloud_details(, "PsychWordVec")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/PsychWordVec/new/PsychWordVec.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘PsychWordVec/DESCRIPTION’ ... OK
* this is package ‘PsychWordVec’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘bruceR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/PsychWordVec/old/PsychWordVec.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘PsychWordVec/DESCRIPTION’ ... OK
* this is package ‘PsychWordVec’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘bruceR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# RBesT

<details>

* Version: 1.6-6
* GitHub: https://github.com/Novartis/RBesT
* Source code: https://github.com/cran/RBesT
* Date/Publication: 2023-03-03 18:20:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "RBesT")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RBesT/new/RBesT.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RBesT/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘RBesT’ version ‘1.6-6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstan’

Package suggested but not available for checking: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RBesT/old/RBesT.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RBesT/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘RBesT’ version ‘1.6-6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstan’

Package suggested but not available for checking: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# rdss

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/rdss
* Date/Publication: 2023-01-17 17:40:02 UTC
* Number of recursive dependencies: 207

Run `revdepcheck::cloud_details(, "rdss")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/rdss/new/rdss.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rdss/DESCRIPTION’ ... OK
* this is package ‘rdss’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/rdss/old/rdss.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rdss/DESCRIPTION’ ... OK
* this is package ‘rdss’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Robyn

<details>

* Version: 3.9.0
* GitHub: https://github.com/facebookexperimental/Robyn
* Source code: https://github.com/cran/Robyn
* Date/Publication: 2023-02-08 08:12:37 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "Robyn")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Robyn/new/Robyn.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Robyn/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Robyn’ version ‘3.9.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Robyn/old/Robyn.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Robyn/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Robyn’ version ‘3.9.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# RVA

<details>

* Version: 0.0.5
* GitHub: https://github.com/THERMOSTATS/RVA
* Source code: https://github.com/cran/RVA
* Date/Publication: 2021-11-01 21:40:02 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "RVA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RVA/new/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RVA/old/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SAMtool

<details>

* Version: 1.5.1
* GitHub: https://github.com/Blue-Matter/SAMtool
* Source code: https://github.com/cran/SAMtool
* Date/Publication: 2023-02-08 23:20:02 UTC
* Number of recursive dependencies: 183

Run `revdepcheck::cloud_details(, "SAMtool")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SAMtool/new/SAMtool.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SAMtool/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SAMtool’ version ‘1.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/SAMtool/old/SAMtool.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SAMtool/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SAMtool’ version ‘1.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# sjPlot

<details>

* Version: 2.8.12
* GitHub: https://github.com/strengejacke/sjPlot
* Source code: https://github.com/cran/sjPlot
* Date/Publication: 2022-11-19 22:20:02 UTC
* Number of recursive dependencies: 186

Run `revdepcheck::cloud_details(, "sjPlot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sjPlot/new/sjPlot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sjPlot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sjPlot’ version ‘2.8.12’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘plot_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘sjtitemanalysis.Rmd’ using ‘UTF-8’... OK
  ‘tab_bayes.Rmd’ using ‘UTF-8’... OK
  ‘tab_mixed.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_robust.Rmd’ using ‘UTF-8’... OK
  ‘table_css.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/sjPlot/old/sjPlot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sjPlot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sjPlot’ version ‘2.8.12’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘plot_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘sjtitemanalysis.Rmd’ using ‘UTF-8’... OK
  ‘tab_bayes.Rmd’ using ‘UTF-8’... OK
  ‘tab_mixed.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_robust.Rmd’ using ‘UTF-8’... OK
  ‘table_css.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# sknifedatar

<details>

* Version: 0.1.2
* GitHub: https://github.com/rafzamb/sknifedatar
* Source code: https://github.com/cran/sknifedatar
* Date/Publication: 2021-06-01 08:00:02 UTC
* Number of recursive dependencies: 180

Run `revdepcheck::cloud_details(, "sknifedatar")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sknifedatar/new/sknifedatar.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sknifedatar/DESCRIPTION’ ... OK
* this is package ‘sknifedatar’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/sknifedatar/old/sknifedatar.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sknifedatar/DESCRIPTION’ ... OK
* this is package ‘sknifedatar’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
* DONE
Status: OK





```
# statsExpressions

<details>

* Version: 1.5.0
* GitHub: https://github.com/IndrajeetPatil/statsExpressions
* Source code: https://github.com/cran/statsExpressions
* Date/Publication: 2023-02-19 14:30:02 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "statsExpressions")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/statsExpressions/new/statsExpressions.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘statsExpressions/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘statsExpressions’ version ‘1.5.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘statsExpressions.Rmd’ using ‘UTF-8’... OK
  ‘stats_details.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/statsExpressions/old/statsExpressions.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘statsExpressions/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘statsExpressions’ version ‘1.5.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘statsExpressions.Rmd’ using ‘UTF-8’... OK
  ‘stats_details.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tidybayes

<details>

* Version: 3.0.3
* GitHub: https://github.com/mjskay/tidybayes
* Source code: https://github.com/cran/tidybayes
* Date/Publication: 2023-02-04 09:10:02 UTC
* Number of recursive dependencies: 200

Run `revdepcheck::cloud_details(, "tidybayes")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidybayes/new/tidybayes.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybayes/DESCRIPTION’ ... OK
* this is package ‘tidybayes’ version ‘3.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy-brms.Rmd’ using ‘UTF-8’... OK
  ‘tidy-posterior.Rmd’ using ‘UTF-8’... OK
  ‘tidy-rstanarm.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes-residuals.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidybayes/old/tidybayes.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybayes/DESCRIPTION’ ... OK
* this is package ‘tidybayes’ version ‘3.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy-brms.Rmd’ using ‘UTF-8’... OK
  ‘tidy-posterior.Rmd’ using ‘UTF-8’... OK
  ‘tidy-rstanarm.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes-residuals.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# tidyposterior

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/tidyposterior
* Source code: https://github.com/cran/tidyposterior
* Date/Publication: 2022-06-23 20:20:02 UTC
* Number of recursive dependencies: 170

Run `revdepcheck::cloud_details(, "tidyposterior")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidyposterior/new/tidyposterior.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyposterior/DESCRIPTION’ ... OK
* this is package ‘tidyposterior’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidyposterior/old/tidyposterior.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyposterior/DESCRIPTION’ ... OK
* this is package ‘tidyposterior’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# timetk

<details>

* Version: 2.8.2
* GitHub: https://github.com/business-science/timetk
* Source code: https://github.com/cran/timetk
* Date/Publication: 2022-11-17 19:30:02 UTC
* Number of recursive dependencies: 226

Run `revdepcheck::cloud_details(, "timetk")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/timetk/new/timetk.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘timetk/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘timetk’ version ‘2.8.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error in library(robets) : there is no package called 'robets'
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘TK04_Plotting_Time_Series.Rmd’ using ‘UTF-8’... OK
  ‘TK07_Time_Series_Data_Wrangling.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/timetk/old/timetk.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘timetk/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘timetk’ version ‘2.8.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error in library(robets) : there is no package called 'robets'
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘TK04_Plotting_Time_Series.Rmd’ using ‘UTF-8’... OK
  ‘TK07_Time_Series_Data_Wrangling.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
# tinyarray

<details>

* Version: 2.2.7
* GitHub: https://github.com/xjsun1221/tinyarray
* Source code: https://github.com/cran/tinyarray
* Date/Publication: 2021-11-08 10:00:02 UTC
* Number of recursive dependencies: 228

Run `revdepcheck::cloud_details(, "tinyarray")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tinyarray/new/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tinyarray/old/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tipmap

<details>

* Version: 0.3.9
* GitHub: NA
* Source code: https://github.com/cran/tipmap
* Date/Publication: 2022-12-07 21:50:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "tipmap")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tipmap/new/tipmap.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tipmap/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tipmap’ version ‘0.3.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘RBesT’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tipmap/old/tipmap.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tipmap/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tipmap’ version ‘0.3.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘RBesT’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# vivid

<details>

* Version: 0.2.5
* GitHub: NA
* Source code: https://github.com/cran/vivid
* Date/Publication: 2023-02-13 16:40:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "vivid")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/vivid/new/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/vivid/old/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# wearables

<details>

* Version: 0.8.1
* GitHub: NA
* Source code: https://github.com/cran/wearables
* Date/Publication: 2021-12-20 15:20:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "wearables")` for more info

</details>

## In both

*   checking whether package ‘wearables’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/wearables/new/wearables.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘wearables’ ...
** package ‘wearables’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘wearables’
* removing ‘/tmp/workdir/wearables/new/wearables.Rcheck/wearables’


```
### CRAN

```
* installing *source* package ‘wearables’ ...
** package ‘wearables’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘wearables’
* removing ‘/tmp/workdir/wearables/old/wearables.Rcheck/wearables’


```
# webSDM

<details>

* Version: 1.1-1
* GitHub: https://github.com/giopogg/webSDM
* Source code: https://github.com/cran/webSDM
* Date/Publication: 2022-11-25 12:40:02 UTC
* Number of recursive dependencies: 190

Run `revdepcheck::cloud_details(, "webSDM")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/webSDM/new/webSDM.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘webSDM/DESCRIPTION’ ... OK
* this is package ‘webSDM’ version ‘1.1-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/webSDM/old/webSDM.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘webSDM/DESCRIPTION’ ... OK
* this is package ‘webSDM’ version ‘1.1-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# xpose.nlmixr2

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/xpose.nlmixr2
* Date/Publication: 2022-06-08 09:10:02 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "xpose.nlmixr2")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/new/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/old/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
