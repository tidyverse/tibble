# data.tree

Version: 0.7.8

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +              color = function(node) {
    +                paste0("grey", 
    +                       100 - as.integer( 100 * nrow(node$data)/nrow(node$root$data))
    +                       )
    +              }
    +              )
    > Do(tree$leaves, 
    +    function(node) {
    +      SetNodeStyle(node, 
    +                   shape = "box", 
    +                   color = ifelse(node$splitname == "yes", "darkolivegreen4", "lightsalmon4"),
    +                   fillcolor = ifelse(node$splitname == "yes", "darkolivegreen1", "lightsalmon"),
    +                   style = "filled,rounded",
    +                   penwidth = 2
    +                   )
    +    }
    +    )
    > 
    > plot(tree)
    Error: Columns 1, 2, 3, 4, 5, … (and 3 more) must be named.
    Execution halted
    ```

