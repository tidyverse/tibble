# conStruct

Version: 1.0.1

## Newly broken

*   checking whether package ‘conStruct’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpcwuZam/filefdc61b7dc911/conStruct.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘conStruct’ ...
** package ‘conStruct’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/multiK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_multiK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=cov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/space_multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_oneK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/space_oneK.cc"
Error in readRDS("/tmp/RtmpcwuZam/filefdc660890f9e") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/RtmpcwuZam/filefdc660890f9e")
1: .Last()
Makevars:18: recipe for target 'stan_files/space_oneK.cc' failed
make: *** [stan_files/space_oneK.cc] Error 1
make: *** Waiting for unfinished jobs....
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/oneK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/oneK.cc"
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/multiK.cc -o stan_files/multiK.o
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc63de574d0/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/space_multiK.cc -o stan_files/space_multiK.o
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc63de574d0/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc63de574d0/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
rm stan_files/space_oneK.cc stan_files/multiK.cc stan_files/oneK.cc stan_files/space_multiK.cc
ERROR: compilation failed for package ‘conStruct’
* removing ‘/tmp/RtmpcwuZam/filefdc61b7dc911/conStruct.Rcheck/conStruct’

```
### CRAN

```
* installing *source* package ‘conStruct’ ...
** package ‘conStruct’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/multiK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/oneK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/oneK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_oneK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/space_oneK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_multiK.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=cov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/space_multiK.cc"
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/oneK.cc -o stan_files/oneK.o
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/multiK.cc -o stan_files/multiK.o
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/space_oneK.cc -o stan_files/space_oneK.o
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdc8709b3bf3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/space_multiK.cc -o stan_files/space_multiK.o
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdc8709b3bf3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdc8709b3bf3/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o conStruct.so stan_files/space_oneK.o stan_files/multiK.o stan_files/oneK.o stan_files/space_multiK.o init.o -L/usr/lib/R/lib -lR
rm stan_files/space_oneK.cc stan_files/multiK.cc stan_files/oneK.cc stan_files/space_multiK.cc
installing to /tmp/RtmpcwuZam/filefdc865218a7b/conStruct.Rcheck/conStruct/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=cov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.
Info: left-hand side variable (name=parCov) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (conStruct)

```
