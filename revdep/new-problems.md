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
