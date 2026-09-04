# Build the package under test once: a source tarball and a platform binary,
# so no shard pays the compilation twice. Shards install the binary; the
# tarball is kept alongside for reference and local reproduction.
#
# This runs INSIDE the base container, not on the runner: the binary must
# load under the container's R -- the pinned oldrel, not whatever the runner
# image ships -- and an R package binary does not survive a minor-version
# boundary. The build dependencies are therefore this script's own problem
# (REVDEPX_BUILD_DEPS), because the container starts with nothing but R, pak
# and the toolchain.
#
# Deliberately independent of the plan, so the job can run in parallel with
# planning; everything it needs is the checkout.
#
# Environment variables:
#   OUT_DIR             - where tarball, binary and metadata land (default: pkg)
#   REVDEPX_BUILD_DEPS  - if truthy, pak-install the package's own hard
#                         dependencies (with system requirements) first

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

out_dir <- env_chr("OUT_DIR", "pkg")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

if (env_flag("REVDEPX_BUILD_DEPS")) {
  # The image's baked repo may be a frozen P3M snapshot (rocker pins the last
  # date a tag's R version was current); the build must resolve against CRAN
  # now, like everything else in the run.
  codename <- tryCatch(
    system(". /etc/os-release && echo $VERSION_CODENAME", intern = TRUE),
    error = function(e) ""
  )
  if (nzchar(codename)) {
    options(
      repos = c(
        CRAN = sprintf("https://p3m.dev/cran/__linux__/%s/latest", codename)
      )
    )
  }
  inform("Installing build dependencies of the package under test")
  result <- pak_install(
    "deps::.",
    lib = .libPaths()[[1]],
    timeout_seconds = install_timeout_seconds()
  )
  if (!isTRUE(result$ok)) {
    stop(
      "Installing build dependencies failed: ",
      result$message %||% "see the log above",
      call. = FALSE
    )
  }
}

desc <- read.dcf("DESCRIPTION")[1, ]
package <- unname(desc[["Package"]])
dev_version <- unname(desc[["Version"]])

head_sha <- tryCatch(
  system2("git", c("rev-parse", "HEAD"), stdout = TRUE, stderr = NULL)[[1]],
  error = function(e) ""
)
if (!nzchar(head_sha)) {
  head_sha <- env_chr("GITHUB_SHA")
}

inform("Building ", package, " ", dev_version)
# `--no-build-vignettes` on top of revdep2's `--no-manual`: this binary
# exists to be installed into the checks' new-half library, and no check
# ever builds or reads the package-under-test's own vignettes -- the revdeps'
# vignettes are what get built, inside their own checks. Building them here
# would drag the whole Suggests tree (knitr, rmarkdown and friends) into a
# container that needs none of it; the first live run failed on exactly
# that ("vignette builder 'knitr' not found").
status <- system2(
  "R",
  c("CMD", "build", "--no-manual", "--no-build-vignettes", ".")
)
if (status != 0) {
  stop("R CMD build failed", call. = FALSE)
}
tarball <- sort(
  list.files(pattern = sprintf("^%s_.*[.]tar[.]gz$", package)),
  decreasing = TRUE
)[[1]]

inform("Building the binary from ", tarball)
binary_dir <- file.path(out_dir, "bin")
dir.create(binary_dir, recursive = TRUE, showWarnings = FALSE)
build_lib <- tempfile("lib-")
dir.create(build_lib)
status <- system2(
  "R",
  # Quoted: system2() quotes the command, but not the arguments.
  c("CMD", "INSTALL", "--build", "-l", shQuote(build_lib), shQuote(tarball))
)
if (status != 0) {
  stop("R CMD INSTALL --build failed", call. = FALSE)
}
binary <- sort(
  list.files(pattern = sprintf("^%s_.*_R_.*[.]tar[.]gz$", package)),
  decreasing = TRUE
)[[1]]
# Copy, not file.rename(): the working directory and OUT_DIR are two
# different bind mounts here, rename(2) across mounts fails with EXDEV,
# and file.rename() reports that as a return value nobody is forced to
# read. Run 32068779192 shipped a two-file artifact -- meta.json naming a
# binary that was never moved -- and every shard failed installing it.
# file.copy() works across mounts and its result is checked.
if (!isTRUE(file.copy(binary, file.path(binary_dir, binary)))) {
  stop("Copying ", binary, " into ", binary_dir, " failed", call. = FALSE)
}
unlink(binary)
if (!isTRUE(file.copy(tarball, file.path(out_dir, tarball)))) {
  stop("Copying ", tarball, " into ", out_dir, " failed", call. = FALSE)
}

write_json(
  list(
    package = package,
    dev_version = dev_version,
    sha = head_sha,
    r_version = paste(
      R.version$major,
      sub("[.].*$", "", R.version$minor),
      sep = "."
    ),
    platform = R.version$platform,
    tarball = tarball,
    binary = file.path("bin", binary),
    built_at = now_utc()
  ),
  file.path(out_dir, "meta.json")
)
inform("Binary: ", binary)

append_summary(c(
  "## revdepx build",
  "",
  sprintf("Built `%s` %s: `%s`.", package, dev_version, binary)
))
