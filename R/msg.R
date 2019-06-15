# Looks into top-level tibble function,
# returns TRUE if that function has a given argument.
has_tibble_arg <- function(arg_name) {
  frames <- sys.frames()
  frame_env <- map(frames, parent.env)
  frame_is_namespace <- which(map_lgl(frame_env, identical, ns_env()))

  if (is_empty(frame_is_namespace)) return(FALSE)

  my_vars <- names(formals(sys.function(frame_is_namespace[[1]])))

  arg_name %in% my_vars
}

data_has_n_cols <- function(n) {
  paste0("`.data` has ", n, " columns")
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

error_enframe_value_null <- function() {
  "The `value` argument to `enframe()` cannot be NULL."
}

error_enframe_has_dim <- function(x) {
  paste0("`x` must not have more than one dimension. `length(dim(x))` must be zero or one, not ", length(dim(x)), ".")
}

error_1d_array_column <- function() {
  "1d arrays are not supported in a tibble column."
}

error_unsupported_index <- function(j) {
  paste0("Can't subset with `[` using an object of class ", class(j)[[1L]], ".")
}

error_na_column_index <- function() {
  "Can't use numeric NA as column index with `[`."
}

error_nonint_column_index <- function(pos, value) {
  bullets(
    "Must use integers to index columns with `[`:",
    paste0("Position ", pos, " equals ", value)
  )
}

error_small_column_index <- function(n, pos, value) {
  bullets(
    "Negative column indexes in `[` must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_large_column_index <- function(n, pos, value) {
  bullets(
    "Positive column indexes in `[` must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_dim_column_index <- function(j) {
  paste0("Must use a vector in `[`, not an object of class ", class(j)[[1L]], ".")
}

error_mismatch_column_flag <- function(n, j) {
  bullets(
    "Length of logical index vector for `[` must equal number of columns (or 1):",
    data_has_n_cols(n),
    paste0("Index vector has length ", j)
  )
}

error_na_column_flag <- function() {
  "Can't use logical NA when selecting columns with `[`."
}

error_unknown_names <- function(names) {
  pluralise_commas("Can't find column(s) ", tick(names), " in `.data`.")
}

error_existing_names <- function(names) {
  pluralise_commas("Column(s) ", tick(names), " already exist[s] in `.data`.")
}

error_add_rows_to_grouped_df <- function() {
  "Can't add rows to grouped data frames"
}

error_inconsistent_new_rows <- function(names) {
  bullets(
    "New rows in `add_row()` must use columns that already exist:",
    error_unknown_names(names)
  )
}

error_names_must_be_non_null <- function(repair = has_tibble_arg(".name_repair")) {
  paste0("The `names` must not be `NULL`.", use_repair(repair))
}

error_names_must_have_length <- function(length, n) {
  paste0("The `names` must have length ", n, ", not ", length, ".")
}

error_column_must_be_named <- function(names, repair = has_tibble_arg(".name_repair")) {
  invalid_df("must be named", names, use_repair(repair))
}

error_column_must_not_be_dot_dot <- function(names, repair = has_tibble_arg(".name_repair")) {
  invalid_df("must not have names of the form ... or ..j", names, use_repair(repair))
}

error_column_names_must_be_unique <- function(names, repair = has_tibble_arg(".name_repair")) {
  pluralise_commas("Column name(s) ", tick(names), " must not be duplicated.", use_repair(repair))
}

error_column_names_must_be_syntactic <- function(names, repair = has_tibble_arg(".name_repair")) {
  pluralise_commas("Column name(s) ", tick(names), " must be syntactic.", use_repair(repair))
}

error_column_must_be_vector <- function(names, classes) {
  bullets(
    "All columns in a tibble must be 1d or 2d objects:",
    paste0("Column ", tick(names), " is ", classes)
  )
}

error_time_column_must_be_posixct <- function(names) {
  invalid_df("[is](are) [a ]date(s)/time(s) and must be stored as POSIXct, not POSIXlt", names)
}

error_inconsistent_cols <- function(.rows, vars, vars_len, rows_source) {
  vars_split <- split(vars, vars_len)

  vars_split[["1"]] <- NULL
  if (!is.null(.rows)) {
    vars_split[[as.character(.rows)]] <- NULL
  }

  bullets(
    "Tibble columns must have consistent lengths, only values of length one are recycled:",
    if (!is.null(.rows)) paste0("Length ", .rows, ": Requested with ", rows_source),
    map2_chr(names(vars_split), vars_split, function(x, y) paste0("Length ", x, ": ", pluralise_commas("Column(s) ", tick(y))))
  )
}

error_inconsistent_new_cols <- function(n, df) {
  bullets(
    "New columns in `add_column()` must be consistent with `.data`:",
    pluralise_count("`.data` has ", n, " row(s)"),
    paste0(
      pluralise_n("New column(s) contribute[s]", ncol(df)), " ",
      nrow(df),
      " rows"
    )
  )
}

error_duplicate_new_cols <- function(names) {
  bullets(
    "Can't add duplicate columns with `add_column()`:",
    error_existing_names(names)
  )
}

error_both_before_after <- function() {
  "Can't specify both `.before` and `.after`."
}

error_already_has_rownames <- function() {
  "`df` must be a data frame without row names in `column_to_rownames()`."
}

error_as_tibble_needs_rownames <- function() {
  "Object passed to `as_tibble()` must have row names if the `rownames` argument is set."
}

error_glimpse_infinite_width <- function() {
  "`glimpse()` requires a finite value for the `width` argument."
}

error_tribble_needs_columns <- function() {
  "`tribble()` needs to specify at least one column using the `~name` syntax."
}

error_tribble_lhs_column_syntax <- function(lhs) {
  bullets(
    "All column specifications in `tribble()` must use the `~name` syntax.",
    paste0("Found ", expr_label(lhs), " on the left-hand side of `~`.")
  )
}

error_tribble_rhs_column_syntax <- function(rhs) {
  bullets(
    'All column specifications in `tribble()` must use the `~name` or `~"name"` syntax.',
    paste0("Found ", expr_label(rhs), " on the right-hand side of `~`.")
  )
}

error_tribble_non_rectangular <- function(cols, cells) {
  bullets(
    "`tribble()` must be used with rectangular data:",
    paste0("Found ", cols, " columns."),
    paste0("Found ", cells, " cells."),
    paste0(cells, " is not an integer multiple of ", cols, ".")
  )
}

error_frame_matrix_list <- function(pos) {
  bullets(
    "All values in `frame_matrix()` must be atomic:",
    pluralise_commas("Found list-valued element(s) at position(s) ", pos, ".")
  )
}

error_name_repair_arg <- function() {
  "The `.name_repair` argument must be a string or a function that specifies the name repair strategy."
}

error_new_tibble_must_be_list <- function() {
  "Must pass a list as `x` argument to `new_tibble()`."
}

error_new_tibble_needs_nrow <- function() {
  "Must pass a scalar integer as `nrow` argument to `new_tibble()`."
}
