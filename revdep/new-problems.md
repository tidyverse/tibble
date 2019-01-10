# breathteststan

Version: 0.4.7

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpJUnbGN/Rd2pdf2b2e12d693ea'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 40.6Mb
      sub-directories of 1Mb or more:
        libs  40.4Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

## Installation

### Devel

```
* installing *source* package ‘breathteststan’ ...
** package ‘breathteststan’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/breath_test_group_1.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/breath_test_group_1.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/breath_test_1.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/breath_test_1.cc"
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/breath_test_group_1.cc -o stan_files/breath_test_group_1.o
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_group_1.hpp:5,
                 from stan_files/breath_test_group_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_group_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/breath_test_1.cc -o stan_files/breath_test_1.o
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/breath_test_1.hpp:5,
                 from stan_files/breath_test_1.cc:3:
/tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd4ff61424bc3/Rcpp/include/Rcpp.h:27,
                 from stan_files/breath_test_1.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o breathteststan.so stan_files/breath_test_1.o stan_files/breath_test_group_1.o init.o -L/usr/lib/R/lib -lR
rm stan_files/breath_test_1.cc stan_files/breath_test_group_1.cc
installing to /tmp/Rtmpz1n4Mo/filed4ff69b3d1bf/breathteststan.Rcheck/breathteststan/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (breathteststan)

```
### CRAN

```
* installing *source* package ‘breathteststan’ ...
** package ‘breathteststan’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5337e157a49/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/breath_test_1.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/breath_test_1.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/breath_test_group_1.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/breath_test_group_1.cc"
Error in readRDS("/tmp/Rtmpz1n4Mo/filed5337d32e9c6") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/Rtmpz1n4Mo/filed5337d32e9c6")
1: .Last()
Makevars:17: recipe for target 'stan_files/breath_test_group_1.cc' failed
make: *** [stan_files/breath_test_group_1.cc] Error 1
rm stan_files/breath_test_1.cc stan_files/breath_test_group_1.cc
ERROR: compilation failed for package ‘breathteststan’
* removing ‘/tmp/Rtmpz1n4Mo/filed53338b32c0d/breathteststan.Rcheck/breathteststan’

```
# codemetar

Version: 0.1.6

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: create_codemeta("codemetar", codemeta) at /tmp/RtmpE9f4Dz/R.INSTALL11164857742e/rlang/R/eval.R:99
      5: add_github_topics(cm) at /tmp/Rtmpz1n4Mo/filed525199b7e0a/codemetar.Rcheck/00_pkg_src/codemetar/R/create_codemeta.R:85
      6: gh::gh("GET /repos/:owner/:repo/topics", repo = repo, owner = owner, .send_headers = c(Accept = "application/vnd.github.mercy-preview+json")) at /tmp/Rtmpz1n4Mo/filed525199b7e0a/codemetar.Rcheck/00_pkg_src/codemetar/R/guess_metadata.R:251
      7: gh_process_response(raw) at /tmp/RtmpW6qOYu/R.INSTALLc80a541ee26e/gh/R/package.R:121
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 73 SKIPPED: 10 FAILED: 5
      1. Error: add_github_topics (@test-guess_metadata.R#103) 
      2. Error: we can write a codemeta document given a package name (@test-write_codemeta.R#4) 
      3. Error: We can read an existing codemeta.json file (@test-write_codemeta.R#29) 
      4. Error: We can use either a path or pkg name in writing (@test-write_codemeta.R#38) 
      5. Error: we can write codemeta given a codemeta object (@test-write_codemeta.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 79-80 (codemeta-intro.Rmd) 
    Error: processing vignette 'codemeta-intro.Rmd' failed with diagnostics:
    GitHub API error (403): 403 Forbidden
      API rate limit exceeded for 13.71.27.76. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)
    Execution halted
    ```

# gastempt

Version: 0.4.3

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/Rtmp2WbXvZ/Rd2pdf5cb94e3cc27a'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 109.3Mb
      sub-directories of 1Mb or more:
        libs  108.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘methods’ ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

## Installation

### Devel

```
* installing *source* package ‘gastempt’ ...
** package ‘gastempt’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1b.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1d.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1d.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1c.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_2b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_2b.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/powexp_gastro_2c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/powexp_gastro_2c.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/powexp_gastro_1b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/powexp_gastro_1b.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_2c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_2c.cc"
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linexp_gastro_1b.cc -o stan_files/linexp_gastro_1b.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1b.hpp:12,
                 from stan_files/linexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linexp_gastro_1d.cc -o stan_files/linexp_gastro_1d.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1d.hpp:12,
                 from stan_files/linexp_gastro_1d.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1d.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linexp_gastro_1c.cc -o stan_files/linexp_gastro_1c.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_1c.hpp:12,
                 from stan_files/linexp_gastro_1c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_1c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/powexp_gastro_2c.cc -o stan_files/powexp_gastro_2c.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_2c.hpp:12,
                 from stan_files/powexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/powexp_gastro_1b.cc -o stan_files/powexp_gastro_1b.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/powexp_gastro_1b.hpp:12,
                 from stan_files/powexp_gastro_1b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/powexp_gastro_1b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linexp_gastro_2c.cc -o stan_files/linexp_gastro_2c.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2c.hpp:12,
                 from stan_files/linexp_gastro_2c.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2c.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linexp_gastro_2b.cc -o stan_files/linexp_gastro_2b.o
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/integer_log2.hpp:19:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/large_arithmetic.hpp:19,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/detail/const_mod.hpp:23,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/linear_congruential.hpp:30,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/random/additive_combine.hpp:27,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:15,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp: At global scope:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/pending/integer_log2.hpp:7:89: note: #pragma message: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead.
In file included from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linexp_gastro_2b.hpp:12,
                 from stan_files/linexp_gastro_2b.cc:3:
/tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/RcppCommon.h:52,
                 from /tmp/Rtmpz1n4Mo/checklibd5116ad05ec9/Rcpp/include/Rcpp.h:27,
                 from stan_files/linexp_gastro_2b.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o gastempt.so stan_files/linexp_gastro_1d.o stan_files/linexp_gastro_1c.o stan_files/linexp_gastro_2b.o stan_files/powexp_gastro_2c.o stan_files/powexp_gastro_1b.o stan_files/linexp_gastro_2c.o stan_files/linexp_gastro_1b.o init.o -L/usr/lib/R/lib -lR
rm stan_files/linexp_gastro_2c.cc stan_files/linexp_gastro_1d.cc stan_files/powexp_gastro_2c.cc stan_files/linexp_gastro_1b.cc stan_files/linexp_gastro_2b.cc stan_files/linexp_gastro_1c.cc stan_files/powexp_gastro_1b.cc
installing to /tmp/Rtmpz1n4Mo/filed5114d576e8f/gastempt.Rcheck/gastempt/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
code for methods in class “Rcpp_model_linexp_gastro_1b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_1b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_1c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_1c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_1d” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_1d” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_2b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_2b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_2c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_linexp_gastro_2c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_powexp_gastro_1b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_powexp_gastro_1b” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_powexp_gastro_2c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_model_powexp_gastro_2c” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
* DONE (gastempt)

```
### CRAN

```
* installing *source* package ‘gastempt’ ...
** package ‘gastempt’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/StanHeaders/include" -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/rstan/include" -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/BH/include" -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/Rcpp/include" -I"/tmp/Rtmpz1n4Mo/checklibd5324b37e3e1/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/powexp_gastro_1b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/powexp_gastro_1b.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1d.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1d.cc"
Error in readRDS("/tmp/Rtmpz1n4Mo/filed5326e751390") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/Rtmpz1n4Mo/filed5326e751390")
1: .Last()
Makevars:17: recipe for target 'stan_files/linexp_gastro_1d.cc' failed
make: *** [stan_files/linexp_gastro_1d.cc] Error 1
make: *** Waiting for unfinished jobs....
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1c.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_2b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_2b.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/powexp_gastro_2c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/powexp_gastro_2c.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_2c.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_2c.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linexp_gastro_1b.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = $(wildcard stan_files/*.stan)
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linexp_gastro_1b.cc"
rm stan_files/linexp_gastro_2c.cc stan_files/linexp_gastro_1d.cc stan_files/powexp_gastro_2c.cc stan_files/linexp_gastro_1b.cc stan_files/linexp_gastro_2b.cc stan_files/linexp_gastro_1c.cc stan_files/powexp_gastro_1b.cc
ERROR: compilation failed for package ‘gastempt’
* removing ‘/tmp/Rtmpz1n4Mo/filed532523929d5/gastempt.Rcheck/gastempt’

```
# pkgcache

Version: 1.0.2

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpvG7oTt/Rd2pdfb05a6784cfdf'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

## Installation

### Devel

```
* installing *source* package ‘pkgcache’ ...
** package ‘pkgcache’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded
* DONE (pkgcache)

```
### CRAN

```
* installing *source* package ‘pkgcache’ ...
** package ‘pkgcache’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded
Error: package or namespace load failed for ‘pkgcache’:
 .onLoad failed in loadNamespace() for 'pkgcache', details:
  call: .name_repair != name_repair
  error: comparison (2) is possible only for atomic and list types
Error: loading failed
3: traceback(1)
2: stop("loading failed", call. = FALSE)
1: tools:::.test_load_package("pkgcache", "/tmp/Rtmpz1n4Mo/filed51e4ddf9ab4/pkgcache.Rcheck")
ERROR: loading failed
* removing ‘/tmp/Rtmpz1n4Mo/filed51e4ddf9ab4/pkgcache.Rcheck/pkgcache’

```
