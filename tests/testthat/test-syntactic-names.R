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

# universal_names() -----------------------------------------------------------
test_that("zero-length input", {
  expect_equal(universal_names(character()), character())
})

test_that("universal names are not changed", {
  expect_equal(universal_names(letters), letters)
})

test_that("universal_names() pass checks for minimal, unique, and universal", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  x_syn <- universal_names(x)
  expect_error(check_minimal(x_syn), NA)
  expect_error(check_unique(x_syn), NA)
  expect_true(all(is_syntactic(x_syn)))
  expect_identical(x_syn, c("...1", "...2", "x...3", "x...4", "a1.", "._x_y."))
})

test_that("universal_names() is idempotent", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  expect_identical(universal_names(x), universal_names(universal_names(x)))
})

test_that("dupes get a suffix", {
  expect_equal(
    universal_names(c("a", "b", "a", "c", "b")),
    c("a...1", "b...2", "a...3", "c", "b...5")
  )
})

test_that("solo empty or NA gets suffix", {
  expect_identical(universal_names(""), "...1")
  expect_identical(universal_names(NA_character_), "...1")
})

test_that("ellipsis treated like empty string", {
  expect_identical(universal_names("..."), universal_names(""))
})

test_that("solo dot is unchanged", {
  expect_equal(universal_names("."), ".")
})

test_that("dot, dot gets suffix", {
  expect_equal(universal_names(c(".", ".")), c("....1", "....2"))
})

test_that("dot-dot, dot-dot gets suffix", {
  expect_equal(universal_names(c("..", "..")), c(".....1", ".....2"))
})

test_that("empty, dot becomes suffix, dot", {
  expect_equal(universal_names(c("", ".")), c("...1", "."))
})

test_that("empty, empty, dot becomes suffix, suffix, dot", {
  expect_equal(universal_names(c("", "", ".")), c("...1", "...2", "."))
})

test_that("dot, dot, empty becomes suffix, suffix, suffix", {
  expect_equal(universal_names(c(".", ".", "")), c("....1", "....2", "...3"))
})

test_that("dot, empty, dot becomes suffix, suffix, suffix", {
  expect_equal(universal_names(c(".", "", ".")), c("....1", "...2", "....3"))
})

test_that("empty, dot, empty becomes suffix, dot, suffix", {
  expect_equal(universal_names(c("", ".", "")), c("...1", ".", "...3"))
})

test_that("'...j' gets stripped then names are modified", {
  expect_equal(universal_names(c("...6", "...1...2")), c("...1", "...2"))
  expect_equal(universal_names("if...2"), ".if")
})

test_that("complicated inputs", {
  expect_equal(
    universal_names(c("", ".", NA, "if...4", "if", "if...8", "for", "if){]1")),
    c("...1", ".", "...3", ".if...4", ".if...5", ".if...6", ".for", "if...1")
  )
})

test_that("message", {
  expect_message(
    universal_names(c("a b", "b c")),
    "New names:\n* `a b` -> a.b\n* `b c` -> b.c\n",
    fixed = TRUE
  )
})

test_that("quiet", {
  expect_message(
    universal_names("", quiet = TRUE),
    NA
  )
})

test_that("unique then universal is universal, with shuffling", {
  x <- c("", ".2", "..3", "...4", "....5", ".....6", "......7", "...")
  expect_identical(universal_names(unique_names(x)), universal_names(x))

  x2 <- x[c(7L, 4L, 3L, 6L, 5L, 1L, 2L, 8L)]
  expect_identical(universal_names(unique_names(x2)), universal_names(x2))

  x3 <- x[c(3L, 2L, 4L, 6L, 8L, 1L, 5L, 7L)]
  expect_identical(universal_names(unique_names(x3)), universal_names(x3))
})

# set_universal_names ---------------------------------------------------------
test_that("zero-length inputs given character names", {
  out <- set_universal_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- set_universal_names(1:3)
  expect_equal(names(out), c("...1", "...2", "...3"))
})

test_that("messages by default", {
  expect_message(
    set_universal_names(set_names(1, "a:b")),
    "New names:\n* `a:b` -> a.b\n",
    fixed = TRUE
  )
})

test_that("quiet = TRUE", {
  expect_message(set_universal_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("non-universal names", {
  out <- set_universal_names(set_names(1, "a b"))
  expect_equal(names(out), "a.b")

  expect_equal(universal_names("a b"), "a.b")
})

# check syntactic
test_that("check_syntactic() imposes check_minimal()", {
  expect_error(
    check_syntactic(NULL),
    error_names_must_be_non_null(repair = FALSE),
    fixed = TRUE
  )
})

test_that("check_syntactic() imposes check_unique()", {
  expect_error(
    check_syntactic(c("x", "x", "y")),
    error_column_names_must_be_unique("x"),
    fixed = TRUE
  )
})

test_that("check_syntactic() errors for non-syntactic names", {
  expect_error(
    check_syntactic(c("x", "a:b", "break")),
    error_column_names_must_be_syntactic(c("a:b", "break"), repair = FALSE),
    fixed = TRUE
  )
})
