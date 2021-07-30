vignette_path <- function(name) {
  path <- system.file("vignettes", name, package = utils::packageName())
  if (path != "") {
    return(path)
  }
  path <- system.file("doc", name, package = utils::packageName())
  if (path != "") {
    return(path)
  }

  abort(paste0("Can't find vignette `", name, "`."))
}

render_galley <- function(name) {
  path <- tempfile(fileext = ".md")

  suppressMessages(capture.output(
    rmarkdown::render(
      vignette_path(name),
      output_file = path,
      output_format = rmarkdown::md_document(preserve_yaml = TRUE)
    )
  ))

  path
}
