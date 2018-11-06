# curl

Version: 3.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      This is libcurl version 7.47.0 with GnuTLS/3.4.10 
      Using test server: http://hb.opencpu.org 
      ── 1. Failure: host_con works via and multi_fdset (@test-multi.R#165)  ─────────
      multi_fdset(pool = pool)$reads has length 1, not length 2.
      
      ── 2. Failure: host_con works via and multi_fdset (@test-multi.R#165)  ─────────
      multi_fdset(pool = pool)$reads has length 0, not length 1.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 174 SKIPPED: 1 FAILED: 2
      1. Failure: host_con works via and multi_fdset (@test-multi.R#165) 
      2. Failure: host_con works via and multi_fdset (@test-multi.R#165) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

