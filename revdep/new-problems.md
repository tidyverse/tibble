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

# diffdf

Version: 1.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 551 SKIPPED: 0 FAILED: 17
      1. Failure: Unequal object, checking numbers correct (@test-core.R#186) 
      2. Failure: Unequal object, checking numbers correct (@test-core.R#187) 
      3. Failure: Unequal object, checking numbers correct (@test-core.R#188) 
      4. Failure: Unequal object, checking numbers correct (@test-core.R#189) 
      5. Failure: Unequal object, checking numbers correct (@test-core.R#190) 
      6. Failure: Unequal object, checking numbers correct (@test-core.R#191) 
      7. Failure: Unequal object, checking numbers correct (@test-core.R#192) 
      8. Failure: Unequal object, checking numbers correct (@test-core.R#193) 
      9. Failure: (unknown) (@test-print_output.R#51) 
      1. ...
      
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

# feather

Version: 0.3.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘feather-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read_feather
    > ### Title: Read and write feather files.
    > ### Aliases: read_feather write_feather
    > 
    > ### ** Examples
    > 
    > mtcars2 <- read_feather(feather_example("mtcars.feather"))
    Error: C stack usage  7969348 is too close to the limit
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(feather)
      > 
      > test_check("feather")
      Error: C stack usage  7969684 is too close to the limit
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 15 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# rcongresso

Version: 0.4.6

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rcongresso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fetch_despesas_deputado
    > ### Title: Fetches expenditures from deputy
    > ### Aliases: fetch_despesas_deputado
    > 
    > ### ** Examples
    > 
    > gastos_abel_mesquita <- fetch_despesas_deputado(id = 178957)
    > gastos_abel_junho2017 <- fetch_despesas_deputado(id = 178957, ano = 2017, mes = 06, itens = -1)
    Error in strsplit(., "/") : non-character argument
    Calls: fetch_despesas_deputado ... eval -> _fseq -> freduce -> <Anonymous> -> strsplit
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: function_list[[k]](value) at /tmp/RtmpoSpeLJ/R.INSTALL94a827ca0554/magrittr/R/freduce.R:20
      18: dplyr::do(., .congresso_api(API_path, .))
      19: do.rowwise_df(., .congresso_api(API_path, .)) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/do.r:84
      20: eval_tidy(args[[j]], mask) at /tmp/Rtmp0wKLgE/R.INSTALL34b218077b7c/dplyr/R/rowwise.r:100
      21: .congresso_api(API_path, .) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval-tidy.R:87
      22: .get_from_api(path, query) at /tmp/Rtmp6P6GhG/filee3d61bab16f1/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:55
      23: stop(.ERRO_RETORNO_JSON, call. = FALSE) at /tmp/Rtmp6P6GhG/filee3d61bab16f1/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:38
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 2
      1. Failure: Not Empty (@test_deputados.R#44) 
      2. Error: Quantidade de itens por requisição (@test_proposicoes.R#82) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# recipes

Version: 0.1.4

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
        date
    
    > 
    > examples <- data.frame(Dan = ymd("2002-03-04") + days(1:10),
    +                        Stefan = ymd("2006-01-13") + days(1:10))
    > date_rec <- recipe(~ Dan + Stefan, examples) %>%
    +    step_date(all_predictors())
    > 
    > tidy(date_rec, number = 1)
    # A tibble: 3 x 4
      terms            value ordinal id        
      <fct>            <fct> <lgl>   <chr>     
    1 all_predictors() dow   FALSE   date_qxJ4m
    2 all_predictors() month FALSE   date_qxJ4m
    3 all_predictors() year  FALSE   date_qxJ4m
    > 
    > date_rec <- prep(date_rec, training = examples)
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1119 SKIPPED: 4 FAILED: 8
      1. Error: default option (@test_date.R#23) 
      2. Error: nondefault options (@test_date.R#59) 
      3. Error: ordinal values (@test_date.R#79) 
      4. Error: printing (@test_date.R#99) 
      5. Error: Date class (@test_holiday.R#17) 
      6. Error: POSIXct class (@test_holiday.R#39) 
      7. Error: printing (@test_holiday.R#58) 
      8. Error: trained (@test_tidy.R#39) 
      
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
    Error in code %in% get_gho_codes(dimension = dimension) : 
      Column 3 must be named.
    Use .name_repair to specify repair.
    Calls: get_gho_data ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 36-38 (a-intro.Rmd) 
    Error: processing vignette 'a-intro.Rmd' failed with diagnostics:
    Column 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rrd

Version: 0.2.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpKJCpCb/Rd2pdfee5a4111dddc'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.1Mb
      sub-directories of 1Mb or more:
        extdata  12.8Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘rrd’ ...
** package ‘rrd’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG      -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG      -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c rrd.c -o rrd.o
gcc -std=gnu99 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o rrd.so registerDynamicSymbol.o rrd.o -lrrd -L/usr/lib/R/lib -lR
installing to /tmp/Rtmp6P6GhG/filee3db1bab16f1/rrd.Rcheck/rrd/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded
* DONE (rrd)

```
### CRAN

```
* installing *source* package ‘rrd’ ...
** package ‘rrd’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG      -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c rrd.c -o rrd.o
rrd.c:1:17: fatal error: rrd.h: No such file or directory
compilation terminated.
/usr/lib/R/etc/Makeconf:159: recipe for target 'rrd.o' failed
make: *** [rrd.o] Error 1
make: *** Waiting for unfinished jobs....
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG      -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
ERROR: compilation failed for package ‘rrd’
* removing ‘/tmp/Rtmp0MWEzP/file8bd45e30623b/rrd.Rcheck/rrd’

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
    See ‘/tmp/Rtmp6P6GhG/filee3c25935c3a4/Sconify.Rcheck/00install.out’ for details.
    ```

# segregation

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: `[[.tbl_df`(total, "M", "est") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval.R:99
      6: NextMethod() at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/subsetting.R:77
      7: `[[.data.frame`(total, "M", "est")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 157 SKIPPED: 0 FAILED: 6
      1. Error: between + within = total (@test_mutual_total.R#53) 
      2. Error: within estimations are correct (@test_mutual_total.R#68) 
      3. Error: H is correct (@test_mutual_total.R#78) 
      4. Error: zero weights no problem (@test_mutual_total.R#101) 
      5. Error: between + within = total (@test_mutual_within.R#24) 
      6. Error: option wide works (@test_mutual_within.R#63) 
      
      Error: testthat unit tests failed
      Execution halted
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

# suropt

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      |                          
      |===========         |  55%
      |                          
      |============        |  60%
      |                          
      |=============       |  65%
      |                          
      |==============      |  70%
      |                          
      |===============     |  75%
      |                          
      |================    |  80%
      |                          
      |=================   |  85%
      |                          
      |==================  |  90%
      |                          
      |=================== |  95%
      |                          
      |====================| 100%Error: Column name `X` must not be duplicated.
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

# tidyr

Version: 0.8.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: as_tibble(m, ..., .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:222
      6: as_tibble.data.frame(m, ..., .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:79
      7: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:95
      8: lst_to_tibble(x, .rows, .name_repair, lengths(x)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:117
      9: set_repaired_names(x, .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:121
      10: set_names(x, repaired_names(names(x), .name_repair = .name_repair)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/repair-names.R:143
      11: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      12: abort("`nm` must be `NULL` or a character vector the same length as `x`") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:182
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 320 SKIPPED: 0 FAILED: 1
      1. Error: spreading empty data frame gives empty data frame (@test-spread.R#179) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

