expect_legacy_error <- function(code, ...) {
  expect_error(code)
}

expect_legacy_warning <- function(code, ...) {
  suppressWarnings(expect_warning(code))
}

skip_legacy <- function() {
  skip_if(packageVersion("tibble") >= "2.99.99")
}

skip_brk_add_row_vctrs <- function() {
  # BRK: add_row() uses vctrs coercion rules
  skip_legacy()
}

skip_brk_auto_splice_anonymous <- function() {
  # ENH: tibble() auto-splices anonymous tibble arguments
  skip_legacy()
}

skip_brk_inner_data_frames <- function() {
  # BRK: data frame columns are no longer coerced to tibbles
  skip_legacy()
}

skip_brk_inner_names_not_stripped <- function() {
  # BRK: inner names not stripped from coluns
  skip_legacy()
}

skip_brk_inner_dim_not_stripped <- function() {
  # BRK: inner dim not stripped from coluns
  skip_legacy()
}

skip_brk_no_recursive_indexing <- function() {
  # BRK: no recursive indexing in [[
  skip_legacy()
}

skip_brk_logical_subsetting_no_base_recycling <- function() {
  # BRK: logical indexes must be length one or match the length
  skip_legacy()
}

skip_brk_character_subsetting_no_negative <- function() {
  # BRK: character subsetting for rows no longer supports negative numbers
  skip_legacy()
}

skip_dep_oob_subsetting_warning <- function() {
  # DEP: numeric indexes give warning when indexing OOB
  skip_legacy()
}

skip_dep_rowname_subsetting_warning <- function() {
  # DEP: character indexes give warning with OOB matching
  skip_legacy()
}

skip_dep_new_tibble_subclass <- function() {
  # DEP: new_tibble() warns with subclass argument
  skip_legacy()
}

skip_dep_glimpse <- function() {
  # DEP: glimpse() and format_v() now in pillar
  skip_legacy()
}

skip_enh_posixlt_supported <- function() {
  # ENH: POSIXlt supported
  skip_legacy()
}

skip_enh_as_tibble_rownames <- function() {
  # ENH: rownames argument to as_tibble() works if data frame or matrix doesn't have row names
  skip_legacy()
}

skip_enh_tibble_null <- function() {
  # ENH: NULL arguments to tibble() are silently removed
  skip_legacy()
}

skip_enh_new_tibble_nrow_null <- function() {
  # ENH: new_tibble(nrow = NULL), #781
  skip_legacy()
}

skip_enh_empty_tribble_unspecified <- function() {
  # ENH: zero-row tribbles create unspecified columns
  skip_legacy()
}

skip_enh_as_tibble_retired <- function() {
  # ENH: retiring as_tibble() for vectors and lists, #447
  skip_legacy()
}

skip_enh_bullets_format <- function() {
  # ENH: new bullets format
  skip_legacy()
}

skip_enh_enframe_vector <- function() {
  # ENH: enframe() supports all vectors (#730)
  skip_legacy()
}

skip_enh_print_tbl_args <- function() {
  # ENH: print() and format() support more arguments
  skip_legacy()
}

skip_int_error_unknown_names <- function() {
  # INT: error_unknown_names() no longer implemented
  skip_legacy()
}

skip_int_error_names_must_be_null <- function() {
  # INT: error_names_must_be_null() no longer implemented
  skip_legacy()
}

skip_int_data_frame_tibble_diff <- function() {
  # INT: changed data_frame_() implementation to support custom deprecation warning
  skip_legacy()
}

skip_int_lifecycle <- function() {
  # INT: lifecycle changes classes for deprecation messages in R < 3.6
  skip_legacy()
}

universal_names <- function(...) {
  # INT: universal_names() no longer implemented
  skip_legacy()
}

set_universal_names <- function(...) {
  # INT: set_universal_names() no longer implemented
  skip_legacy()
}

unique_names <- function(...) {
  # INT: unique_names() no longer implemented
  skip_legacy()
}

minimal_names <- function(...) {
  # INT: minimal_names() no longer implemented
  skip_legacy()
}

set_minimal_names <- function(...) {
  # INT: set_minimal_names() no longer implemented
  skip_legacy()
}

make_syntactic <- function(...) {
  # INT: make_syntactic() no longer implemented
  skip_legacy()
}

make_unique <- function(...) {
  # INT: make_unique() no longer implemented
  skip_legacy()
}

two_to_three_dots <- function(...) {
  # INT: two_to_three_dots() no longer implemented
  skip_legacy()
}

output_file <- function(filename) file.path("zzz-output", filename)

expect_output_file_rel <- function(x, filename) {
  withr::with_options(
    list(digits = 4, width = 80, cli.unicode = l10n_info()$`UTF-8`),
    suppressWarnings(expect_output_file(x, output_file(filename), update = TRUE))
  )
}

expect_output_knit <- function(knit, filename, envir = parent.frame()) {
  expect_output_file_rel(cat(knit), filename)
}

expect_output <- function(...) {
  suppressWarnings(testthat::expect_output(...))
}
