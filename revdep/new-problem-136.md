# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
Error in readRDS("/tmp/RtmpcwuZam/filefdcc1bfdeb30") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefdcc1bfdeb30"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last(): No such file or directory
/usr/lib/R/etc/Makeconf:168: recipe for target 'fasta.o' failed
make: *** [fasta.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c findNN_.cpp -o findNN_.o
Compiling with: 

