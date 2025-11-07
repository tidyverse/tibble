# Deprecated functions

**\[deprecated\]**

Use [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
instead of `data_frame()`.

Use
[rlang::quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
instead of `tibble_()`, `data_frame_()`, and `lst_()`.

Use
[`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
instead of `as_data_frame()` or `as.tibble()`, but mind the new
signature and semantics.

Use [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
instead of `frame_data()`.

## Usage

``` r
data_frame(...)

tibble_(xs)

data_frame_(xs)

lst_(xs)

as_data_frame(x, ...)

as.tibble(x, ...)

frame_data(...)
```
