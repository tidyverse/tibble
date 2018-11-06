# ggsn

Version: 0.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Loading required package: sp
    rgdal: version: 1.3-6, (SVN revision 773)
     Geospatial Data Abstraction Library extensions to R successfully loaded
     Loaded GDAL runtime: GDAL 2.1.3, released 2017/20/01
     Path to GDAL shared files: /usr/share/gdal/2.1
     GDAL binary built with GEOS: TRUE 
     Loaded PROJ.4 runtime: Rel. 4.9.2, 08 September 2015, [PJ_VERSION: 492]
     Path to PROJ.4 shared files: (autodetected)
     Linking to sp version: 1.3-1 
    > library(broom)
    > dsn <- system.file('extdata', package = 'ggsn')
    > map <- readOGR(dsn, 'sp')
    OGR data source with driver: ESRI Shapefile 
    Source: "/tmp/RtmpcwuZam/filefdc611e6beaa/ggsn.Rcheck/ggsn/extdata", layer: "sp"
    with 96 features
    It has 2 fields
    > map@data$id <- 0:(nrow(map@data) - 1)
    > map.df <- merge(tidy(map), map, by = 'id')
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

