# Invariants: Comparing behavior with data frames

This vignette defines invariants for subsetting and subset-assignment
for tibbles, and illustrates where their behaviour differs from data
frames. The goal is to define a small set of invariants that
consistently define how behaviors interact. Some behaviors are defined
using functions of the vctrs package,
e.g. [`vec_slice()`](https://vctrs.r-lib.org/reference/vec_slice.html),
[`vec_recycle()`](https://vctrs.r-lib.org/reference/vec_recycle.html)
and
[`vec_as_index()`](https://vctrs.r-lib.org/reference/vec_as_index.html).
Refer to their documentation for more details about the invariants that
they follow.

The subsetting and subassignment operators for data frames and tibbles
are particularly tricky, because they support both row and column
indexes, both of which are optionally missing. We resolve this by first
defining column access with `[[` and `$`, then column-wise subsetting
with `[`, then row-wise subsetting, then the composition of both.

## Conventions

In this article, all behaviors are demonstrated using one example data
frame and its tibble equivalent:

``` r
library(tibble)
library(vctrs)
new_df <- function() {
  df <- data.frame(n = c(1L, NA, 3L, NA))
  df$c <- letters[5:8]
  df$li <- list(9, 10:11, 12:14, "text")
  df
}
new_tbl <- function() {
  as_tibble(new_df())
}
```

Results of the same code for data frames and tibbles are presented side
by side:

[TABLE]

If the results are identical (after converting to a data frame if
necessary), only the tibble result is shown.

Subsetting operations are read-only. The same objects are reused in all
examples:

``` r
df <- new_df()
tbl <- new_tbl()
```

Where needed, we also show examples with hierarchical columns containing
a data frame or a matrix:

``` r
new_tbl2 <- function() {
  tibble(
    tb = tbl,
    m = diag(4)
  )
}
new_df2 <- function() {
  df2 <- new_tbl2()
  class(df2) <- "data.frame"
  class(df2$tb) <- "data.frame"
  df2
}
df2 <- new_df2()
tbl2 <- new_tbl2()
```

[TABLE]

For subset assignment (subassignment, for short), we need a fresh copy
of the data for each test. The `with_*()` functions (omitted here for
brevity) allow for a more concise notation. These functions take an
assignment expression, execute it on a fresh copy of the data, and
return the data for printing. The first example prints what’s really
executed, further examples omit this output.

[TABLE]

## Column extraction

### Definition of `x[[j]]`

`x[[j]]` is equal to `.subset2(x, j)`.

[TABLE]

NB: `x[[j]]` always returns an object of size `nrow(x)` if the column
exists.

`j` must be a single number or a string, as enforced by
`.subset2(x, j)`.

[TABLE]

`NA` indexes, numeric out-of-bounds (OOB) values, and non-integers throw
an error:

[TABLE]

Character OOB access is silent because a common package idiom is to
check for the absence of a column with `is.null(df[[var]])`.

[TABLE]

### Definition of `x$name`

`x$name` and `x$"name"` are equal to `x[["name"]]`.

[TABLE]

Unlike data frames, tibbles do not partially match names. Because `df$x`
is rarely used in packages, it can raise a warning:

[TABLE]

## Column subsetting

### Definition of `x[j]`

`j` is converted to an integer vector by
`vec_as_index(j, ncol(x), names = names(x))`. Then
`x[c(j_1, j_2, ..., j_n)]` is equivalent to
`tibble(x[[j_1]], x[[j_2]], ..., x[[j_n]])`, keeping the corresponding
column names. This implies that `j` must be a numeric or character
vector, or a logical vector with length 1 or `ncol(x)`.[¹](#fn1)

[TABLE]

When subsetting repeated indexes, the resulting column names are
undefined, do not rely on them.

[TABLE]

For tibbles with repeated column names, subsetting by name uses the
first matching column.

`nrow(df[j])` equals `nrow(df)`.

[TABLE]

Tibbles support indexing by a logical matrix, but only if all values in
the returned vector are compatible.

[TABLE]

### Definition of `x[, j]`

`x[, j]` is equal to `x[j]`. Tibbles do not perform column extraction if
`x[j]` would yield a single column.

[TABLE]

### Definition of `x[, j, drop = TRUE]`

For backward compatiblity, `x[, j, drop = TRUE]` performs column
**extraction**, returning `x[j][[1]]` when `ncol(x[j])` is 1.

[TABLE]

## Row subsetting

### Definition of `x[i, ]`

`x[i, ]` is equal to
`tibble(vec_slice(x[[1]], i), vec_slice(x[[2]], i), ...)`.[²](#fn2)

[TABLE]

This means that `i` must be a numeric vector, or a logical vector of
length `nrow(x)` or 1. For compatibility, `i` can also be a character
vector containing positive numbers.

[TABLE]

Exception: OOB values generate warnings instead of errors:

[TABLE]

Unlike data frames, only logical vectors of length 1 are recycled.

[TABLE]

NB: scalar logicals are recycled, but scalar numerics are not. That
makes the `x[NA, ]` and `x[NA_integer_, ]` return different results.

[TABLE]

### Definition of `x[i, , drop = TRUE]`

`drop = TRUE` has no effect when not selecting a single row:

[TABLE]

## Row and column subsetting

### Definition of `x[]` and `x[,]`

`x[]` and `x[,]` are equivalent to `x`.[³](#fn3)

### Definition of `x[i, j]`

`x[i, j]` is equal to `x[i, ][j]`.[⁴](#fn4)

### Definition of `x[[i, j]]`

`i` must be a numeric vector of length 1. `x[[i, j]]` is equal to
`x[i, ][[j]]`, or `vctrs::vec_slice(x[[j]], i)`.[⁵](#fn5)

``` r
df[[1, 1]]
#> [1] 1
df[[1, 3]]
#> [1] 9
```

This implies that `j` must be a numeric or character vector of length 1.

NB: `vec_size(x[[i, j]])` always equals 1. Unlike `x[i, ]`, `x[[i, ]]`
is not valid.

## Column update

### Definition of `x[[j]] <- a`

If `a` is a vector then `x[[j]] <- a` replaces the `j`th column with
value `a`.

`a` is recycled to the same size as `x` so must have size `nrow(x)`
or 1. (The only exception is when `a` is `NULL`, as described below.)
Recycling also works for list, data frame, and matrix columns.

[TABLE]

`j` must be a scalar numeric or a string, and cannot be `NA`. If `j` is
OOB, a new column is added on the right hand side, with name repair if
needed.

[TABLE]

`df[[j]] <- a` replaces the complete column so can change the type.

`[[<-` supports removing a column by assigning `NULL` to it.

Removing a nonexistent column is a no-op.

### Definition of `x$name <- a`

`x$name <- a` and `x$"name" <- a` are equivalent to
`x[["name"]] <- a`.[⁶](#fn6)

[TABLE]

`$<-` does not perform partial matching.

[TABLE]

## Column subassignment: `x[j] <- a`

- If `j` is missing, it’s replaced with `seq_along(x)`
- If `j` is logical vector, it’s converted to numeric with
  `seq_along(x)[j]`.

### `a` is a list or data frame

If `inherits(a, "list")` or `inherits(a, "data.frame")` is `TRUE`, then
`x[j] <- a` is equivalent to `x[[j[[1]]] <- a[[1]]`,
`x[[j[[2]]]] <- a[[2]]`, …

[TABLE]

If `length(a)` equals 1, then it is recycled to the same length as `j`.

[TABLE]

An attempt to update the same column twice gives an error.

[TABLE]

If `a` contains `NULL` values, the corresponding columns are removed
*after* updating (i.e. position indexes refer to columns before any
modifications).

[TABLE]

`NA` indexes are not supported.

Just like column updates, `[<-` supports changing the type of an
existing column.

Appending columns at the end (without gaps) is supported. The name of
new columns is determined by the LHS, the RHS, or by name repair (in
that order of precedence).

[TABLE]

Tibbles support indexing by a logical matrix, but only for a scalar RHS,
and if all columns updated are compatible with the value assigned.

[TABLE]

### `a` is a matrix or array

If `is.matrix(a)`, then `a` is coerced to a data frame with
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) before
assigning. If rows are assigned, the matrix type must be compatible with
all columns. If `is.array(a)` and `any(dim(a)[-1:-2] != 1)`, an error is
thrown.

[TABLE]

### `a` is another type of vector

If `vec_is(a)`, then `x[j] <- a` is equivalent to `x[j] <- list(a)`.
This is primarily provided for backward compatibility.

[TABLE]

Matrices must be wrapped in [`list()`](https://rdrr.io/r/base/list.html)
before assignment to create a matrix column.

[TABLE]

### `a` is `NULL`

Entire columns can be removed. Specifying `i` is an error.

[TABLE]

### `a` is not a vector

Any other type for `a` is an error. Note that if `is.list(a)` is `TRUE`,
but `inherits(a, "list")` is `FALSE`, then `a` is considered to be a
scalar. See
[`?vec_is`](https://vctrs.r-lib.org/reference/vec_assert.html) and
[`?vec_proxy`](https://vctrs.r-lib.org/reference/vec_proxy.html) for
details.

[TABLE]

## Row subassignment: `x[i, ] <- list(...)`

`x[i, ] <- a` is the same as `vec_slice(x[[j_1]], i) <- a[[1]]`,
`vec_slice(x[[j_2]], i) <- a[[2]]`, … .[⁷](#fn7)

[TABLE]

Only values of size one can be recycled.

[TABLE]

For compatibility, only a warning is issued for indexing beyond the
number of rows. Appending rows right at the end of the existing data is
supported, without warning.

[TABLE]

For compatibility, `i` can also be a character vector containing
positive numbers.

[TABLE]

## Row and column subassignment

### Definition of `x[i, j] <- a`

`x[i, j] <- a` is equivalent to `x[i, ][j] <- a`.[⁸](#fn8)

Subassignment to `x[i, j]` is stricter for tibbles than for data frames.
`x[i, j] <- a` can’t change the data type of existing columns.

[TABLE]

A notable exception is the population of a column full of `NA` (which is
of type `logical`), or the use of `NA` on the right-hand side of the
assignment.

[TABLE]

For programming, it is always safer (and faster) to use the correct type
of `NA` to initialize columns.

[TABLE]

For new columns, `x[i, j] <- a` fills the unassigned rows with `NA`.

[TABLE]

Likewise, for new rows, `x[i, j] <- a` fills the unassigned columns with
`NA`.

[TABLE]

### Definition of `x[[i, j]] <- a`

`i` must be a numeric vector of length 1. `x[[i, j]] <- a` is equivalent
to `x[i, ][[j]] <- a`.[⁹](#fn9)

NB: `vec_size(a)` must equal 1. Unlike `x[i, ] <-`, `x[[i, ]] <-` is not
valid.

------------------------------------------------------------------------

1.  `x[j][[jj]]` is equal to `x[[ j[[jj]] ]]`, in particular `x[j][[1]]`
    is equal to `x[[j]]` for scalar numeric or integer `j`.

2.  Row subsetting `x[i, ]` is not defined in terms of `x[[j]][i]`
    because that definition does not generalise to matrix and data frame
    columns. For efficiency and backward compatibility, `i` is converted
    to an integer vector by `vec_as_index(i, nrow(x))` first.

3.  `x[,]` is equivalent to `x[]` because `x[, j]` is equivalent to
    `x[j]`.

4.  A more efficient implementation of `x[i, j]` would forward to
    `x[j][i, ]`.

5.  Cell subsetting `x[[i, j]]` is not defined in terms of `x[[j]][[i]]`
    because that definition does not generalise to list, matrix and data
    frame columns. A more efficient implementation of `x[[i, j]]` would
    check that `j` is a scalar and forward to `x[i, j][[1]]`.

6.  `$` behaves almost completely symmetrically to `[[` when comparing
    subsetting and subassignment.

7.  `x[i, ]` is symmetrical for subset and subassignment.

8.  `x[i, j]` is symmetrical for subsetting and subassignment. A more
    efficient implementation of `x[i, j] <- a` would forward to
    `x[j][i, ] <- a`.

9.  `x[[i, j]]` is symmetrical for subsetting and subassignment. An
    efficient implementation would check that `i` and `j` are scalar and
    forward to `x[i, j][[1]] <- a`.
