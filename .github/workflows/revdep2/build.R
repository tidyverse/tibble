# Build the package under test once: a source tarball and a platform binary,
# so no shard pays the compilation twice. Shards install the binary; the
# tarball is kept alongside for reference and local reproduction.
#
# Deliberately independent of the plan, so the job can run in parallel with
# planning; everything it needs is the checkout.
#
# Environment variables:
#   OUT_DIR  - where the tarball, binary and metadata land (default: pkg)

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

out_dir <- env_chr("OUT_DIR", "pkg")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

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
status <- system2("R", c("CMD", "build", "--no-manual", "."))
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
file.rename(binary, file.path(binary_dir, binary))
file.copy(tarball, file.path(out_dir, tarball))

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
  "## revdep2 build",
  "",
  sprintf("Built `%s` %s: `%s`.", package, dev_version, binary)
))
