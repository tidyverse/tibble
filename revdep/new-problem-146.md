# bsts

Version: 0.8.0

## Newly broken

*   checking whether package ‘bsts’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpcwuZam/filefdf5682e1b80/bsts.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aggregate_time_series.cc -o aggregate_time_series.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
Error in readRDS("/tmp/RtmpcwuZam/filefdf54e21511a") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefdf54e21511a"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last()/include: No such file or directory
/usr/lib/R/etc/Makeconf:166: recipe for target 'aggregate_time_series.o' failed
make: *** [aggregate_time_series.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts_init.cc -o bsts_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c model_manager.cc -o model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
Error in readRDS("/tmp/RtmpcwuZam/filefdf54e21511a") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefdf54e21511a"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last()/include: No such file or directory
/usr/lib/R/etc/Makeconf:166: recipe for target 'model_manager.o' failed
make: *** [model_manager.o] Error 1
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c get_date_ranges.cc -o get_date_ranges.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c utils.cc -o utils.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_gaussian_model_manager.cc -o state_space_gaussian_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mixed_frequency.cc -o mixed_frequency.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_poisson_model_manager.cc -o state_space_poisson_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts.cc -o bsts.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_logit_model_manager.cc -o state_space_logit_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_student_model_manager.cc -o state_space_student_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_regression_model_manager.cc -o state_space_regression_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdf559159c17/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
ERROR: compilation failed for package ‘bsts’
* removing ‘/tmp/RtmpcwuZam/filefdf5682e1b80/bsts.Rcheck/bsts’

```
### CRAN

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts_init.cc -o bsts_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aggregate_time_series.cc -o aggregate_time_series.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c get_date_ranges.cc -o get_date_ranges.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c utils.cc -o utils.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_poisson_model_manager.cc -o state_space_poisson_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_logit_model_manager.cc -o state_space_logit_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_gaussian_model_manager.cc -o state_space_gaussian_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c model_manager.cc -o model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts.cc -o bsts.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mixed_frequency.cc -o mixed_frequency.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_student_model_manager.cc -o state_space_student_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_regression_model_manager.cc -o state_space_regression_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o bsts.so aggregate_time_series.o bsts.o bsts_init.o get_date_ranges.o mixed_frequency.o model_manager.o state_space_gaussian_model_manager.o state_space_logit_model_manager.o state_space_poisson_model_manager.o state_space_regression_model_manager.o state_space_student_model_manager.o utils.o /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/lib/libboom.a -L/usr/lib/R/lib -lR
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
installing to /tmp/RtmpcwuZam/filefdecf907f28/bsts.Rcheck/bsts/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (bsts)

```
