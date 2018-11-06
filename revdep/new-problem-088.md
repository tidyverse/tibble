# vqtl

Version: 2.0.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vqtl-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.scanonevar
    > ### Title: plot.scanonevar
    > ### Aliases: plot.scanonevar
    > 
    > ### ** Examples
    > 
    > set.seed(27599)
    > test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 3), n.mar = 5), n.ind = 50)
    > test.sov <- scanonevar(cross = test.cross)
    calculating genoprobs with stepwidth = 5, off.end = 0, error.prob = 1e-4, map.function = 'haldane'
    Error: Columns 1, 2, 3, 4, 5, … (and 45 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      14: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      15: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 58 SKIPPED: 2 FAILED: 6
      1. Error: testing scanonevar with dglm with gaussian model (@test-2-scanonevar.R#23) 
      2. Error: testing conditional scanonevar with dglm with gaussian model (@test-2-scanonevar.R#61) 
      3. Error: testing scanonevar with dglm with poisson model (@test-2-scanonevar.R#95) 
      4. Error: testing conditional scanonevar with dglm with poisson model (@test-2-scanonevar.R#129) 
      5. Error: testing scanonevar with hglm (@test-2-scanonevar.R#164) 
      6. Error: (unknown) (@test-4-plots.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

