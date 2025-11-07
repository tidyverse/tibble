# Build a list

`lst()` constructs a list, similar to
[`base::list()`](https://rdrr.io/r/base/list.html), but with some of the
same features as
[`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md).
`lst()` builds components sequentially. When defining a component, you
can refer to components created earlier in the call. `lst()` also
generates missing names automatically.

See [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html) for
a simpler and faster alternative without tibble's evaluation and
auto-name semantics.

## Usage

``` r
lst(...)
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

## Value

A named list.

## Examples

``` r
# the value of n can be used immediately in the definition of x
lst(n = 5, x = runif(n))
#> $n
#> [1] 5
#> 
#> $x
#> [1] 0.01541165 0.88650768 0.90355584 0.40385181 0.31612350
#> 

# missing names are constructed from user's input
lst(1:3, z = letters[4:6], runif(3))
#> $`1:3`
#> [1] 1 2 3
#> 
#> $z
#> [1] "d" "e" "f"
#> 
#> $`runif(3)`
#> [1] 0.65806867 0.06178628 0.25907777
#> 

a <- 1:3
b <- letters[4:6]
lst(a, b)
#> $a
#> [1] 1 2 3
#> 
#> $b
#> [1] "d" "e" "f"
#> 

# pre-formed quoted expressions can be used with lst() and then
# unquoted (with !!) or unquoted and spliced (with !!!)
n1 <- 2
n2 <- 3
n_stuff <- quote(n1 + n2)
x_stuff <- quote(seq_len(n))
lst(!!!list(n = n_stuff, x = x_stuff))
#> $n
#> [1] 5
#> 
#> $x
#> [1] 1 2 3 4 5
#> 
lst(n = !!n_stuff, x = !!x_stuff)
#> $n
#> [1] 5
#> 
#> $x
#> [1] 1 2 3 4 5
#> 
lst(n = 4, x = !!x_stuff)
#> $n
#> [1] 4
#> 
#> $x
#> [1] 1 2 3 4
#> 
lst(!!!list(n = 2, x = x_stuff))
#> $n
#> [1] 2
#> 
#> $x
#> [1] 1 2
#> 
```
