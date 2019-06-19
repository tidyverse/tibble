context("universal_names")

# make_syntactic -------------------------------------------------------------
expect_syntactic <- function(name, exp_syn_name) {
  expect_identical(
    syn_name <- make_syntactic(name),
    exp_syn_name
  )
  expect_identical(syn_name, make.names(syn_name))
}

test_that("make_syntactic(): empty or NA", {
  expect_syntactic(
      c("", NA_character_),
      c(".", ".")
  )
})

test_that("make_syntactic(): reserved words", {
  expect_syntactic(
    c("if", "TRUE", "Inf", "NA_real_", "normal"),
    c(".if", ".TRUE", ".Inf", ".NA_real_", "normal")
  )
})

test_that("make_syntactic(): underscore", {
  expect_syntactic(
    c( "_",  "_1",  "_a}"),
    c("._", "._1", "._a.")
  )
})

test_that("make_syntactic(): dots", {
  expect_syntactic(
    c(".", "..",  "...", "...."),
    c(".", "..", "....", "....")
  )
})

test_that("make_syntactic(): number", {
  expect_syntactic(
      c(   "0",    "1",    "22",    "333"),
      c("...0", "...1", "...22", "...333")
  )
})

test_that("make_syntactic(): number then character", {
  expect_syntactic(
    c(  "0a",   "1b",   "22c",   "333d"),
    c("..0a", "..1b", "..22c", "..333d")
  )
})

test_that("make_syntactic(): number then non-character", {
  expect_syntactic(
    c(  "0)",   "1&",   "22*",   "333@"),
    c("..0.", "..1.", "..22.", "..333.")
  )
})

test_that("make_syntactic(): dot then number", {
  expect_syntactic(
    c(  ".0",   ".1",   ".22",   ".333"),
    c("...0", "...1", "...22", "...333")
  )
})

test_that("make_syntactic(): dot then number then character", {
  expect_syntactic(
    c( ".0a",  ".1b",  ".22c",  ".333d"),
    c("..0a", "..1b", "..22c", "..333d")
  )
})

test_that("make_syntactic(): dot then number then non-character", {
  expect_syntactic(
    c( ".0)",  ".1&",  ".22*",  ".333@"),
    c("..0.", "..1.", "..22.", "..333.")
  )
})

test_that("make_syntactic(): dot dot then number", {
  expect_syntactic(
    c( "..0",  "..1",  "..22",  "..333"),
    c("...0", "...1", "...22", "...333")
  )
})

test_that("make_syntactic(): dot dot dot then number", {
  expect_syntactic(
    c("...0", "...1", "...22", "...333"),
    c("...0", "...1", "...22", "...333")
  )
})

test_that("make_syntactic(): dot dot dot dot then number", {
  expect_syntactic(
    c("....0", "....1", "....22", "....333"),
    c("....0", "....1", "....22", "....333")
  )
})

test_that("make_syntactic(): dot dot dot dot dot then number", {
  expect_syntactic(
    c(".....0", ".....1", ".....22", ".....333"),
    c(".....0", ".....1", ".....22", ".....333")
  )
})

test_that("make_syntactic(): dot dot then number then character", {
  expect_syntactic(
    c("..0a", "..1b", "..22c", "..333d"),
    c("..0a", "..1b", "..22c", "..333d")
  )
})

test_that("make_syntactic(): dot dot then number then non-character", {
  expect_syntactic(
    c("..0)", "..1&", "..22*", "..333@"),
    c("..0.", "..1.", "..22.", "..333.")
  )
})
