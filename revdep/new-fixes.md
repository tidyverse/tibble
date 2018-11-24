# curl

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#curl>

Why is curl even in the revdep set for tibble? In any case, this look like flaky internet failure, which Jeroen has confirmed (I asked him to take a quick look at the ERROR).

# DiagrammeR

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#diagrammer>

Uses tidyverse extensively internally for data manipulation. No API implications and AFAICT no changes that would be user-visible.

Example and test failure due to intermediate unnamed tibbles in internal code.

JB fixed in <https://github.com/rich-iannone/DiagrammeR/pull/319>, which Rich should be able to tweak to make completely resilient to tibble version.

# nullabor

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#nullabor>

An example was failing. There are no tests.

Fixed by eliminating (what seems to me) an unnecessary coercion of a `ts` object to tibble, without specifying column name. Solution is not specific to a tibble version.

JB proposed this fix in <https://github.com/dicook/nullabor/pull/15>.

Makes me wonder if `as_tibble.ts()` should be like `as.data.frame.ts()` and just call the column `x` for a univariate time series. Opened an issue: <https://github.com/tidyverse/tibble/issues/537>

# prophet

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#prophet>

The revdep report shows 15 test failures and a failure with the vignette. I believe all come from a single place where `dplyr::as_data_frame.matrix()` is used *just prior* to providing nice, unduplicated column names.

JB proposed a fix in a PR. I now see no test failures and the vignette renders. There are other notes and warnings from `R CMD check` but I don't think they have anything to do with tibble.

The PR: <https://github.com/facebook/prophet/pull/739> **now merged: they plan to submit to CRAN before end of November**

# rdefra

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#rdefra>

Looks like an intermittent internet thing. I see no likely connection to tibble.

# readxl

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#readxl>

CRAN v1.1.0 applies `tibble::as_tibble(validate = FALSE)` and `tibble::repair_names()` on the list emitted by the C/C++ code. Sole point of tibble contact.

If I did nothing, users would see this and get same old behaviour:
```
> read_excel(xlsx_example)
The `validate` argument to `as_tibble()` is deprecated. Please use `.name_repair` to control column names.
```

It is possible to create a readxl version that handles different tibble versions and keeps existing name repair. But I don't want that.

  * I *want* to make an API change and expose `.name_repair` in `read_excel()` and friends. I announced my intent to change name repair in the v1.1.0 blog post and in the NEWS.
  * `.name_repair = "unique"` probably has to be the default, as readxl has a history of returning a tibble with unique names.

This PR is where I am working things out: <https://github.com/tidyverse/readxl/pull/517>

  * Introduces new `.name_repair` argument. Default is `.name_repair = "unique"`.
  * Allows for tibble <= 1.4.2, but messages on first use. Messages subsequently if and only if user has old tibble and seems to be trying to use `.name_repair`.

# xgboost

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#xgboost>

There is one example and one test failure. Both are related to `xgb.plot.multi.trees()` which calls DiagrammeR. If I install DiagrammeR from my PR (see elsewhere), examples run cleanly and tests pass cleanly. I can't run `check()` due to the somewhat non-standard way this package is setup.

TL;DR: if DiagrammeR gets updated for dev tibble, I believe that fixes xgboost.

# naniar

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#naniar>

All failures are due to the fact that `new_tibble()` requires an `nrow` argument. Luckily, this can be derived from the data.

Submitted PR: <https://github.com/njtierney/naniar/pull/220>. R CMD check runs fine locally.

# tidygraph

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#tidygraph>

Switched `as_tibble()` and manual name repair in a conversion from matrix to tibble.

PR: <https://github.com/thomasp85/tidygraph/pull/79>. Tests run fine locally, haven't run `R CMD check` yet.

# tibbletime

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#tibbletime>

All failures are due to the fact that `new_tibble()` requires an `nrow` argument. Luckily, this can be derived from the data.

Submitted PR: <https://github.com/business-science/tibbletime/pull/73>. R CMD check runs fine locally.

# anomalize

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#anomalize>

Fixed with tibbletime fix, needs to replace `as.tibble()` with `as_tibble()` . No PR submitted.

# drake

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#drake>

Switched `as_tibble()` and manual name repair in a conversion from matrix to tibble.

PR: <https://github.com/ropensci/drake/pull/586>. Tests run fine locally, haven't run `R CMD check` yet.

# broom

<https://github.com/tidyverse/tibble/blob/f-revdep-2/revdep/new-problems.md#broom>

  * One test warning and one test failure fixed by switching an application of `as_tibble()` to a vector to an application of `enframe()` in the lavaan tidiers.
  * One test failure re: `tidy.Polygon()` and another re: `tidy.Line()`. Each fixed by applying names just before `as.tibble()` instead of just after.
  * ~~One test failure in `tidy_xyz()` (has something to do with lists), fixed by moving the application of colnames to just before `as_tibble()` instead of just after.~~ *applied to the first PR, which is now closed*
  * Although slated to be deprecated / removed, broom currently has lots of "base" tidiers which just call `as_tibble()`. I changed some tests and examples to *not* test edge cases for us. Also applied `as.table()` to `ftable` objects, so that those hit the same code path. Otherwise `ftable` objects route through `as_tibble.default()` and generate a warning because `rlang::is_atomic()` returns `TRUE`.
  * No test failures remain. 24 test warnings remain, but seem to have nothing to do with tibble.
  * I see 1 warning and 1 note with `R CMD check`, neither of which have anything to do with tibble.

The first PR: ~~<https://github.com/tidymodels/broom/pull/534>~~ *`master` is not going to CRAN soon, but there will be a patch release ... hence the 2nd PR*

The second PR: <https://github.com/tidymodels/broom/pull/536> **now merged: they plan to submit to CRAN fairly soon because of this and the recent release or generics**
