# Check one shard of a revdepx plan: many reverse dependencies, one job,
# every `R CMD check` inside a container.
#
# The engine-agnostic shard driver. The dependency library is not installed
# here any more -- it is baked into the run's universe image at
# /opt/revdepx/lib, built once and shared by every shard -- so the old
# `install` phase has shrunk into `prepare`: build the two one-package half
# libraries (the CRAN release of the package under test, and the dev binary)
# on the host, each by a short run of that same image, ready to be
# bind-mounted at /revdepx/lib-half in front of the baked library. The two
# phases exist so that the workflow can put each in its own step and Actions
# can time them separately; `PHASE=all` runs both in one go, which is what a
# local invocation wants.
#
# The check phase:
#
#   queue -- one line per runnable package into a queue file, heaviest first;
#            revdep4/queue.sh drains it with a pool of workers, each running
#            a package's two halves in turn and then a per-package
#            compare-one.R -- which sources the same compare.R this driver
#            does and appends the manifest line itself.
#
# Either way the two results are compared per package, revdepcheck-style,
# with the functions in compare.R.
#
# Failure is data here, never a job failure: a package that breaks, times out,
# or cannot even install its dependencies gets a manifest entry saying so, and
# the walk continues. The job goes red only when the driver itself is broken.
#
# The shard stops starting new checks when its deadline says the next one will
# not finish, and records the rest as deferred; a later run started with
# `retry-run` picks exactly those up. Results that exist by then -- including
# an old-version result whose new-version counterpart was cut off -- are still
# uploaded, so nothing decided is lost to the deadline. (The queue engine's
# workers apply the same defer rule per claim, inside queue.sh.)
#
# What each phase costs is recorded in timing.json next to the results: the
# collector folds it into the run's timings artifact, and the next plan sizes
# its shards from what this one measured rather than from CRAN's numbers and a
# guess.
#
# Environment variables:
#   SHARD                  - shard index from plan.json (required)
#   PLAN                   - plan file (default: plan.json)
#   PKG_DIR                - the revdepx-pkg artifact: meta.json, bin/ (required)
#   BASELINE_DIR           - the revdepx-baseline artifact of the donor run;
#                            may be missing or empty, then everything is fresh
#   OUT_DIR                - results directory, uploaded as the shard artifact
#                            (default: results)
#   REVDEPX_IMAGE_FILE     - file holding the universe image reference,
#                            written by shard-prep.sh
#                            (default: $RUNNER_TEMP/revdepx-image-ref)
#   REVDEPX_LIB_INDEX      - the image's library index, extracted from the
#                            image by shard-prep.sh
#                            (default: $RUNNER_TEMP/revdepx-lib-index.json)
#   TIMEOUT_FACTOR         - per-half check timeout as a multiple of the
#                            package's CRAN check time (default: 1.5)
#   TIMEOUT_MIN_MINUTES    - floor for that timeout; CRAN's machines are not
#                            these runners (default: 20 in the workflow)
#   DEADLINE_MINUTES       - stop starting new checks past this (default: 300)
#   PHASE                  - "prepare", "check", or "all" (default): which half
#                            of the shard this invocation runs ("install" is
#                            accepted as an alias for "prepare")
#   CHECK_SLICE            - `i/n`: which slice of the check phase this
#                            invocation runs (default: all of it in one go)

script_dir <- dirname(sub(
  "--file=",
  "",
  grep("^--file=", commandArgs(), value = TRUE)
))
source(file.path(script_dir, "util.R"))
source(file.path(script_dir, "compare.R"))

script_started <- Sys.time()
elapsed <- function(from) {
  round(as.numeric(difftime(Sys.time(), from, units = "secs")), 1)
}

shard_index <- as.integer(env_chr("SHARD"))
stopifnot(!is.na(shard_index))
plan <- read_json(env_chr("PLAN", "plan.json"))
pkg_dir <- env_chr("PKG_DIR", "pkg")
baseline_dir <- env_chr("BASELINE_DIR", "baseline")
out_dir <- env_chr("OUT_DIR", "results")
timeout_factor <- env_num("TIMEOUT_FACTOR", 1.5)
timeout_min_sec <- env_num("TIMEOUT_MIN_MINUTES", 10) * 60
deadline <- Sys.time() + env_num("DEADLINE_MINUTES", 300) * 60

# The queue engine is the only one: the pair engine (revdep3) was retired
# with its unmerged PR. The constant keeps the manifest, plan and timings
# schema -- whose rows are engine-tagged -- unchanged.
engine <- "queue"

mine <- Filter(function(s) s$index == shard_index, plan$shards)
if (length(mine) == 0) {
  stop(
    "Plan has no shard ",
    shard_index,
    " (it has ",
    length(plan$shards),
    "); the plan and the matrix disagree",
    call. = FALSE
  )
}
shard <- mine[[1]]
members <- vapply(shard$packages, function(p) p$name, character(1))
meta <- read_json(file.path(pkg_dir, "meta.json"))
package <- plan$package

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
manifest_path <- file.path(out_dir, "manifest.ndjson")
runner_temp <- env_chr("RUNNER_TEMP", tempdir())
work <- file.path(runner_temp, "revdepx-work")
dir.create(work, recursive = TRUE, showWarnings = FALSE)

# What shard-prep.sh left behind: the universe image's reference (a file, so
# the workflow does not have to thread it through job outputs), and the
# image's library index, extracted onto the host for the depfail screen.
image_ref_file <- env_chr(
  "REVDEPX_IMAGE_FILE",
  file.path(runner_temp, "revdepx-image-ref")
)
lib_index_path <- env_chr(
  "REVDEPX_LIB_INDEX",
  file.path(runner_temp, "revdepx-lib-index.json")
)
read_image_ref <- function() {
  if (!file.exists(image_ref_file)) {
    stop(
      "No universe image reference at ",
      image_ref_file,
      "; shard-prep.sh writes it, and it did not run",
      call. = FALSE
    )
  }
  trimws(readLines(image_ref_file, warn = FALSE)[[1]])
}

# Which half of the shard this invocation runs. The workflow calls the driver
# twice so that Actions times the preparation and the checks separately;
# `all` is for running the whole shard in one process, which is what a local
# invocation wants. The prepare phase leaves `install-state.json` behind and
# the checks read it, so the split costs one small file and repeats nothing.
phase <- env_chr("PHASE", "all")
if (identical(phase, "install")) {
  # The phase's name when it installed a whole dependency library on the
  # host; kept as an alias so nothing breaks while workflows move over.
  phase <- "prepare"
}
if (!phase %in% c("all", "prepare", "check")) {
  stop("PHASE must be one of \"all\", \"prepare\", \"check\"", call. = FALSE)
}
do_prepare <- phase %in% c("all", "prepare")
do_check <- phase %in% c("all", "check")
install_state <- file.path(work, "install-state.json")

# Which slice of the shard's packages this invocation checks, as `i/n`.
#
# The driver has always written its results as it goes -- one manifest line per
# package, appended -- so that a shard killed part way through still accounts
# for what it finished. That only helps if someone *uploads* them, and the
# upload was one step at the very end. Shard 16 of run 31951756102 got three
# minutes into a 196-minute check budget before its runner was reclaimed:
#
#   ##[error]The runner has received a shutdown signal.
#   ##[error]Process completed with exit code 143.
#
# `if: always()` cannot help there -- a reclaimed runner runs nothing further,
# so the upload was skipped and all 87 packages came back `missing`. Slicing
# the check phase into several steps, each followed by an upload, bounds that
# loss to one slice. The slices share `OUT_DIR`, and the artifact is overwritten
# under one name, so the last upload to survive carries everything before it.
check_slice <- local({
  raw <- trimws(env_chr("CHECK_SLICE"))
  if (!nzchar(raw)) {
    return(list(index = 1L, of = 1L))
  }
  parts <- suppressWarnings(as.integer(strsplit(raw, "/", fixed = TRUE)[[1]]))
  if (
    length(parts) != 2 ||
      anyNA(parts) ||
      parts[[1]] < 1 ||
      parts[[2]] < 1 ||
      parts[[1]] > parts[[2]]
  ) {
    stop("CHECK_SLICE must be `i/n` with 1 <= i <= n, not ", raw, call. = FALSE)
  }
  list(index = parts[[1]], of = parts[[2]])
})
last_slice <- check_slice$index == check_slice$of

inform(
  "Shard ",
  shard_index,
  ": ",
  length(members),
  " package(s), ",
  "estimated ~",
  shard$estimate_minutes,
  " min"
)

# The running state per package; every entry ends up as one manifest line.
# The entry template lives in compare.R (`manifest_entry_defaults()`), shared
# with the queue engine's compare-one.R, which builds the same entries in its
# own process.
state <- new.env(parent = emptyenv())
for (p in shard$packages) {
  assign(p$name, manifest_entry_defaults(p$name, p, shard_index), envir = state)
}
update <- function(name, ...) {
  entry <- get(name, envir = state)
  entry[names(list(...))] <- list(...)
  assign(name, entry, envir = state)
  entry
}

# ---------------------------------------------------------------- prepare ----

# The two half libraries, on the host. Each holds exactly one package -- the
# CRAN release of the package under test for `old`, the dev binary for `new`
# -- and check-half.sh bind-mounts the right one read-only into each check
# container at /revdepx/lib-half, in front of the image's baked dependency
# library (`R_LIBS=/revdepx/lib-half:/opt/revdepx/lib`). Same cascade as
# revdep2's host libraries, across a bind mount: the two halves see libraries
# that differ in exactly the package under test, and nothing is installed or
# uninstalled between checks.
lib_old <- file.path(work, "lib-old")
lib_new <- file.path(work, "lib-new")

if (do_prepare) {
  # There is no dependency union to install and no sysreqs to fetch: the
  # universe image carries the whole dependency library, its system
  # requirements, and the eviction of the package under test, all settled
  # when the image was built. What is left of the old install phase is the
  # two one-package half libraries, each populated by a short run of that
  # same image -- so everything about them (R version, platform, compilers)
  # matches the checks exactly.
  libs_started <- Sys.time()
  image_ref <- read_image_ref()
  inform("Preparing shard ", shard_index, " against ", image_ref)

  # The dev binary must have been built for the container's R, or `R CMD
  # INSTALL` below would either refuse it or, worse, install something the
  # containers cannot load. Both sides of this comparison are the container
  # series by construction -- build.R ran inside a container of the same base
  # image, and the plan recorded the series the run resolved -- so a mismatch
  # means the artifacts come from different runs.
  if (!identical(as.character(meta$r_version), as.character(plan$r_version))) {
    stop(
      "The dev binary was built for R ",
      meta$r_version,
      ", but this run's containers run R ",
      plan$r_version,
      "; the revdepx-pkg artifact and the plan disagree",
      call. = FALSE
    )
  }

  dir.create(lib_old, recursive = TRUE, showWarnings = FALSE)
  dir.create(lib_new, recursive = TRUE, showWarnings = FALSE)

  # The CRAN release, installed by the container's own pak. The script is
  # written here and bind-mounted in, rather than passed as one long `-e`,
  # so the job log and a local reproduction can read what ran.
  #
  # The repositories are set inside the script rather than trusted from the
  # image: the image's baked default may be a frozen p3m snapshot from the
  # day the universe library was built, and the old half must be whatever
  # CRAN serves *today* -- that is the release the plan fingerprinted. The
  # distribution codename is read from the container's own /etc/os-release,
  # so the binary repository matches the platform doing the installing.
  old_script <- file.path(work, "install-old.R")
  writeLines(
    c(
      sprintf(
        "# Written by shard.R: install the CRAN release of %s into the",
        package
      ),
      "# half library mounted at /revdepx/lib-half.",
      "os_release <- readLines('/etc/os-release', warn = FALSE)",
      "line <- grep('^VERSION_CODENAME=', os_release, value = TRUE)",
      "if (length(line) == 0) stop('no VERSION_CODENAME in /etc/os-release')",
      "codename <- gsub('\"', '', sub('^VERSION_CODENAME=', '', line[[1]]))",
      "options(repos = c(CRAN = sprintf(",
      "  'https://p3m.dev/cran/__linux__/%s/latest',",
      "  codename",
      ")))",
      "# The baked library already satisfies every dependency; on the path it",
      "# keeps pak from installing the dependency tree over again into the",
      "# half library, which must end up holding exactly one package.",
      ".libPaths(c('/revdepx/lib-half', '/opt/revdepx/lib', .libPaths()))",
      sprintf(
        "pak::pkg_install('%s', lib = '/revdepx/lib-half', upgrade = FALSE)",
        package
      )
    ),
    old_script
  )
  inform(
    "Installing ",
    package,
    " ",
    plan$cran_version,
    " into the old half library"
  )
  # As root, like every image-side install: it writes to a bind mount and
  # nothing about the container outlives the run (`--rm`; the captured output
  # below is all the forensics a failed install needs). Bounded by coreutils
  # `timeout` rather than run_with_timeout() -- there is no R child to
  # supervise, just one docker client -- at 15 minutes, many times what this
  # install has ever taken. The output streams into the job log.
  status <- system2(
    "timeout",
    c(
      "900",
      "docker",
      "run",
      "--rm",
      "-v",
      shQuote(paste0(normalizePath(lib_old), ":/revdepx/lib-half")),
      "-v",
      shQuote(paste0(normalizePath(old_script), ":/revdepx/install-old.R:ro")),
      shQuote(image_ref),
      "Rscript",
      "/revdepx/install-old.R"
    )
  )
  if (status != 0) {
    stop(
      "Installing the CRAN release of ",
      package,
      " failed (exit ",
      status,
      ")",
      call. = FALSE
    )
  }
  # What actually landed, read off the host side of the bind mount: the
  # repositories can lag CRAN, and the manifest records what was really
  # checked against.
  old_desc <- file.path(lib_old, package, "DESCRIPTION")
  if (!file.exists(old_desc)) {
    stop(
      "The install container exited 0, but ",
      old_desc,
      " does not exist",
      call. = FALSE
    )
  }
  our_cran_version <- unname(read.dcf(old_desc, fields = "Version")[1, 1])
  if (!identical(our_cran_version, plan$cran_version)) {
    inform(
      "Note: old checks run against ",
      our_cran_version,
      " (the repositories lag CRAN, the plan expected ",
      plan$cran_version,
      ")"
    )
  }

  inform(
    "Installing dev binary ",
    basename(meta$binary),
    " into the new half library"
  )
  status <- system2(
    "timeout",
    c(
      "900",
      "docker",
      "run",
      "--rm",
      "-v",
      shQuote(paste0(normalizePath(pkg_dir), ":/revdepx/pkg:ro")),
      "-v",
      shQuote(paste0(normalizePath(lib_new), ":/revdepx/lib-half")),
      shQuote(image_ref),
      "R",
      "CMD",
      "INSTALL",
      "-l",
      "/revdepx/lib-half",
      shQuote(file.path("/revdepx/pkg", meta$binary))
    )
  )
  if (status != 0) {
    stop("Installing the prebuilt dev binary failed", call. = FALSE)
  }
  our_dev_version <- meta$dev_version

  install_seconds <- elapsed(libs_started)
  inform(
    "Half libraries ready after ",
    round(install_seconds / 60, 1),
    " min"
  )

  # What the check phase needs to know about this one, and what the timings at
  # the end report. Everything else it can work out for itself from what it
  # finds on disk.
  write_json(
    list(
      # The field names are the host-library era's, kept verbatim: the
      # collector's calibration reads them off every run's timings, and the
      # numbers that are structurally zero now -- nothing is restored on the
      # host, the dependency library ships inside the image -- still have to
      # be zero *under the same names* to stay comparable across runs.
      install_packages = 0L,
      restored = 0L,
      restore_seconds = 0,
      install_seconds = install_seconds,
      our_cran_version = our_cran_version,
      our_dev_version = our_dev_version,
      image = image_ref,
      # When the shard's clock started, and what the prepare phase spent of
      # it. Both matter to the phase that follows: it has to finish inside the
      # same job, and its own `script_seconds` is no longer the whole driver.
      started_at = format(script_started, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
      phase_seconds = elapsed(script_started)
    ),
    install_state
  )
}

if (!do_check) {
  inform("Prepare phase complete; the check phase runs as its own step")
  quit(save = "no", status = 0)
}

# A prepare phase that never finished leaves no state, and there is nothing
# to check without the two half libraries it builds. But every package still
# has to be *accounted for*: `missing` -- which is what the collector reports
# for a shard that uploaded nothing -- says only that a job died, while a
# manifest full of `error` says which shard, and why, and is picked up by
# `retry-run` just the same. Shard 3 of run 31893156685 lost 50 packages to
# exactly this.
if (!file.exists(install_state)) {
  reason <- sprintf(
    "shard %d: the prepare phase did not finish, so nothing could be checked",
    shard_index
  )
  inform(reason)
  invisible(file.create(manifest_path))
  for (name in members) {
    update(name, result = "error", message = reason)
    write_manifest_line(
      get(name, envir = state),
      manifest_path,
      plan$cran_version,
      plan$dev_version
    )
  }
  append_summary(c(
    if (check_slice$of > 1L) {
    sprintf("### Shard %d, slice %d/%d", shard_index, check_slice$index, check_slice$of)
  } else {
    sprintf("### Shard %d", shard_index)
  },
    "",
    sprintf("%d package(s) not checked: %s.", length(members), reason)
  ))
  quit(save = "no", status = 0)
}
installed_state <- read_json(install_state)
our_cran_version <- installed_state$our_cran_version
our_dev_version <- installed_state$our_dev_version

# The deadline belongs to the *shard*, not to this process.
#
# `deadline` was computed at the top of the script, so the check phase gave
# itself a fresh 300 minutes on top of whatever the prepare phase had already
# spent -- and the job's own `timeout-minutes` covers their sum. A shard with
# a long preparation could then be killed mid-check by Actions instead of
# stopping itself and deferring, which is the one thing the deadline exists to
# prevent. Rebased on when the prepare phase started.
shard_started <- tryCatch(
  as.POSIXct(
    installed_state$started_at,
    format = "%Y-%m-%dT%H:%M:%SZ",
    tz = "UTC"
  ),
  error = function(e) NA
)
if (!is.na(shard_started)) {
  deadline <- shard_started + env_num("DEADLINE_MINUTES", 300) * 60
  inform(sprintf(
    "Prepare phase took %s; %s of the shard's deadline left for checks",
    format_duration(installed_state$phase_seconds %||% 0),
    format_duration(max(0, as.numeric(deadline - Sys.time(), units = "secs")))
  ))
}
# Create, NEVER truncate: file.create() zeroes an existing file, and the
# slices share this manifest. Run 32114635495 lost two thirds of its results
# to exactly this line -- every slice wiped its predecessors' lines at
# startup, and the account-for-everything sweep then faithfully re-wrote
# those packages as `deferred`, erasing 2293 finished checks. The sweep at
# the end was already written to leave existing lines alone; it just never
# got to see them.
if (!file.exists(manifest_path)) {
  invisible(file.create(manifest_path))
}

# What a check will be able to load, which is nothing this host has
# installed: the dependency library lives inside the universe image, at
# /opt/revdepx/lib, and this driver process never sees it. shard-prep.sh
# extracts the image's own index -- the container library's manifest, written
# when the image was built -- and that is what the depfail screen reads. The
# package under test is deliberately *not* in the baked library (it was
# evicted at image build time, so neither half's cascading library can be
# shadowed by it) and lives in `lib-old` and `lib-new` instead, so it is
# added back by name; the base and recommended packages ship with the
# container's R, as with any R.
if (!file.exists(lib_index_path)) {
  stop(
    "No library index at ",
    lib_index_path,
    "; shard-prep.sh extracts it from the universe image, and it did not run",
    call. = FALSE
  )
}
lib_index <- read_json(lib_index_path)
installed <- unique(c(
  vapply(lib_index$packages, function(p) p$package, character(1)),
  package,
  base_packages()
))

# A package whose *strong* dependency closure is incomplete cannot produce a
# check result worth comparing; missing suggests are tolerable, the check runs
# with _R_CHECK_FORCE_SUGGESTS_=false, the way CRAN treats unavailable ones.
# The dependency metadata spans CRAN and Bioconductor, like the planner's:
# a Bioconductor dependency the image build could not deliver fails the
# package here, as `depfail`, instead of costing two checks to learn
# `depmissing`.
db <- dep_db()
strong_missing <- function(name) {
  strong <- tools::package_dependencies(
    name,
    db = db,
    which = "strong",
    recursive = TRUE
  )[[1]]
  setdiff(intersect(strong, rownames(db)), c(installed, base_packages()))
}
runnable <- character()
for (name in members) {
  missing <- tryCatch(strong_missing(name), error = function(e) character())
  if (length(missing) > 0) {
    update(
      name,
      result = "depfail",
      message = paste(
        "Dependencies not installed:",
        paste(missing, collapse = ", ")
      )
    )
    inform(
      name,
      ": dependencies missing (",
      paste(missing, collapse = ", "),
      ")"
    )
  } else {
    runnable <- c(runnable, name)
  }
}

# ------------------------------------------------------------------ slice ----

# Dealt round robin rather than in blocks. `runnable` is heaviest first, so a
# contiguous cut would put every long check in the first slice and leave the
# last one with nothing but the cheap ones -- and the deadline, which stops the
# shard when the next check will not fit, would then bite unevenly. Round robin
# gives every slice the same mix.
#
# Cut before the downloads, not after: every slice derives the same screened,
# heaviest-first list from the same plan, so the deal is stable, and slicing
# first means each slice downloads only its own tarballs instead of the whole
# shard's three times over.
#
# Not `seq(index, length(runnable), by = of)`: seq() refuses a `from` past
# `to` ("wrong sign in 'by' argument"), so that spelling is an R *error* for
# a shard with fewer runnable packages than slices -- a 1-package shard, the
# common retry case, crashed slices 2 and 3 -- and for an empty `runnable`
# (say, a half-built universe image depfailing everything) it crashed slice 1
# before a single manifest line was written, turning recorded diagnoses into
# `missing`.
if (check_slice$of > 1L) {
  mine <- seq_along(runnable)
  mine <- mine[mine %% check_slice$of == check_slice$index %% check_slice$of]
  inform(sprintf(
    "Slice %d/%d: %d of this shard's %d runnable package(s)",
    check_slice$index,
    check_slice$of,
    length(mine),
    length(runnable)
  ))
  runnable <- runnable[mine]
}

# ---------------------------------------------------------------- sources ----

src_dir <- file.path(work, "src")
dir.create(src_dir, showWarnings = FALSE)
sources <- list()
for (name in runnable) {
  tarball <- tryCatch(
    {
      hit <- utils::download.packages(
        name,
        destdir = src_dir,
        repos = cran_repo(),
        type = "source",
        quiet = TRUE
      )
      hit[1, 2]
    },
    error = function(e) NULL
  )
  if (is.null(tarball)) {
    update(
      name,
      result = "error",
      message = "Source tarball could not be downloaded"
    )
    inform(name, ": source download failed")
  } else {
    sources[[name]] <- tarball
    actual <- sub(
      sprintf("^%s_(.*)[.]tar[.]gz$", name),
      "\\1",
      basename(tarball)
    )
    update(name, version = actual)
  }
}
runnable <- names(sources)

# ------------------------------------------------------------------ checks ---

# The check containers must run the exact image the half libraries were
# prepared against, so the ref recorded by the prepare phase wins; the ref
# file is the fallback for a hand-driven PHASE=check over an existing work
# directory. Exported because queue.sh passes it to check-half.sh, which
# passes it to `docker run`.
image_ref <- installed_state$image %||% read_image_ref()
Sys.setenv(REVDEPX_IMAGE = image_ref)
inform(sprintf(
  "Checking old (%s) and new (%s) with the %s engine, image %s",
  our_cran_version,
  our_dev_version,
  engine,
  image_ref
))

# The timeout scales with what the check costs CRAN, floored because these
# runners are slower than CRAN's machines and a tiny package must not be
# killed over the difference. It is a *per-half* clock: the queue hands it
# to the old and the new half in turn.
package_timeout_sec <- function(name) {
  max(
    timeout_min_sec,
    timeout_factor * (get(name, envir = state)$t_total %||% 0)
  )
}

# How much of a package's diff goes into the job log before it is cut off.
diff_max_lines <- env_num("REVDEPX_DIFF_MAX_LINES", 200)

# How much of an installation or test transcript goes into the job summary.
# Both are read to find out why something broke, and 80 lines -- the default
# for the check log, which is a summary of stages -- cuts a compiler error or a
# testthat run off in the middle.
detail_max_lines <- env_num("REVDEPX_DETAIL_MAX_LINES", 300)

checks_started <- 0L
check_seconds <- 0
reported <- character()

# The queue engine: this driver writes the work list and hands it to
# revdep4/queue.sh, whose workers run the two halves of a package one after
# the other and then a per-package compare-one.R -- sourcing the same
# compare.R as this script -- which appends the manifest line itself, under
# flock, as each package finishes. Write-as-you-go, so a killed shard still
# accounts for what it finished. This process only writes the deferred tail afterwards.
queue_sh <- file.path(dirname(script_dir), "revdep4", "queue.sh")
if (!file.exists(queue_sh)) {
  stop(
    "REVDEPX_ENGINE=queue needs ",
    queue_sh,
    ", which does not exist; is the revdep4 directory checked out?",
    call. = FALSE
  )
}

# One line per runnable package: name, tarball, per-half timeout seconds,
# and the plan's weight in minutes (queue.sh defers on it near the
# deadline). `runnable` is already heaviest first -- the plan deals shard
# members that way and nothing above reorders them -- which is what
# queue.sh's two cursors rely on: one worker eats from the heavy end, the
# rest from the light end, so a giant cannot strand a tail of cheap
# packages behind it.
#
# Both halves always run fresh. A
# stored old result the plan certified as comparable is read back by
# compare-one.R purely as a second opinion (`baseline_agrees`) -- never as
# a substitute for the old check, however tempting the saved wall clock: a
# fresh old is the only result whose provenance this run controls, and the
# second opinion is exactly how a discrepancy in the stored one gets
# noticed rather than trusted.
second_opinions <- sum(vapply(
  runnable,
  function(name) {
    isTRUE(get(name, envir = state)$baseline_planned) &&
      file.exists(file.path(baseline_dir, "old-rds", paste0(name, ".rds")))
  },
  logical(1)
))
queue_file <- file.path(
  work,
  sprintf("queue-slice-%d.tsv", check_slice$index)
)
writeLines(
  vapply(
    runnable,
    function(name) {
      entry <- get(name, envir = state)
      paste(
        name,
        sources[[name]],
        format(round(package_timeout_sec(name)), scientific = FALSE),
        format(
          max(entry$weight_minutes %||% 0, 0),
          scientific = FALSE,
          trim = TRUE
        ),
        sep = "\t"
      )
    },
    character(1)
  ),
  queue_file
)
inform(sprintf(
  "Queue: %d package(s), %d with a stored old result as a second opinion",
  length(runnable),
  second_opinions
))

queue_work <- file.path(work, "check")
dir.create(queue_work, recursive = TRUE, showWarnings = FALSE)
# What the prepare phase installed into the two half libraries; queue.sh
# forwards these to compare-one.R (and stamps its last-resort fallback
# lines with them), so every manifest line carries the versions.
Sys.setenv(
  REVDEPX_OUR_CRAN_VERSION = our_cran_version,
  REVDEPX_OUR_DEV_VERSION = our_dev_version
)
status <- system2(
  queue_sh,
  shQuote(c(
      queue_file,
      queue_work,
      lib_old,
      lib_new,
      manifest_path,
      format(round(as.numeric(deadline)), scientific = FALSE)
    ))
)
if (!identical(status, 0L)) {
  # queue.sh promises to always exit 0, so anything else means it never
  # reached its own last line. Whatever the workers did write is on disk
  # and is read back below; the packages without lines become deferred.
  inform(
    "queue.sh exited with status ",
    status,
    "; reading back what it left"
  )
}

# The queue's forensics -- who claimed what, and the closing tallies -- go
# into the results artifact, named per slice so later slices do not
# overwrite them. Left in the work directory alone they die with the
# runner, which is exactly when they are wanted.
for (record in c("claimed.log", "queue-state.json")) {
  from <- file.path(queue_work, record)
  if (file.exists(from)) {
    file.copy(
      from,
      file.path(
        out_dir,
        sprintf("queue-slice-%d-%s", check_slice$index, record)
      ),
      overwrite = TRUE
    )
  }
}

# ---------------------------------------------------------------- manifest ---

# Whatever nothing wrote a line for: deferred packages, and the ones a depfail
# or a missing source knocked out before anything started.
#
# Under slicing this also covers the packages belonging to *later* slices,
# which is deliberate: an interim artifact that says `deferred` for them is
# the truth at that moment, and better than the `missing` the collector would
# otherwise reconcile them into. What it must not do is overwrite a result
# already on disk -- an earlier slice's line, or under the queue engine a line
# a worker's compare-one.R appended -- those packages are still `deferred` in
# this process's memory, and a later line wins in the collector. So the
# manifest is read back and anything already accounted for is left alone.
read_manifest <- function() {
  if (!file.exists(manifest_path)) {
    return(list())
  }
  lines <- readLines(manifest_path, warn = FALSE)
  lines <- lines[nzchar(trimws(lines))]
  lapply(lines, function(line) jsonlite::fromJSON(line, simplifyVector = FALSE))
}
already <- vapply(read_manifest(), function(e) e$package, character(1))
for (name in setdiff(members, c(reported, already))) {
  write_manifest_line(
    get(name, envir = state),
    manifest_path,
    our_cran_version,
    our_dev_version
  )
}
# The summary below is this slice's, not the shard's: the other slices'
# packages are still at their initial `deferred` in this process and would pad
# every table with rows that say nothing.
# The queue's results were written by compare-one.R in other processes, so
# this driver's `state` never saw them; the manifest on disk is the source
# of truth. Later lines win per package, matching the collector.
by_package <- list()
for (e in read_manifest()) {
  by_package[[e$package]] <- e
}
slice_names <- if (check_slice$of > 1L) runnable else members
entries <- lapply(
  intersect(slice_names, names(by_package)),
  function(name) by_package[[name]]
)
# What this slice's checks cost, read back the same way rather than
# accumulated in-process. `check_seconds` sums true per-half seconds
# (t_old + t_new) over the lines this slice produced, and `checks_started`
# counts halves run -- one for each positive t.
ran <- lapply(
  intersect(runnable, names(by_package)),
  function(name) by_package[[name]]
)
check_seconds <- sum(vapply(
  ran,
  function(e) (e$t_old %||% 0) + (e$t_new %||% 0),
  numeric(1)
))
checks_started <- as.integer(sum(vapply(
  ran,
  function(e) ((e$t_old %||% 0) > 0) + ((e$t_new %||% 0) > 0),
  numeric(1)
)))

# ----------------------------------------------------------------- timings ---

# What this shard cost, next to what the plan thought it would: the collector
# pools these into the run's timings artifact, and the next plan calibrates its
# cost model from them. The job's own minutes -- the runner image, the image
# pull, the artifact downloads before this script even starts -- are not
# visible from here; the collector reads those off the API and adds them.
# `checks` and `check_seconds` mean halves run and summed per-half seconds.
# Historical rows from the retired pair engine tallied pairs and pair wall
# clocks instead; calibration() keys on the engine tag, so they never mix.
# Across slices, not per slice: the collector fits the cost model from these,
# and a `check_seconds` covering a third of the shard next to a `script_seconds`
# covering the job would make every shard look three times cheaper than it is.
earlier <- if (file.exists(file.path(out_dir, "timing.json"))) {
  tryCatch(read_json(file.path(out_dir, "timing.json")), error = function(e) {
    NULL
  })
} else {
  NULL
}
write_json(
  list(
    index = shard_index,
    packages = length(members),
    checks = checks_started + (earlier$checks %||% 0L),
    install_packages = installed_state$install_packages,
    restored = installed_state$restored,
    restore_seconds = installed_state$restore_seconds,
    install_seconds = installed_state$install_seconds,
    check_seconds = round(check_seconds + (earlier$check_seconds %||% 0), 1),
    # Both phases AND every earlier slice, because the collector fits
    # `setup_minutes` as `job_minutes - script_minutes` -- the minutes before
    # the driver starts. Reporting only this process would charge the prepare
    # phase and the earlier slices' driver time to "setup"; with three slices
    # that hands up to two thirds of the shard's check minutes to the fixed
    # cost, which the plan then seeds every shard's load with, and a setup of
    # tens of minutes instead of a few is what tips a plan into extra waves.
    # `earlier$script_seconds` already carries the prepare phase from slice 1,
    # so it replaces `phase_seconds` rather than adding to it.
    script_seconds = round(
      (earlier$script_seconds %||% installed_state$phase_seconds %||% 0) +
        elapsed(script_started),
      1
    ),
    started_at = installed_state$started_at %||%
      earlier$started_at %||%
      format(script_started, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
    finished_at = now_utc(),
    planned_minutes = shard$estimate_minutes,
    planned_check_minutes = shard$check_minutes
  ),
  file.path(out_dir, "timing.json")
)

# ------------------------------------------------------------------ summary --

results <- vapply(entries, function(e) e$result, character(1))
df <- data.frame(
  Package = vapply(entries, function(e) e$package, character(1)),
  Version = vapply(entries, function(e) e$version, character(1)),
  Result = results,
  Old = vapply(entries, function(e) e$status_old, character(1)),
  New = vapply(entries, function(e) e$status_new, character(1)),
  # `baseline_reused` stopped being set when both halves became mandatory, so
  # this column was empty in every row. What the baseline is still good for is
  # the drift check -- whether a result from an earlier run still reproduces --
  # and that is what it says now.
  Baseline = vapply(
    entries,
    function(e) {
      if (isTRUE(e$baseline_agrees)) {
        "agrees"
      } else if (isFALSE(e$baseline_agrees)) {
        "disagrees"
      } else {
        ""
      }
    },
    character(1)
  )
)
append_summary(c(
  sprintf("### Shard %d", shard_index),
  "",
  sprintf(
    "%d ok, %d newly broken, %d failed, %d timed out, %d depfail, %d depmissing, %d error, %d deferred.",
    sum(results == "ok"), sum(results == "newly_broken"), sum(results == "failed"),
    sum(results == "timeout"),
    sum(results == "depfail"), sum(results == "depmissing"),
    sum(results == "error"), sum(results == "deferred")
  ),
  "",
  md_table(df)
))
for (entry in entries) {
  if (entry$result %in% c("ok", "deferred")) {
    next
  }
  # The reason goes in the title, where `md_details()` cannot tail it away;
  # the body is the check log where there is one, because the reason alone
  # rarely says which check step broke.
  kept <- file.path(out_dir, "pkgs", entry$package, "new-check")
  log <- file.path(kept, "00check.log")
  reason <- gsub("\n", " ", entry$message %||% "")
  lines <- if (file.exists(log)) {
    readLines(log, warn = FALSE)
  } else if (nzchar(reason)) {
    strsplit(entry$message, "\n")[[1]]
  } else {
    "(no log captured)"
  }
  title <- sprintf(
    "<code>%s</code> &mdash; %s%s",
    entry$package,
    entry$result,
    if (nzchar(reason)) paste0(": ", md_escape_html(reason)) else ""
  )
  append_summary(md_details(title, lines))

  # The check log says what broke; these say why, and none of them fits in it.
  # `00install.out` is where a package that could not be installed explains
  # itself -- the check log only points at the file, which used to mean
  # downloading the artifact to read a compiler error. A `.Rout.fail` is a
  # failed test file's whole transcript and `-Ex.Rout` the examples', where the
  # check log carries a bounded excerpt. Each gets its own block and its own
  # budget rather than sharing one, or the tail of the set would be all anyone
  # saw.
  for (extra in list(
    list(file = "00install.out", what = "installation output"),
    list(
      file = list.files(kept, pattern = "[.]Rout[.]fail$"),
      what = "test output"
    ),
    list(
      file = list.files(kept, pattern = "-Ex[.]Rout$"),
      what = "example output"
    )
  )) {
    for (f in extra$file) {
      path <- file.path(kept, f)
      if (!file.exists(path)) {
        next
      }
      append_summary(md_details(
        sprintf(
          "<code>%s</code> &mdash; %s (<code>%s</code>)",
          entry$package,
          extra$what,
          f
        ),
        readLines(path, warn = FALSE),
        max_lines = detail_max_lines
      ))
    }
  }
}

inform(
  "Shard ",
  shard_index,
  " done: ",
  paste(names(table(results)), table(results), sep = "=", collapse = ", ")
)
