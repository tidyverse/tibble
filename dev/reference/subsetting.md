# Subsetting tibbles

Accessing columns, rows, or cells via `$`, `[[`, or `[` is mostly
similar to [regular data frames](https://rdrr.io/r/base/Extract.html).
However, the behavior is different for tibbles and data frames in some
cases:

- `[` always returns a tibble by default, even if only one column is
  accessed.

- Partial matching of column names with `$` and `[[` is not supported,
  and `NULL` is returned. For `$`, a warning is given.

- Only scalars (vectors of length one) or vectors with the same length
  as the number of rows can be used for assignment.

- Rows outside of the tibble's boundaries cannot be accessed.

- When updating with `[[<-` and `[<-`, type changes of entire columns
  are supported, but updating a part of a column requires that the new
  value is coercible to the existing type. See
  [`vctrs::vec_slice()`](https://vctrs.r-lib.org/reference/vec_slice.html)
  for the underlying implementation.

Unstable return type and implicit partial matching can lead to surprises
and bugs that are hard to catch. If you rely on code that requires the
original data frame behavior, coerce to a data frame via
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html).

## Usage

``` r
# S3 method for class 'tbl_df'
x$name

# S3 method for class 'tbl_df'
x[[i, j, ..., exact = TRUE]]

# S3 method for class 'tbl_df'
x[i, j, drop = FALSE, ...]

# S3 method for class 'tbl_df'
x$name <- value

# S3 method for class 'tbl_df'
x[[i, j, ...]] <- value

# S3 method for class 'tbl_df'
x[i, j, ...] <- value
```

## Arguments

- x:

  A tibble.

- name:

  A [name](https://rdrr.io/r/base/name.html) or a string.

- i, j:

  Row and column indices. If `j` is omitted, `i` is used as column
  index.

- ...:

  Ignored.

- exact:

  Ignored, with a warning.

- drop:

  Coerce to a vector if fetching one column via `tbl[, j]` . Default
  `FALSE`, ignored when accessing a column via `tbl[j]` .

- value:

  A value to store in a row, column, range or cell. Tibbles are stricter
  than data frames in what is accepted here.

## Details

For better compatibility with older code written for regular data
frames, `[` supports a `drop` argument which defaults to `FALSE`. New
code should use `[[` to turn a column into a vector.

## Examples

``` r
df <- data.frame(a = 1:3, bc = 4:6)
tbl <- tibble(a = 1:3, bc = 4:6)

# Subsetting single columns:
df[, "a"]
#> [1] 1 2 3
tbl[, "a"]
#> # A tibble: 3 × 1
#>       a
#>   <int>
#> 1     1
#> 2     2
#> 3     3
tbl[, "a", drop = TRUE]
#> [1] 1 2 3
as.data.frame(tbl)[, "a"]
#> [1] 1 2 3

# Subsetting single rows with the drop argument:
df[1, , drop = TRUE]
#> $a
#> [1] 1
#> 
#> $bc
#> [1] 4
#> 
tbl[1, , drop = TRUE]
#> # A tibble: 1 × 2
#>       a    bc
#>   <int> <int>
#> 1     1     4
as.list(tbl[1, ])
#> $a
#> [1] 1
#> 
#> $bc
#> [1] 4
#> 

# Accessing non-existent columns:
df$b
#> [1] 4 5 6
tbl$b
#> Warning: Unknown or uninitialised column: `b`.
#> NULL

df[["b", exact = FALSE]]
#> [1] 4 5 6
tbl[["b", exact = FALSE]]
#> Warning: `exact` ignored.
#> NULL

df$bd <- c("n", "e", "w")
tbl$bd <- c("n", "e", "w")
df$b
#> NULL
tbl$b
#> Warning: Unknown or uninitialised column: `b`.
#> NULL

df$b <- 7:9
tbl$b <- 7:9
df$b
#> [1] 7 8 9
tbl$b
#> [1] 7 8 9

# Identical behavior:
tbl[1, ]
#> # A tibble: 1 × 4
#>       a    bc bd        b
#>   <int> <int> <chr> <int>
#> 1     1     4 n         7
tbl[1, c("bc", "a")]
#> # A tibble: 1 × 2
#>      bc     a
#>   <int> <int>
#> 1     4     1
tbl[, c("bc", "a")]
#> # A tibble: 3 × 2
#>      bc     a
#>   <int> <int>
#> 1     4     1
#> 2     5     2
#> 3     6     3
tbl[c("bc", "a")]
#> # A tibble: 3 × 2
#>      bc     a
#>   <int> <int>
#> 1     4     1
#> 2     5     2
#> 3     6     3
tbl["a"]
#> # A tibble: 3 × 1
#>       a
#>   <int>
#> 1     1
#> 2     2
#> 3     3
tbl$a
#> [1] 1 2 3
tbl[["a"]]
#> [1] 1 2 3
```
