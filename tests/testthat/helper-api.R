# I like the API file, but can't use pkgapi::api_roclet reliably:
# * pkgapi is not on CRAN, can't add to Suggests
# * RStudio default is to ignore the `Roxygen` field in `DESCRIPTION`

if (any(c("pkgload", "devtools") %in% loadedNamespaces())) {
  if (grepl("/tests/testthat$", getwd()) && file.exists("../../API")) {
    if (max(file.info(dir("../../R", full.names = TRUE))$mtime) > file.info("../../API")$mtime) {
      if (rlang::is_installed("pkgapi")) {
        rlang::inform("Updating API file")
        writeLines(format(pkgapi::extract_api()), "../../API")
      } else {
        rlang::warn("Install r-lib/pkgapi to update the API file")
      }
    }
  }
}
