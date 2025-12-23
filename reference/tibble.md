# Build a data frame

`tibble()` constructs a data frame. It is used like
[`base::data.frame()`](https://rdrr.io/r/base/data.frame.html), but with
a couple notable differences:

- The returned data frame has the class
  [`tbl_df`](https://tibble.tidyverse.org/reference/tbl_df-class.md), in
  addition to `data.frame`. This allows so-called "tibbles" to exhibit
  some special behaviour, such as [enhanced
  printing](https://tibble.tidyverse.org/reference/formatting.md).
  Tibbles are fully described in
  [`tbl_df`](https://tibble.tidyverse.org/reference/tbl_df-class.md).

- `tibble()` is much lazier than
  [`base::data.frame()`](https://rdrr.io/r/base/data.frame.html) in
  terms of transforming the user's input.

  - List-columns are expressly anticipated and do not require special
    tricks.

  - Column names are not modified.

  - Inner names in columns are left unchanged.

  - For R \< 4.0, [character vectors were not coerced to
    factor](https://blog.r-project.org/2020/02/16/stringsasfactors/).

- `tibble()` builds columns sequentially. When defining a column, you
  can refer to columns created earlier in the call. Only columns of
  length one are recycled.

- If a column evaluates to a data frame or tibble, it is nested or
  spliced. If it evaluates to a matrix or a array, it remains a matrix
  or array, respectively. See examples.

`tibble_row()` constructs a data frame that is guaranteed to occupy one
row. Vector columns are required to have size one, non-vector columns
are wrapped in a list.

## Usage

``` r
tibble(
  ...,
  .rows = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet")
)

tibble_row(
  ...,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet")
)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  A set of name-value pairs. These arguments are processed with
  [`rlang::quos()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
  and support unquote via
  [`rlang::!!`](https://rlang.r-lib.org/reference/injection-operator.html)
  and unquote-splice via
  [`rlang::!!!`](https://rlang.r-lib.org/reference/splice-operator.html).
  Use `:=` to create columns that start with a dot.

  Arguments are evaluated sequentially. You can refer to previously
  created elements directly or using the
  [rlang::.data](https://rlang.r-lib.org/reference/dot-data.html)
  pronoun. To refer explicitly to objects in the calling environment,
  use
  [`rlang::!!`](https://rlang.r-lib.org/reference/injection-operator.html)
  or [rlang::.env](https://rlang.r-lib.org/reference/dot-data.html),
  e.g. `!!.data` or `.env$.data` for the special case of an object named
  `.data`.

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

## Value

A tibble, which is a colloquial term for an object of class
[`tbl_df`](https://tibble.tidyverse.org/reference/tbl_df-class.md). A
[`tbl_df`](https://tibble.tidyverse.org/reference/tbl_df-class.md)
object is also a data frame, i.e. it has class `data.frame`.

## See also

Use [`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.md)
to turn an existing object into a tibble. Use
[`enframe()`](https://tibble.tidyverse.org/reference/enframe.md) to
convert a named vector into a tibble. Name repair is detailed in
[`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).
See
[rlang::quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
for more details on tidy dots semantics, i.e. exactly how the `...`
argument is processed.

## Examples

``` r
# Unnamed arguments are named with their expression:
a <- 1:5
tibble(a, a * 2)
#> # A tibble: 5 × 2
#>       a `a * 2`
#>   <int>   <dbl>
#> 1     1       2
#> 2     2       4
#> 3     3       6
#> 4     4       8
#> 5     5      10

# Scalars (vectors of length one) are recycled:
tibble(a, b = a * 2, c = 1)
#> # A tibble: 5 × 3
#>       a     b     c
#>   <int> <dbl> <dbl>
#> 1     1     2     1
#> 2     2     4     1
#> 3     3     6     1
#> 4     4     8     1
#> 5     5    10     1

# Columns are available in subsequent expressions:
tibble(x = runif(10), y = x * 2)
#> # A tibble: 10 × 2
#>          x      y
#>      <dbl>  <dbl>
#>  1 0.850   1.70  
#>  2 0.954   1.91  
#>  3 0.00536 0.0107
#>  4 0.660   1.32  
#>  5 0.189   0.378 
#>  6 0.817   1.63  
#>  7 0.824   1.65  
#>  8 0.354   0.708 
#>  9 0.805   1.61  
#> 10 0.506   1.01  

# tibble() never coerces its inputs,
str(tibble(letters))
#> tibble [26 × 1] (S3: tbl_df/tbl/data.frame)
#>  $ letters: chr [1:26] "a" "b" "c" "d" ...
str(tibble(x = list(diag(1), diag(2))))
#> tibble [2 × 1] (S3: tbl_df/tbl/data.frame)
#>  $ x:List of 2
#>   ..$ : num [1, 1] 1
#>   ..$ : num [1:2, 1:2] 1 0 0 1

# or munges column names (unless requested),
tibble(`a + b` = 1:5)
#> # A tibble: 5 × 1
#>   `a + b`
#>     <int>
#> 1       1
#> 2       2
#> 3       3
#> 4       4
#> 5       5

# but it forces you to take charge of names, if they need repair:
try(tibble(x = 1, x = 2))
#> Error in tibble(x = 1, x = 2) : 
#>   Column name `x` must not be duplicated.
#> Use `.name_repair` to specify repair.
#> Caused by error in `repaired_names()` at tibble/R/names.R:38:3:
#> ! Names must be unique.
#> ✖ These names are duplicated:
#>   * "x" at locations 1 and 2.
tibble(x = 1, x = 2, .name_repair = "unique")
#> New names:
#> • `x` -> `x...1`
#> • `x` -> `x...2`
#> # A tibble: 1 × 2
#>   x...1 x...2
#>   <dbl> <dbl>
#> 1     1     2
tibble(x = 1, x = 2, .name_repair = "minimal")
#> # A tibble: 1 × 2
#>       x     x
#>   <dbl> <dbl>
#> 1     1     2

## By default, non-syntactic names are allowed,
df <- tibble(`a 1` = 1, `a 2` = 2)
## because you can still index by name:
df[["a 1"]]
#> [1] 1
df$`a 1`
#> [1] 1
with(df, `a 1`)
#> [1] 1

## Syntactic names are easier to work with, though, and you can request them:
df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
#> New names:
#> • `a 1` -> `a.1`
#> • `a 2` -> `a.2`
df$a.1
#> [1] 1

## You can specify your own name repair function:
tibble(x = 1, x = 2, .name_repair = make.unique)
#> # A tibble: 1 × 2
#>       x   x.1
#>   <dbl> <dbl>
#> 1     1     2

fix_names <- function(x) gsub("\\s+", "_", x)
tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)
#> # A tibble: 1 × 2
#>   year_1 year_2
#>    <dbl>  <dbl>
#> 1      1      2

## purrr-style anonymous functions and constants
## are also supported
tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))
#> # A tibble: 1 × 2
#>       x   x.1
#>   <dbl> <dbl>
#> 1     1     2

tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     1     2

# Tibbles can contain columns that are tibbles or matrices
# if the number of rows is compatible. Unnamed tibbled are
# spliced, i.e. the inner columns are inserted into the
# tibble under construction.
tibble(
  a = 1:3,
  tibble(
    b = 4:6,
    c = 7:9
  ),
  d = tibble(
    e = tibble(
      f = b
    )
  )
)
#> # A tibble: 3 × 4
#>       a     b     c d$e$f
#>   <int> <int> <int> <int>
#> 1     1     4     7     4
#> 2     2     5     8     5
#> 3     3     6     9     6
tibble(
  a = 1:3,
  b = diag(3),
  c = cor(trees),
  d = Titanic[1:3, , , ]
)
#> # A tibble: 3 × 4
#>       a b[,1]  [,2]  [,3] c[,"Girth"] [,"Height"] [,"Volume"]         d
#>   <int> <dbl> <dbl> <dbl>       <dbl>       <dbl>       <dbl> <table[,>
#> 1     1     1     0     0       1           0.519       0.967       0 …
#> 2     2     0     1     0       0.519       1           0.598       0 …
#> 3     3     0     0     1       0.967       0.598       1          35 …

# Data can not contain tibbles or matrices with incompatible number of rows:
try(tibble(a = 1:3, b = tibble(c = 4:7)))
#> Error in tibble(a = 1:3, b = tibble(c = 4:7)) : 
#>   Tibble columns must have compatible sizes.
#> • Size 3: Existing data.
#> • Size 4: Column `b`.
#> ℹ Only values of size one are recycled.

# Use := to create columns with names that start with a dot:
tibble(.dotted := 3)
#> # A tibble: 1 × 1
#>   .dotted
#>     <dbl>
#> 1       3

# This also works, but might break in the future:
tibble(.dotted = 3)
#> # A tibble: 1 × 1
#>   .dotted
#>     <dbl>
#> 1       3

# You can unquote an expression:
x <- 3
tibble(x = 1, y = x)
#> # A tibble: 1 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     1
tibble(x = 1, y = !!x)
#> # A tibble: 1 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     3

# You can splice-unquote a list of quosures and expressions:
tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))
#> # A tibble: 10 × 2
#>        x     y
#>    <int> <dbl>
#>  1     1     2
#>  2     2     4
#>  3     3     6
#>  4     4     8
#>  5     5    10
#>  6     6    12
#>  7     7    14
#>  8     8    16
#>  9     9    18
#> 10    10    20

# Use .data, .env and !! to refer explicitly to columns or outside objects
a <- 1
tibble(a = 2, b = a)
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     2     2
tibble(a = 2, b = .data$a)
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     2     2
tibble(a = 2, b = .env$a)
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     2     1
tibble(a = 2, b = !!a)
#> # A tibble: 1 × 2
#>       a     b
#>   <dbl> <dbl>
#> 1     2     1
try(tibble(a = 2, b = .env$bogus))
#> Error : object 'bogus' not found
try(tibble(a = 2, b = !!bogus))
#> Error in eval(expr, envir) : object 'bogus' not found

# Use tibble_row() to construct a one-row tibble:
tibble_row(a = 1, lm = lm(Height ~ Girth + Volume, data = trees))
#> # A tibble: 1 × 2
#>       a lm    
#>   <dbl> <list>
#> 1     1 <lm>  
```
