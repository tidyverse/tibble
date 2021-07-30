render_galley_ext <- function(name, pkg, installed, path) {
  if (installed) {
    library(pkg, character.only = TRUE)
    in_path <- system.file("doc", name, package = pkg)
  } else {
    pkgload::load_all()
    in_path <- system.file("vignettes", name, package = pkg)
  }

  testthat::local_reproducible_output()

  Sys.time <- function() {
    structure(1627618285.45488, class = c("POSIXct", "POSIXt"))
  }
  Sys.Date <- function() {
    structure(18838, class = "Date")
  }
  set.seed(20210730)

  rmarkdown::render(
    in_path,
    output_file = path,
    output_format = rmarkdown::md_document(preserve_yaml = TRUE)
  )
}

render_galley <- function(name) {
  pkg <- utils::packageName()
  # FIXME: Hack!
  installed <- inherits(testthat::get_reporter(), "CheckReporter")
  path <- tempfile(fileext = ".md")

  out <- callr::r(
    render_galley_ext,
    args = list(name = name, pkg = pkg, installed = installed, path = path),
    stderr = "2>&1"
  )

  if (!file.exists(path)) {
    writeLines(c("", out, ""))
    rlang::abort(paste0("Error rendering ", name))
  }

  scrub_file(path)

  path
}

scrub_tempdir <- function(x) {
  tmpdir <- tempdir()
  stable_tmpdir <- gsub("(Rtmp).*$", "\\1Galley", tmpdir)

  tmpdir_rx <- utils::glob2rx(paste0("*", tmpdir, "*"), trim.head = TRUE)
  gsub(tmpdir_rx, stable_tmpdir, x)
}

scrub <- function(x) {
  x <- gsub("[<]bytecode: 0x.*[>]", "<bytecode: 0x1ee4c0de>", x)
  x <- gsub("[<]environment: 0x.*[>]", "<environment: 0xdeadbeef>", x)

  x <- scrub_tempdir(x)

  paste0(x, "\n", collapse = "")
}

scrub_file <- function(path) {
  text <- brio::read_lines(path)
  brio::write_file(scrub(text), path)
}

test_galley <- function(name) {
  skip_on_cran()

  rmd_name <- paste0(name, ".Rmd")
  md_name <- paste0(name, ".md")

  path <- render_galley(rmd_name)

  expect_snapshot_file(path, name = md_name, compare = compare_file_text)
}
