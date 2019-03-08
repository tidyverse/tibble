context("test-name_repair")

# minimal names -------------------------------------------------------------
test_that("minimal names are made from `n` when `name = NULL`", {
  expect_identical(minimal_names(NULL, 2), c("", ""))
  expect_error(
    minimal_names(NULL),
    error_name_length_required(),
    fixed = TRUE
  )
})

test_that("minimal names have '' instead of NAs", {
  expect_identical(minimal_names(c("", NA, "", NA)), c("", "", "", ""))
})

test_that("set_minimal_names() copes with NULL input names", {
  x <- 1:3
  x_named <- set_minimal_names(x)
  expect_equal(names(x_named), rep("", 3))
})

test_that("check_minimal() errors when names aren't minimal", {
  expect_error(
    check_minimal(NULL),
    error_names_must_be_non_null(repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    check_minimal(c("a", NA)),
    error_column_must_be_named(2, repair = FALSE),
    fixed = TRUE
  )
})

test_that("minimal_names() is idempotent", {
  x <- c("", "", NA)
  expect_identical(minimal_names(x), minimal_names(minimal_names(x)))
})

# unique names -------------------------------------------------------------
test_that("unique_names() eliminates emptiness and duplication", {
  x <- c("", "x", "y", "x")
  expect_identical(unique_names(x), c("...1", "x...2", "y", "x...4"))
})

test_that("solo empty or NA gets suffix", {
  expect_identical(unique_names(""), "...1")
  expect_identical(unique_names(NA_character_), "...1")
})

test_that("ellipsis treated like empty string", {
  expect_identical(unique_names("..."), unique_names(""))
})

test_that("two_three_dots() does its job and no more", {
  x <- c(".", ".1", "...1", "..1a")
  expect_identical(two_to_three_dots(x), x)

  expect_identical(two_to_three_dots(c("..1", "..22")), c("...1", "...22"))
})

test_that("two dots then number treated like three dots then number", {
  expect_identical(unique_names("..2"), unique_names("...5"))
})

test_that("unique_names() strips positional suffixes, re-applies as needed", {
  x <- c("...20", "a...1", "b", "", "a...2...34")
  expect_identical(unique_names(x), c("...1", "a...2", "b", "...4", "a...5"))

  expect_identical(unique_names("a...1"), "a")
  expect_identical(unique_names(c("a...2", "a")), c("a...1", "a...2"))
  expect_identical(unique_names(c("a...3", "a", "a")), c("a...1", "a...2", "a...3"))
  expect_identical(unique_names(c("a...2", "a", "a")), c("a...1", "a...2", "a...3"))
  expect_identical(unique_names(c("a...2", "a...2", "a...2")), c("a...1", "a...2", "a...3"))
})

test_that("check_unique() imposes check_minimal()", {
  expect_error(
    check_unique(NULL),
    error_names_must_be_non_null(repair = FALSE),
    fixed = TRUE
  )

  expect_error(
    check_unique(c("x", NA)),
    error_column_must_be_named(2, repair = FALSE),
    fixed = TRUE
  )
})

test_that("check_unique() errors for empty or duplicated names", {
  expect_error(
    check_unique(c("x", "")),
    error_column_must_be_named(2, repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("", "x", "")),
    error_column_must_be_named(c(1, 3), repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("x", "x", "y")),
    error_column_names_must_be_unique("x", repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("x", "y", "x", "y")),
    error_column_names_must_be_unique(c("x", "y"), repair = FALSE),
    fixed = TRUE
  )
})

test_that("unique_names() is idempotent", {
  x <- c("...20", "a...1", "b", "", "a...2")
  expect_identical(unique_names(!!x), unique_names(unique_names(!!x)))
})

test_that("unique-ification has an 'algebraic'-y property", {
  ## inspired by, but different from, this guarantee about base::make.unique()
  ## make.unique(c(A, B)) == make.unique(c(make.unique(A), B))
  ## If A is already unique, then make.unique(c(A, B)) preserves A.

  ## I haven't formulated what we guarantee very well yet, but it's probably
  ## implicit in this test (?)

  x <- c("...20", "a...1", "b", "", "a...2", "d")
  y <- c("", "a...3", "b", "...3", "e")

  ## fix names on each, catenate, fix the whole
  z1 <- unique_names(
    c(
      unique_names(x), unique_names(y)
    )
  )

  ## fix names on x, catenate, fix the whole
  z2 <- unique_names(
    c(
      unique_names(x), y
    )
  )

  ## fix names on y, catenate, fix the whole
  z3 <- unique_names(
    c(
      x, unique_names(y)
    )
  )

  ## catenate, fix the whole
  z4 <- unique_names(
    c(
      x, y
    )
  )

  expect_identical(z1, z2)
  expect_identical(z1, z3)
  expect_identical(z1, z4)
})

# names<-() -------------------------------------------------------------------
test_that("names<-() and set_names() reject non-minimal names", {
  df <- tibble(a = 1:3, b = 4:6, c = 7:9)

  scoped_lifecycle_warnings()

  # https://github.com/tidyverse/tibble/issues/562
  expect_warning(
    set_names(df, NULL),
    if (is_rstudio()) NA else error_names_must_be_non_null(),
    fixed = TRUE
  )

  expect_warning(
    `names<-`(df, NA),
    error_names_must_have_length(1, 3),
    fixed = TRUE
  )

  expect_warning(
    `names<-`(df, ""),
    error_names_must_have_length(1, 3),
    fixed = TRUE
  )

  expect_warning(
    `names<-`(df, 1),
    error_names_must_have_length(1, 3),
    fixed = TRUE
  )

  expect_warning(
    `names<-`(df, 1:2),
    error_names_must_have_length(2, 3),
    fixed = TRUE
  )

  expect_identical(
    set_names(df, letters[1:3]),
    tibble(a = 1:3, b = 4:6, c = 7:9)
  )
})

# repair_names (deprecated) ---------------------------------------------------
test_that("zero-length inputs given character names", {
  out <- repair_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- repair_names(1:3)
  expect_equal(names(out), c("V1", "V2", "V3"))
})

# make_unique (deprecated) ----------------------------------------------------
test_that("duplicates are de-deduped", {
  expect_equal(make_unique(c("x", "x")), c("x", "x1"))
})

test_that("blanks get prefix + numeric id", {
  expect_equal(make_unique(c("", "")), c("V1", "V2"))
})

test_that("blanks skip existing names", {
  expect_equal(make_unique(c("", "V1")), c("V2", "V1"))
})

test_that("blanks skip names created when de-duping", {
  expect_equal(make_unique(c("", "V", "V")), c("V2", "V", "V1"))
})
