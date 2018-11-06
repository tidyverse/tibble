# codemetar

Version: 0.1.6

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: add_github_topics(cm) at /tmp/RtmpcwuZam/filefdc82eadf6bd/codemetar.Rcheck/00_pkg_src/codemetar/R/create_codemeta.R:85
      6: gh::gh("GET /repos/:owner/:repo/topics", repo = repo, owner = owner, .send_headers = c(Accept = "application/vnd.github.mercy-preview+json")) at /tmp/RtmpcwuZam/filefdc82eadf6bd/codemetar.Rcheck/00_pkg_src/codemetar/R/guess_metadata.R:251
      7: gh_process_response(raw) at /tmp/RtmpmsBBoS/R.INSTALL989b6f582b22/gh/R/package.R:121
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 72 SKIPPED: 10 FAILED: 6
      1. Error: we can validate this file (@test-codemeta_validate.R#4) 
      2. Error: add_github_topics (@test-guess_metadata.R#103) 
      3. Error: we can write a codemeta document given a package name (@test-write_codemeta.R#4) 
      4. Error: We can read an existing codemeta.json file (@test-write_codemeta.R#29) 
      5. Error: We can use either a path or pkg name in writing (@test-write_codemeta.R#38) 
      6. Error: we can write codemeta given a codemeta object (@test-write_codemeta.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 79-80 (codemeta-intro.Rmd) 
    Error: processing vignette 'codemeta-intro.Rmd' failed with diagnostics:
    GitHub API error (403): 403 Forbidden
      API rate limit exceeded for 13.71.27.76. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)
    Execution halted
    ```

