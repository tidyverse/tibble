# corrr

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:104
      26: -rowname at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# docxtractr

Version: 0.5.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: docx_extract_tbl
    > 
    > ### ** Examples
    > 
    > doc3 <- read_docx(system.file("examples/data3.docx", package="docxtractr"))
    > docx_extract_tbl(doc3, 3)
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
      10: freduce(value, `_function_list`) at /tmp/RtmpoSpeLJ/R.INSTALL94a827ca0554/magrittr/R/pipe.R:28
      11: function_list[[i]](value) at /tmp/RtmpoSpeLJ/R.INSTALL94a827ca0554/magrittr/R/freduce.R:17
      12: dplyr::group_by(., get.col1.)
      13: group_by.data.frame(., get.col1.) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/group-by.r:76
      14: grouped_df(groups$data, groups$group_names) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/dataframe.R:34
      15: grouped_df_impl(data, unname(vars), drop) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/grouped-df.r:25
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 24 SKIPPED: 0 FAILED: 2
      1. Error: numbers and letters aggregations are correct (@test_freq_two_vects.R#44) 
      2. Error: dates and logicals aggregations are correct (@test_freq_two_vects.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# metacoder

Version: 0.3.0.1

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
         }) at /tmp/RtmpFTQK3L/R.INSTALL5929317856a1/taxa/R/taxonomy--class.R:1256
      13: FUN(X[[i]], ...)
      14: stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
             type = "silent"))) at /tmp/RtmpFTQK3L/R.INSTALL5929317856a1/taxa/R/taxonomy--class.R:1261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 94 SKIPPED: 1 FAILED: 1
      1. Error: Converting to phyloseq (@test--parsers_and_writers.R#204) 
      
      Error: testthat unit tests failed
      Execution halted
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

# Rchemcpp

Version: 2.18.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpIOQmiB/Rd2pdfce2f406f3d1a'
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
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o constant.o constant.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o chemcpp.o chemcpp.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o descriptor.o descriptor.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o jlpioutils.o jlpioutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o kcfmolecule.o kcfmolecule.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o cerror.o cerror.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o node.o node.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o ring.o ring.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o bond.o bond.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o elements.o elements.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o stringutils.o stringutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o atom.o atom.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o datacontainer.o datacontainer.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Relements.cpp -o Relements.o
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeutils.o moleculeutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o molecule.o molecule.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c subtreehelper.cpp -o subtreehelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrum3Dhelper.cpp -o spectrum3Dhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmoleculeset.cpp -o Rmoleculeset.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrumhelper.cpp -o spectrumhelper.o
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeset.o moleculeset.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.dll -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.so -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc84b12c7475d/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmolecule.cpp -o Rmolecule.o
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o Rchemcpp.so Relements.o Rmolecule.o Rmoleculeset.o spectrum3Dhelper.o spectrumhelper.o subtreehelper.o -L./ -lchemcpp -Wl,-rpath,/tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/Rchemcpp/libs -L/usr/lib/R/lib -lR
installing to /tmp/RtmpTTQeks/filec84b47603712/Rchemcpp.Rcheck/Rchemcpp/libs
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
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o constant.o constant.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o descriptor.o descriptor.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o chemcpp.o chemcpp.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o cerror.o cerror.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o node.o node.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o kcfmolecule.o kcfmolecule.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o ring.o ring.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o jlpioutils.o jlpioutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o bond.o bond.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o stringutils.o stringutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o elements.o elements.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o atom.o atom.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o datacontainer.o datacontainer.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeutils.o moleculeutils.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Relements.cpp -o Relements.o
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o molecule.o molecule.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrumhelper.cpp -o spectrumhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c subtreehelper.cpp -o subtreehelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c spectrum3Dhelper.cpp -o spectrum3Dhelper.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmolecule.cpp -o Rmolecule.o
g++  -I"/usr/share/R/include" -DNDEBUG -I./chemcpp/src -I"/tmp/RtmpTTQeks/checklibc8315e2f6e8f/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rmoleculeset.cpp -o Rmoleculeset.o
g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o Rchemcpp.so Relements.o Rmolecule.o Rmoleculeset.o spectrum3Dhelper.o spectrumhelper.o subtreehelper.o -L./ -lchemcpp -Wl,-rpath,/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/Rchemcpp/libs -L/usr/lib/R/lib -lR
/usr/bin/ld: cannot find -lchemcpp
collect2: error: ld returned 1 exit status
/usr/share/R/share/make/shlib.mk:6: recipe for target 'Rchemcpp.so' failed
make: *** [Rchemcpp.so] Error 1
make: *** Waiting for unfinished jobs....
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/   -c -o moleculeset.o moleculeset.cpp
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.so -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
make[1]: Entering directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
g++  -shared -o ../../libchemcpp.dll -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -w -fPIC -I../src/ constant.o node.o atom.o bond.o cerror.o chemcpp.o datacontainer.o descriptor.o elements.o jlpioutils.o kcfmolecule.o molecule.o moleculeset.o moleculeutils.o ring.o stringutils.o
make[1]: Leaving directory '/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/00_pkg_src/Rchemcpp/src/chemcpp/src'
ERROR: compilation failed for package ‘Rchemcpp’
* removing ‘/tmp/RtmpTTQeks/filec8317c7048fa/Rchemcpp.Rcheck/Rchemcpp’

```
# RCzechia

Version: 1.3.1

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    code for methods in class "Rcpp_SpExtent" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpExtent" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPoly" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPoly" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPolyPart" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPolyPart" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPolygons" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_SpPolygons" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    Linking to GEOS 3.5.1, GDAL 2.1.3, PROJ 4.9.2
    New names:
    ```

# readabs

Version: 0.2.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: rename.data.frame(dat, Date = X__1) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/manip.r:498
      4: tidyselect::vars_rename(names(.data), !!!quos(...)) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/dataframe.R:124
      5: vars_rename_eval(quos, .vars) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-rename.R:19
      6: map2_chr(renamed, names(quos), validate_renamed_var, vars) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-rename.R:51
      7: .f(.x[[1L]], .y[[1L]], ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map2-pmap.R:99
      8: bad_named_calls(named_call, "must be a { singular(vars) } name or position, not {actual_type}") at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-rename.R:76
      9: glubort(fmt_named_calls(named_calls), ..., .envir = .envir) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/utils-errors.R:39
      10: .abort(text) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/utils-errors.R:57
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_read_abs_data.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rsample

Version: 0.0.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          fill
      
      > 
      > test_check(package = "rsample")
      ── 1. Failure: simple rset (@test_rset.R#44)  ──────────────────────────────────
      sort(names(attributes(res2))) not equal to c("class", "names", "row.names").
      Lengths differ: 6 is not 3
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 492 SKIPPED: 0 FAILED: 1
      1. Failure: simple rset (@test_rset.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# Sconify

Version: 1.0.4

## Newly broken

*   checking whether package ‘Sconify’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘flowCore::view’ by ‘tibble::view’ when loading ‘Sconify’
    See ‘/tmp/RtmpTTQeks/filec8416703927f/Sconify.Rcheck/00install.out’ for details.
    ```

# simTool

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 46 SKIPPED: 0 FAILED: 11
      1. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      2. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      3. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      4. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      5. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      6. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      7. Error: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#360) 
      8. Error: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#504) 
      9. Error: Three analyzing functions and one summary function over 2 cpus. Results were created and stored in simulation (@test_eval_tibbles.R#570) 
      1. ...
      
      Error: testthat unit tests failed
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

