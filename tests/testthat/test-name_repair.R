context("test-name_repair")

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
    error_names_must_be_non_null()
  )
  expect_error(
    check_minimal(c("a", NA)),
    error_column_must_be_named(2)
  )
})

test_that("unique_names() eliminates emptiness and duplication", {
  x <- c("", "x", "y", "x")
  expect_identical(unique_names(x), c("..1", "x..2", "y", "x..4"))
})

test_that("unique_names() strips positional suffixes, re-applies as needed", {
  x <- c("..20", "a..1", "b", "", "a..2")
  expect_identical(unique_names(x), c("..1", "a..2", "b", "..4", "a..5"))
})

test_that("check_unique() imposes check_minimal()", {
  expect_error(
    check_unique(NULL),
    capture_error(check_minimal(NULL))$message,
    fixed = TRUE
  )

  expect_error(
    check_unique(c("x", NA)),
    capture_error(error_column_must_be_named(2))$message,
    fixed = TRUE
  )
})

test_that("check_unique() errors for empty or duplicated names", {
  expect_error(
    check_unique(c("x", "")),
    error_column_must_be_named(2),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("", "x", "")),
    error_column_must_be_named(c(1, 3)),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("x", "x", "y")),
    error_column_names_must_be_unique("x"),
    fixed = TRUE
  )
  expect_error(
    check_unique(c("x", "y", "x", "y")),
    error_column_names_must_be_unique(c("x", "y")),
    fixed = TRUE
  )
})

test_that("syntactic_names() pass checks for minimal, unique, and syntactic", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  x_syn <- syntactic_names(x)
  expect_error(check_minimal(x_syn), NA)
  expect_error(check_unique(x_syn), NA)
  expect_true(all(is_syntactic(x_syn)))
  expect_identical(x_syn, c("...1", "...2", "x..3", "x..4", "a1.", "._x_y."))
})

test_that("name fixers are idempotent", {
  x <- c("", "", NA)
  expect_identical(minimal_names(x), minimal_names(minimal_names(x)))

  x <- c("..20", "a..1", "b", "", "a..2")
  expect_identical(unique_names(x), unique_names(unique_names(x)))

  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  expect_identical(syntactic_names(x), syntactic_names(syntactic_names(x)))
})

test_that("unique-ification has an 'algebraic'-y property", {
  ## inspired by, but different from, this guarantee about base::make.unique()
  ## make.unique(c(A, B)) == make.unique(c(make.unique(A), B))
  ## If A is already unique, then make.unique(c(A, B)) preserves A.

  ## I haven't formulated what we guarantee very well yet, but it's probably
  ## implicit in this test (?)

  x <- c("..20", "a..1", "b", "", "a..2", "d")
  y <- c("", "a..3", "b", "..3", "e")

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

# repair_names ------------------------------------------------------------

test_that("zero-length inputs given character names", {
  out <- repair_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- repair_names(1:3)
  expect_equal(names(out), c("V1", "V2", "V3"))
})

# make_unique -------------------------------------------------------------

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

# make_syntactic -------------------------------------------------------------
test_that("make_syntactic(): empty or NA", {
  expect_identical(
    syn_name <- make_syntactic(
      c( "", NA_character_)
    ),
      c(".", ".")
  )
  expect_identical(syn_name, make.names(syn_name))
})

test_that("make_syntactic(): dots", {
  expect_identical(
    syn_name <- make_syntactic(
      c(".", "..",  "...", "....")
    ),
      c(".", "..", "....", "....")
  )
  expect_identical(syn_name, make.names(syn_name))
})

test_that("make_syntactic(): dot(s) followed by a number", {
  expect_identical(
    syn_name <- make_syntactic(
      c(  ".1",   ".13",  "..1",  "..13", "...1", "...13")
    ),
      c("...1", "...13", "...1", "...13", "...1", "...13")
  )
  expect_identical(syn_name, make.names(syn_name))
})

test_that("make_syntactic(): dot(s) followed by a number then a non-number", {
  expect_identical(
    syn_name <- make_syntactic(
      c( ".1)",  ".13)", "..1)", "..13)", "...1)", "...13)")
    ),
      c("..1.", "..13.", "..1.", "..13.", "...1.", "...13.")
  )
  expect_identical(syn_name, make.names(syn_name))
})

test_that("make_syntactic(): reserved words", {
  expect_identical(
    syn_name <- make_syntactic(
      c("if", "TRUE", "Inf", "NA_real_", "normal")
    ),
      c(".if", ".TRUE", ".Inf", ".NA_real_", "normal")
  )
  expect_identical(syn_name, make.names(syn_name))
})

test_that("make_syntactic(): underscore", {
  expect_identical(
    syn_name <- make_syntactic(
      c( "_",  "_1",  "_a}")
    ),
      c("._", "._1", "._a.")
  )
  expect_identical(syn_name, make.names(syn_name))
})
