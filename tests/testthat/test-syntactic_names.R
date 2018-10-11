context("syntactic_names")

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

# syntactic_names() -----------------------------------------------------------
test_that("zero-length input", {
  expect_equal(syntactic_names(character()), character())
})

test_that("syntactic names are not changed", {
  expect_equal(syntactic_names(letters), letters)
})

test_that("syntactic_names() pass checks for minimal, unique, and syntactic", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  x_syn <- syntactic_names(x)
  expect_error(check_minimal(x_syn), NA)
  expect_error(check_unique(x_syn), NA)
  expect_true(all(is_syntactic(x_syn)))
  expect_identical(x_syn, c("...1", "...2", "x..3", "x..4", "a1.", "._x_y."))
})

test_that("syntactic_names() is idempotent", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  expect_identical(syntactic_names(x), syntactic_names(syntactic_names(x)))
})

test_that("dupes get a suffix", {
  expect_equal(
    syntactic_names(c("a", "b", "a", "c", "b")),
    c("a..1", "b..2", "a..3", "c", "b..5")
  )
})

test_that("solo empty or NA gets suffix", {
  expect_equal(syntactic_names(""), "...1")
  expect_equal(syntactic_names(NA_character_), "...1")
})

test_that("solo dot is unchanged", {
  expect_equal(syntactic_names("."), ".")
})

test_that("dot, dot gets suffix", {
  expect_equal(syntactic_names(c(".", ".")), c("...1", "...2"))
})

test_that("empty, dot becomes suffix, dot", {
  expect_equal(syntactic_names(c("", ".")), c("...1", "."))
})

test_that("empty, empty, dot becomes suffix, suffix, dot", {
  expect_equal(syntactic_names(c("", "", ".")), c("...1", "...2", "."))
})

test_that("dot, dot, empty becomes suffix, suffix, suffix", {
  expect_equal(syntactic_names(c(".", ".", "")), c("...1", "...2", "...3"))
})

test_that("'..j' gets stripped then names are modified", {
  expect_equal(syntactic_names(c("..6", "..1")), c("...1", "...2"))
  expect_equal(syntactic_names("if..2"), ".if")
})

test_that("complicated inputs", {
  syntactic_names(c("", ".", NA, "if..4", "if", "if..8", "for", "if){1"))
})

test_that("message", {
  expect_message(
    syntactic_names(c("a b", "b c")),
    "New names:\n* `a b` -> a.b\n* `b c` -> b.c\n",
    fixed = TRUE
  )
})

test_that("quiet", {
  expect_message(
    syntactic_names("", quiet = TRUE),
    NA
  )
})

# set_syntactic_names ---------------------------------------------------------
test_that("zero-length inputs given character names", {
  out <- set_syntactic_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- set_syntactic_names(1:3)
  expect_equal(names(out), c("...1", "...2", "...3"))
})

test_that("messages by default", {
  expect_message(
    set_syntactic_names(set_names(1, "a:b")),
    "New names:\n* `a:b` -> a.b\n",
    fixed = TRUE
  )
})

test_that("quiet = TRUE", {
  expect_message(set_syntactic_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("non-syntactic names", {
  out <- set_syntactic_names(set_names(1, "a b"))
  expect_equal(names(out), "a.b")

  expect_equal(syntactic_names("a b"), "a.b")
})

# check syntactic
test_that("check_syntactic() imposes check_minimal()", {
  expect_error(
    check_syntactic(NULL),
    capture_error(check_minimal(NULL))$message,
    fixed = TRUE
  )
})

test_that("check_syntactic() imposes check_unique()", {
  expect_error(
    check_syntactic(c("x", "x", "y")),
    capture_error(check_unique(c("x", "x", "y")))$message,
    fixed = TRUE
  )
})

test_that("check_syntactic() errors for non-syntactic names", {
  expect_error(
    check_syntactic(c("x", "a:b", "break")),
    error_column_names_must_be_syntactic(c("a:b", "break")),
    fixed = TRUE
  )
})
