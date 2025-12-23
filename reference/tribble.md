# Row-wise tibble creation

Create [tibble](https://tibble.tidyverse.org/reference/tibble.md)s using
an easier to read row-by-row layout. This is useful for small tables of
data where readability is important. Please see
[tibble-package](https://tibble.tidyverse.org/reference/tibble-package.md)
for a general introduction.

## Usage

``` r
tribble(...)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Arguments specifying the structure of a `tibble`. Variable names
  should be formulas, and may only appear before the data. These
  arguments are processed with
  [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html) and
  support unquote via
  [`rlang::!!`](https://rlang.r-lib.org/reference/injection-operator.html)
  and unquote-splice via
  [`rlang::!!!`](https://rlang.r-lib.org/reference/splice-operator.html).

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble.md).

## See also

See
[rlang::quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
for more details on tidy dots semantics, i.e. exactly how the `...`
argument is processed.

## Examples

``` r
tribble(
  ~colA, ~colB,
  "a",   1,
  "b",   2,
  "c",   3
)
#> # A tibble: 3 × 2
#>   colA   colB
#>   <chr> <dbl>
#> 1 a         1
#> 2 b         2
#> 3 c         3

# tribble will create a list column if the value in any cell is
# not a scalar
tribble(
  ~x,  ~y,
  "a", 1:3,
  "b", 4:6
)
#> # A tibble: 2 × 2
#>   x     y        
#>   <chr> <list>   
#> 1 a     <int [3]>
#> 2 b     <int [3]>

# Use dplyr::mutate(dplyr::across(...)) to assign an explicit type
tribble(
  ~a, ~b, ~c,
  1, "2000-01-01", "1.5"
) %>%
  dplyr::mutate(
    dplyr::across(a, as.integer),
    dplyr::across(b, as.Date)
  )
#> # A tibble: 1 × 3
#>       a b          c    
#>   <int> <date>     <chr>
#> 1     1 2000-01-01 1.5  
```
