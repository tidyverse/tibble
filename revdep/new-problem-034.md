# rdefra

Version: 0.3.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: httr::http_error(myURL) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/expect-that.R:22
      7: http_error.character(myURL) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:162
      8: http_error(HEAD(x, ...)) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:166
      9: HEAD(x, ...) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:166
      10: request_perform(req, hu$handle$handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/http-head.r:28
      11: request_fetch(req$output, req$url, handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/request.R:137
      12: request_fetch.write_memory(req$output, req$url, handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/write-function.R:74
      13: curl::curl_fetch_memory(url, handle = handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/write-function.R:76
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 20 SKIPPED: 1 FAILED: 1
      1. Error: Hourly data for station ABD/2014 should be available (@test-data.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

