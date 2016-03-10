Version 0.2-3 (2016-03-10)
===

- New function `repair_names()` fixes missing and duplicate names (#10, #15, @r2evans).
- Finer coverage analysis (#37).
- Use `tibble` prefix for options (#13, #36).
- Expand README.
- Fix typos in documentation.
- Remove use of `src()` from examples.


Version 0.2-2 (2016-03-08)
===

- `frame_data()` now also creates a list column if one of the entries is a list (#32).
- New `rownames_to_column()` and `column_to_rownames()` functions, replace `add_rownames()` (#11, @zhilongjia).


Version 0.2-1 (2016-03-08)
===

- Use new-style `.travis.yml`
- Fix NOTE from `R CMD check`.


Version 0.2 (2016-03-02)
===

- Functions related to `tbl` and `src` stay in `dplyr` (#26). Remove unused `make_tbl()`.
- Non-scalar input to `frame_data()` and `tibble()` (including lists) creates list-valued columns (#7).
- Use C++ implementation for `as_data_frame.matrix()` (#14). Also add former `matrixToDataFrame()` tests, and fix unwanted conversion to factor.
- `as_data_frame(NULL)` is 0-row 0-column data frame (#17, @jennybc). `frame_data()` and `tibble()` create empty `data_frame` if no rows are given (#20).
- `data_frame(NULL)` raises error "must be a 1d atomic vector or list".
- `lst(NULL)` doesn't raise an error anymore (#17, @jennybc), but always uses deparsed expression as name (even for `NULL`).
- `trunc_mat()` and `print()` use `width` argument also for zero-row and zero-column data frames (#18).
- `glimpse()` now (invisibly) returns `x`, so it can be used within a chain of `dplyr` verbs (@edwindj).
- `base::getElement()` now works with tibbles (#9).
- Remove spurious usage of "dplyr" in documentation (#3).
- Almost full test coverage.


tibble 0.1
==========

First release. Contains functions related to table sources, the `tbl` class and the `tbl_df` subclass, as well as output and helper functions:

## Table sources

- `src()`
- `src_df()`
- `src_local()`
- `src_tbls()`
- `is.src()`
- `same_src()`


## The `tbl` class

- `tbl()`
- `tbl_df()`
- `make_tbl()`
- `tbl_vars()`
- `as.tbl()`, `is.tbl()`


## The `tbl_df` subclass

- `as_data_frame()`
- `data_frame()`, `data_frame_()`
- `frame_data()`, `tibble()`


## Output functions

- `glimpse()`
- `trunc_mat()`, `knit_print.trunc_mat()`
- `dim_desc()`
- `type_sum()`


## Helper functions

- `lst()`, `lst_()`
- `add_row()`
- `add_rownames()`
