# Coerce lists, matrices, and more to data frames

`as_tibble()` turns an existing object, such as a data frame or matrix,
into a so-called tibble, a data frame with class
[`tbl_df`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md).
This is in contrast with
[`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md),
which builds a tibble from individual columns. `as_tibble()` is to
[`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) as
[`base::as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) is
to [`base::data.frame()`](https://rdrr.io/r/base/data.frame.html).

`as_tibble()` is an S3 generic, with methods for:

- [`data.frame`](https://rdrr.io/r/base/data.frame.html): Thin wrapper
  around the `list` method that implements tibble's treatment of
  [rownames](https://tibble.tidyverse.org/dev/reference/rownames.md).

- [`matrix`](https://rdrr.io/r/base/matrix.html),
  [`poly`](https://rdrr.io/r/stats/poly.html),
  [`ts`](https://rdrr.io/r/stats/ts.html),
  [`table`](https://rdrr.io/r/base/table.html)

- Default: Other inputs are first coerced with
  [`base::as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html).

`as_tibble_row()` converts a vector to a tibble with one row. If the
input is a list, all elements must have size one.

`as_tibble_col()` converts a vector to a tibble with one column.

## Usage

``` r
as_tibble(
  x,
  ...,
  .rows = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet"),
  rownames = pkgconfig::get_config("tibble::rownames", NULL)
)

# S3 method for class 'data.frame'
as_tibble(
  x,
  validate = NULL,
  ...,
  .rows = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet"),
  rownames = pkgconfig::get_config("tibble::rownames", NULL)
)

# S3 method for class 'list'
as_tibble(
  x,
  validate = NULL,
  ...,
  .rows = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet")
)

# S3 method for class 'matrix'
as_tibble(x, ..., validate = NULL, .name_repair = NULL)

# S3 method for class 'table'
as_tibble(x, `_n` = "n", ..., n = `_n`, .name_repair = "check_unique")

# S3 method for class '`NULL`'
as_tibble(x, ...)

# Default S3 method
as_tibble(x, ...)

as_tibble_row(
  x,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet")
)

as_tibble_col(x, column_name = "value")
```

## Arguments

- x:

  A data frame, list, matrix, or other object that could reasonably be
  coerced to a tibble.

- ...:

  Unused, for extensibility.

- .rows:

  The number of rows, useful to create a 0-column tibble or just as an
  additional check.

- .name_repair:

  Treatment of problematic column names:

  - `"minimal"`: No name repair or checks, beyond basic existence,

  - `"unique"`: Make sure names are unique and not empty,

  - `"check_unique"`: (default value), no name repair, but check they
    are `unique`,

  - `"universal"`: Make the names `unique` and syntactic

  - `"unique_quiet"`: Same as `"unique"`, but "quiet"

  - `"universal_quiet"`: Same as `"universal"`, but "quiet"

  - a function: apply custom name repair (e.g.,
    `.name_repair = make.names` for names in the style of base R).

  - A purrr-style anonymous function, see
    [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html)

  This argument is passed on as `repair` to
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).
  See there for more details on these terms and the strategies used to
  enforce them.

- rownames:

  How to treat existing row names of a data frame or matrix:

  - `NULL`: remove row names. This is the default.

  - `NA`: keep row names.

  - A string: the name of a new column. Existing rownames are
    transferred into this column and the `row.names` attribute is
    deleted. No name repair is applied to the new column name, even if
    `x` already contains a column of that name. Use
    `as_tibble(rownames_to_column(...))` to safeguard against this case.

  Read more in
  [rownames](https://tibble.tidyverse.org/dev/reference/rownames.md).

- \_n, validate:

  **\[soft-deprecated\]**

  For compatibility only, do not use for new code.

- n:

  Name for count column, default: `"n"`.

- column_name:

  Name of the column.

## Row names

The default behavior is to silently remove row names.

New code should explicitly convert row names to a new column using the
`rownames` argument.

For existing code that relies on the retention of row names, call
`pkgconfig::set_config("tibble::rownames" = NA)` in your script or in
your package's [`.onLoad()`](https://rdrr.io/r/base/ns-hooks.html)
function.

## Life cycle

Using `as_tibble()` for vectors is superseded as of version 3.0.0,
prefer the more expressive `as_tibble_row()` and `as_tibble_col()`
variants for new code.

## See also

[`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
constructs a tibble from individual columns.
[`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
converts a named vector to a tibble with a column of names and column of
values. Name repair is implemented using
[`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).

## Examples

``` r
m <- matrix(rnorm(50), ncol = 5)
colnames(m) <- c("a", "b", "c", "d", "e")
df <- as_tibble(m)

as_tibble_row(c(a = 1, b = 2))
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     1     2
as_tibble_row(list(c = "three", d = list(4:5)))
#> # A tibble: 1 × 2
#>   c     d        
#>   <chr> <list>   
#> 1 three <int [2]>
as_tibble_row(1:3, .name_repair = "unique")
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> # A tibble: 1 × 3
#>    ...1  ...2  ...3
#>   <int> <int> <int>
#> 1     1     2     3

as_tibble_col(1:3)
#> # A tibble: 3 × 1
#>   value
#>   <int>
#> 1     1
#> 2     2
#> 3     3
as_tibble_col(
  list(c = "three", d = list(4:5)),
  column_name = "data"
)
#> # A tibble: 2 × 1
#>   data        
#>   <named list>
#> 1 <chr [1]>   
#> 2 <list [1]>  
```
