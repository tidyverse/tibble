# DeLorean

Version: 1.5.0

## Newly broken

*   checking whether package ‘DeLorean’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpcwuZam/filefdd8720f62c7/DeLorean.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘DeLorean’ ...
** package ‘DeLorean’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd816056340/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/lowranksizes.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/lowranksizes.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/exactsizes.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/exactsizes.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/lowrank.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/lowrank.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/exact.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/exact.cc"
Error in readRDS("/tmp/RtmpcwuZam/filefdd8cebbbfd") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/RtmpcwuZam/filefdd8cebbbfd")
1: .Last()
Makevars:17: recipe for target 'stan_files/exact.cc' failed
make: *** [stan_files/exact.cc] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd816056340/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/exactsizes.cc -o stan_files/exactsizes.o
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd816056340/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/lowrank.cc -o stan_files/lowrank.o
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd816056340/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/lowranksizes.cc -o stan_files/lowranksizes.o
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd816056340/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd816056340/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
rm stan_files/exact.cc stan_files/exactsizes.cc stan_files/lowranksizes.cc stan_files/lowrank.cc
ERROR: compilation failed for package ‘DeLorean’
* removing ‘/tmp/RtmpcwuZam/filefdd8720f62c7/DeLorean.Rcheck/DeLorean’

```
### CRAN

```
* installing *source* package ‘DeLorean’ ...
** package ‘DeLorean’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/lowranksizes.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/lowranksizes.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/exactsizes.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/exactsizes.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/exact.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/exact.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/lowrank.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error
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
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

Wrote C++ file "stan_files/lowrank.cc"
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/exactsizes.cc -o stan_files/exactsizes.o
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exactsizes.hpp:25,
                 from stan_files/exactsizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exactsizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/lowrank.cc -o stan_files/lowrank.o
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowrank.hpp:25,
                 from stan_files/lowrank.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowrank.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/exact.cc -o stan_files/exact.o
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/exact.hpp:25,
                 from stan_files/exact.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/exact.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/RcppEigen/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/lowranksizes.cc -o stan_files/lowranksizes.o
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/lowranksizes.hpp:25,
                 from stan_files/lowranksizes.cc:3:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdd454a8c3ac/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdd454a8c3ac/Rcpp/include/Rcpp.h:27,
                 from stan_files/lowranksizes.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o DeLorean.so stan_files/lowranksizes.o stan_files/lowrank.o stan_files/exactsizes.o stan_files/exact.o init.o -L/usr/lib/R/lib -lR
rm stan_files/exact.cc stan_files/exactsizes.cc stan_files/lowranksizes.cc stan_files/lowrank.cc
installing to /tmp/RtmpcwuZam/filefdd41343089e/DeLorean.Rcheck/DeLorean/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

DIAGNOSTIC(S) FROM PARSER:
Info: left-hand side variable (name=result) occurs on right-hand side of assignment, causing inefficient deep copy to avoid aliasing.

** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (DeLorean)

```
