# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
installing to /tmp/RtmpcwuZam/filefdfc5c84443a/protViz.Rcheck/protViz/libs
** R
** data
*** moving datasets to lazyload DB
** demo
** exec
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
code for methods in class “Rcpp_Fasta” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_Fasta” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
* DONE (protViz)

```
### CRAN

```
* installing *source* package ‘protViz’ ...
** package ‘protViz’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c findNN.c -o findNN.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c protViz_init.c -o protViz_init.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeParentIonMass.c -o computeParentIonMass.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeFragmentIons.c -o computeFragmentIons.o
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c fasta.cpp -o fasta.o
Compiling with: 

