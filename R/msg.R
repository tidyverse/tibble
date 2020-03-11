# Looks into top-level tibble function,
# returns TRUE if that function has a given argument.
has_tibble_arg <- function(arg_name) {
  frames <- utils::tail(sys.frames(), 5)
  frame_env <- map(frames, parent.env)
  frame_is_namespace <- which(map_lgl(frame_env, identical, ns_env()))

  if (is_empty(frame_is_namespace)) return(FALSE)

  my_vars <- names(formals(sys.function(frame_is_namespace[[1]])))

  arg_name %in% my_vars
}

invalid_df <- function(problem, vars, ...) {
  if (is.character(vars)) {
    vars <- tick(vars)
  }

  pluralise_commas(
    "Column(s) ",
    vars,
    paste0(" ", problem, ".", ...)
  )
}

use_repair <- function(repair) {
  if (repair) "\nUse .name_repair to specify repair."
}

# https://github.com/r-lib/rlang/issues/861
# Can't wrap properly because otherwise tibble::abort() appears in the traceback
abort <- cnd_signal

tibble_error_class <- function(class) {
  c(paste0("tibble_error_", class), "tibble_error")
}

# Errors get a class name derived from the name of the calling function
tibble_error <- function(x, ..., parent = NULL) {
  call <- sys.call(-1)
  fn_name <- as_name(call[[1]])
  class <- tibble_error_class(gsub("^error_", "", fn_name))
  error_cnd(.subclass = class, ..., message = x, parent = parent)
}

error_enframe_value_null <- function() {
  tibble_error("The `value` argument to `enframe()` cannot be NULL.")
}

error_enframe_has_dim <- function(x) {
  tibble_error(paste0("`x` must not have more than one dimension. `length(dim(x))` must be zero or one, not ", length(dim(x)), "."))
}

error_need_scalar_column_index <- function(j) {
  tibble_error("Must use a scalar in `[[`.")
}

error_na_column_index <- function(j) {
  tibble_error(pluralise_commas("Can't use NA as column index with `[` at position(s) ", j, "."), j = j)
}

error_dim_column_index <- function(j) {
  tibble_error(paste0("Must use a vector in `[`, not an object of class ", class(j)[[1L]], "."))
}

error_unsupported_column_index <- function(parent = NULL) {
  tibble_error("Must subset columns with an index vector.", body = parent$body, parent = parent)
}

error_unknown_column_names <- function(j, parent = NULL) {
  tibble_error(pluralise_commas("Can't find column(s) ", tick(j), " in `.data`."), j = j, parent = parent)
}

error_large_column_index <- function(ncol, j, parent = NULL) {
  tibble_error(
    pluralise_commas(
      "Cannot subset column(s) ", j, " in tibble with ",
      ncol, pluralise_n(" column(s)", ncol), "."),
    ncol = ncol, j = j, parent = parent
  )
}

error_small_column_index <- function(ncol, j, parent = NULL) {
  tibble_error(
    pluralise_commas(
      "Cannot exclude column(s) ", abs(j), " in tibble with ",
      ncol, pluralise_n(" column(s)", ncol), "."),
    ncol = ncol, j = j, parent = parent
  )
}

error_existing_column_names <- function(names) {
  tibble_error(pluralise_commas("Column(s) ", tick(names), " already exist[s] in `.data`."), names = names)
}

error_assign_columns_non_na_only <- function() {
  tibble_error("Can't use NA as column index in a tibble for assignment.")
}

error_assign_columns_non_missing_only <- function() {
  tibble_error("Column index is required for tibbles in `[[`.")
}

error_new_columns_at_end_only <- function(ncol, j) {
  j <- j[j > ncol + 1]
  tibble_error(
    pluralise_commas("Can't assign column(s) ", j, " in a tibble with ", ncol, pluralise_n(" column(s).", ncol)),
    ncol = ncol, j = j
  )
}

error_duplicate_column_subscript_for_assignment <- function(j) {
  j <- unique(j[duplicated(j)])
  tibble_error(pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

error_assign_rows_non_na_only <- function() {
  tibble_error("Can't use NA as row index in a tibble for assignment.")
}

error_new_rows_at_end_only <- function(nrow, i) {
  i <- i[i > nrow + 1]
  tibble_error(
    pluralise_commas("Can't assign row(s) ", i, " in a tibble with ", nrow, pluralise_n(" row(s).", nrow)),
    nrow = nrow, i = i
  )
}

error_duplicate_row_subscript_for_assignment <- function(i) {
  i <- unique(i[duplicated(i)])
  tibble_error(pluralise_commas("Row index(es) ", i, " [is](are) used more than once for assignment."), i = i)
}

error_add_rows_to_grouped_df <- function() {
  tibble_error("Can't add rows to grouped data frames.")
}

error_inconsistent_new_rows <- function(names) {
  tibble_error(
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      cnd_message(error_unknown_column_names(names))
    ),
    names = names
  )
}

error_names_must_be_non_null <- function(repair = has_tibble_arg(".name_repair")) {
  tibble_error(paste0("The `names` must not be `NULL`.", use_repair(repair)))
}

error_names_must_have_length <- function(length, n) {
  tibble_error(
    paste0("The `names` must have length ", n, ", not ", length, "."),
    expected = n,
    actual = length
  )
}

error_column_must_be_named <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must be named", names, use_repair(repair)), names = names, parent = parent)
}

error_column_must_not_be_dot_dot <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must not have names of the form ... or ..j", names, use_repair(repair)), names = names, parent = parent)
}

error_column_names_must_be_unique <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(pluralise_commas("Column name(s) ", tick(names), " must not be duplicated.", use_repair(repair)), names = names, parent = parent)
}

error_column_names_must_be_syntactic <- function(names, repair = has_tibble_arg(".name_repair")) {
  tibble_error(pluralise_commas("Column name(s) ", tick(names), " must be syntactic.", use_repair(repair)), names = names)
}

error_column_must_be_vector <- function(names, positions, classes) {
  tibble_error(
    bullets(
      "All columns in a tibble must be vectors:",
      paste0("Column ", name_or_pos(names, positions), " is ", classes)
    ),
    names = names
  )
}

error_inconsistent_cols <- function(.rows, vars, vars_len, rows_source) {
  vars_split <- split(vars, vars_len)

  vars_split[["1"]] <- NULL
  if (!is.null(.rows)) {
    vars_split[[as.character(.rows)]] <- NULL
  }

  tibble_error(bullets(
    "Tibble columns must have consistent sizes, only values of size one are recycled:",
    if (!is.null(.rows)) paste0("Size ", .rows, ": ", rows_source),
    map2_chr(names(vars_split), vars_split, function(x, y) {
      if (is.numeric(y)) {
        text <- "Column(s) at position(s) "
      } else {
        text <- "Column(s) "
        y <- tick(y)
      }

      paste0("Size ", x, ": ", pluralise_commas(text, y))
    })
  ))
}

error_inconsistent_new_cols <- function(n, df) {
  tibble_error(
    bullets(
      "New columns in `add_column()` must be consistent with `.data`:",
      pluralise_count("`.data` has ", n, " row(s)"),
      paste0(
        pluralise_n("New column(s) contribute[s]", ncol(df)), " ",
        nrow(df), " rows"
      )
    ),
    expected = n,
    actual = nrow(df)
  )
}

error_duplicate_new_cols <- function(names) {
  tibble_error(
    bullets(
      "Can't add duplicate columns with `add_column()`:",
      cnd_message(error_existing_column_names(names))
    ),
    names = names
  )
}

error_both_before_after <- function() {
  tibble_error("Can't specify both `.before` and `.after`.")
}

error_already_has_rownames <- function() {
  tibble_error("`df` must be a data frame without row names in `column_to_rownames()`.")
}

error_glimpse_infinite_width <- function() {
  tibble_error("`glimpse()` requires a finite value for the `width` argument.")
}

error_tribble_needs_columns <- function() {
  tibble_error("`tribble()` needs to specify at least one column using the `~name` syntax.")
}

error_tribble_lhs_column_syntax <- function(lhs) {
  tibble_error(bullets(
    "All column specifications in `tribble()` must use the `~name` syntax.",
    paste0("Found ", expr_label(lhs), " on the left-hand side of `~`.")
  ))
}

error_tribble_rhs_column_syntax <- function(rhs) {
  tibble_error(bullets(
    'All column specifications in `tribble()` must use the `~name` or `~"name"` syntax.',
    paste0("Found ", expr_label(rhs), " on the right-hand side of `~`.")
  ))
}

error_tribble_non_rectangular <- function(cols, cells) {
  tibble_error(bullets(
    "`tribble()` must be used with rectangular data:",
    paste0("Found ", cols, " columns."),
    paste0("Found ", cells, " cells."),
    paste0(cells, " is not an integer multiple of ", cols, ".")
  ))
}

error_frame_matrix_list <- function(pos) {
  tibble_error(bullets(
    "All values in `frame_matrix()` must be atomic:",
    pluralise_commas("Found list-valued element(s) at position(s) ", pos, ".")
  ))
}

error_tibble_row_size_one <- function(j, name, size, caller = "tibble_row") {
  desc <- tick(name)
  desc[name == ""] <- paste0("at position ", j[name == ""])

  tibble_error(bullets(
    "All vectors in `tibble_row()` must be size one, use `list()` to wrap.",
    paste0("Column ", desc, " is of size ", size, ".")
  ))
}

error_as_tibble_row_size_one <- function(j, name, size, caller = "tibble_row") {
  desc <- tick(name)
  desc[name == ""] <- paste0("at position ", j[name == ""])

  tibble_error(bullets(
    "All elements must be size one, use `list()` to wrap.",
    paste0("Element ", desc, " is of size ", size, ".")
  ))
}

error_new_tibble_must_be_list <- function() {
  tibble_error("Must pass a list as `x` argument to `new_tibble()`.")
}

error_new_tibble_needs_nrow <- function() {
  tibble_error("Must pass a scalar integer as `nrow` argument to `new_tibble()`.")
}

error_new_tibble_needs_class <- function() {
  tibble_error("Must pass a `class` argument instead of `subclass` to `new_tibble()`.")
}


# Subclassing errors ------------------------------------------------------

subclass_name_repair_errors <- function(expr, name, details = NULL) {
  tryCatch(
    force(expr),

    vctrs_error_names_cannot_be_empty = function(cnd) {
      cnd <- error_column_must_be_named(cnd$locations, parent = cnd)
      cnd$body <- details

      cnd_signal(cnd)
    },
    vctrs_error_names_cannot_be_dot_dot = function(cnd) {
      cnd <- error_column_must_not_be_dot_dot(cnd$locations, parent = cnd)
      cnd_signal(cnd)
    },
    vctrs_error_names_must_be_unique = function(cnd) {
      cnd <- error_column_names_must_be_unique(name[cnd$locations], parent = cnd)
      cnd_signal(cnd)
    }
  )
}

with_col_index_errors <- function(expr, arg = NULL) {
  tryCatch(
    force(expr),
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- arg
      cnd$subscript_elt <- "column"
      cnd_signal(cnd)
    }
  )
}
with_row_index_errors <- function(expr, arg = NULL) {
  tryCatch(
    force(expr),
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- arg
      cnd$subscript_elt <- "row"
      cnd_signal(cnd)
    }
  )
}

subclass_col_recycle_errors <- function(expr) {
  tryCatch(
    force(expr),

    vctrs_error_recycle_incompatible_size = function(cnd) {
      cnd_signal(cnd)
    }
  )
}
