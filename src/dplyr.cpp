#include <dplyr.h>

using namespace Rcpp ;
using namespace dplyr ;

// [[Rcpp::export]]
SEXP shallow_copy(const List& data){
    int n = data.size() ;
    List out(n) ;
    for( int i=0; i<n; i++) {
      out[i] = shared_SEXP(data[i]) ;
    }
    copy_attributes(out, data) ;
    return out ;
}

// [[Rcpp::export]]
DataFrame as_regular_df(DataFrame df){
  DataFrame copy( shallow_copy(df));
  SET_OBJECT(copy, OBJECT(df)) ;
  copy.attr("class") = CharacterVector::create("data.frame") ;
  return copy ;
}
