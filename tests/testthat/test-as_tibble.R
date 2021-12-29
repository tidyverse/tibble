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
    error_incompatible_size(NULL, c("x", "y"), 2:3, NA)
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
  expect_s3_class(zero, "tbl_df")
  expect_equal(dim(zero), c(0L, 0L))
})


test_that("NULL makes 0 x 0 tbl_df", {
  nnnull <- as_tibble(NULL)
  expect_s3_class(nnnull, "tbl_df")
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
  mtcars_table <- xtabs(mtcars, formula = ~ vs + am + cyl)

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
    error_column_names_cannot_be_empty(1, repair_hint = TRUE)
  )

  l2 <- list(x = 1, 2)
  expect_tibble_error(
    as_tibble(l2),
    error_column_names_cannot_be_empty(2, repair_hint = TRUE)
  )

  l3 <- list(x = 1, ... = 2)
  expect_tibble_error(
    as_tibble(l3),
    error_column_names_cannot_be_dot_dot(2, repair_hint = TRUE)
  )

  l4 <- list(x = 1, ..1 = 2)
  expect_tibble_error(
    as_tibble(l4),
    error_column_names_cannot_be_dot_dot(2, repair_hint = TRUE)
  )

  df <- list(a = 1, b = 2)
  names(df) <- c("", NA)
  df <- new_tibble(df, nrow = 1)
  expect_tibble_error(
    as_tibble(df),
    error_column_names_cannot_be_empty(1:2, repair_hint = TRUE)
  )
})


test_that("as_tibble() makes names `minimal`, even if not fixing names", {
  invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "minimal")
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), rep("", 3))
})

test_that("as_tibble() implements unique names", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  expect_snapshot({
    invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "unique")
  })
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(
    names(invalid_df),
    vec_as_names(rep("", 3), repair = "unique", quiet = TRUE)
  )
})

test_that("as_tibble() implements universal names", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  expect_snapshot({
    invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "universal")
  })
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(
    names(invalid_df),
    vec_as_names(rep("", 3), repair = "universal", quiet = TRUE)
  )
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
    .name_repair = ~ make.names(., unique = TRUE)
  )
  expect_identical(invalid_df_purrr, invalid_df)
})

test_that("as_tibble.matrix() supports validate (with warning) (#558)", {
  expect_warning(
    expect_identical(
      as_tibble(diag(3), validate = TRUE),
      tibble(
        V1 = c(1, 0, 0),
        V2 = c(0, 1, 0),
        V3 = c(0, 0, 1)
      )
    )
  )
})

test_that("as_tibble.matrix() supports .name_repair", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  scoped_lifecycle_warnings()

  x <- matrix(1:6, nrow = 3)

  expect_warning(as_tibble(x))

  minimal <- as_tibble(x, .name_repair = "minimal")
  expect_identical(names(minimal), rep("", 2))

  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), paste0("...", 1:2))

  x <- matrix(1:6, nrow = 3, dimnames = list(x = LETTERS[1:3], y = c("if", "when")))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when")
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), c(".if", "when"))
})

test_that("as_tibble.poly() supports .name_repair", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  x <- poly(1:6, 3)

  expect_identical(
    names(as_tibble(x)),
    as.character(1:3)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    as.character(1:3)
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), paste0("...", 1:3))
})

test_that("as_tibble.table() supports .name_repair", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  expect_snapshot(error = TRUE, {
    as_tibble(table(a = c(1, 1, 1, 2, 2, 2), a = c(3, 4, 5, 3, 4, 5)))
    as_tibble(table(c(1, 1, 1, 2, 2, 2), c(3, 4, 5, 3, 4, 5)))
  })

  x <- table(a = c(1, 1, 1, 2, 2, 2), a = c(3, 4, 5, 3, 4, 5))
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("a", "a", "n")
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), c("a...1", "a...2", "n"))

  x <- table("if" = c(1, 1, 1, 2, 2, 2), "when" = c(3, 4, 5, 3, 4, 5))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when", "n")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when", "n")
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), c(".if", "when", "n"))

  x <- table("m" = c(1, 1, 1, 2, 2, 2), "n" = c(3, 4, 5, 3, 4, 5))

  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("m", "n", "n")
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), c("m", "n...2", "n...3"))
})

test_that("as_tibble.ts() supports .name_repair, minimal by default (#537)", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  x <- ts(matrix(rnorm(6), nrow = 3), start = c(1961, 1), frequency = 12, names = NULL)

  expect_identical(
    names(as_tibble(x)),
    rep("", 2)
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    rep("", 2)
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), paste0("...", 1:2))

  x <- ts(matrix(rnorm(6), nrow = 3), start = c(1961, 1), frequency = 12, names = c("if", "when"))

  expect_identical(
    names(as_tibble(x)),
    c("if", "when")
  )
  expect_identical(
    names(as_tibble(x, .name_repair = "minimal")),
    c("if", "when")
  )
  expect_snapshot(
    universal <- as_tibble(x, .name_repair = "universal")
  )
  expect_identical(names(universal), c(".if", "when"))
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

test_that("as_data_frame() is an alias of as_tibble()", {
  scoped_lifecycle_silence()
  expect_identical(as_data_frame(NULL), as_tibble(NULL))
})

test_that("as.tibble() is an alias of as_tibble()", {
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
    error_column_names_cannot_be_empty(3, repair_hint = TRUE)
  )
})

test_that("as_tibble_row() works with non-bare vectors (#797)", {
  expect_tibble_error(
    as_tibble_row(new_environment()),
    error_as_tibble_row_vector(new_environment())
  )

  time <- vec_slice(Sys.time(), 1)
  expect_identical(
    as_tibble_row(time, .name_repair = "unique"),
    tibble(...1 = time)
  )
  expect_identical(
    as_tibble_row(trees[1:3, ], .name_repair = "unique"),
    tibble(
      ...1 = remove_rownames(trees[1, ]),
      ...2 = remove_rownames(trees[2, ]),
      ...3 = remove_rownames(trees[3, ])
    )
  )

  remove_first_dimname <- function(x) {
    dn <- dimnames(x)
    dn[1] <- list(NULL)
    dimnames(x) <- dn
    x
  }

  expect_identical(
    as_tibble_row(Titanic),
    tibble(
      "1st" = remove_first_dimname(Titanic[1, , , , drop = FALSE]),
      "2nd" = remove_first_dimname(Titanic[2, , , , drop = FALSE]),
      "3rd" = remove_first_dimname(Titanic[3, , , , drop = FALSE]),
      Crew  = remove_first_dimname(Titanic[4, , , , drop = FALSE])
    )
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
    error_column_names_cannot_be_empty(2, repair_hint = TRUE)
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
    error_column_names_cannot_be_empty(2, repair_hint = TRUE)
  )
})

test_that("`validate` always raises lifecycle warning.", {
  expect_deprecated(
    expect_tibble_error(
      as_tibble(list(a = 1, "hi"), validate = TRUE, .name_repair = "check_unique"),
      error_column_names_cannot_be_empty(2, repair_hint = TRUE)
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
    error_column_names_cannot_be_empty(2, repair_hint = TRUE)
  )
})

test_that("Inconsistent `validate` and `.name_repair` used together raise a warning.", {
  expect_deprecated(
    expect_tibble_error(
      as_tibble(list(a = 1, "hi"), validate = FALSE, .name_repair = "check_unique"),
      error_column_names_cannot_be_empty(2, repair_hint = TRUE)
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
      error_column_names_cannot_be_empty(2, repair_hint = TRUE)
    )
  )
})

test_that("correct rows and cols", {
  x <- matrix(1:6, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(2, 3))
})

test_that("correct rows and cols for 0 cols", {
  x <- matrix(integer(), nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(2, 0))
})

test_that("correct rows and cols for 0 cols and legacy naming", {
  scoped_lifecycle_silence()

  x <- matrix(integer(), nrow = 2)
  out <- as_tibble(x)

  expect_equal(dim(out), c(2, 0))
})

test_that("correct rows and cols for 0 rows", {
  x <- matrix(integer(), ncol = 3)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(0, 3))
})

test_that("preserves col names", {
  x <- matrix(1:4, nrow = 2)
  colnames(x) <- c("a", "b")

  out <- as_tibble(x)
  expect_equal(names(out), c("a", "b"))
})

test_that("supports compat col names", {
  scoped_lifecycle_warnings()

  x <- matrix(1:4, nrow = 2)

  expect_warning(out <- as_tibble(x))
  expect_equal(names(out), c("V1", "V2"))
})

test_that("creates col names with name repair", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  x <- matrix(1:4, nrow = 2)

  expect_snapshot(
    out <- as_tibble(x, .name_repair = "unique")
  )
  expect_equal(names(out), c("...1", "...2"))

  expect_snapshot(
    out <- as_tibble(x, .name_repair = "universal")
  )
  expect_equal(names(out), c("...1", "...2"))
})

test_that("preserves attributes except dim and names", {
  date <- Sys.Date() + 0:3
  dim(date) <- c(2, 2)
  colnames(date) <- c("a", "b")
  attr(date, "special") <- 42

  out <- as_tibble.matrix(date)
  expect_null(attributes(out[[1]])$names)
  expect_equal(attributes(out[[1]])$class, "Date")
  expect_equal(attributes(out[[2]])$special, 42)
})

test_that("properly handles poly class (#110)", {
  p <- poly(1:6, 3)
  p_df <- as_tibble(p)

  expect_equal(names(p_df), colnames(p))
  expect_equal(class(p_df[[1L]]), class(p[, 1]))
})

test_that("handles atomic vectors", {
  x <- matrix(TRUE, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(TRUE, TRUE))

  x <- matrix(1L, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(1L, 1L))

  x <- matrix(1.5, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(1.5, 1.5))

  x <- matrix("a", nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c("a", "a"))

  x <- matrix(complex(real = 1, imaginary = 2), nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], as.vector(x))
})

test_that("forwarding to as.data.frame() for ts objects (#184)", {
  mts <- cbind(
    A = ts(c(1, 1, 2, 2), start = 2016, frequency = 4),
    B = ts(c(11, 11, 12, 13), start = 2016, frequency = 4)
  )
  expect_identical(as_tibble(mts), as_tibble(as.data.frame(mts)))
})


test_that("converting from matrix removes row names by default", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- data.frame(A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30)
  out <- as_tibble(x)
  expect_false(has_rownames(out))
  expect_identical(out, as_tibble(df))
})

test_that("converting from matrix keeps row names if argument has them, with rownames = NA", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- data.frame(
    A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30,
    row.names = letters[1:6]
  )

  out <- as_tibble(x, rownames = NA)
  expect_identical(rownames(out), rownames(x))
  expect_identical(remove_rownames(out), as_tibble(df))
})

test_that("converting from matrix supports storing row names in a column", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- tibble(id = letters[1:6], A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30)
  out <- as_tibble(x, rownames = "id")
  expect_identical(out, df)
})

test_that("converting from matrix uses implicit row names when `rownames =` is passed", {
  x <- matrix(1:30, 6, 5)
  y <- as_tibble(x, rownames = "id", .name_repair = "minimal")
  z <- new_tibble(
    list(
      id = c("1", "2", "3", "4", "5", "6"),
      c(1L, 2L, 3L, 4L, 5L, 6L),
      c(7L, 8L, 9L, 10L, 11L, 12L),
      c(13L, 14L, 15L, 16L, 17L, 18L),
      c(19L, 20L, 21L, 22L, 23L, 24L),
      c(25L, 26L, 27L, 28L, 29L, 30L)
    ),
    nrow = 6
  )
  expect_equal(y, z)
})

test_that("output test", {
  expect_snapshot_with_error({
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
})
