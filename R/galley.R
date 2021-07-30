render_galley_ext <- function(name, pkg, installed, path) {
  if (installed) {
    library(pkg, character.only = TRUE)
    in_path <- system.file("doc", name, package = pkg)
  } else {
    pkgload::load_all()
    in_path <- system.file("vignettes", name, package = pkg)
  }

  testthat::local_reproducible_output()

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

  path
}

test_galley <- function(name) {
  rmd_name <- paste0(name, ".Rmd")
  md_name <- paste0(name, ".md")

  path <- render_galley(rmd_name)
  expect_snapshot_file(path, name = md_name, compare = compare_file_text)
}
