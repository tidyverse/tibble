# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
Compiling with: 

