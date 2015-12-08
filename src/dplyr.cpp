#include <dplyr.h>

using namespace Rcpp ;
using namespace dplyr ;

// [[Rcpp::export]]
DataFrame as_regular_df(DataFrame df){
  DataFrame copy( shallow_copy(df));
  SET_ATTRIB(copy, strip_group_attributes(df)) ;
  SET_OBJECT(copy, OBJECT(df)) ;
  copy.attr("class") = CharacterVector::create("data.frame") ;
  return copy ;
}
