# echarts4r

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: e_heatmap e_heatmap_
    > 
    > ### ** Examples
    > 
    > v <- LETTERS[1:10]
    > matrix <- data.frame(
    +   x = sample(v, 300, replace = TRUE), 
    +   y = sample(v, 300, replace = TRUE), 
    +   z = rnorm(300, 10, 1),
    +   stringsAsFactors = FALSE
    + ) %>% 
    +   dplyr::group_by(x, y) %>% 
    +   dplyr::summarise(z = sum(z)) %>% 
    +   dplyr::ungroup()
    > 
    > matrix %>% 
    +   e_charts(x) %>% 
    +   e_heatmap(y, z) %>% 
    +   e_visual_map(z)
    Error: The `names` must not be `NULL`.
    Execution halted
    ```

