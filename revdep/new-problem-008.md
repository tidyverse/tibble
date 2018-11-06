# classyfireR

Version: 0.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: eval_bare(get_expr(quo), get_env(quo)) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/expectation.R:90
      4: dplyr::is.tbl(retrieve_classification(inchi_sub$query_id)) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval.R:99
      5: retrieve_classification(inchi_sub$query_id) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/tbl.r:34
      6: jsonlite::fromJSON(text_content) at /tmp/RtmpcwuZam/filefdc8687d603c/classyfireR.Rcheck/00_pkg_src/classyfireR/R/retrieve_classification.R:27
      7: fromJSON_string(txt = txt, simplifyVector = simplifyVector, simplifyDataFrame = simplifyDataFrame, 
             simplifyMatrix = simplifyMatrix, flatten = flatten, ...) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/fromJSON.R:99
      8: parseJSON(txt, bigint_as_char) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/fromJSON.R:115
      9: parse_string(txt, bigint_as_char) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/parseJSON.R:5
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 10 SKIPPED: 0 FAILED: 1
      1. Error: submit-classification (@test-submission.R#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

