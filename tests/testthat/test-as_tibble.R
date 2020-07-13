# as_tibble -----------------------------------------------------------

test_that("columns are recycled to common length", {
  expect_identical(
    as_tibble(list(x = 1, y = 1:3)),
    tibble(x = rep(1, 3), y = 1:3)
  )
  expect_identical(
    as_tibble(list(x = 1:3, y = 1)),
    tibble(x = 1:3, y = rep(1, 3))
  )
  expect_identical(
    as_tibble(list(x = character(), y = 1)),
    tibble(x = character(), y = numeric())
  )
})

test_that("columns must be same length", {
  expect_tibble_error(
    as_tibble(list(x = 1:2, y = 1:3)),
    error_incompatible_size(NULL,  c("x", "y"), 2:3, NA)
  )
  expect_tibble_error(
    as_tibble(list(x = 1:2, y = 1:3, z = 1:4)),
    error_incompatible_size(
      NULL,
      c("x", "y", "z"),
      2:4,
      NA
    )
  )
  expect_tibble_error(
    as_tibble(list(x = 1:4, y = 1:2, z = 1:2)),
    error_incompatible_size(
      NULL,
      c("x", "y", "z"),
      c(4, 2, 2),
      NA
    )
  )
  expect_tibble_error(
    as_tibble(list(x = 1, y = 1:4, z = 1:2)),
    error_incompatible_size(
      NULL,
      c("y", "z"),
      c(4, 2),
      NA
    )
  )
  expect_tibble_error(
    as_tibble(list(x = 1:2, y = 1:4, z = 1)),
    error_incompatible_size(
      NULL,
      c("x", "y"),
      c(2, 4),
      NA
    )
  )
})

test_that("empty list() makes 0 x 0 tbl_df", {
  zero <- as_tibble(list())
  expect_is(zero, "tbl_df")
  expect_equal(dim(zero), c(0L, 0L))
})


test_that("NULL makes 0 x 0 tbl_df", {
  nnnull <- as_tibble(NULL)
  expect_is(nnnull, "tbl_df")
  expect_equal(dim(nnnull), c(0L, 0L))
})


test_that("as_tibble() without arguments raises a lifecycle warning", {
  scoped_lifecycle_errors()

  expect_error(as_tibble())
})


test_that("as_tibble.tbl_df() leaves classes unchanged (#60)", {
  df <- tibble()
  expect_equal(
    class(df),
    c("tbl_df", "tbl", "data.frame")
  )
  expect_equal(
    class(structure(df, class = c("my_df", class(df)))),
    c("my_df", "tbl_df", "tbl", "data.frame")
  )
})


test_that("Can convert tables to data frame", {
  mtcars_table <- xtabs(mtcars, formula = ~vs + am + cyl)

  mtcars2 <- as_tibble(mtcars_table)
  expect_equal(names(mtcars2), c(names(dimnames(mtcars_table)), "n"))

  expect_warning(
    mtcars2 <- as_tibble(mtcars_table, "Freq"),
    "named argument",
    fixed = TRUE
  )
  expect_equal(names(mtcars2), c(names(dimnames(mtcars_table)), "Freq"))

  mtcars2 <- as_tibble(mtcars_table, n = "Freq")
  expect_equal(names(mtcars2), c(names(dimnames(mtcars_table)), "Freq"))
})


test_that("Superseded: Can convert unnamed atomic vectors to tibble by default", {
  expect_equal(as_tibble(1:3), tibble(value = 1:3))
  expect_equal(as_tibble(c(TRUE, FALSE, NA)), tibble(value = c(TRUE, FALSE, NA)))
  expect_equal(as_tibble(1.5:3.5), tibble(value = 1.5:3.5))
  expect_equal(as_tibble(letters), tibble(value = letters))
})


test_that("as_tibble() checks for `unique` names by default (#278)", {
  l1 <- list(1:10)
  expect_tibble_error(
    as_tibble(l1),
    error_column_names_cannot_be_empty(1)
  )

  l2 <- list(x = 1, 2)
  expect_tibble_error(
    as_tibble(l2),
    error_column_names_cannot_be_empty(2)
  )

  l3 <- list(x = 1, ... = 2)
  expect_tibble_error(
    as_tibble(l3),
    error_column_names_cannot_be_dot_dot(2)
  )

  l4 <- list(x = 1, ..1 = 2)
  expect_tibble_error(
    as_tibble(l4),
    error_column_names_cannot_be_dot_dot(2)
  )

  df <- list(a = 1, b = 2)
  names(df) <- c("", NA)
  df <- new_tibble(df, nrow = 1)
  expect_tibble_error(
    as_tibble(df),
    error_column_names_cannot_be_empty(1:2)
  )
})


test_that("as_tibble() makes names `minimal`, even if not fixing names", {
  invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "minimal")
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), rep("", 3))
})

test_that("as_tibble() implements unique names", {
  invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "unique")
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), vec_as_names(rep("", 3), repair = "unique"))
})

test_that("as_tibble() implements universal names", {
  invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "universal")
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), vec_as_names(rep("", 3), repair = "universal"))
})


test_that("as_tibble() implements custom name repair", {
  expect_silent(
    invalid_df <- as_tibble(
      list(3, 4, 5),
      .name_repair = function(x) make.names(x, unique = TRUE)
    )
  )
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), make.names(rep("", 3), unique = TRUE))

  invalid_df_purrr <- as_tibble(
    list(3, 4, 5),
    .name_repair = ~make.names(., unique = TRUE)
  )
  expect_identical(invalid_df_purrr, invalid_df)
})

test_that("as_tibble.matrix() supports validate (with warning) (#558)", {
  expect_identical(
    expect_warning(as_tibble(diag(3), validate = TRUE)),
    tibble(
      V1 = c(1, 0, 0),
      V2 = c(0, 1, 0),
      V3 = c(0, 0, 1)
    )
  )
})

test_that("as_tibble.matrix() supports .name_repair", {
  scoped_lifecycle_warnings()

  x <- matrix(1:6, nrow = 3)

  expect_warning(as_tibble(x))
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    rep("", 2)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    paste0("...", 1:2)
  )

  x <- matrix(1:6, nrow = 3, dimnames = list(x = LETTERS[1:3], y = c("if", "when")))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    c(".if", "when")
  )
})

test_that("as_tibble.poly() supports .name_repair", {
  x <- poly(1:6, 3)

  expect_identical(
    names(as_tibble(x)),
    as.character(1:3)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    as.character(1:3)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    paste0("...", 1:3)
  )
})

test_that("as_tibble.table() supports .name_repair", {
  x <- table(a = c(1, 1, 1, 2, 2, 2), a = c(3, 4, 5, 3, 4, 5))

  expect_tibble_error(
    as_tibble(x),
    error_column_names_must_be_unique("a")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("a", "a", "n")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    c("a...1", "a...2", "n")
  )

  x <- table("if" = c(1, 1, 1, 2, 2, 2), "when" = c(3, 4, 5, 3, 4, 5))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when", "n")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when", "n")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    c(".if", "when", "n")
  )

  x <- table("m" = c(1, 1, 1, 2, 2, 2), "n" = c(3, 4, 5, 3, 4, 5))

  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("m", "n", "n")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    c("m", "n...2", "n...3")
  )
})

test_that("as_tibble.ts() supports .name_repair, minimal by default (#537)", {
  x <- ts(matrix(rnorm(6), nrow = 3), start = c(1961, 1), frequency = 12, names = NULL)

  expect_identical(
    names(as_tibble(x)),
    rep("", 2)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    rep("", 2)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    paste0("...", 1:2)
  )

  x <- ts(matrix(rnorm(6), nrow = 3), start = c(1961, 1), frequency = 12, names = c("if", "when"))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "universal")),
    c(".if", "when")
  )
})

test_that("as_tibble() can convert row names", {
  df <- data.frame(a = 1:3, b = 2:4, row.names = letters[5:7])

  expect_identical(
    as_tibble(df, rownames = NULL),
    tibble(a = 1:3, b = 2:4)
  )
  expect_identical(
    as_tibble(df, rownames = "id"),
    tibble(id = letters[5:7], a = 1:3, b = 2:4)
  )
  tbl_df <- as_tibble(df, rownames = NA)
  expect_identical(rownames(tbl_df), rownames(df))
  expect_identical(unclass(tbl_df), unclass(df))
})

test_that("as_tibble() can convert row names for zero-row tibbles", {
  df <- data.frame(a = 1:3, b = 2:4, row.names = letters[5:7])[0, ]

  expect_identical(
    as_tibble(df, rownames = NULL),
    tibble(a = integer(), b = integer())
  )
  expect_identical(
    as_tibble(df, rownames = "id"),
    tibble(id = character(), a = integer(), b = integer())
  )
  tbl_df <- as_tibble(df, rownames = NA)
  expect_identical(rownames(tbl_df), rownames(df))
  expect_identical(unclass(tbl_df), unclass(df))
})

test_that("as_tibble() converts implicit row names when `rownames =` is passed", {
  df <- data.frame(a = 1:3, b = 2:4)
  expect_equal(
    as_tibble(df, rownames = "id"),
    tibble(id = as.character(1:3), a = 1:3, b = 2:4)
  )
  expect_equal(
    as_tibble(df[0, ], rownames = "id"),
    tibble(id = character(0), a = integer(0), b = integer(0))
  )
})

test_that("as_data_frame is an alias of as_tibble", {
  scoped_lifecycle_silence()
  expect_identical(as_data_frame(NULL), as_tibble(NULL))
})

test_that("as.tibble is an alias of as_tibble", {
  scoped_lifecycle_silence()
  expect_identical(as.tibble(NULL), as_tibble(NULL))
})


# as_tibble_row -----------------------------------------------------------

test_that("as_tibble_row() can convert named bare vectors to data frame", {
  expect_identical(as_tibble_row(setNames(nm = 1:3)), tibble(`1` = 1L, `2` = 2L, `3` = 3L))
  expect_identical(as_tibble_row(setNames(nm = c(TRUE, FALSE))), tibble(`TRUE` = TRUE, `FALSE` = FALSE))
  expect_identical(as_tibble_row(setNames(nm = 1.5:3.5)), tibble(`1.5` = 1.5, `2.5` = 2.5, `3.5` = 3.5))
  expect_identical(as_tibble_row(setNames(nm = letters)), tibble(!!!setNames(nm = letters)))
  expect_identical(
    as_tibble_row(list(a = 1, b = list(2:3))),
    tibble(a = 1, b = list(2:3))
  )

  expect_tibble_error(
    as_tibble_row(list(a = 1, b = 2:3)),
    error_as_tibble_row_size_one(2, "b", 2)
  )
  expect_tibble_error(
    as_tibble_row(setNames(nm = c(TRUE, FALSE, NA))),
    error_column_names_cannot_be_empty(3)
  )
})

test_that("as_tibbe_row() fails with non-bare vectors (#739)", {
  expect_tibble_error(
    as_tibble_row(Sys.time()),
    error_as_tibble_row_bare(Sys.time())
  )
  expect_tibble_error(
    as_tibble_row(iris),
    error_as_tibble_row_bare(iris)
  )
  expect_tibble_error(
    as_tibble_row(Titanic),
    error_as_tibble_row_bare(Titanic)
  )
})


# as_tibble_col -----------------------------------------------------------

test_that("as_tibble_col() can convert atomic vectors to data frame", {
  expect_identical(as_tibble_col(1:3), tibble(value = 1:3))
  expect_identical(as_tibble_col(list(4, 5:6), column_name = "data"), tibble(data = list(4, 5:6)))

  expect_tibble_error(
    as_tibble_col(lm(y ~ x, data.frame(x = 1:3, y = 2:4))),
    error_column_scalar_type("value", 1, "a `lm` object")
  )
})

# Validation --------------------------------------------------------------

test_that("`validate` triggers deprecation message, but then works", {
  scoped_lifecycle_warnings()

  expect_tibble_error(
    expect_warning(
      as_tibble(list(a = 1, "hi"), validate = TRUE),
      "deprecated",
      fixed = TRUE
    ),
    error_column_names_cannot_be_empty(2)
  )

  expect_warning(
    df <- as_tibble(list(a = 1, "hi", a = 2), validate = FALSE),
    "deprecated",
    fixed = TRUE
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi", a = 2)
  names(df) <- c("a", "", "a")
  expect_warning(
    df <- as_tibble(df, validate = FALSE),
    "deprecated",
    fixed = TRUE
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi")
  names(df) <- c("a", "")
  expect_tibble_error(
    expect_warning(
      as_tibble(df, validate = TRUE),
      "deprecated",
      fixed = TRUE
    ),
    error_column_names_cannot_be_empty(2)
  )
})

test_that("`validate` always raises lifecycle warning.", {
  expect_deprecated(
    expect_tibble_error(
      as_tibble(list(a = 1, "hi"), validate = TRUE, .name_repair = "check_unique"),
      error_column_names_cannot_be_empty(2)
    )
  )

  expect_deprecated(
    df <- as_tibble(list(a = 1, "hi", a = 2), validate = FALSE, .name_repair = "minimal")
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi", a = 2)
  names(df) <- c("a", "", "a")
  expect_deprecated(
    df <- as_tibble(df, validate = FALSE, .name_repair = "minimal")
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi")
  names(df) <- c("a", "")
  expect_tibble_error(
    expect_warning(
      as_tibble(df, validate = TRUE, .name_repair = "check_unique"),
      NA
    ),
    error_column_names_cannot_be_empty(2)
  )
})

test_that("Inconsistent `validate` and `.name_repair` used together raise a warning.", {
  expect_deprecated(
    expect_tibble_error(
      as_tibble(list(a = 1, "hi"), validate = FALSE, .name_repair = "check_unique"),
      error_column_names_cannot_be_empty(2)
    )
  )

  expect_deprecated(
    df <- as_tibble(list(a = 1, "hi", a = 2), validate = TRUE, .name_repair = "minimal")
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi", a = 2)
  names(df) <- c("a", "", "a")
  expect_deprecated(
    df <- as_tibble(df, validate = TRUE, .name_repair = "minimal")
  )
  expect_identical(names(df), c("a", "", "a"))

  df <- data.frame(a = 1, "hi")
  names(df) <- c("a", "")
  expect_deprecated(
    expect_tibble_error(
      as_tibble(df, validate = FALSE, .name_repair = "check_unique"),
      error_column_names_cannot_be_empty(2)
    )
  )
})

verify_output("as_tibble.txt", {
  as_tibble(list(1))
  as_tibble(list(1, 2))
  as_tibble(list(a = 1, 2))
  as_tibble(as.list(1:26))
  as_tibble(set_names(list(1), "..1"))
  as_tibble(set_names(list(1:26), paste0("..", 1:26)))
  as_tibble(list(a = 1, a = 1))
  as_tibble(list(a = 1, a = 1, b = 1, b = 1))
  as_tibble(list(a = new_environment()))

  as_tibble_row(list(1))
  as_tibble_row(list(1, 2))
  as_tibble_row(list(a = 1, 2))
  as_tibble_row(as.list(1:26))
  as_tibble_row(set_names(list(1), "..1"))
  as_tibble_row(set_names(list(1:26), paste0("..", 1:26)))
  as_tibble_row(list(a = 1, a = 1))
  as_tibble_row(list(a = 1, a = 1, b = 1, b = 1))
  as_tibble_row(list(a = new_environment()))

  as_tibble_row(list(a = 1:3))
  as_tibble_row(list(a = 1:3, b = 1:3))
})
