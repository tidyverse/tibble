# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o protViz.so protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o -L/usr/lib/R/lib -lR
Compiling with: 

