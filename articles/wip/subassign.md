# Subassignment

This vignette is an attempt to provide a comprehensive overview over all
subassignment operations, highlighting where the tibble implementation
differs from the data frame implementation.

``` r
library(tibble)
new_df <- function() {
  df <- data.frame(a = 1:4)
  df$b <- letters[5:8]
  df$cd <- list(9, 10:11, 12:14, "text")
  df
}
new_tbl <- function() {
  as_tibble(new_df())
}
```

Results of the same code for data frames and tibbles are presented side
by side:

[TABLE]

In the following, if the results are identical (after converting to a
data frame if necessary), only the tibble result is shown, as in the
example below. This allows to spot differences easier.

[TABLE]

For subassignment, we need a fresh copy of the data for each test. The
`with_*()` functions allow for a more concise notation (`with_tbl()`
omitted here for brevity):

``` r
with_df <- function(code, verbose = FALSE) {
  code <- rlang::enexpr(code)

  full_code <- rlang::quo({
    df <- new_df()
    !!code
    df
  })
  if (verbose) rlang::expr_print(rlang::quo_get_expr(full_code))
  rlang::eval_tidy(full_code)
}
```

This function takes an assignment expression and executes it on a fresh
copy of the data. The first example prints what’s really executed,
further examples omit this output.

[TABLE]

## \$\<-

### Scalars and full length

Assigning a scalar or a full-length vector to a column consistently
overwrites existing data or appends a new column at the end. Partial
matching doesn’t happen:

[TABLE]

[TABLE]

### Recycling

Tibbles allow recycling only for vectors of length 1 or of the same
length as the data.

[TABLE]

### Subset assignment

Updating parts of a column extracted by `$` is the responsibility of the
column vector. Tibbles can’t control what happens after `$` has
returned.

[TABLE]

For columns of the stricter `"vctrs_vctr"` class, this class implements
the check, which then works identically for data frames and tibbles:

``` r
with_df({ df$v = vctrs::new_vctr(1:4); df$v[1:2] <- vctrs::new_vctr(4:3)})
#>   a b         cd v
#> 1 1 e          9 4
#> 2 2 f     10, 11 3
#> 3 3 g 12, 13, 14 3
#> 4 4 h       text 4
with_df({ df$v = vctrs::new_vctr(1:4); df$v[1:2] <- vctrs::new_vctr(letters[4:3])})
#> Error in `[<-`:
#> ! Can't convert `value` <vctrs_vctr> to <vctrs_vctr>.
```

## \[\[\<-

### Scalars and full length

As with `$` subsetting, columns are consistently overwritten, and
partial matching doesn’t occur. Numeric indexing is supported, but
tibbles don’t support creation of new numbered columns for a good
reason.

[TABLE]

[TABLE]

### Cells

Tibbles are stricter when updating single cells, the value must be
coercible to the existing contents. Updating a list column requires the
contents to be wrapped in a list, consistently with `[[` subsetting
which returns a list if a cell in a list column is accessed:

[TABLE]

## \[\<-

### Scalars

[TABLE]

### Full length columns

[TABLE]

### Multiple full length columns

[TABLE]

### Full length rows

[TABLE]

### Multiple full length rows

[TABLE]

### Unspecified

[TABLE]

### Subset assignment

Due to tibble’s default of `drop = FALSE`, updating a portion of a `[`
subset is still safe, because tibble is still in control. Only one
example is given here.

[TABLE]
