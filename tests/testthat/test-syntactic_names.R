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
