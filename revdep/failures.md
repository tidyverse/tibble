# CausalImpact

<details>

* Version: 1.2.7
* GitHub: NA
* Source code: https://github.com/cran/CausalImpact
* Date/Publication: 2021-06-07 06:40:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "CausalImpact")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/CausalImpact/new/CausalImpact.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CausalImpact/DESCRIPTION’ ... OK
* this is package ‘CausalImpact’ version ‘1.2.7’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bsts', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/CausalImpact/old/CausalImpact.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CausalImpact/DESCRIPTION’ ... OK
* this is package ‘CausalImpact’ version ‘1.2.7’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bsts', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ctsem

<details>

* Version: 3.6.0
* GitHub: https://github.com/cdriveraus/ctsem
* Source code: https://github.com/cran/ctsem
* Date/Publication: 2022-03-10 11:20:19 UTC
* Number of recursive dependencies: 125

Run `cloud_details(, "ctsem")` for more info

</details>

## In both

*   checking whether package ‘ctsem’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ctsem/new/ctsem.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ctsem’ ...
** package ‘ctsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
"/opt/R/4.1.1/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/ctsm.stan
DIAGNOSTIC(S) FROM PARSER:
Info: integer division implicitly rounds to integer. Found int division: d * d - d / 2
 Positive values rounded down, negative values rounded up or down in platform-dependent way.

Wrote C++ file "stan_files/ctsm.cc"
...
stan_files/ctsm.hpp: In member function ‘T__ model_ctsm_namespace::model_ctsm::log_prob(std::vector<T_l>&, std::vector<int>&, std::ostream*) const [with bool propto__ = false; bool jacobian__ = true; T__ = double]’:
stan_files/ctsm.hpp:2348:9: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
 2348 |     T__ log_prob(std::vector<T__>& params_r__,
      |         ^~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stan_files/ctsm.o] Error 1
rm stan_files/ctsm.cc
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/new/ctsem.Rcheck/ctsem’


```
### CRAN

```
* installing *source* package ‘ctsem’ ...
** package ‘ctsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
"/opt/R/4.1.1/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/ctsm.stan
DIAGNOSTIC(S) FROM PARSER:
Info: integer division implicitly rounds to integer. Found int division: d * d - d / 2
 Positive values rounded down, negative values rounded up or down in platform-dependent way.

Wrote C++ file "stan_files/ctsm.cc"
...
stan_files/ctsm.hpp: In member function ‘T__ model_ctsm_namespace::model_ctsm::log_prob(std::vector<T_l>&, std::vector<int>&, std::ostream*) const [with bool propto__ = false; bool jacobian__ = true; T__ = double]’:
stan_files/ctsm.hpp:2348:9: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
 2348 |     T__ log_prob(std::vector<T__>& params_r__,
      |         ^~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.1.1/lib/R/etc/Makeconf:175: stan_files/ctsm.o] Error 1
rm stan_files/ctsm.cc
ERROR: compilation failed for package ‘ctsem’
* removing ‘/tmp/workdir/ctsem/old/ctsem.Rcheck/ctsem’


```
# diveR

<details>

* Version: 0.1.2
* GitHub: https://github.com/great-northern-diver/diver
* Source code: https://github.com/cran/diveR
* Date/Publication: 2021-09-28 19:40:02 UTC
* Number of recursive dependencies: 81

Run `cloud_details(, "diveR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/diveR/new/diveR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘diveR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘diveR’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available:
  'loon', 'loon.ggplot', 'zenplots', 'loon.shiny', 'loon.tourr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/diveR/old/diveR.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘diveR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘diveR’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available:
  'loon', 'loon.ggplot', 'zenplots', 'loon.shiny', 'loon.tourr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# elbird

<details>

* Version: 0.2.3
* GitHub: https://github.com/mrchypark/elbird
* Source code: https://github.com/cran/elbird
* Date/Publication: 2022-04-19 11:42:36 UTC
* Number of recursive dependencies: 0

Run `cloud_details(, "elbird")` for more info

</details>

## In both

*   checking whether package ‘elbird’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/elbird/new/elbird.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘elbird’ ...
** package ‘elbird’ successfully unpacked and MD5 sums checked
** using staged installation
/usr/bin/uname
Prior system libkiwi installation not found
Preparing to download and build library from source...
------------------------------[ ELBIRD ]------------------------------
Configuration failed because 'git' was not found.
If you want to kiwi build from source in package installation prosess,
make sure git and cmake work in system.
-------------------------------------------------------------------------
ERROR: configuration failed for package ‘elbird’
* removing ‘/tmp/workdir/elbird/new/elbird.Rcheck/elbird’


```
### CRAN

```
* installing *source* package ‘elbird’ ...
** package ‘elbird’ successfully unpacked and MD5 sums checked
** using staged installation
/usr/bin/uname
Prior system libkiwi installation not found
Preparing to download and build library from source...
------------------------------[ ELBIRD ]------------------------------
Configuration failed because 'git' was not found.
If you want to kiwi build from source in package installation prosess,
make sure git and cmake work in system.
-------------------------------------------------------------------------
ERROR: configuration failed for package ‘elbird’
* removing ‘/tmp/workdir/elbird/old/elbird.Rcheck/elbird’


```
# fable

<details>

* Version: 0.3.1
* GitHub: https://github.com/tidyverts/fable
* Source code: https://github.com/cran/fable
* Date/Publication: 2021-05-16 14:20:07 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "fable")` for more info

</details>

## In both

*   checking whether package ‘fable’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/fable/new/fable.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fable’ ...
** package ‘fable’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etsTargetFunction.cpp -o etsTargetFunction.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etsTargetFunctionWrapper.cpp -o etsTargetFunctionWrapper.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etscalc.c -o etscalc.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o fable.so etsTargetFunction.o etsTargetFunctionWrapper.o etscalc.o registerDynamicSymbol.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/fable/new/fable.Rcheck/00LOCK-fable/00new/fable/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘fabletools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘lubridate’
Execution halted
ERROR: lazy loading failed for package ‘fable’
* removing ‘/tmp/workdir/fable/new/fable.Rcheck/fable’


```
### CRAN

```
* installing *source* package ‘fable’ ...
** package ‘fable’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etsTargetFunction.cpp -o etsTargetFunction.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etsTargetFunctionWrapper.cpp -o etsTargetFunctionWrapper.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c etscalc.c -o etscalc.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o fable.so etsTargetFunction.o etsTargetFunctionWrapper.o etscalc.o registerDynamicSymbol.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/fable/old/fable.Rcheck/00LOCK-fable/00new/fable/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘fabletools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘lubridate’
Execution halted
ERROR: lazy loading failed for package ‘fable’
* removing ‘/tmp/workdir/fable/old/fable.Rcheck/fable’


```
# ImputeRobust

<details>

* Version: 1.3-1
* GitHub: NA
* Source code: https://github.com/cran/ImputeRobust
* Date/Publication: 2018-11-30 12:10:03 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "ImputeRobust")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ImputeRobust/new/ImputeRobust.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ImputeRobust/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ImputeRobust’ version ‘1.3-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/ImputeRobust/old/ImputeRobust.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ImputeRobust/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ImputeRobust’ version ‘1.3-1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# loon.ggplot

<details>

* Version: 1.3.1
* GitHub: https://github.com/great-northern-diver/loon.ggplot
* Source code: https://github.com/cran/loon.ggplot
* Date/Publication: 2022-02-07 21:50:06 UTC
* Number of recursive dependencies: 103

Run `cloud_details(, "loon.ggplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.ggplot/new/loon.ggplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/loon.ggplot/old/loon.ggplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# loon.shiny

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/loon.shiny
* Date/Publication: 2022-02-07 04:50:02 UTC
* Number of recursive dependencies: 131

Run `cloud_details(, "loon.shiny")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.shiny/new/loon.shiny.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.shiny’ version ‘1.0.2’
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
* using log directory ‘/tmp/workdir/loon.shiny/old/loon.shiny.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.shiny’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'loon', 'loon.ggplot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# loon.tourr

<details>

* Version: 0.1.3
* GitHub: https://github.com/z267xu/loon.tourr
* Source code: https://github.com/cran/loon.tourr
* Date/Publication: 2021-10-27 14:10:05 UTC
* Number of recursive dependencies: 120

Run `cloud_details(, "loon.tourr")` for more info

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
# MarketMatching

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/MarketMatching
* Date/Publication: 2021-01-08 20:10:02 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "MarketMatching")` for more info

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
# nlmixr

<details>

* Version: 2.0.7
* GitHub: https://github.com/nlmixrdevelopment/nlmixr
* Source code: https://github.com/cran/nlmixr
* Date/Publication: 2022-03-27 14:50:06 UTC
* Number of recursive dependencies: 216

Run `cloud_details(, "nlmixr")` for more info

</details>

## In both

*   checking whether package ‘nlmixr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/nlmixr/new/nlmixr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
--------[begin src/Makevars]--------
# -*- mode: makefile-gmake -*-
ARMA=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`
BH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`
RCPP=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`
EG=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`
SH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`
...
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'RxODE', details:
  call: NULL
  error: RxODE compiled with PreciseSums '0.4' but PreciseSums '0.5' is loaded
Recompile RxODE with the this version of PreciseSums
Execution halted
ERROR: lazy loading failed for package ‘nlmixr’
* removing ‘/tmp/workdir/nlmixr/new/nlmixr.Rcheck/nlmixr’


```
### CRAN

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
--------[begin src/Makevars]--------
# -*- mode: makefile-gmake -*-
ARMA=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`
BH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`
RCPP=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`
EG=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`
SH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`
...
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'RxODE', details:
  call: NULL
  error: RxODE compiled with PreciseSums '0.4' but PreciseSums '0.5' is loaded
Recompile RxODE with the this version of PreciseSums
Execution halted
ERROR: lazy loading failed for package ‘nlmixr’
* removing ‘/tmp/workdir/nlmixr/old/nlmixr.Rcheck/nlmixr’


```
# referenceIntervals

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/referenceIntervals
* Date/Publication: 2020-04-18 05:10:03 UTC
* Number of recursive dependencies: 85

Run `cloud_details(, "referenceIntervals")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/referenceIntervals/new/referenceIntervals.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘referenceIntervals/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘referenceIntervals’ version ‘1.2.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/referenceIntervals/old/referenceIntervals.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘referenceIntervals/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘referenceIntervals’ version ‘1.2.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘extremevalues’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SPORTSCausal

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/SPORTSCausal
* Date/Publication: 2021-03-30 08:10:02 UTC
* Number of recursive dependencies: 63

Run `cloud_details(, "SPORTSCausal")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SPORTSCausal/new/SPORTSCausal.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SPORTSCausal/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SPORTSCausal’ version ‘1.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘CausalImpact’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/SPORTSCausal/old/SPORTSCausal.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SPORTSCausal/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SPORTSCausal’ version ‘1.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘CausalImpact’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SSVS

<details>

* Version: 1.0.0
* GitHub: https://github.com/sabainter/SSVS
* Source code: https://github.com/cran/SSVS
* Date/Publication: 2022-03-08 20:20:12 UTC
* Number of recursive dependencies: 100

Run `cloud_details(, "SSVS")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SSVS/new/SSVS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSVS/DESCRIPTION’ ... OK
* this is package ‘SSVS’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘BoomSpikeSlab’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/SSVS/old/SSVS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSVS/DESCRIPTION’ ... OK
* this is package ‘SSVS’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘BoomSpikeSlab’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# valse

<details>

* Version: 0.1-0
* GitHub: NA
* Source code: https://github.com/cran/valse
* Date/Publication: 2021-05-31 08:00:02 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "valse")` for more info

</details>

## In both

*   checking whether package ‘valse’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/valse/new/valse.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘valse’ ...
** package ‘valse’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c EMGLLF.c -o EMGLLF.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c EMGrank.c -o EMGrank.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c a.EMGLLF.c -o a.EMGLLF.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c a.EMGrank.c -o a.EMGrank.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c valse_init.c -o valse_init.o
Error in loadNamespace(x) : there is no package called ‘RcppGSL’
...
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘valse’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/tmp/workdir/valse/new/valse.Rcheck/00LOCK-valse/00new/valse/libs/valse.so':
  /tmp/workdir/valse/new/valse.Rcheck/00LOCK-valse/00new/valse/libs/valse.so: undefined symbol: gsl_vector_free
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/valse/new/valse.Rcheck/valse’


```
### CRAN

```
* installing *source* package ‘valse’ ...
** package ‘valse’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c EMGLLF.c -o EMGLLF.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c EMGrank.c -o EMGrank.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c a.EMGLLF.c -o a.EMGLLF.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c a.EMGrank.c -o a.EMGrank.o
gcc -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c valse_init.c -o valse_init.o
Error in loadNamespace(x) : there is no package called ‘RcppGSL’
...
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘valse’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/tmp/workdir/valse/old/valse.Rcheck/00LOCK-valse/00new/valse/libs/valse.so':
  /tmp/workdir/valse/old/valse.Rcheck/00LOCK-valse/00new/valse/libs/valse.so: undefined symbol: gsl_vector_free
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/valse/old/valse.Rcheck/valse’


```
# vivid

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/vivid
* Date/Publication: 2021-11-20 01:30:02 UTC
* Number of recursive dependencies: 202

Run `cloud_details(, "vivid")` for more info

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
* this is package ‘vivid’ version ‘0.2.3’
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
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/vivid/old/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.3’
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
Status: 2 NOTEs





```
# xpose.nlmixr

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/xpose.nlmixr
* Date/Publication: 2021-04-26 10:20:03 UTC
* Number of recursive dependencies: 91

Run `cloud_details(, "xpose.nlmixr")` for more info

</details>

## In both

*   checking whether package ‘xpose.nlmixr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/xpose.nlmixr/new/xpose.nlmixr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘xpose.nlmixr’ ...
** package ‘xpose.nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘nlmixr’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
Warning: namespace ‘RxODE’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
...
Warning: namespace ‘RxODE’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'RxODE', details:
  call: NULL
  error: RxODE compiled with PreciseSums '0.4' but PreciseSums '0.5' is loaded
Recompile RxODE with the this version of PreciseSums
Execution halted
ERROR: lazy loading failed for package ‘xpose.nlmixr’
* removing ‘/tmp/workdir/xpose.nlmixr/new/xpose.nlmixr.Rcheck/xpose.nlmixr’


```
### CRAN

```
* installing *source* package ‘xpose.nlmixr’ ...
** package ‘xpose.nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘nlmixr’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
Warning: namespace ‘RxODE’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
...
Warning: namespace ‘RxODE’ is not available and has been replaced
by .GlobalEnv when processing object ‘theo_sd_fit’
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'RxODE', details:
  call: NULL
  error: RxODE compiled with PreciseSums '0.4' but PreciseSums '0.5' is loaded
Recompile RxODE with the this version of PreciseSums
Execution halted
ERROR: lazy loading failed for package ‘xpose.nlmixr’
* removing ‘/tmp/workdir/xpose.nlmixr/old/xpose.nlmixr.Rcheck/xpose.nlmixr’


```
