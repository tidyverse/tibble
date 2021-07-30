render_galley_ext <- function(input_path, pkg, installed, output_dir, output_file) {
  if (installed) {
    library(pkg, character.only = TRUE)
  } else {
    pkgload::load_all()
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
    input_path,
    output_dir = output_dir,
    output_file = output_file,
    run_pandoc = FALSE,
    output_format = rmarkdown::md_document(preserve_yaml = TRUE)
  )
}

galley_use_installed <- function() {
  names <- lapply(sys.calls(), `[[`, 1)
  any(vapply(names, identical, quote(test_check), FUN.VALUE = logical(1)))
}

render_galley <- function(name, md_name) {
  pkg <- utils::packageName()
  # FIXME: Hack!
  installed <- galley_use_installed()

  if (installed) {
    input_path <- system.file("doc", name, package = pkg)
  } else {
    input_path <- system.file("vignettes", name, package = pkg)
  }

  # Need fixed file name for stability
  output_dir <- tempdir()
  output_file <- md_name

  out_text <- character()

  knit_path <- tryCatch(
    callr::r(
      render_galley_ext,
      args = list(
        input_path = input_path, pkg = pkg, installed = installed,
        output_dir = output_dir, output_file = output_file
      ),
      callback = function(x) {
        out_text <<- c(out_text, x)
      }
    ),
    error = function(e) {
      writeLines(c("", out_text, ""))
      rlang::abort(paste0("Error rendering ", name))
    }
  )

  path <- file.path(output_dir, output_file)
  full_knit_path <- file.path(dirname(input_path), knit_path)
  scrub_file(path, full_knit_path)
  unlink(full_knit_path)

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

scrub_file <- function(path, in_path = path) {
  text <- brio::read_lines(in_path)
  brio::write_file(scrub(text), path)
}

test_galley <- function(name) {
  testthat::skip_on_cran()

  rmd_name <- paste0(name, ".Rmd")
  md_name <- paste0(name, ".md")

  path <- render_galley(rmd_name, md_name)

  testthat::expect_snapshot_file(
    path, name = md_name, compare = testthat::compare_file_text
  )

  # FIXME: Test generated files
}
