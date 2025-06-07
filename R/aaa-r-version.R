# Detect mismatched R versions and clean object files if needed
#
# Loading a package compiled with a different R version is a bad idea.
# Switching R versions is useful: LLDB debugging only works with non-notarized
# versions of R (e.g. R-devel) on macOS, binary packages (e.g. arrow)
# are available only for stable versions.
# This code cleans up if a mismatch in R versions is detected,
# via a hidden src/version.txt file.
#
# This code is run directly, not in a function, to support both R CMD INSTALL
# and pkgload::load_all().
# Running this in .onLoad() is too late.
#
# This file is sourced manually in ./configure,
# and also sourced when the package is loaded.
# - For a package installed via R CMD build, nothing happens,
#   because this file is part of .Rbuildignore .
# - For a package installed via R CMD INSTALL, the file is sourced manually
#   in ./configure (which is always run) and does the right thing
# - For a package loaded via pkgload::load_all(), ./configure isn't always run.
#   In this case, this code serves as an emergency brake to clean up and fail,
#   so that the next attempt has a chance to succeed.
local({
  is_configure <- is.null(utils::packageName())

  if (is_configure) {
    pkg_path <- "src"
  } else {
    pkg_path <- system.file("src", package = utils::packageName())
  }

  if (dir.exists(pkg_path)) {
    version_file <- file.path(pkg_path, "version.txt")
    if (file.exists(version_file)) {
      binary_version <- readLines(version_file)[[1]]
    } else {
      binary_version <- "<unknown>"
    }
    if (R.version.string != binary_version) {
      files <- dir(pkg_path, pattern = "[.]o$|[.]so$", full.names = TRUE)
      unlink(files)
      writeLines(R.version.string, version_file)

      if (!is_configure) {
        stop(
          "Package was previously compiled with ",
          binary_version,
          ", ",
          "current is ",
          R.version.string,
          ". ",
          "Object files deleted, please try again.",
          call. = FALSE
        )
      }
    }
  }
})
