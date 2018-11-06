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
      20: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      21: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      22: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      23: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      24: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      25: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 62 SKIPPED: 0 FAILED: 3
      1. Error: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      2. Error: polypath works as intended (@test-geom-polypath.R#5) 
      3. Error: geom_spatial_* geoms work properly (@test-geom_spatial.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

