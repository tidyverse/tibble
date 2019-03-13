# cellWise

Version: 2.1.0

## Newly broken

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘rospca’
    ```

# ggstatsplot

Version: 0.0.9

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      group1 group2 statistic  p.value significance p.value.label
      [3m[38;5;246m<chr>[39m[23m  [3m[38;5;246m<chr>[39m[23m      [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<chr>[39m[23m        
    [38;5;250m1[39m HDHF   HDLF        4.78 1.44[38;5;246me[39m[31m- 5[39m ***          p <= 0.001   
    [38;5;250m2[39m HDHF   LDHF        2.44 4.47[38;5;246me[39m[31m- 2[39m *            p = 0.045    
    [38;5;250m3[39m HDHF   LDLF        8.01 5.45[38;5;246me[39m[31m-13[39m ***          p <= 0.001   
    [38;5;250m4[39m HDLF   LDHF        2.34 4.96[38;5;246me[39m[31m- 2[39m *            p = 0.050    
    [38;5;250m5[39m HDLF   LDLF        3.23 5.05[38;5;246me[39m[31m- 3[39m **           p = 0.005    
    [38;5;250m6[39m LDHF   LDLF        5.57 4.64[38;5;246me[39m[31m- 7[39m ***          p <= 0.001   
    > 
    > # robust
    > ggstatsplot::pairwise_p(
    +   data = bugs_long,
    +   x = key,
    +   y = value,
    +   type = "r",
    +   paired = TRUE,
    +   p.adjust.method = "hommel"
    + )
    Error in .f(.x[[i]], ...) : object 'Group..1' not found
    Calls: <Anonymous> ... <Anonymous> -> vars_rename_eval -> map_if -> map -> .f -> .Call
    Execution halted
    ```

# komaletter

Version: 0.3.0

## Newly broken

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘linl’
    ```

# LogConcDEAD

Version: 1.6-1

## Newly broken

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘logcondens’
    ```

# lumiBarnes

Version: 1.20.0

## Newly broken

*   checking whether the package can be loaded ... ERROR
    ```
    ...
        rowMeans, rowSums, rownames, sapply, setdiff, sort, table, tapply,
        union, unique, unsplit, which, which.max, which.min
    
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    Loading required package: lumi
    Error: package or namespace load failed for ‘lumi’:
     .onLoad failed in loadNamespace() for 'HDF5Array', details:
      call: .set_dump_dir(dir)
      error: cannot create directory "/tmp/Rtmp1xRCPQ/HDF5Array_dump"
    Error: package ‘lumi’ could not be loaded
    In addition: Warning messages:
    1: In close.connection(con) :
      Problem closing connection:  No space left on device
    2: In close.connection(con) :
      Problem closing connection:  No space left on device
    Execution halted
    ```

# mrMLM

Version: 3.1

## Newly broken

*   checking for unstated dependencies in examples ... WARNING
    ```
    Fatal error: cannot create 'R_TempDir'
    ```

# orloca

Version: 4.6

## Newly broken

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘orloca.es’
    ```

# readxl

Version: 1.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[2]: "a.b..2"
      
      ══ testthat results  ════════════════════════════════════════════════════════════
      OK: 381 SKIPPED: 2 FAILED: 8
      1. Failure: missing column names are populated (@test-col-names.R#56) 
      2. Failure: missing column names are populated (@test-col-names.R#58) 
      3. Failure: column names are de-duplicated (@test-col-names.R#66) 
      4. Failure: column names are de-duplicated (@test-col-names.R#68) 
      5. Failure: .name_repair is passed through to tibble (@test-col-names.R#117) 
      6. Failure: .name_repair is passed through to tibble (@test-col-names.R#119) 
      7. Failure: .name_repair is passed through to tibble (@test-col-names.R#124) 
      8. Failure: .name_repair is passed through to tibble (@test-col-names.R#126) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sim1000G

Version: 1.39

## Newly broken

*   checking PDF version of manual ... ERROR
    ```
    ...
      Problem closing connection:  No space left on device
    Warning in close.connection(con) :
      Problem closing connection:  No space left on device
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/readGeneticMap.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/readGeneticMapFromFile.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/readVCF.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/resetSimulation.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/setRecombinationModel.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/sim1000G-package.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/startSimulation.tex’ lacks a header: skipping
    Warning in .pkg2tex(files, outfile, encoding = encoding, append = append,  :
      file ‘/tmp/RtmpdBkDN9/ltx90b47273ff0e/writePED.tex’ lacks a header: skipping
    Error in writeLines(readLines(f), outcon) : 
      Error writing to connection:  No space left on device
    ```

# SmartEDA

Version: 0.3.0

## Newly broken

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘InformationValue’
    ```

# treeclim

Version: 2.0.0

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘treeclim’ ...
** package ‘treeclim’ successfully unpacked and MD5 sums checked
** libs
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun.cpp -o corfun.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun_exact.cpp -o corfun_exact.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun_noboot.cpp -o corfun_noboot.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c pcor.cpp -o pcor.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c respo.cpp -o respo.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/Rcpp/include" -I"/tmp/RtmpMjZhRV/checklib78887b758c3d/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c respo_exact.cpp -o respo_exact.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
g++ -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o treeclim.so RcppExports.o corfun.o corfun_exact.o corfun_noboot.o pcor.o respo.o respo_exact.o -L/usr/local/lib/R/lib -lRlapack -lblas -lgfortran -lm -lquadmath -L/usr/local/lib/R/lib -lR
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
installing to /tmp/RtmpMjZhRV/file78882cab8120/treeclim.Rcheck/treeclim/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (treeclim)

```
### CRAN

```
* installing *source* package ‘treeclim’ ...
** package ‘treeclim’ successfully unpacked and MD5 sums checked
** libs
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/Rcpp/include" -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/Rcpp/include" -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun.cpp -o corfun.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/Rcpp/include" -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun_exact.cpp -o corfun_exact.o
g++  -I"/usr/local/lib/R/include" -DNDEBUG  -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/Rcpp/include" -I"/tmp/Rtmp9EssIf/checklib315f3fb3caaf/RcppArmadillo/include" -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c corfun_noboot.cpp -o corfun_noboot.o
corfun_noboot.cpp:52:1: fatal error: error writing to /tmp/ccespLWf.s: No space left on device
 }
 ^
compilation terminated.
/usr/local/lib/R/etc/Makeconf:171: recipe for target 'corfun_noboot.o' failed
make: *** [corfun_noboot.o] Error 1
ERROR: compilation failed for package ‘treeclim’
* removing ‘/tmp/Rtmp9EssIf/file315f7d8aad97/treeclim.Rcheck/treeclim’

```
