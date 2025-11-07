# Row-wise matrix creation

Create matrices laying out the data in rows, similar to
`matrix(..., byrow = TRUE)`, with a nicer-to-read syntax. This is useful
for small matrices, e.g. covariance matrices, where readability is
important. The syntax is inspired by
[`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md).

## Usage

``` r
frame_matrix(...)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Arguments specifying the structure of a `frame_matrix`. Column names
  should be formulas, and may only appear before the data. These
  arguments are processed with
  [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html) and
  support unquote via
  [`rlang::!!`](https://rlang.r-lib.org/reference/injection-operator.html)
  and unquote-splice via
  [`rlang::!!!`](https://rlang.r-lib.org/reference/splice-operator.html).

## Value

A [matrix](https://rdrr.io/r/base/matrix.html).

## See also

See
[rlang::quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
for more details on tidy dots semantics, i.e. exactly how the `...`
argument is processed.

## Examples

``` r
frame_matrix(
  ~col1, ~col2,
  1,     3,
  5,     2
)
#>      col1 col2
#> [1,]    1    3
#> [2,]    5    2
```
