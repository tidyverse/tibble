# geotopbricks

Version: 1.4

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: get.geotop.inpts.keyword.value
    > 
    > ### ** Examples
    > 
    > 
    > library(geotopbricks)
    > 
    > #Simulation working path
    > wpath <- 'http://www.rendena100.eu/public/geotopbricks/simulations/panola13_run2xC_test3'
    > prefix <- get.geotop.inpts.keyword.value("SoilLiqWaterPressTensorFile",wpath=wpath)
    > 
    > slope <- get.geotop.inpts.keyword.value("SlopeMapFile",raster=TRUE,wpath=wpath) 
    > bedrock_depth <- get.geotop.inpts.keyword.value("BedrockDepthMapFile",raster=TRUE,wpath=wpath) 
    > 
    > layers <- get.geotop.inpts.keyword.value("SoilLayerThicknesses",numeric=TRUE,wpath=wpath)
    Warning in file(con, "r") :
      URL 'http://www.rendena100.eu/public/geotopbricks/simulations/panola13_run2xC_test3/geotop.inpts': status was 'Failure when receiving data from the peer'
    Error in file(con, "r") : 
      cannot open the connection to 'http://www.rendena100.eu/public/geotopbricks/simulations/panola13_run2xC_test3/geotop.inpts'
    Calls: get.geotop.inpts.keyword.value -> <Anonymous> -> <Anonymous> -> file
    Execution halted
    ```

