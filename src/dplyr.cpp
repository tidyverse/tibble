#include <tibble.h>

using namespace Rcpp ;
using namespace dplyr ;

SEXP promote(SEXP x){
    if( TYPEOF(x) == INTSXP ){
        IntegerVector data(x) ;
        if( Rf_inherits( x, "factor" ) ){
            Rf_warning( "coercing factor to character vector" ) ;
            CharacterVector levels = data.attr( "levels" ) ;
            int n = data.size() ;
            CharacterVector out( data.size() ) ;
            for( int i=0; i<n; i++ ){
                out[i] = levels[data[i]-1] ;
            }
            return out ;
        } else {
            return NumericVector(x) ;
        }
    }
    return x ;
}

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
dplyr::BoolResult compatible_data_frame( DataFrame& x, DataFrame& y, bool ignore_col_order = true, bool convert = false ){
    int n = x.size() ;

    CharacterVector names_x, names_y ;

    bool null_x = Rf_isNull(x.names()), null_y = Rf_isNull(y.names()) ;
    if( null_x && !null_y ){
        return no_because( "x does not have names, but y does") ;
    } else if( null_y && !null_x){
        return no_because( "y does not have names, but x does") ;
    } else if( null_x && null_y){
        names_x = CharacterVector(n) ;
        std::string v("v") ;
        for( int i=0; i<n; i++){
            std::stringstream ss ;
            ss << "v" << (i+1) ;
            names_x[i] = ss.str() ;
        }
        x = shallow_copy(x) ;
        x.names() = names_x ;

        int ny = y.size() ;
        names_y = CharacterVector(ny) ;
        for( int i=0; i<ny; i++){
            std::stringstream ss ;
            ss << "v" << (i+1) ;
            names_y[i] = ss.str()  ;
        }
        y = shallow_copy(y) ;
        y.names() = names_y ;


    } else {
        names_x = x.names() ;
        names_y = y.names() ;
    }

    CharacterVector names_y_not_in_x = setdiff( names_y, names_x );
    CharacterVector names_x_not_in_y = setdiff( names_x, names_y );
    std::stringstream ss ;
    bool ok = true ;

    if( !ignore_col_order ){
        if( names_y_not_in_x.size() == 0 && names_y_not_in_x.size() == 0 ){
            // so the names are the same, check if they are in the same order
            for( int i=0; i<n; i++){
                if( names_x[i] != names_y[i] ){
                    ok = false ;
                    break ;
                }
            }
            if( !ok ){
                ss <<  "Same column names, but different order" ;
                return no_because( ss.str() ) ;
            }
        }
    }

    if( names_y_not_in_x.size() ){
        ok = false ;
        ss << "Cols in y but not x: " << collapse(names_y_not_in_x) << ". ";
    }

    if( names_x_not_in_y.size() ){
        ok = false ;
        ss << "Cols in x but not y: " << collapse(names_x_not_in_y) << ". ";
    }

    if(!ok){
        return no_because( ss.str() ) ;
    }

    if( convert ){
        x = clone(x) ;
        y = clone(y) ;
        for( int i = 0; i<n; i++){
            x[i] = promote( x[i] ) ;
            y[i] = promote( y[i] ) ;
        }
    }

    DataFrameSubsetVisitors v_x( x, names_x );
    DataFrameSubsetVisitors v_y( y, names_x );

    ok = true ;
    for( int i=0; i<n; i++){
        SubsetVectorVisitor* visitor_x = v_x.get(i) ;
        SubsetVectorVisitor* visitor_y = v_y.get(i) ;

        String name = names_x[i];
        if(
          ( !convert && typeid(*visitor_x) != typeid(*visitor_y) ) ||
          ( ! visitor_x->is_compatible( visitor_y, ss, name ) )
        ){
            ss << "Incompatible type for column "
               << names_x[i]
               << ": x "
               << visitor_x->get_r_type()
               << ", y "
               << visitor_y->get_r_type() ;
            ok = false ;
        }
        if(convert && typeid(*visitor_x) != typeid(*visitor_y) ){
          Rf_warning("type coercion") ;
        }
    }
    if(!ok) return no_because( ss.str() ) ;
    return yes() ;
}

class RowTrack {
public:
    RowTrack( const std::string& msg, int max_count_ = 10 ) : ss(), count(0), max_count(max_count_) {
        ss << msg ;
    }

    void record( int i){
        if( count > max_count ) return ;
        if( count ) ss << ", " ;
        int idx = i >= 0 ? (i+1) : -i ;
        ss << idx ;
        if( count == max_count ) ss << "[...]" ;
        count++ ;
    }

    bool empty() const {
        return count == 0 ;
    }

    std::string str() const {
        return ss.str() ;
    }

private:
    std::stringstream ss ;
    int count ;
    int max_count ;
} ;

// [[Rcpp::export]]
dplyr::BoolResult equal_data_frame(DataFrame x, DataFrame y, bool ignore_col_order = true, bool ignore_row_order = true, bool convert = false ){
    BoolResult compat = compatible_data_frame(x, y, ignore_col_order, convert);
    if( !compat ) return compat ;

    typedef VisitorSetIndexMap<DataFrameJoinVisitors, std::vector<int> > Map ;
    DataFrameJoinVisitors visitors(x, y, x.names(), x.names(), true ) ;
    Map map(visitors);

    // train the map in both x and y
    int nrows_x = x.nrows() ;
    int nrows_y = y.nrows() ;

    if( nrows_x != nrows_y )
        return no_because( "Different number of rows" ) ;
    if( x.size() == 0 )
        return yes() ;

    for( int i=0; i<nrows_x; i++) map[i].push_back(i) ;
    for( int i=0; i<nrows_y; i++) map[-i-1].push_back(-i-1) ;

    RowTrack track_x( "Rows in x but not y: " ) ;
    RowTrack track_y( "Rows in y but not x: " ) ;
    RowTrack track_mismatch( "Rows with difference occurences in x and y: " ) ;

    bool ok = true ;
    Map::const_iterator it = map.begin() ;

    for( ; it != map.end(); ++it){
        // retrieve the indices ( -ves for y, +ves for x )
        const std::vector<int>& chunk = it->second ;
        int n = chunk.size() ;

        int count_left = 0, count_right = 0 ;
        for( int i=0; i<n; i++){
            if( chunk[i] < 0 )
                count_right++ ;
            else
                count_left++ ;
        }
        if( count_right == 0 ){
            track_x.record( chunk[0] ) ;
            ok = false ;
        } else if( count_left == 0){
            track_y.record( chunk[0] ) ;
            ok = false ;
        } else if( count_left != count_right ){
            track_mismatch.record( chunk[0] ) ;
            ok = false ;
        }

    }

    if(!ok){
        std::stringstream ss ;
        if( ! track_x.empty() ) ss << track_x.str() << ". " ;
        if( ! track_y.empty() ) ss << track_y.str() << ". " ;
        if( ! track_mismatch.empty() ) ss << track_mismatch.str() ;

        return no_because( ss.str() ) ;
    }

    if(ok && ignore_row_order) return yes();

    if( !ignore_row_order ){
        for( int i=0; i<nrows_x; i++){
            if( !visitors.equal( i, -i-1) ){
                    return no_because( "Same row values, but different order" ) ;
            }
        }
    }

    return yes() ;
}

// [[Rcpp::export]]
dplyr::BoolResult all_equal_data_frame( List args, Environment env ){
    int n = args.size() ;
    DataFrame x0 = Rf_eval( args[0], env) ;
    for( int i=1; i<n; i++){
        BoolResult test = equal_data_frame( x0, Rf_eval( args[i], env ) ) ;
        if( !test ) return test ;
    }
    return yes() ;
}

// [[Rcpp::export]]
DataFrame as_regular_df(DataFrame df){
  DataFrame copy( shallow_copy(df));
  SET_OBJECT(copy, OBJECT(df)) ;
  copy.attr("class") = CharacterVector::create("data.frame") ;
  return copy ;
}
