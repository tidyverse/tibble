# Langevin

Version: 1.2

## Newly broken

*   checking whether package ‘Langevin’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpcwuZam/filefddd7d943a49/Langevin.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘Langevin’ ...
** package ‘Langevin’ successfully unpacked and MD5 sums checked
** libs
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c timeseries1D.cpp -o timeseries1D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
Error in readRDS("/tmp/RtmpcwuZam/filefddd37c61dd4") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefddd37c61dd4"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last(): No such file or directory
/usr/lib/R/etc/Makeconf:168: recipe for target 'timeseries1D.o' failed
make: *** [timeseries1D.o] Error 1
make: *** Waiting for unfinished jobs....
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c timeseries2D.cpp -o timeseries2D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Langevin1D.cpp -o Langevin1D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfddd3d0b8085/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Langevin2D.cpp -o Langevin2D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
ERROR: compilation failed for package ‘Langevin’
* removing ‘/tmp/RtmpcwuZam/filefddd7d943a49/Langevin.Rcheck/Langevin’

```
### CRAN

```
* installing *source* package ‘Langevin’ ...
** package ‘Langevin’ successfully unpacked and MD5 sums checked
** libs
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c timeseries1D.cpp -o timeseries1D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c timeseries2D.cpp -o timeseries2D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Langevin1D.cpp -o Langevin1D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++  -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdbf7f6b44ea/RcppArmadillo/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -fopenmp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Langevin2D.cpp -o Langevin2D.o
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o Langevin.so Langevin1D.o Langevin2D.o RcppExports.o timeseries1D.o timeseries2D.o -llapack -lblas -lgfortran -lm -lquadmath -fopenmp -L/usr/lib/R/lib -lR
Compiling with: 
## Use the R_HOME indirection to support installations of multiple R version
PKG_CXXFLAGS = `$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` $(SHLIB_OPENMP_CXXFLAGS)
PKG_LIBS = `$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) $(SHLIB_OPENMP_CXXFLAGS)
installing to /tmp/RtmpcwuZam/filefdbf2842581/Langevin.Rcheck/Langevin/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (Langevin)

```
