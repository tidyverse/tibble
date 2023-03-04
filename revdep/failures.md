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
# bssm

<details>

* Version: 2.0.1
* GitHub: https://github.com/helske/bssm
* Source code: https://github.com/cran/bssm
* Date/Publication: 2022-05-03 23:00:09 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "bssm")` for more info

</details>

## In both

*   checking whether package ‘bssm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bssm/new/bssm.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘ggplot2’
    ```

## Installation

### Devel

```
* installing *source* package ‘bssm’ ...
** package ‘bssm’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_approx.cpp -o R_approx.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_bootstrap_filter.cpp -o R_bootstrap_filter.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_ekf.cpp -o R_ekf.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_ekpf.cpp -o R_ekpf.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_iact.cpp -o R_iact.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_importance_sample.cpp -o R_importance_sample.o
...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ggplot2’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘bssm’
* removing ‘/tmp/workdir/bssm/new/bssm.Rcheck/bssm’


```
### CRAN

```
* installing *source* package ‘bssm’ ...
** package ‘bssm’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_approx.cpp -o R_approx.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_bootstrap_filter.cpp -o R_bootstrap_filter.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_ekf.cpp -o R_ekf.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_ekpf.cpp -o R_ekpf.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_iact.cpp -o R_iact.o
g++ -std=gnu++11 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/ramcmc/include' -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.1.1/lib/R/site-library/sitmo/include' -I/usr/local/include  -fopenmp -fpic  -g -O2  -c R_importance_sample.cpp -o R_importance_sample.o
...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ggplot2’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘bssm’
* removing ‘/tmp/workdir/bssm/old/bssm.Rcheck/bssm’


```
# calendRio

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/calendRio
* Date/Publication: 2022-03-10 07:50:02 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "calendRio")` for more info

</details>

## In both

*   checking whether package ‘calendRio’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/calendRio/new/calendRio.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘calendRio’ ...
** package ‘calendRio’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ggplotify’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘calendRio’
* removing ‘/tmp/workdir/calendRio/new/calendRio.Rcheck/calendRio’


```
### CRAN

```
* installing *source* package ‘calendRio’ ...
** package ‘calendRio’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ggplotify’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘calendRio’
* removing ‘/tmp/workdir/calendRio/old/calendRio.Rcheck/calendRio’


```
# ClustAssess

<details>

* Version: 0.3.0
* GitHub: https://github.com/Core-Bioinformatics/ClustAssess
* Source code: https://github.com/cran/ClustAssess
* Date/Publication: 2022-01-26 16:52:46 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "ClustAssess")` for more info

</details>

## In both

*   checking whether package ‘ClustAssess’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ClustAssess’ ...
** package ‘ClustAssess’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c calculate_pac.cpp -o calculate_pac.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c update_connectivity.cpp -o update_connectivity.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o ClustAssess.so RcppExports.o calculate_pac.o update_connectivity.o -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/00LOCK-ClustAssess/00new/ClustAssess/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘iterators’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ClustAssess’
* removing ‘/tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/ClustAssess’


```
### CRAN

```
* installing *source* package ‘ClustAssess’ ...
** package ‘ClustAssess’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c calculate_pac.cpp -o calculate_pac.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c update_connectivity.cpp -o update_connectivity.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o ClustAssess.so RcppExports.o calculate_pac.o update_connectivity.o -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/00LOCK-ClustAssess/00new/ClustAssess/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘iterators’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ClustAssess’
* removing ‘/tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/ClustAssess’


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
# detrendr

<details>

* Version: 0.6.14
* GitHub: https://github.com/rorynolan/detrendr
* Source code: https://github.com/cran/detrendr
* Date/Publication: 2021-05-16 05:00:05 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "detrendr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/detrendr/new/detrendr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘detrendr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘detrendr’ version ‘0.6.14’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'autothresholdr', 'ijtiff'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/detrendr/old/detrendr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘detrendr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘detrendr’ version ‘0.6.14’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'autothresholdr', 'ijtiff'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# diffdfs

<details>

* Version: 0.9.0
* GitHub: https://github.com/riazarbi/diffdfs
* Source code: https://github.com/cran/diffdfs
* Date/Publication: 2022-08-09 13:50:06 UTC
* Number of recursive dependencies: 48

Run `revdepcheck::cloud_details(, "diffdfs")` for more info

</details>

## In both

*   checking whether package ‘diffdfs’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/diffdfs/new/diffdfs.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘diffdfs’ ...
** package ‘diffdfs’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘bit64’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘diffdfs’
* removing ‘/tmp/workdir/diffdfs/new/diffdfs.Rcheck/diffdfs’


```
### CRAN

```
* installing *source* package ‘diffdfs’ ...
** package ‘diffdfs’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘bit64’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘diffdfs’
* removing ‘/tmp/workdir/diffdfs/old/diffdfs.Rcheck/diffdfs’


```
# dnapath

<details>

* Version: 0.7.4
* GitHub: NA
* Source code: https://github.com/cran/dnapath
* Date/Publication: 2022-05-09 09:00:05 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::cloud_details(, "dnapath")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dnapath/new/dnapath.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dnapath/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘dnapath’ version ‘0.7.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘introduction_to_dnapath.Rmd’ using ‘UTF-8’... OK
  ‘package_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/dnapath/old/dnapath.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dnapath/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘dnapath’ version ‘0.7.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘introduction_to_dnapath.Rmd’ using ‘UTF-8’... OK
  ‘package_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





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
# eurostat

<details>

* Version: 3.7.10
* GitHub: https://github.com/rOpenGov/eurostat
* Source code: https://github.com/cran/eurostat
* Date/Publication: 2022-02-09 11:30:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "eurostat")` for more info

</details>

## In both

*   checking whether package ‘eurostat’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/eurostat/new/eurostat.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eurostat’ ...
** package ‘eurostat’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘generics’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘eurostat’
* removing ‘/tmp/workdir/eurostat/new/eurostat.Rcheck/eurostat’


```
### CRAN

```
* installing *source* package ‘eurostat’ ...
** package ‘eurostat’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘generics’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘eurostat’
* removing ‘/tmp/workdir/eurostat/old/eurostat.Rcheck/eurostat’


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
# FRK

<details>

* Version: 2.1.5
* GitHub: https://github.com/andrewzm/FRK
* Source code: https://github.com/cran/FRK
* Date/Publication: 2023-02-01 10:20:02 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "FRK")` for more info

</details>

## In both

*   checking whether package ‘FRK’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FRK/new/FRK.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FRK’ ...
** package ‘FRK’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/TMB/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppEigen/include' -I/usr/local/include   -fpic  -g -O2  -c FRK.cpp -o FRK.o
In file included from /opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/Core:397,
                 from /opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /opt/R/4.1.1/lib/R/site-library/TMB/include/TMB.hpp:78,
                 from FRK.cpp:1:
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:60:39: warning: ignoring attributes on template argument ‘__m128’ {aka ‘__vector(4) float’} [-Wignored-attributes]
...
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘abind’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘FRK’
* removing ‘/tmp/workdir/FRK/new/FRK.Rcheck/FRK’


```
### CRAN

```
* installing *source* package ‘FRK’ ...
** package ‘FRK’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.1.1/lib/R/site-library/TMB/include' -I'/opt/R/4.1.1/lib/R/site-library/RcppEigen/include' -I/usr/local/include   -fpic  -g -O2  -c FRK.cpp -o FRK.o
In file included from /opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/Core:397,
                 from /opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /opt/R/4.1.1/lib/R/site-library/TMB/include/TMB.hpp:78,
                 from FRK.cpp:1:
/opt/R/4.1.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:60:39: warning: ignoring attributes on template argument ‘__m128’ {aka ‘__vector(4) float’} [-Wignored-attributes]
...
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘abind’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘FRK’
* removing ‘/tmp/workdir/FRK/old/FRK.Rcheck/FRK’


```
# FSinR

<details>

* Version: 2.0.5
* GitHub: NA
* Source code: https://github.com/cran/FSinR
* Date/Publication: 2020-11-23 10:50:26 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "FSinR")` for more info

</details>

## In both

*   checking whether package ‘FSinR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FSinR/new/FSinR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FSinR’ ...
** package ‘FSinR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘tidyselect’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘FSinR’
* removing ‘/tmp/workdir/FSinR/new/FSinR.Rcheck/FSinR’


```
### CRAN

```
* installing *source* package ‘FSinR’ ...
** package ‘FSinR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘tidyselect’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘FSinR’
* removing ‘/tmp/workdir/FSinR/old/FSinR.Rcheck/FSinR’


```
# gmgm

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/gmgm
* Date/Publication: 2022-09-08 20:32:55 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "gmgm")` for more info

</details>

## In both

*   checking whether package ‘gmgm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/gmgm/new/gmgm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘gmgm’ ...
** package ‘gmgm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘R6’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘gmgm’
* removing ‘/tmp/workdir/gmgm/new/gmgm.Rcheck/gmgm’


```
### CRAN

```
* installing *source* package ‘gmgm’ ...
** package ‘gmgm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘R6’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘gmgm’
* removing ‘/tmp/workdir/gmgm/old/gmgm.Rcheck/gmgm’


```
# gwpcormapper

<details>

* Version: 0.1.3
* GitHub: https://github.com/gwpcor/gwpcormapper
* Source code: https://github.com/cran/gwpcormapper
* Date/Publication: 2021-12-09 16:00:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "gwpcormapper")` for more info

</details>

## In both

*   checking whether package ‘gwpcormapper’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/gwpcormapper/new/gwpcormapper.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘gwpcormapper’ ...
** package ‘gwpcormapper’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c gwpcor.cpp -o gwpcor.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o gwpcormapper.so RcppExports.o gwpcor.o -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/gwpcormapper/new/gwpcormapper.Rcheck/00LOCK-gwpcormapper/00new/gwpcormapper/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘stringr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘gwpcormapper’
* removing ‘/tmp/workdir/gwpcormapper/new/gwpcormapper.Rcheck/gwpcormapper’


```
### CRAN

```
* installing *source* package ‘gwpcormapper’ ...
** package ‘gwpcormapper’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.1.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.1.1/lib/R/site-library/Rcpp/include' -I/usr/local/include   -fpic  -g -O2  -c gwpcor.cpp -o gwpcor.o
g++ -std=gnu++14 -shared -L/opt/R/4.1.1/lib/R/lib -L/usr/local/lib -o gwpcormapper.so RcppExports.o gwpcor.o -L/opt/R/4.1.1/lib/R/lib -lR
installing to /tmp/workdir/gwpcormapper/old/gwpcormapper.Rcheck/00LOCK-gwpcormapper/00new/gwpcormapper/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘stringr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘gwpcormapper’
* removing ‘/tmp/workdir/gwpcormapper/old/gwpcormapper.Rcheck/gwpcormapper’


```
# haldensify

<details>

* Version: 0.2.3
* GitHub: https://github.com/nhejazi/haldensify
* Source code: https://github.com/cran/haldensify
* Date/Publication: 2022-02-09 22:20:06 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "haldensify")` for more info

</details>

## In both

*   checking whether package ‘haldensify’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/haldensify/new/haldensify.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘haldensify’ ...
** package ‘haldensify’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘tidyr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘haldensify’
* removing ‘/tmp/workdir/haldensify/new/haldensify.Rcheck/haldensify’


```
### CRAN

```
* installing *source* package ‘haldensify’ ...
** package ‘haldensify’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘tidyr’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘haldensify’
* removing ‘/tmp/workdir/haldensify/old/haldensify.Rcheck/haldensify’


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
# insane

<details>

* Version: 1.0.1
* GitHub: https://github.com/mcanouil/insane
* Source code: https://github.com/cran/insane
* Date/Publication: 2022-12-06 00:30:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "insane")` for more info

</details>

## In both

*   checking whether package ‘insane’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/insane/new/insane.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘insane’ ...
** package ‘insane’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘carData’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘insane’
* removing ‘/tmp/workdir/insane/new/insane.Rcheck/insane’


```
### CRAN

```
* installing *source* package ‘insane’ ...
** package ‘insane’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘carData’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘insane’
* removing ‘/tmp/workdir/insane/old/insane.Rcheck/insane’


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
# KCSNBShiny

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/KCSNBShiny
* Date/Publication: 2019-07-01 12:20:03 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "KCSNBShiny")` for more info

</details>

## In both

*   checking whether package ‘KCSNBShiny’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/KCSNBShiny/new/KCSNBShiny.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘KCSNBShiny’ ...
** package ‘KCSNBShiny’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘iterators’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘KCSNBShiny’
* removing ‘/tmp/workdir/KCSNBShiny/new/KCSNBShiny.Rcheck/KCSNBShiny’


```
### CRAN

```
* installing *source* package ‘KCSNBShiny’ ...
** package ‘KCSNBShiny’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘iterators’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘KCSNBShiny’
* removing ‘/tmp/workdir/KCSNBShiny/old/KCSNBShiny.Rcheck/KCSNBShiny’


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
# LOGANTree

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/LOGANTree
* Date/Publication: 2022-06-22 22:20:06 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "LOGANTree")` for more info

</details>

## In both

*   checking whether package ‘LOGANTree’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/LOGANTree/new/LOGANTree.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘LOGANTree’ ...
** package ‘LOGANTree’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘stringi’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘LOGANTree’
* removing ‘/tmp/workdir/LOGANTree/new/LOGANTree.Rcheck/LOGANTree’


```
### CRAN

```
* installing *source* package ‘LOGANTree’ ...
** package ‘LOGANTree’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘stringi’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘LOGANTree’
* removing ‘/tmp/workdir/LOGANTree/old/LOGANTree.Rcheck/LOGANTree’


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
# OTrecod

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/OTrecod
* Date/Publication: 2022-10-05 10:40:02 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::cloud_details(, "OTrecod")` for more info

</details>

## In both

*   checking whether package ‘OTrecod’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/OTrecod/new/OTrecod.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OTrecod’ ...
** package ‘OTrecod’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘slam’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘OTrecod’
* removing ‘/tmp/workdir/OTrecod/new/OTrecod.Rcheck/OTrecod’


```
### CRAN

```
* installing *source* package ‘OTrecod’ ...
** package ‘OTrecod’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘slam’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘OTrecod’
* removing ‘/tmp/workdir/OTrecod/old/OTrecod.Rcheck/OTrecod’


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
# PDtoolkit

<details>

* Version: 1.0.1
* GitHub: https://github.com/andrija-djurovic/PDtoolkit
* Source code: https://github.com/cran/PDtoolkit
* Date/Publication: 2023-02-14 09:50:10 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "PDtoolkit")` for more info

</details>

## In both

*   checking whether package ‘PDtoolkit’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/PDtoolkit/new/PDtoolkit.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘PDtoolkit’ ...
** package ‘PDtoolkit’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘Hmisc’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘htmlwidgets’
Execution halted
ERROR: lazy loading failed for package ‘PDtoolkit’
* removing ‘/tmp/workdir/PDtoolkit/new/PDtoolkit.Rcheck/PDtoolkit’


```
### CRAN

```
* installing *source* package ‘PDtoolkit’ ...
** package ‘PDtoolkit’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘Hmisc’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘htmlwidgets’
Execution halted
ERROR: lazy loading failed for package ‘PDtoolkit’
* removing ‘/tmp/workdir/PDtoolkit/old/PDtoolkit.Rcheck/PDtoolkit’


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
# RKorAPClient

<details>

* Version: 0.7.5
* GitHub: https://github.com/KorAP/RKorAPClient
* Source code: https://github.com/cran/RKorAPClient
* Date/Publication: 2022-09-07 18:40:09 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::cloud_details(, "RKorAPClient")` for more info

</details>

## In both

*   checking whether package ‘RKorAPClient’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/RKorAPClient/new/RKorAPClient.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RKorAPClient’ ...
** package ‘RKorAPClient’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ade4’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘RKorAPClient’
* removing ‘/tmp/workdir/RKorAPClient/new/RKorAPClient.Rcheck/RKorAPClient’


```
### CRAN

```
* installing *source* package ‘RKorAPClient’ ...
** package ‘RKorAPClient’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘ade4’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘RKorAPClient’
* removing ‘/tmp/workdir/RKorAPClient/old/RKorAPClient.Rcheck/RKorAPClient’


```
# rsnell

<details>

* Version: 0.1
* GitHub: https://github.com/pfpetrowski/rsnell
* Source code: https://github.com/cran/rsnell
* Date/Publication: 2023-02-27 16:42:29 UTC
* Number of recursive dependencies: 21

Run `revdepcheck::cloud_details(, "rsnell")` for more info

</details>

## In both

*   checking whether package ‘rsnell’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rsnell/new/rsnell.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rsnell’ ...
** package ‘rsnell’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘generics’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘rsnell’
* removing ‘/tmp/workdir/rsnell/new/rsnell.Rcheck/rsnell’


```
### CRAN

```
* installing *source* package ‘rsnell’ ...
** package ‘rsnell’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘generics’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘rsnell’
* removing ‘/tmp/workdir/rsnell/old/rsnell.Rcheck/rsnell’


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
# shiny.benchmark

<details>

* Version: 0.1.1
* GitHub: https://github.com/Appsilon/shiny.benchmark
* Source code: https://github.com/cran/shiny.benchmark
* Date/Publication: 2023-01-20 09:50:02 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "shiny.benchmark")` for more info

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
