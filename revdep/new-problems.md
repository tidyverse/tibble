# anomalize

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Needed to pass CRAN check / This is loaded by default
    > set_time_scale_template(time_scale_template())
    > 
    > data(tidyverse_cran_downloads)
    > 
    > tidyverse_cran_downloads %>%
    +     time_decompose(count, method = "stl") %>%
    +     anomalize(remainder, method = "iqr")
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Must pass a scalar integer as `nrow` argument to `new_tibble()`..
    Calls: %>% ... <Anonymous> -> <Anonymous> -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 14 SKIPPED: 0 FAILED: 21
      1. Error: iqr_grouped_df works (@test-anomalize.R#32) 
      2. Error: gesd_grouped_df works (@test-anomalize.R#45) 
      3. Error: returns a ggplot (@test-plot_anomalies.R#8) 
      4. Error: returns a ggplot (@test-plot_anomaly_decomposition.R#10) 
      5. Error: converts tibble to tbl_time (@test-prep_tbl_time.R#14) 
      6. Error: tbl_time returns tbl_time (@test-prep_tbl_time.R#19) 
      7. Error: grouped_tbl_time works (@test-time_apply.R#11) 
      8. Error: tbl_time works (@test-time_apply.R#17) 
      9. Error: single tbl_df (@test-time_decompose.R#14) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 72-81 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# anomalyDetection

Version: 0.2.5

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 159-164 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 19 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# atlantistools

Version: 0.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             1)), .)))) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      7: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      8: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      9: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      10: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      11: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      12: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      13: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 195 SKIPPED: 1 FAILED: 1
      1. Error: (unknown) (@test-diet-fishbase.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bayesammi

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Bayesian Estimation of the Additive Main Effects and
    > ###   Multiplicative Interaction Model
    > ### Aliases: bayes_ammi bayes_ammi.default
    > 
    > ### ** Examples
    > 
    > 
    > data(Maiz)
    > 
    > fm1 <-
    +  bayes_ammi(
    +      .data  = Maiz
    +    , .y     = y
    +    , .gen   = entry
    +    , .env   = site
    +    , .rep   = rep
    +    , .nIter = 20
    +   )
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# BayesMallows

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesMallows-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_constraints
    > ### Title: Generate Constraint Set from Pairwise Comparisons
    > ### Aliases: generate_constraints
    > 
    > ### ** Examples
    > 
    > # Here is an example with the beach preference data.
    > # First, generate the transitive closure.
    > beach_tc <- generate_transitive_closure(beach_preferences)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: as_tibble.matrix(.generate_transitive_closure(cbind(.data$bottom_item, .data$top_item))) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      10: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      11: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      12: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      13: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      14: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      15: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      16: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 75 SKIPPED: 1 FAILED: 1
      1. Error: transitive closure generation works (@test_pairwise_functions.R#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 448-449 (BayesMallowsPackage.Rmd) 
    Error: processing vignette 'BayesMallowsPackage.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# baystability

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ge_means0 <- fm1$ge_means$ge_means
    > 
    > data(cultivo2008)
    > 
    > fm2 <-
    +  ge_ammi(
    +    .data = cultivo2009
    +    , .y    = y
    +    , .gen  = entry
    +    , .env  = site
    +    , .rep  = rep
    +   )
    > 
    > k        <- fm2$k
    > alphasa  <- fm2$alphas
    > gammasa  <- fm2$gammas
    > 
    > alphas1  <- tibble::as_tibble(fm2$alphas)
    Error: Columns 1, 2, 3, 4, 5, … (and 6 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# beadplexr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(beadplexr)
    > library(magrittr)
    > library(ggplot2)
    > 
    > data("lplex")
    > 
    > lplex[[1]] %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    > 
    > lplex[[1]] %>%
    +   despeckle(.parameters = c("FL6-H", "FL2-H"), .neighbours = 8) %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    Loading required namespace: igraph
    Error: Columns 1, 2, 3, 4, 5, … (and 109 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: as_tibble.matrix(x, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      16: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      17: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      18: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      19: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      20: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      21: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      22: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 4574 SKIPPED: 1 FAILED: 1
      1. Error: Despeckle works (@test_despeckle.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 140-146 (cba_macsplex_example.Rmd) 
    Error: processing vignette 'cba_macsplex_example.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 249 more) must be named.
    Execution halted
    ```

# blorr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘blorr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: blr_multi_model_fit_stats
    > ### Title: Multi model fit statistics
    > ### Aliases: blr_multi_model_fit_stats blr_multi_model_fit_stats.default
    > 
    > ### ** Examples
    > 
    > model <- glm(honcomp ~ female + read + science, data = hsb2,
    + family = binomial(link = 'logit'))
    > 
    > model2 <- glm(honcomp ~ female + read + math, data = hsb2,
    + family = binomial(link = 'logit'))
    > 
    > blr_multi_model_fit_stats(model, model2)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                           Added/                                                  
      Step    Variable    Removed        AIC           BIC           C(p)       
      ----------------------------------------------------------------------
         1       x6       addition     18869.627     18885.434    18865.6270    
         2       x1       addition     18571.376     18595.087    18565.3760    
         3       x3       addition     18016.724     18048.338    18008.7240    
         4       x2       addition     16642.374     16681.891    16632.3740    
         5       x5       addition     16640.883     16688.304    16628.8830    
         6       x6       removal      16639.219     16678.736    16629.2190    
      ----------------------------------------------------------------------══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 76 SKIPPED: 28 FAILED: 1
      1. Error: blr_multi_model_fit_stats prints the correct output (@test-model-fit-stats.R#154) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# BMSC

Version: 0.1.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/Rtmpz3yA2h/Rd2pdfddd8428b7803'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 65.6Mb
      sub-directories of 1Mb or more:
        libs  65.1Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘BMSC’ ...
** package ‘BMSC’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoeUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegHorseHoeUnConstr.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegUnConstr.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linReg.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linReg.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoe.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegHorseHoe.cc"
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegUnConstr.cc -o stan_files/linRegUnConstr.o
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linReg.cc -o stan_files/linReg.o
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoeUnConstr.cc -o stan_files/linRegHorseHoeUnConstr.o
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib33243cddafed/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoe.cc -o stan_files/linRegHorseHoe.o
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib33243cddafed/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib33243cddafed/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o BMSC.so stan_files/linReg.o stan_files/linRegHorseHoe.o stan_files/linRegHorseHoeUnConstr.o stan_files/linRegUnConstr.o init.o -L/usr/lib/R/lib -lR
rm stan_files/linRegUnConstr.cc stan_files/linRegHorseHoe.cc stan_files/linRegHorseHoeUnConstr.cc stan_files/linReg.cc
installing to /tmp/RtmpSwdSvf/file332429d7ad5d/BMSC.Rcheck/BMSC/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (BMSC)

```
### CRAN

```
* installing *source* package ‘BMSC’ ...
** package ‘BMSC’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoe.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegHorseHoe.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linReg.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linReg.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegUnConstr.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoeUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
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
Wrote C++ file "stan_files/linRegHorseHoeUnConstr.cc"
Error in readRDS("/tmp/RtmpSwdSvf/file334024fd2f35") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/RtmpSwdSvf/file334024fd2f35")
1: .Last()
Makevars:18: recipe for target 'stan_files/linRegHorseHoeUnConstr.cc' failed
make: *** [stan_files/linRegHorseHoeUnConstr.cc] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linReg.cc -o stan_files/linReg.o
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegUnConstr.cc -o stan_files/linRegUnConstr.o
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib334012465a7b/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoe.cc -o stan_files/linRegHorseHoe.o
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib334012465a7b/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib334012465a7b/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
rm stan_files/linRegUnConstr.cc stan_files/linRegHorseHoe.cc stan_files/linRegHorseHoeUnConstr.cc stan_files/linReg.cc
ERROR: compilation failed for package ‘BMSC’
* removing ‘/tmp/RtmpSwdSvf/file334042035138/BMSC.Rcheck/BMSC’

```
# breathtestcore

Version: 0.4.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      ── 2. Failure: A list of data frames is concatenated, comments are concatenated 
      comment(d) not identical to "A".
      1/1 mismatches
      x[1]: "A\n2 records,  m = 40±10, k =  0.010±0.003, beta = 2.00±0.40,\nGaussian n
      x[1]: oise amplitude = 1, 0% missing"
      y[1]: "A"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 356 SKIPPED: 5 FAILED: 2
      1. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#136) 
      2. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#145) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# broom

Version: 0.5.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > 
    > if (require("lavaan", quietly = TRUE)) {
    + 
    +  library(lavaan)
    + 
    +  cfa.fit <- cfa(
    +    'F =~ x1 + x2 + x3 + x4 + x5',
    +    data = HolzingerSwineford1939, group = "school"
    +  )
    +  glance(cfa.fit)
    + 
    + }
    This is lavaan 0.6-3
    lavaan is BETA software! Please report any bugs.
    Warning: Calling `as_tibble()` on a vector is discouraged, because the behavior is likely to change in the future. Use `enframe(name = NULL)` instead.
    Error in .f(.x[[i]], ...) : object 'rmsea.ci.upper' not found
    Calls: glance ... <Anonymous> -> vars_rename_eval -> map_if -> map -> .f
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      7: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      8: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      9: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      10: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      11: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 872 SKIPPED: 2 FAILED: 4
      1. Error: tidy.table (@test-base.R#34) 
      2. Error: glance.lavaan (@test-lavaan.R#45) 
      3. Error: polygon tidiers work (@test-sp.R#20) 
      4. Error: line tidiers work (@test-sp.R#73) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# caffsim

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘caffsim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: caffConcTime
    > ### Title: Create a dataset of the concentration-time curve of single oral
    > ###   administration of caffeine
    > ### Aliases: caffConcTime
    > 
    > ### ** Examples
    > 
    > caffConcTime(Weight = 20, Dose = 200, N = 20)
    Error: Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# circumplex

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘circumplex-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ssm_analyze
    > ### Title: Perform analyses using the Structural Summary Method
    > ### Aliases: ssm_analyze
    > 
    > ### ** Examples
    > 
    > # Load example data
    > data("jz2017")
    > 
    > # Single-group mean-based SSM
    > ssm_analyze(jz2017, scales = PA:NO, angles = octants())
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 98 SKIPPED: 6 FAILED: 10
      1.  Error: The norms function detects when no norms are available (@test-instrument_oop.R#86) 
      2.  Error: Single-group mean-based SSM results are correct (@test-ssm_analysis.R#6) 
      3.  Error: Scale magnitudes greater than 5 trigger message (@test-ssm_analysis.R#171) 
      4.  Error: Single-group correlation-based SSM results are correct (@test-ssm_analysis.R#184) 
      5.  Error: Single-group mean-based SSM plot is correct (@test-ssm_visualization.R#5) 
      6.  Error: Single-group correlation-based SSM plot is correct (@test-ssm_visualization.R#17) 
      7.  Error: Measure-contrast SSM plot is correct (@test-ssm_visualization.R#27) 
      8.  Error: Group-contrast correlation-based SSM plot is correct (@test-ssm_visualization.R#40) 
      9.  Error: Removing plots with low fit works as expected (@test-ssm_visualization.R#54) 
      10. Error: SSM Table captions are correct (@test-ssm_visualization.R#61) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 26-31 (intermediate-ssm-analysis.Rmd) 
    Error: processing vignette 'intermediate-ssm-analysis.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# clustree

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustree
    > ### Title: Plot a clustering tree
    > ### Aliases: clustree clustree.matrix clustree.data.frame
    > ###   clustree.SingleCellExperiment clustree.seurat
    > 
    > ### ** Examples
    > 
    > data(iris_clusts)
    > clustree(iris_clusts, prefix = "K")
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 20
      1. Error: node_colour aesthetic works (@test-aesthetics.R#6) 
      2. Error: static node_colour works (@test-aesthetics.R#19) 
      3. Error: node_size aesthetic works (@test-aesthetics.R#30) 
      4. Error: static node_size works (@test-aesthetics.R#43) 
      5. Error: node_alpha aesthetic works (@test-aesthetics.R#52) 
      6. Error: static node_size works (@test-aesthetics.R#65) 
      7. Error: all static works (@test-aesthetics.R#76) 
      8. Error: layout argument works (@test-aesthetics.R#82) 
      9. Error: data.frame interface works (@test-clustree-overlay.R#23) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 77-78 (clustree.Rmd) 
    Error: processing vignette 'clustree.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# colorednoise

Version: 1.0.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘colorednoise-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: matrix_model
    > ### Title: Temporally Autocorrelated Matrix Population Models
    > ### Aliases: matrix_model
    > 
    > ### ** Examples
    > 
    > meanMat <- matrix(c(0.55, 0.6, 0.24, 0.4), byrow = TRUE, ncol = 2)
    > sdMat <- matrix(c(0.3, 0.35, 0.05, 0.1), byrow = TRUE, ncol = 2)
    > phiMat <- matrix(c(-0.2, -0.2, 0, 0), byrow = TRUE, ncol = 2)
    > initialPop <- c(100, 100)
    > sim <- matrix_model(list(meanMat, sdMat, phiMat), initialPop, 50)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      14: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      15: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 6 SKIPPED: 0 FAILED: 3
      1. Error: colored_multi_rnorm can produce red noise (@test_noise.R#29) 
      2. Error: colored_multi_rnorm can produce blue noise (@test_noise.R#37) 
      3. Error: matrix_model can produce cross-correlated autocorrelated populations with demographic stochasticity (@test_simulations.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# conStruct

Version: 1.0.2

## Newly broken

*   checking whether package ‘conStruct’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpSwdSvf/file33551532d723/conStruct.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘conStruct’ ...
** package ‘conStruct’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/rstan/include" -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/BH/include" -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib3355649d8cd9/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/multiK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_oneK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/space_oneK.cc"
Error in readRDS("/tmp/RtmpSwdSvf/file33556e37ce59") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/RtmpSwdSvf/file33556e37ce59")
1: .Last()
Makevars:18: recipe for target 'stan_files/space_oneK.cc' failed
make: *** [stan_files/space_oneK.cc] Error 1
make: *** Waiting for unfinished jobs....
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/oneK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/oneK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_multiK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/space_multiK.cc"
rm stan_files/space_oneK.cc stan_files/multiK.cc stan_files/oneK.cc stan_files/space_multiK.cc
ERROR: compilation failed for package ‘conStruct’
* removing ‘/tmp/RtmpSwdSvf/file33551532d723/conStruct.Rcheck/conStruct’

```
### CRAN

```
* installing *source* package ‘conStruct’ ...
** package ‘conStruct’ successfully unpacked and MD5 sums checked
** libs
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_multiK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/space_multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/space_oneK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/space_oneK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/multiK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/multiK.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/oneK.stan
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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
Wrote C++ file "stan_files/oneK.cc"
Compiling with: 
STANHEADERS_SRC = $(shell "$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "message()" -e "cat(system.file('include', 'src', package = 'StanHeaders', mustWork = TRUE))" -e "message()" | grep "StanHeaders")
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


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/space_multiK.cc -o stan_files/space_multiK.o
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_multiK.hpp:18,
                 from stan_files/space_multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_multiK.cc:1:
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
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/oneK.cc -o stan_files/oneK.o
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/oneK.hpp:18,
                 from stan_files/oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/oneK.cc:1:
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
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/space_oneK.cc -o stan_files/space_oneK.o
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/space_oneK.hpp:18,
                 from stan_files/space_oneK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/space_oneK.cc:1:
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
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean


g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include" -I"/tmp/RtmpSwdSvf/checklib333c78e6594c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/multiK.cc -o stan_files/multiK.o
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/multiK.hpp:18,
                 from stan_files/multiK.cc:3:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpSwdSvf/checklib333c78e6594c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpSwdSvf/checklib333c78e6594c/Rcpp/include/Rcpp.h:27,
                 from stan_files/multiK.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o conStruct.so stan_files/space_oneK.o stan_files/multiK.o stan_files/oneK.o stan_files/space_multiK.o init.o -L/usr/lib/R/lib -lR
rm stan_files/space_oneK.cc stan_files/multiK.cc stan_files/oneK.cc stan_files/space_multiK.cc
installing to /tmp/RtmpSwdSvf/file333c1b017d2f/conStruct.Rcheck/conStruct/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (conStruct)

```
# corrr

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos) at /tmp/RtmpCghJ5z/R.INSTALLbb0d15584d20/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpCghJ5z/R.INSTALLbb0d15584d20/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/RtmpJuVtR0/R.INSTALL897d18389bd1/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/RtmpJuVtR0/R.INSTALL897d18389bd1/purrr/R/map.R:104
      26: -rowname at /tmp/Rtmpalrjoj/R.INSTALL392a7b7c7568/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpCghJ5z/R.INSTALLbb0d15584d20/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dexter

Version: 0.8.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      21: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      22: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      23: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      24: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      25: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      26: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ==
      ==
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 56 SKIPPED: 5 FAILED: 1
      1. Error: calibration of verbal aggression dataset matches oplm results, with fixed and unfixed (@test_enorm.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# docxtractr

Version: 0.5.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > doc3 <- read_docx(system.file("examples/data3.docx", package="docxtractr"))
    > docx_extract_tbl(doc3, 3)
    Warning: Must use a character vector as names.
    # A tibble: 6 x 2
      Foo   Bar  
      <chr> <chr>
    1 Aa    Bb   
    2 Dd    Ee   
    3 Gg    Hh   
    4 1     2    
    5 Zz    Jj   
    6 Tt    ii   
    > 
    > intracell_whitespace <- read_docx(system.file("examples/preserve.docx", package="docxtractr"))
    > docx_extract_tbl(intracell_whitespace, 2, preserve=FALSE)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# drake

Version: 6.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘drake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_plan
    > ### Title: Create a plan that maps a function to a grid of arguments.
    > ### Aliases: map_plan
    > 
    > ### ** Examples
    > 
    > # For the full tutorial, visit
    > # https://ropenscilabs.github.io/drake-manual/plans.html#map_plan.
    > my_model_fit <- function(x1, x2, data){
    +   lm(as.formula(paste("mpg ~", x1, "+", x1)), data = data)
    + }
    > covariates <- setdiff(colnames(mtcars), "mpg")
    > args <- tibble::as_tibble(t(combn(covariates, 2)))
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# epidata

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epidata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_annual_wages_and_work_hours
    > ### Title: Retreive CPS ASEC Annual Wages and Work Hours
    > ### Aliases: get_annual_wages_and_work_hours
    > 
    > ### ** Examples
    > 
    > get_annual_wages_and_work_hours()
    Error: Columns 1, 2, 3, 4, 5, … (and 2 more) must be named.
    Execution halted
    ```

# frequencies

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘frequencies-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: freq_two_vects
    > ### Title: freq_two_vects
    > ### Aliases: freq_two_vects
    > 
    > ### ** Examples
    > 
    > # Sample data frame to demo the freq_two_vects function.
    > df <- data.frame(gender = sample(c('m','f'), 200, replace = TRUE),
    +                  ethnicity = sample(c('african american', 'asian', 'caucasian',
    +                                    'hispanic', 'other'),
    +                                    200, replace = TRUE),
    +                  stringsAsFactors = FALSE)
    > 
    > freq_two_vects(df, gender, ethnicity, FALSE)
    Error in grouped_df_impl(data, unname(vars), drop) : 
      Column `get.col1.` is unknown
    Calls: freq_two_vects ... group_by.data.frame -> grouped_df -> grouped_df_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: `_fseq`(`_lhs`)
      10: freduce(value, `_function_list`) at /tmp/RtmpzT4itO/R.INSTALL53fc1dade66f/magrittr/R/pipe.R:28
      11: function_list[[i]](value) at /tmp/RtmpzT4itO/R.INSTALL53fc1dade66f/magrittr/R/freduce.R:17
      12: dplyr::group_by(., get.col1.)
      13: group_by.data.frame(., get.col1.) at /tmp/RtmpVNfmtz/R.INSTALLaf254ddc6f91/dplyr/R/group-by.r:76
      14: grouped_df(groups$data, groups$group_names) at /tmp/RtmpVNfmtz/R.INSTALLaf254ddc6f91/dplyr/R/dataframe.R:34
      15: grouped_df_impl(data, unname(vars), drop) at /tmp/RtmpVNfmtz/R.INSTALLaf254ddc6f91/dplyr/R/grouped-df.r:25
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 24 SKIPPED: 0 FAILED: 2
      1. Error: numbers and letters aggregations are correct (@test_freq_two_vects.R#44) 
      2. Error: dates and logicals aggregations are correct (@test_freq_two_vects.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# genBaRcode

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘genBaRcode-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotClusterGgTree
    > ### Title: Plotting a Cluster ggTree
    > ### Aliases: plotClusterGgTree
    > 
    > ### ** Examples
    > 
    > data(BC_dat)
    > plotClusterGgTree(BC_dat, tree_est = "UPGMA", type = "circular")
    Error in as.data.frame.default(value, stringsAsFactors = FALSE) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: plotClusterGgTree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

# ggfan

Version: 0.1.2

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 117-125 (ggfan_stan.Rmd) 
    Error: processing vignette 'ggfan_stan.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 995 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# ggsn

Version: 0.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Loading required package: sp
    rgdal: version: 1.3-6, (SVN revision 773)
     Geospatial Data Abstraction Library extensions to R successfully loaded
     Loaded GDAL runtime: GDAL 2.1.3, released 2017/20/01
     Path to GDAL shared files: /usr/share/gdal/2.1
     GDAL binary built with GEOS: TRUE 
     Loaded PROJ.4 runtime: Rel. 4.9.2, 08 September 2015, [PJ_VERSION: 492]
     Path to PROJ.4 shared files: (autodetected)
     Linking to sp version: 1.3-1 
    > library(broom)
    > dsn <- system.file('extdata', package = 'ggsn')
    > map <- readOGR(dsn, 'sp')
    OGR data source with driver: ESRI Shapefile 
    Source: "/tmp/RtmpSwdSvf/file33512e2cd56d/ggsn.Rcheck/ggsn/extdata", layer: "sp"
    with 96 features
    It has 2 fields
    > map@data$id <- 0:(nrow(map@data) - 1)
    > map.df <- merge(tidy(map), map, by = 'id')
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# ggspatial

Version: 1.0.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggspatial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: geom_polypath
    > ### Title: Polygons with holes in ggplot2
    > ### Aliases: geom_polypath
    > 
    > ### ** Examples
    > 
    > load_longlake_data()
    > ggplot(df_spatial(longlake_waterdf), aes(x, y, group = piece_id)) +
    +   geom_polypath()
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      20: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      21: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      22: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      23: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      24: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      25: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 62 SKIPPED: 0 FAILED: 3
      1. Error: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      2. Error: polypath works as intended (@test-geom-polypath.R#5) 
      3. Error: geom_spatial_* geoms work properly (@test-geom_spatial.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggtree

Version: 1.12.7

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggtree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: facet_plot
    > ### Title: facet_plot
    > ### Aliases: facet_plot
    > 
    > ### ** Examples
    > 
    > tr <- rtree(10)
    > dd = data.frame(id=tr$tip.label, value=abs(rnorm(10)))
    > p <- ggtree(tr)
    Error in as.data.frame.default(value, stringsAsFactors = FALSE) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: ggtree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 7
      1. Error: collapse tree to polytomy (@test-conversion.R#7) 
      2. Error: geom_balance gives proper errors if called on non-binary node (@test-geom_balance.R#12) 
      3. Error: geom_cladelabel support parsing expression (@test-geom_cladelabel.R#5) 
      4. Error: groupOTU (@test-group.R#7) 
      5. Error: groupClade (@test-group.R#28) 
      6. Error: dummy layer to set x axis limits of Tree panel (@test-xlim_expand.R#7) 
      7. Error: dummy layer to set x axis limits of data panel (@test-xlim_expand.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# haploR

Version: 2.0.6

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Last 13 lines of output:
      Number of errors: 0 
      Number of failures: 1 
      
       
      1 Test Suite : 
      haploR unit testing - 3 test functions, 0 errors, 1 failure
      FAILURE in test_queryRegulome: Error in checkEqualsNumeric(dim(x$res.table)[1], 2) : 
        Mean relative difference: 0.9974684
      
      Error: 
      
      Unit testing failed (#test failures: 1, 
                       #R errors: 0)
      
      Execution halted
    ```

# jstor

Version: 0.3.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jstor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: jst_define_import
    > ### Title: Define an import specification
    > ### Aliases: jst_define_import
    > 
    > ### ** Examples
    > 
    > # articles will be imported via `jst_get_article()` and `jst_get_authors()`
    > jst_define_import(article = c(jst_get_article, jst_get_authors))
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      OK: 116 SKIPPED: 4 FAILED: 14
      1. Error: total pages are computed (@test-augment.R#24) 
      2. Error: total pages are added (@test-augment.R#46) 
      3. Error: ranges are parsed correctly (@test-augment.R#53) 
      4. Error: data gets augmented (@test-augment.R#95) 
      5. Error: (unknown) (@test-author-import.R#7) 
      6. Error: (unknown) (@test-books.R#7) 
      7. Error: (unknown) (@test-footnotes.R#7) 
      8. Error: full-text is read correctly (@test-full_text.R#33) 
      9. Error: jst_define_import validates input (@test-import-spec.R#11) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
      Error while shutting down parallel: unable to terminate some child processes
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 142-144 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# keyholder

Version: 0.1.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 295 SKIPPED: 0 FAILED: 15
      1. Failure: restore_keys.default works (@test-keys-manip.R#44) 
      2. Failure: restore_keys.default works (@test-keys-manip.R#54) 
      3. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#65) 
      4. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#72) 
      5. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#80) 
      6. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#85) 
      7. Failure: restore_keys_all works (@test-scoped.R#94) 
      8. Failure: restore_keys_all works (@test-scoped.R#101) 
      9. Failure: restore_keys_all works (@test-scoped.R#108) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# LymphoSeq

Version: 1.8.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      |                                                                            
      |============================                                          |  40%
      |                                                                            
      |===================================                                   |  50%
      |                                                                            
      |==========================================                            |  60%
      |                                                                            
      |=================================================                     |  70%
      |                                                                            
      |========================================================              |  80%
      |                                                                            
      |===============================================================       |  90%
      |                                                                            
      |======================================================================| 100%
    > 
    > phyloTree(list = productive.nt, sample = "IGH_MVQ92552A_BL", type = "nucleotide", 
    +          layout = "rectangular")
    Error in as.data.frame.default(value, stringsAsFactors = FALSE) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: phyloTree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 140-142 (LymphoSeq.Rmd) 
    Error: processing vignette 'LymphoSeq.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# metacoder

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
                     type = "silent")))
             }
             return(result)
         }) at /tmp/RtmpbsTLjG/R.INSTALL721f4c05a9b5/taxa/R/taxonomy--class.R:1256
      13: FUN(X[[i]], ...)
      14: stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
             type = "silent"))) at /tmp/RtmpbsTLjG/R.INSTALL721f4c05a9b5/taxa/R/taxonomy--class.R:1261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 94 SKIPPED: 1 FAILED: 1
      1. Error: Converting to phyloseq (@test--parsers_and_writers.R#204) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# metagenomeFeatures

Version: 2.0.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    ✔ readr   1.1.1           ✔ forcats 0.3.0      
    ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ✖ ggplot2::Position() masks BiocGenerics::Position(), base::Position()
    ✖ dplyr::combine()    masks Biobase::combine(), BiocGenerics::combine()
    ✖ dplyr::filter()     masks stats::filter()
    ✖ dplyr::lag()        masks stats::lag()
    ggtree v1.12.7  For help: https://guangchuangyu.github.io/software/ggtree
    
    If you use ggtree in published research, please cite:
    Guangchuang Yu, David Smith, Huachen Zhu, Yi Guan, Tommy Tsan-Yuk Lam. ggtree: an R package for visualization and annotation of phylogenetic trees with their covariates and other associated data. Methods in Ecology and Evolution 2017, 8(1):28-36, doi:10.1111/2041-210X.12628
    
    Attaching package: 'ggtree'
    
    The following object is masked from 'package:tidyr':
    
        expand
    
    Quitting from lines 106-120 (database-explore.Rmd) 
    Error: processing vignette 'database-explore.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# mfa

Version: 1.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mfa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: summary.mfa
    > ### Title: Summarise an mfa fit
    > ### Aliases: summary.mfa
    > 
    > ### ** Examples
    > 
    > synth <- create_synthetic(C = 20, G = 5)
    > m <- mfa(synth$X)
    Sampling for 20 cells and 5 genes
    > ms <- summary(m)
    Error: Columns 1, 2 must be named.
    Execution halted
    ```

# mudata2

Version: 1.0.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mudata2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: biplot.mudata
    > ### Title: Biplot a mudata object
    > ### Aliases: biplot.mudata autobiplot.mudata
    > 
    > ### ** Examples
    > 
    > kvtemp <- kentvillegreenwood %>% select_params(contains("temp"))
    > 
    > # use base plotting for regular biplot function
    > biplot(kvtemp)
    > 
    > # use ggplot and facet_grid to biplot
    > autobiplot(kvtemp, col = "location")
    Using names_x = c("mintemp", "maxtemp"), names_y = c("meantemp", "mintemp")
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      OGR: Unsupported geometry type
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 947 SKIPPED: 0 FAILED: 9
      1. Error: autobiplot works on both data frames and mudata objects (@test_biplot.R#15) 
      2. Error: error bars show up in autoplot (@test_biplot.R#27) 
      3. Error: long_pairs finds invalid inputs (@test_biplot.R#54) 
      4. Error: autobiplot.data.frame funcion detects invalid inputs (@test_biplot.R#94) 
      5. Error: long_pairs correctly assigns parameter combinations (@test_biplot.R#104) 
      6. Error: long_pairs name_var can be included in id_vars (@test_biplot.R#132) 
      7. Error: long_pairs handles grouped data frames (@test_biplot.R#139) 
      8. Error: long_pairs handles zero-row combinations gracefully (@test_biplot.R#151) 
      9. Error: max_names is respected in long_pairs, autobiplot, and long_biplot (@test_biplot.R#167) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# naniar

Version: 0.4.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘naniar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_label_shadow
    > ### Title: Add a column describing whether there is a shadow
    > ### Aliases: add_label_shadow
    > 
    > ### ** Examples
    > 
    > 
    > airquality %>%
    +   add_shadow(Ozone, Solar.R) %>%
    +   add_label_shadow()
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 78-87 (exploring-imputed-values.Rmd) 
    Error: processing vignette 'exploring-imputed-values.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# parsnip

Version: 0.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: as_tibble.matrix(.) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      15: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      16: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      17: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      18: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      19: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      20: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      21: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 440 SKIPPED: 82 FAILED: 1
      1. Error: survival prediction (@test_surv_reg_survreg.R#67) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# particles

Version: 0.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘particles-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evolve
    > ### Title: Move the simulation forward one or more steps
    > ### Aliases: evolve
    > 
    > ### ** Examples
    > 
    > graph <- tidygraph::create_notable('folkman')
    > sim <- graph %>%
    +   simulate() %>%
    +   wield(link_force) %>%
    +   wield(manybody_force)
    Error in is.force(force) : Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Calls: %>% ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Error in re-building vignettes:
      ...
    
    Attaching package: 'particles'
    
    The following objects are masked from 'package:stats':
    
        filter, simulate
    
    
    Attaching package: 'tidygraph'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 61-71 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# phenopath

Version: 1.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phenopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clvm
    > ### Title: Fit a CLVM Model
    > ### Aliases: clvm
    > 
    > ### ** Examples
    > 
    > sim <- simulate_phenopath()
    Error: Columns 1, 2, 3 must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(phenopath)
      > 
      > test_check("phenopath")
      Error: Columns 1, 2, 3 must be named.
      Execution halted
    ```

# philr

Version: 1.6.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘philr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotate_balance
    > ### Title: annotate_balance
    > ### Aliases: annotate_balance
    > 
    > ### ** Examples
    > 
    > tr <- named_rtree(10)
    > 
    > annotate_balance(tr, 'n4', size=7)
    Error in as.data.frame.default(value, stringsAsFactors = FALSE) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: annotate_balance ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        expand
    
    The following object is masked from 'package:ape':
    
        rotate
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 218-230 (philr-intro.Rmd) 
    Error: processing vignette 'philr-intro.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# photobiology

Version: 0.9.24

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 365-368 (userguide2-radiation.Rmd) 
    Error: processing vignette 'userguide2-radiation.Rmd' failed with diagnostics:
    Columns 2, 3 must be named.
    Execution halted
    ```

# plotly

Version: 4.8.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘plotly-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_dendro
    > ### Title: Plot an interactive dendrogram
    > ### Aliases: plot_dendro
    > 
    > ### ** Examples
    > 
    > 
    > hc <- hclust(dist(USArrests), "ave")
    > dend1 <- as.dendrogram(hc)
    > plot_dendro(dend1, height = 600) %>% 
    +   hide_legend() %>% 
    +   highlight(persistent = TRUE, dynamic = TRUE)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# poio

Version: 0.0-3

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Package unavailable to check Rd xrefs: ‘ISOcodes’
    Missing link or links in documentation object 'print.po.Rd':
      ‘[tibble]{print.tbl_df}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

# portalr

Version: 0.1.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── 3. Failure: data generated by level = Plot, type = Annuals, plots = longterm 
      digest::digest(data) not identical to "3a482a2016888521ef72498e8c36936f".
      1/1 mismatches
      x[1]: "96eb7db63ea38928dece20d6cda66949"
      y[1]: "3a482a2016888521ef72498e8c36936f"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 130 SKIPPED: 14 FAILED: 3
      1. Failure: data generated by default setting is same (plants) (@test-99-regression.R#72) 
      2. Failure: data generated by type = Shrubs, unknowns = T, correct_sp = F is same (plants) (@test-99-regression.R#82) 
      3. Failure: data generated by level = Plot, type = Annuals, plots = longterm is same (plants) (@test-99-regression.R#92) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# prophet

Version: 0.3.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 286 SKIPPED: 0 FAILED: 15
      1. Error: cross_validation (@test_diagnostics.R#20) 
      2. Error: cross_validation_logistic (@test_diagnostics.R#46) 
      3. Error: cross_validation_extra_regressors (@test_diagnostics.R#62) 
      4. Error: cross_validation_default_value_check (@test_diagnostics.R#77) 
      5. Error: performance_metrics (@test_diagnostics.R#87) 
      6. Failure: fit_predict (@test_prophet.R#17) 
      7. Failure: fit_predict_no_seasons (@test_prophet.R#23) 
      8. Failure: fit_predict_no_changepoints (@test_prophet.R#28) 
      9. Failure: fit_predict_changepoint_not_in_history (@test_prophet.R#42) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Loading required package: Rcpp
    code for methods in class "Rcpp_stan_fit4modelcd475a0e34c9_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_stan_fit4modelcd475a0e34c9_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 44-46 (quick_start.Rmd) 
    Error: processing vignette 'quick_start.Rmd' failed with diagnostics:
    Column names `10%`, `90%` must not be duplicated.
    Execution halted
    ```

# psychmeta

Version: 2.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: create_ad_tibble
    > ### Title: Create a tibble of artifact distributions by construct
    > ### Aliases: create_ad_tibble create_ad_list
    > 
    > ### ** Examples
    > 
    > ## Examples to create Taylor series artifact distributions:
    > # Overall artifact distributions (not pairwise, not moderated)
    > create_ad_tibble(ad_type = "tsa",
    +                  n = n, rxx = rxxi, ryy = ryyi,
    +                  construct_x = x_name, construct_y = y_name,
    +                  sample_id = sample_id, moderators = moderator,
    +                  data = data_r_meas_multi,
    +                  control = control_psychmeta(pairwise_ads = FALSE,
    +                                              moderated_ads = FALSE))
    Tibble of artifact distributions 
    ---------------------------------------------------------------------- 
    # A tibble: 3 x 3
      construct_x analysis_type ad_x        
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 478-486 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# Rchemcpp

Version: 2.18.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/Rtmp3o67mA/Rd2pdf3a491f109499'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.8Mb
      sub-directories of 1Mb or more:
        extdata   2.3Mb
        libs     12.2Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    0 molecules pairs were orthogonal
    0 of them had a different biological activity
    0 of them had unknown biological activity
    
    Attaching package: ‘apcluster’
    
    The following object is masked from ‘package:stats’:
    
        heatmap
    
    Error in (function (x)  : attempt to apply non-function
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Error in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  : 
      Running 'texi2dvi' on 'Rchemcpp.tex' failed.
    Messages:
    sh: 1: /usr/bin/texi2dvi: not found
    Calls: buildVignettes -> texi2pdf -> texi2dvi
    Execution halted
    ```

## Installation

### Devel

```
* installing *source* package ‘Rchemcpp’ ...
** libs
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o constant.o constant.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o descriptor.o descriptor.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o cerror.o cerror.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o chemcpp.o chemcpp.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o node.o node.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o jlpioutils.o jlpioutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o ring.o ring.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o kcfmolecule.o kcfmolecule.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o bond.o bond.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o stringutils.o stringutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o elements.o elements.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o atom.o atom.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o datacontainer.o datacontainer.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeutils.o moleculeutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Relements.cpp -o Relements.o
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o molecule.o molecule.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrumhelper.cpp -o spectrumhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrum3Dhelper.cpp -o spectrum3Dhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmolecule.cpp -o Rmolecule.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c subtreehelper.cpp -o subtreehelper.o
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeset.o moleculeset.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.dll -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.so -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib33204de60605/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmoleculeset.cpp -o Rmoleculeset.o
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o Rchemcpp.so Relements.o Rmolecule.o Rmoleculeset.o spectrum3Dhelper.o spectrumhelper.o subtreehelper.o -L./ -lchemcpp -Wl,-rpath,/tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/Rchemcpp/libs -L/usr/lib/R/lib -lR
installing to /tmp/RtmpSwdSvf/file33207b4ea46d/Rchemcpp.Rcheck/Rchemcpp/libs
** R
** inst
** byte-compile and prepare package for lazy loading
in method for ‘length’ with signature ‘"Rcpp_Rmoleculeset"’: no definition for class “Rcpp_Rmoleculeset”
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
code for methods in class “Rcpp_Rmolecule” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_Rmolecule” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_Rmoleculeset” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_Rmoleculeset” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
* DONE (Rchemcpp)

```
### CRAN

```
* installing *source* package ‘Rchemcpp’ ...
** libs
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o constant.o constant.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o chemcpp.o chemcpp.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o descriptor.o descriptor.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o cerror.o cerror.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o node.o node.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o jlpioutils.o jlpioutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o ring.o ring.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o bond.o bond.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o kcfmolecule.o kcfmolecule.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o elements.o elements.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o stringutils.o stringutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o atom.o atom.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o datacontainer.o datacontainer.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Relements.cpp -o Relements.o
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeutils.o moleculeutils.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o molecule.o molecule.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrum3Dhelper.cpp -o spectrum3Dhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmolecule.cpp -o Rmolecule.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c subtreehelper.cpp -o subtreehelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrumhelper.cpp -o spectrumhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpSwdSvf/checklib335856153b64/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmoleculeset.cpp -o Rmoleculeset.o
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o Rchemcpp.so Relements.o Rmolecule.o Rmoleculeset.o spectrum3Dhelper.o spectrumhelper.o subtreehelper.o -L./ -lchemcpp -Wl,-rpath,/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/Rchemcpp/libs -L/usr/lib/R/lib -lR
/usr/bin/ld: cannot find -lchemcpp
collect2: error: ld returned 1 exit status
/usr/share/R/share/make/shlib.mk:6: recipe for target 'Rchemcpp.so' failed
make: *** [Rchemcpp.so] Error 1
make: *** Waiting for unfinished jobs....
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeset.o moleculeset.cpp
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.dll -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.so -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
ERROR: compilation failed for package ‘Rchemcpp’
* removing ‘/tmp/RtmpSwdSvf/file33586d2c7ec7/Rchemcpp.Rcheck/Rchemcpp’

```
# rcrtan

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rcrtan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: crt_iteman
    > ### Title: Calculate criterion-referenced item discrimination indices
    > ### Aliases: crt_iteman
    > 
    > ### ** Examples
    > 
    > crt_iteman(bh_depend, 2:31, 21, scale = 'raw')
    Error: Column 1 must be named.
    Execution halted
    ```

# readxl

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `df <- read_excel(test_sheet("missing-v-node-xlsx.xlsx"))` produced messages.
      
      ── 5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64)  ──────
      `... <- NULL` produced messages.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 374 SKIPPED: 0 FAILED: 5
      1. Failure: column_names can anticipate skipping (@test-col-names.R#78) 
      2. Failure: column_names can anticipate skipping (@test-col-names.R#89) 
      3. Failure: we can finally read Ekaterinburg (@test-compatibility.R#27) 
      4. Failure: formula cell with no v node does not cause crash (@test-compatibility.R#53) 
      5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rgho

Version: 1.0.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rgho-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_gho_data
    > ### Title: Returns GHO Data
    > ### Aliases: get_gho_data
    > 
    > ### ** Examples
    > 
    > 
    > result <- get_gho_data(
    +   dimension = "GHO",
    +   code = "MDG_0000000001"
    + )
    Error in dimension %in% get_gho_dimensions() : 
      Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Calls: get_gho_data ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 30-31 (a-intro.Rmd) 
    Error: processing vignette 'a-intro.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rhierbaps

Version: 1.1.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-5>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-6>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-7>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Read 1 item
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-8>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Quitting from lines 106-110 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# ritis

Version: 0.7.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      20: as_tibble.matrix(x, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      21: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      22: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      23: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      24: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      25: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      26: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      27: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 114 SKIPPED: 4 FAILED: 1
      1. Error: itis_facet basic functionality works (@test-itis_facet.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rplos

Version: 0.8.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      17: as_tibble.matrix(x, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      18: as_tibble(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:187
      19: as_tibble.data.frame(m, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      20: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      21: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      22: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      23: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      24: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 100 SKIPPED: 7 FAILED: 1
      1. Error: facetplos (@test-facetplos.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rrr

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pairwise_plot
    > ### Title: Pairwise Plots
    > ### Aliases: pairwise_plot
    > 
    > ### ** Examples
    > 
    > data(pendigits)
    > digits_features <- pendigits[,1:34]
    > digits_class <- pendigits[,35]
    > pairwise_plot(digits_features, digits_class, type = "pca", pair_x = 1, pair_y = 3)
    Error: Columns 1, 2, 3, 4, 5, … (and 29 more) must be named.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 337-338 (rrr.Rmd) 
    Error: processing vignette 'rrr.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 29 more) must be named.
    Execution halted
    ```

# rsample

Version: 0.0.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          fill
      
      > 
      > test_check(package = "rsample")
      ── 1. Failure: simple rset (@test_rset.R#42)  ──────────────────────────────────
      sort(names(attributes(res2))) not equal to c("class", "names", "row.names").
      Lengths differ: 6 is not 3
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 486 SKIPPED: 0 FAILED: 1
      1. Failure: simple rset (@test_rset.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ruler

Version: 0.1.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             use.names = use.names, ...)
      9: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert) at /tmp/RtmpVNfmtz/R.INSTALLaf254ddc6f91/dplyr/R/all-equal.r:35
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 301 SKIPPED: 0 FAILED: 6
      1. Error: add_pack_names works (@test-expose-helpers.R#73) 
      2. Failure: expose works (@test-expose.R#159) 
      3. Error: expose works (@test-expose.R#188) 
      4. Error: expose removes obeyers (@test-expose.R#202) 
      5. Error: expose preserves pack names (@test-expose.R#246) 
      6. Error: expose accounts for rule separator (@test-expose.R#264) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# scholar

Version: 0.1.7

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 131-132 (scholar.Rmd) 
    Error: processing vignette 'scholar.Rmd' failed with diagnostics:
    Evaluation error: Columns 1, 2 must be named.
    Use .name_repair to specify repair..
    Execution halted
    ```

# Sconify

Version: 1.0.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Sconify-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: QuantNormalizeElements
    > ### Title: Takes a list of tibbles as input, and performs per-column
    > ###   quantile normalization, then outputs the quantile normalized list
    > ### Aliases: QuantNormalizeElements
    > 
    > ### ** Examples
    > 
    > basal <- wand.combined[wand.combined$condition == "basal",][,1:10]
    > il7 <- wand.combined[wand.combined$condition == "IL7",][,1:10]
    > QuantNormalizeElements(list(basal, il7))
    Error: Columns 1, 2, 3, 4, 5, … (and 5 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:94
      17: set_repaired_names(x, .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:118
      18: repaired_names(names(x), .name_repair = .name_repair) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:137
      19: check_unique(new_name) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 40 SKIPPED: 0 FAILED: 4
      1. Error: Simple quantile normalization case (@test.file.processing.R#116) 
      2. Error: (unknown) (@test.knn.and.statistics.R#10) 
      3. Error: Subsampling and tSNE functionality works (@test.post.processing.R#9) 
      4. Error: Basic post-processing functionality (@test.post.processing.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘Sconify’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘flowCore::view’ by ‘tibble::view’ when loading ‘Sconify’
    See ‘/tmp/RtmpSwdSvf/file334c45702858/Sconify.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      functional = col_character()
    )
    finding k-nearest neighbors
    k-nearest neighbors complete
    running per-knn statistics
    10 percent complete
    20 percent complete
    30 percent complete
    40 percent complete
    50 percent complete
    60 percent complete
    70 percent complete
    80 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    90 percent complete
    100 percent complete
    Quitting from lines 85-91 (Step2.TheSconeWorkflow.Rmd) 
    Error: processing vignette 'Step2.TheSconeWorkflow.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 11 more) must be named.
    Execution halted
    ```

# simTool

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     6 rnorm     5            2 rng      0.738  
     7 rnorm     5            2 median   0.487  
     8 rnorm     5            2 length   5      
     9 rnorm    10            1 rng     -2.21   
    10 rnorm    10            1 rng      1.51   
    11 rnorm    10            1 median   0.492  
    12 rnorm    10            1 length  10      
    13 rnorm    10            2 rng     -1.99   
    14 rnorm    10            2 rng      0.919  
    15 rnorm    10            2 median   0.00922
    16 rnorm    10            2 length  10      
    Number of data generating functions: 2
    Number of analyzing procedures: 3
    Number of replications: 2
    Estimated replications per hour: 5121076
    Start of the simulation: 2018-11-15 01:36:40
    End of the simulation: 2018-11-15 01:36:40
    > eval_tibbles(dg, pg,rep = 2, post_analyze = purrr::compose(tibble::as_tibble, t))
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 46 SKIPPED: 0 FAILED: 12
      1. Error: Matrix is converted to tibble (@test_bind_or_combine.R#15) 
      2. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      3. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      4. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      5. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      6. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      7. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      8. Error: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#360) 
      9. Error: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#504) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# stminsights

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # fit model
    > gadarian_10 <- stm(documents = out$documents,
    +                    vocab = out$vocab,
    +                    data = out$meta,
    +                    prevalence = ~ treatment + s(pid_rep),
    +                    K = 10,
    +                    max.em.its = 1, # reduce computation time for example
    +                    verbose = FALSE)
    > 
    > # extract network
    > stm_corrs <- get_network(model = gadarian_10,
    +                          method = 'simple',
    +                          labels = paste('Topic', 1:10),
    +                          cutoff = 0.001,
    +                          cutiso = TRUE)
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Columns 1, 2 must be named.
    Use .name_repair to specify repair..
    Calls: get_network ... mutate_as_tbl -> mutate -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

# taxa

Version: 0.3.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      2/2 mismatches
      x[1]: NA
      y[1]: "j"
      
      x[2]: NA
      y[2]: "i"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 598 SKIPPED: 2 FAILED: 2
      1. Failure: New tables and vectors can be made (@test--taxmap.R#684) 
      2. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#56) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tibbletime

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tibbletime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_period
    > ### Title: Change 'tbl_time' periodicity
    > ### Aliases: as_period
    > 
    > ### ** Examples
    > 
    > 
    > # Basic usage ---------------------------------------------------------------
    > 
    > # FB stock prices
    > data(FB)
    > FB <- as_tbl_time(FB, date)
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 32 SKIPPED: 0 FAILED: 21
      1. Error: (unknown) (@test_as_period.R#7) 
      2. Error: (unknown) (@test_ceiling_index.R#7) 
      3. Error: Can coerce tbl_df to tbl_time (@test_coercion.R#23) 
      4. Error: Can coerce data.frame to tbl_time using default method (@test_coercion.R#27) 
      5. Error: Can coerce grouped_df to tbl_time (@test_coercion.R#32) 
      6. Error: Can coerce tbl_time back to tbl_df (@test_coercion.R#40) 
      7. Error: Collapsing works on yearmon (@test_collapse_index.R#34) 
      8. Error: Collapsing works on yearqtr (@test_collapse_index.R#41) 
      9. Error: Collapsing works on hms (@test_collapse_index.R#48) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'tibbletime'
    
    The following object is masked from 'package:stats':
    
        filter
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 29-45 (TT-01-time-based-filtering.Rmd) 
    Error: processing vignette 'TT-01-time-based-filtering.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# tidygraph

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate
    > ### Title: Determine the context of subsequent manipulations
    > ### Aliases: activate active %N>% %E>%
    > 
    > ### ** Examples
    > 
    > gr <- create_complete(5) %>%
    +   activate(nodes) %>%
    +   mutate(class = sample(c('a', 'b'), 5, TRUE)) %>%
    +   activate(edges) %>%
    +   arrange(from)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 133 SKIPPED: 0 FAILED: 36
      1. Error: activate activates all morphed graphs (@test-activate.R#26) 
      2. Error: arrange works with edges (@test-arrange.R#13) 
      3. Error: bind_graphs works (@test-bind.R#8) 
      4. Error: bind_edges works (@test-bind.R#22) 
      5. Error: centrality returns numeric (@test-centrality.R#8) 
      6. Error: centrality returns correct length (@test-centrality.R#25) 
      7. Error: graphs get added and stacked in the context (@test-context.R#12) 
      8. Error: distinct works (@test-distinct.R#4) 
      9. Error: edge types return logical (@test-edge_types.R#7) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidypredict

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > df <- mutate(mtcars, cyl = paste0("cyl", cyl))
    > model <- lm(mpg ~ wt + cyl * disp, offset = am, data = df)
    > parse_model(model)
    Warning: Calling `as_tibble()` on a vector is discouraged, because the behavior is likely to change in the future. Use `enframe(name = NULL)` instead.
    Error in parse_model_lm(model) : There was a parsing error
    Calls: parse_model -> parse_model.lm -> parse_model_lm
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: tidypredict_fit.lm(model) at /tmp/RtmpSwdSvf/file33575b361bdf/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:18
      24: parse_model(model) at /tmp/RtmpSwdSvf/file33575b361bdf/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:23
      25: parse_model.lm(model) at /tmp/RtmpSwdSvf/file33575b361bdf/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:20
      26: parse_model_lm(model) at /tmp/RtmpSwdSvf/file33575b361bdf/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:26
      27: stop("There was a parsing error") at /tmp/RtmpSwdSvf/file33575b361bdf/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:120
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 12 SKIPPED: 0 FAILED: 4
      1. Error: Returns a data frame (@test-parsemodel.R#9) 
      2. Error: (unknown) (@test-parsemodel.R#13) 
      3. Error: Individual prediction difference is never above 1e-12 (@test_glm.R#13) 
      4. Error: Predictions within threshold and parsed model results are equal (@test_lm.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 47-50 (glm.Rmd) 
    Error: processing vignette 'glm.Rmd' failed with diagnostics:
    There was a parsing error
    Execution halted
    ```

# tidytree

Version: 0.1.9

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ancestor
    > ### Title: ancestor
    > ### Aliases: ancestor ancestor.tbl_tree
    > 
    > ### ** Examples
    > 
    > library(ape)
    > tree <- rtree(4)
    > x <- as_data_frame(tree)
    Error in as.data.frame.default(value, stringsAsFactors = FALSE) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: as_data_frame ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 14
      1. Error: conversion to table is reversible (@test-access-related-nodes.R#27) 
      2. Error: child works for bifurcating trees (@test-access-related-nodes.R#35) 
      3. Error: child works for non-bifurcating trees (@test-access-related-nodes.R#44) 
      4. Error: offspring works on bifurcating trees (@test-access-related-nodes.R#52) 
      5. Error: offspring works on non-bifurcating trees (@test-access-related-nodes.R#58) 
      6. Error: parent works for bifurcating trees (@test-access-related-nodes.R#64) 
      7. Error: parent works for non-bifurcating trees (@test-access-related-nodes.R#70) 
      8. Error: ancestor works for bifurcating trees (@test-access-related-nodes.R#76) 
      9. Error: ancestor works for non-bifurcating trees (@test-access-related-nodes.R#82) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 58-64 (tidytree.Rmd) 
    Error: processing vignette 'tidytree.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# treeio

Version: 1.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: as_tibble(x, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/deprecated.R:42
      12: as_tibble.default(x, ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:76
      13: as_tibble(as.data.frame(value, stringsAsFactors = FALSE), ...) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:233
      14: as.data.frame(value, stringsAsFactors = FALSE) at /tmp/RtmpDor6pK/R.INSTALL3b6c53b5ddaf/tibble/R/as_tibble.R:233
      15: as.data.frame.default(value, stringsAsFactors = FALSE)
      16: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 91 SKIPPED: 0 FAILED: 2
      1. Error: (unknown) (@test-conversion.R#4) 
      2. Error: (unknown) (@test-treedata-accessor.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 467-478 (Importer.Rmd) 
    Error: processing vignette 'Importer.Rmd' failed with diagnostics:
    cannot coerce class 'structure("treedata", package = "tidytree")' to a data.frame
    Execution halted
    ```

# xpose

Version: 0.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Can't join on 'data' x 'data' because of incompatible types (list / list)
      1: expect_identical(xpdb_vpc_test$special, ctrl_special$special) at testthat/test-vpc.R:43
      2: compare(act$val, exp$val) at /tmp/Rtmp6bATMU/R.INSTALL89e91142811d/testthat/R/expect-equality.R:138
      3: compare.default(act$val, exp$val) at /tmp/Rtmp6bATMU/R.INSTALL89e91142811d/testthat/R/compare.R:13
      4: all.equal(x, y, ...) at /tmp/Rtmp6bATMU/R.INSTALL89e91142811d/testthat/R/compare.R:48
      5: all.equal.tbl_df(x, y, ...)
      6: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert) at /tmp/RtmpVNfmtz/R.INSTALLaf254ddc6f91/dplyr/R/all-equal.r:35
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 523 SKIPPED: 6 FAILED: 1
      1. Error: vpc_data works properly with xpdb tables (@test-vpc.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

