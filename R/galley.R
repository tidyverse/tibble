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
