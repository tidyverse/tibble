# Converting vectors to data frames, and vice versa

`enframe()` converts named atomic vectors or lists to one- or two-column
data frames. For a list, the result will be a nested tibble with a
column of type `list`. For unnamed vectors, the natural sequence is used
as name column.

`deframe()` converts two-column data frames to a named vector or list,
using the first column as name and the second column as value. If the
input has only one column, an unnamed vector is returned.

## Usage

``` r
enframe(x, name = "name", value = "value")

deframe(x)
```

## Arguments

- x:

  A vector (for `enframe()`) or a data frame with one or two columns
  (for `deframe()`).

- name, value:

  Names of the columns that store the names and values. If `name` is
  `NULL`, a one-column tibble is returned; `value` cannot be `NULL`.

## Value

For `enframe()`, a
[tibble](https://tibble.tidyverse.org/reference/tibble.md) with two
columns (if `name` is not `NULL`, the default) or one column
(otherwise).

For `deframe()`, a vector (named or unnamed).

## Examples

``` r
enframe(1:3)
#> # A tibble: 3 × 2
#>    name value
#>   <int> <int>
#> 1     1     1
#> 2     2     2
#> 3     3     3
enframe(c(a = 5, b = 7))
#> # A tibble: 2 × 2
#>   name  value
#>   <chr> <dbl>
#> 1 a         5
#> 2 b         7
enframe(list(one = 1, two = 2:3, three = 4:6))
#> # A tibble: 3 × 2
#>   name  value    
#>   <chr> <list>   
#> 1 one   <dbl [1]>
#> 2 two   <int [2]>
#> 3 three <int [3]>
deframe(enframe(3:1))
#> 1 2 3 
#> 3 2 1 
deframe(tibble(a = 1:3))
#> [1] 1 2 3
deframe(tibble(a = as.list(1:3)))
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 2
#> 
#> [[3]]
#> [1] 3
#> 
```
