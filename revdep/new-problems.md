# pak

Version: 0.1.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      +   test_check("pak")
      + }
      > 
      > do()
      [31m──[39m [31m1. Error: remote (@test-subprocess.R#31) [39m [31m────────────────────────────────────[39m
      Subprocess is busy or cannot start
      1: remote(function() Sys.getpid()) at testthat/test-subprocess.R:31
      2: stop("Subprocess is busy or cannot start") at /tmp/RtmpXxLtHJ/file37e3145ac36a/pak.Rcheck/00_pkg_src/pak/R/subprocess.R:25
      
      ══ testthat results  ════════════════════════════════════════════════════════════
      OK: 51 SKIPPED: 6 FAILED: 1
      1. Error: remote (@test-subprocess.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

