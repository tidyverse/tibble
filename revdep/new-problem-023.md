# jpndistrict

Version: 0.3.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      options:        ENCODING=cp932 
      Reading layer `P34-14_47' from data source `/tmp/Rtmpsrlg6B/P34-14_47_GML/P34-14_47.shp' using driver `ESRI Shapefile'
      Simple feature collection with 65 features and 4 fields
      geometry type:  POINT
      dimension:      XY
      bbox:           xmin: 123.0045 ymin: 24.06092 xmax: 131.2989 ymax: 27.03917
      epsg (SRID):    NA
      proj4string:    +proj=longlat +ellps=GRS80 +no_defs
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 62 SKIPPED: 1 FAILED: 1
      1. Error: (unknown) (@test-export.R#3) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

