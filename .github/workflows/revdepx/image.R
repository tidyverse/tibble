# Build the dependency universe into the image: install every package the
# plan's checks need -- and the system libraries they require -- into
# /opt/revdepx/lib, load-test the result, and leave behind the index and
# marker files the rest of the workflow trusts. This script runs INSIDE the
# image-build container, as root, and only ever sees an ordinary filesystem:
# the workflow starts the container (from the plain base image, or from the
# previous universe image for a delta build), bind-mounts the pak cache so
# downloads persist across runs, runs this, and commits the container as the
# revdepx-universe image every shard then pulls.
#
# A dependency failure is a report, not a stop: shards screen each revdep
# against the baked index and skip what cannot be checked, and a revdep whose
# dependencies genuinely cannot be installed fails its own check with an
# install log, which is the result a report can work with. depfail.json and
# build-report.md land in OUT_DIR for the workflow to upload.
#
# Environment variables:
#   PLAN     - plan.json from plan.R (default: plan.json)
#   OUT_DIR  - where depfail.json and build-report.md land (default:
#              universe); bind-mounted by the caller and uploaded as the
#              revdepx-universe-report artifact
#   REVDEPX_BASE_IMAGE - the base-image tag this build started from,
#              recorded in the library index as an opaque string
#   REVDEPX_UNIVERSE_OVERRIDE_SHARD - a shard index: install only that
#              shard's install list instead of the whole universe. This is
#              the local-fallback path in shard-prep.sh -- a shard that can
#              procure no image builds one for itself, and pays only for its
#              own slice.
#
# Nothing here waits without a clock: REVDEPX_INSTALL_TIMEOUT_MINUTES bounds
# one pak call, REVDEPX_LOAD_TIMEOUT_MINUTES one load-test session, and
# REVDEPX_INSTALL_DEADLINE_MINUTES the installs together -- see the README's
# "Nothing waits for ever".

script_dir <- dirname(sub(
  "--file=",
  "",
  grep("^--file=", commandArgs(), value = TRUE)
))
source(file.path(script_dir, "util.R"))

# A headless container has no X display, and Tk-based packages
# (gWidgets2tcltk and friends) initialise Tk while their code is lazy-loaded
# AT INSTALL TIME: without a display the install dies with
# `[tcl] invalid command name "font"`. CRAN's own check machines run under
# X; ours get a virtual framebuffer. Started here, once, so every child this
# script spawns -- pak installs, load-test sessions -- inherits the display;
# `-ac` is safe because nothing else shares the container's network
# namespace. Dies with the container.
if (!nzchar(Sys.getenv("DISPLAY")) && nzchar(Sys.which("Xvfb"))) {
  system2(
    "Xvfb",
    c(":99", "-screen", "0", "1280x1024x24", "-ac", "-nolisten", "tcp"),
    wait = FALSE,
    stdout = FALSE,
    stderr = FALSE
  )
  Sys.setenv(DISPLAY = ":99")
  inform("Xvfb started on :99 for Tk-based installs and load tests")
}

# Before anything talks to a repository: the base image bakes in a p3m.dev
# CRAN snapshot frozen on the day rocker built it. Installing against that
# would quietly resolve last month's versions, while the plan's dependency
# fingerprints -- the baseline reuse key -- are computed from CRAN today;
# the mismatch would fail nothing and check a world the plan did not
# describe. So the first act is to point this process at the rolling
# `latest` binary snapshot for the container's own Ubuntu release. Only this
# process's options, no site Rprofile: pak's children inherit the set
# through pinned_repos() in util.R, which snapshots these options before the
# first install, and the committed image may keep rocker's frozen default --
# check containers install nothing.
codename <- local({
  lines <- tryCatch(
    readLines("/etc/os-release", warn = FALSE),
    error = function(e) character()
  )
  hit <- grep("^VERSION_CODENAME=", lines, value = TRUE)
  gsub('"', "", sub("^VERSION_CODENAME=", "", hit))[1]
})
if (is.na(codename) || !nzchar(codename)) {
  stop(
    "/etc/os-release names no VERSION_CODENAME; refusing to install ",
    "against the base image's frozen CRAN snapshot",
    call. = FALSE
  )
}
options(
  repos = c(
    CRAN = sprintf("https://p3m.dev/cran/__linux__/%s/latest", codename)
  )
)

plan <- read_json(env_chr("PLAN", "plan.json"))
out_dir <- env_chr("OUT_DIR", "universe")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
# `plan$package` normally names it. The fallback reads this repository's own
# DESCRIPTION rather than a hardcoded name, so the kit is correct in every
# repository it is broadcast to; the repository name is not a safe source,
# since igraph/rigraph ships the `igraph` package.
package <- plan$package %||%
  unname(read.dcf("DESCRIPTION", fields = "Package")[1, 1])

# The install set is the whole universe: everything any shard's checks need
# installed anywhere. plan$universe is the sorted union plan.R writes; a
# plan from before the field existed still works, from the union of the
# shards' own install lists.
install_set <- unlist(plan$universe, use.names = FALSE)
if (length(install_set) == 0) {
  install_set <- sort(unique(unlist(
    lapply(plan$shards, function(s) unlist(s$install, use.names = FALSE)),
    use.names = FALSE
  )))
}

# Under the shard override, only that shard's slice is installed and only
# its own packages' system requirements are surveyed: the fallback runs on a
# shard's clock, and every other shard's dependencies would be minutes spent
# on packages this runner will never check.
override_shard <- env_chr("REVDEPX_UNIVERSE_OVERRIDE_SHARD")
shard_packages <- function(shards) {
  sort(unique(unlist(
    lapply(shards, function(s) {
      vapply(s$packages, function(p) p$name, character(1))
    }),
    use.names = FALSE
  )))
}
if (nzchar(override_shard)) {
  mine <- Filter(
    function(s) identical(as.integer(s$index), as.integer(override_shard)),
    plan$shards
  )
  if (length(mine) != 1) {
    stop(
      "REVDEPX_UNIVERSE_OVERRIDE_SHARD=",
      override_shard,
      " names no shard of the plan",
      call. = FALSE
    )
  }
  install_set <- sort(unique(unlist(mine[[1]]$install, use.names = FALSE)))
  checked_packages <- shard_packages(mine)
  set_label <- sprintf("shard %s's install union", override_shard)
} else {
  checked_packages <- shard_packages(plan$shards)
  set_label <- "the plan's dependency universe"
}

lib <- "/opt/revdepx/lib"
dir.create(lib, recursive = TRUE, showWarnings = FALSE)
# In front of this session's own paths, so everything that asks the session
# rather than being handed `lib` explicitly -- pak resolving what is already
# installed, stray installed.packages() calls -- sees the library being
# built.
.libPaths(c(lib, .libPaths()))
failures <- list()

# What was in the library before the first chunk: non-empty when the caller
# warm-started the container from the previous universe image (a delta
# build). These play the part the restored tarballs played in the host
# design -- packages that need not be built again while still current, and
# the prime suspects when the load test fails.
preinstalled <- list.dirs(lib, full.names = FALSE, recursive = FALSE)
inform(
  "Image: ",
  length(preinstalled),
  " package(s) already in ",
  lib,
  " from the donor image"
)

# With a warm-started library, `upgrade = FALSE` would freeze whatever
# versions the donor image happened to hold; the plan's dependency
# fingerprints are computed from CRAN *now*, so the library has to follow
# CRAN now. The same reasoning governed the old restored-library path --
# and what "outdated" means is pak's call either way.
upgrade <- length(preinstalled) > 0

# This install is the whole build, and the place its ancestor died: handed
# the whole universe at once, pak resolves every one of those refs before it
# installs any of them, and the resolution of a few thousand is where a run
# that is killed rather than failed gets killed. So it goes in dependency
# order, four hundred at a time (see install_chunks() in util.R), which
# keeps every resolution well clear of the size that killed it and turns a
# fatal ten minutes of silence into a chunk counter.
chunk_size <- env_num("REVDEPX_INSTALL_CHUNK", 400)
# Past this, no further chunk is started. The workflow's own timeout on the
# build step cancels everything; this stops earlier and on purpose, so the
# packages that did install are still load-tested and indexed, and the
# container is still committed, instead of dying with the step.
install_deadline <- Sys.time() +
  env_num("REVDEPX_INSTALL_DEADLINE_MINUTES", 210) * 60
# And a deadline for the whole build, because stopping the *installs* early
# only helps if what follows them is bounded too. After `install_deadline`
# come the sysreqs surveys, the load sweep at up to
# REVDEPX_LOAD_TIMEOUT_MINUTES per session, a per-package retry of every
# failure, and a rebuild loop of up to REVDEPX_INSTALL_TIMEOUT_MINUTES per
# stale binary -- whose worst case is far past the step's timeout. Reaching
# that means the container is never committed and no universe image is
# published, so every shard falls back to building its own slice: the one
# outcome this build exists to prevent.
job_deadline <- Sys.time() +
  env_num("REVDEPX_JOB_DEADLINE_MINUTES", 270) * 60
out_of_time <- function(what) {
  if (Sys.time() <= job_deadline) {
    return(FALSE)
  }
  inform(
    "Past the build deadline; ",
    what,
    " stops here so the library is still indexed and committed"
  )
  TRUE
}
chunks <- install_chunks(install_set, dep_db(), chunk_size)
inform(
  "Image: installing ",
  length(install_set),
  " packages (",
  length(missing_from(lib, install_set)),
  " not in the library yet) in ",
  length(chunks),
  " chunk(s) of at most ",
  chunk_size,
  ", dependencies first; upgrade = ",
  upgrade
)
# Before the first install, not after the first failure: a poisoned metadata
# database is inherited through the pak cache the caller bind-mounts, so the
# build can start with one. Asking pak what it can see costs seconds and is
# the difference between one bad build and committing an image that fails
# every shard the same way.
metadata <- ensure_metadata("Image")
if (identical(metadata, "broken")) {
  stop(
    "pak cannot see the packages that must exist, before or after rebuilding ",
    "its metadata database. Installing anything now would fail package by ",
    "package for hours and commit an image that fails every shard the same ",
    "way.",
    call. = FALSE
  )
}

# What the resource sampler calls the samples it is taking. The sampler runs
# on the host; when the caller bind-mounts the phase file into the container
# this still labels its samples, and when the variable is unset it is a
# no-op.
phase_file <- env_chr("RESOURCE_PHASE_FILE")
phase <- function(name) {
  if (nzchar(phase_file)) {
    writeLines(name, phase_file)
  }
  invisible(name)
}

phase("installing")
install_started <- Sys.time()
installed_ok <- install_in_chunks(
  chunks,
  lib,
  upgrade,
  "Image",
  deadline = install_deadline
)
inform(sprintf(
  "Image: the install %s after %.1f min; %d of %d packages are in the library",
  if (installed_ok) "finished" else "failed",
  as.numeric(difftime(Sys.time(), install_started, units = "mins")),
  length(install_set) - length(missing_from(lib, install_set)),
  length(install_set)
))
if (!installed_ok) {
  # One bad package must not hide the state of the other thousand -- but a
  # pak transaction is all-or-nothing, so one bad package strands whatever
  # shared its chunk, and retrying the stranded one at a time pays pak's
  # per-call overhead once per innocent: the resolver runs per call, in
  # pak's own private subprocess, and no driver-side cleverness can
  # amortise it -- the only lever is the NUMBER of calls. So: divide and
  # conquer. Retry the missing set whole; a failing set of more than one
  # package is split into three and each third retried, down to single
  # packages -- the leaves, where a genuine failure names itself with its
  # own log and its own depfail.json line. Subsets without a culprit
  # succeed as one call, so d bad packages hiding in n cost about
  # 3 * d * log3(n) calls instead of n. Three-way rather than two- or
  # four-way because the call count scales with k/ln(k), minimal at k = 3
  # (the group-testing classic; 2 and 4 cost ~6% more, and larger fans
  # converge on the flat scan this replaces). The driver risks nothing by
  # recursing: it is one long-lived R process whose every pak call already
  # runs in its own clocked subprocess, and missing_from() re-measures
  # before every call, so whatever a failing transaction did install --
  # pak lands the dependency-ordered prefix before the culprit stops it --
  # is never asked for twice, and a big retry that merely times out
  # splits and continues instead of starting over.
  install_divide <- function(pkgs, depth = 0L) {
    pkgs <- missing_from(lib, pkgs)
    if (length(pkgs) == 0) {
      return(invisible(NULL))
    }
    if (Sys.time() > install_deadline) {
      inform(sprintf(
        "Image: the install deadline passed; %d package(s) not retried (%s%s)",
        length(pkgs),
        paste(utils::head(pkgs, 5), collapse = ", "),
        if (length(pkgs) > 5) ", ..." else ""
      ))
      return(invisible(NULL))
    }
    run <- pak_install(
      pkgs,
      lib = lib,
      upgrade = upgrade,
      timeout_seconds = install_timeout_seconds(),
      label = if (length(pkgs) == 1) {
        paste("Image: installing", pkgs)
      } else {
        sprintf("Image retry: %d package(s), depth %d", length(pkgs), depth)
      }
    )
    if (run$ok) {
      return(invisible(NULL))
    }
    if (length(pkgs) == 1) {
      failures[[length(failures) + 1]] <<- list(
        package = pkgs,
        phase = "install",
        message = run$message
      )
      return(invisible(NULL))
    }
    size <- ceiling(length(pkgs) / 3)
    for (part in split(pkgs, ceiling(seq_along(pkgs) / size))) {
      install_divide(part, depth + 1L)
    }
    invisible(NULL)
  }
  retry <- missing_from(lib, install_set)
  inform(
    "Image: isolating ",
    length(retry),
    " missing package(s) by trisection"
  )
  install_divide(retry)
}

# Before the load test, because a preinstalled package whose system library
# is absent fails to load for a reason that has nothing to do with the
# package: without this it would be judged stale and rebuilt from source, to
# fail again the same way. This container runs as root, so pak's apt calls
# need no sudo -- util.R handles both cases.
phase("surveying system requirements")
ensure_sysreqs(lib, "Image")

# Load every installed dependency; a failing package is retried on its own
# so a single bad namespace names itself.
installed <- intersect(
  install_set,
  rownames(utils::installed.packages(lib))
)
phase("load-testing")
inform("Image: loading ", length(installed), " packages")

# Bounded, because `loadNamespace()` is not a thing that necessarily
# returns: a package whose .onLoad waits on a lock, a port or a display
# hangs the child for ever, and the ancestor of this script used to wait for
# it with no clock -- the same unbounded wait that cost run 31276552027 its
# preflight, one call further on. A session that runs out of time is a load
# failure like any other, with "timed out" as its reason.
load_timeout_sec <- env_num("REVDEPX_LOAD_TIMEOUT_MINUTES", 10) * 60
# One session per package, several at a time: loading is mostly I/O and
# dynamic linking, so it parallelises well across the machine's cores.
load_jobs <- max(1, env_num("REVDEPX_LOAD_JOBS", parallel::detectCores()))
load_sweep_sec <- env_num("REVDEPX_LOAD_SWEEP_MINUTES", 60) * 60
load_batch <- function(pkgs) {
  script <- tempfile(fileext = ".R")
  writeLines(
    c(
      sprintf(".libPaths(c(%s, .libPaths()))", deparse(lib)),
      "for (p in commandArgs(trailingOnly = TRUE)) {",
      "  loadNamespace(p)",
      "  writeLines(paste0('LOADED ', p))",
      "}"
    ),
    script
  )
  args <- c("--vanilla", script, pkgs)
  if (requireNamespace("processx", quietly = TRUE)) {
    # processx runs the command directly rather than through a shell, so the
    # arguments need no quoting of their own.
    run <- processx::run(
      "Rscript",
      args,
      timeout = load_timeout_sec,
      error_on_status = FALSE,
      stderr_to_stdout = TRUE
    )
    out <- strsplit(run$stdout %||% "", "\n", fixed = TRUE)[[1]]
    timed_out <- isTRUE(run$timeout)
  } else {
    out <- suppressWarnings(system2(
      "Rscript",
      # Quoted: system2() quotes the command, but not the arguments.
      shQuote(args),
      stdout = TRUE,
      stderr = TRUE
    ))
    timed_out <- FALSE
  }
  loaded <- sub("^LOADED ", "", grep("^LOADED ", out, value = TRUE))
  list(failed = setdiff(pkgs, loaded), log = out, timed_out = timed_out)
}
# Which packages actually have to be loaded.
#
# Loading a namespace loads everything it imports, transitively -- so
# loading the packages nothing else in the set depends on covers the whole
# set. In a DAG every other package is reachable from at least one of those
# roots, by following dependents upwards until there are none. For a
# universe of a few thousand packages the roots are a few hundred, so this
# is the same coverage for a fraction of the sessions.
#
# The saving is real but it is not the main point. One session per package
# means one clock per package: a package whose `.onLoad` blocks used to
# spend a batch's whole ten minutes and take 39 innocent packages with it,
# and the batch then had to be re-run package by package to find out which
# one it was. And independent sessions run at once, which is what the other
# cores are for.
load_roots <- function(pkgs) {
  db <- dep_db()
  known <- intersect(pkgs, rownames(db))
  if (length(known) == 0) {
    return(pkgs)
  }
  # Depends and Imports only, NOT "strong": "strong" includes LinkingTo,
  # but loading a dependent never loads its LinkingTo-only dependencies at
  # run time -- a header-only package (BH, cpp11) would be counted as
  # covered by its dependents while never actually being loaded by anyone.
  # With LinkingTo out of the reachability, such packages become roots and
  # get their own load test, and the transitive-coverage argument is exact.
  deps <- tools::package_dependencies(
    known,
    db = db,
    which = c("Depends", "Imports"),
    recursive = TRUE
  )
  depended_on <- unique(unlist(deps, use.names = FALSE))
  roots <- setdiff(known, depended_on)
  # Anything the database cannot speak for is tested in its own right rather
  # than assumed to be covered by something else.
  c(roots, setdiff(pkgs, known))
}

load_failures <- list()
roots <- load_roots(installed)
inform(sprintf(
  "Image: load-testing %d of %d installed package(s) -- the ones nothing else needs, which pull the rest in -- %d at a time, %.0f min each",
  length(roots),
  length(installed),
  load_jobs,
  load_timeout_sec / 60
))
if (!out_of_time("the load test") && length(roots) > 0) {
  list_file <- file.path(tempdir(), "load-roots.txt")
  writeLines(roots, list_file)
  run <- run_with_timeout(
    function(script, args) {
      # stdout captured, stderr inherited: the script writes its verdicts to
      # both, and the stderr copy is what reaches the build log as the sweep
      # runs rather than half an hour later.
      system2(script, args, stdout = TRUE, stderr = "")
    },
    list(
      script = file.path(script_dir, "load-test.sh"),
      args = shQuote(c(
        list_file,
        lib,
        format(round(load_timeout_sec), scientific = FALSE),
        format(load_jobs)
      ))
    ),
    # The whole sweep, bounded independently of the per-package clocks: with
    # `jobs` in parallel the worst case is roughly `roots / jobs` timeouts,
    # and this is the backstop for the case where that is still too long.
    timeout_seconds = min(
      load_sweep_sec,
      max(60, as.numeric(difftime(job_deadline, Sys.time(), units = "secs")))
    ),
    label = "load test"
  )
  out <- if (is.character(run$value)) run$value else character()
  for (line in grep("^FAIL ", out, value = TRUE)) {
    parts <- strsplit(line, " ", fixed = TRUE)[[1]]
    load_failures[[parts[[2]]]] <- if (identical(parts[[3]], "timeout")) {
      sprintf("loading timed out after %.0f min", load_timeout_sec / 60)
    } else {
      "loading failed"
    }
  }

  # Every package that was tested, and what it cost, folded away.
  #
  # Without this the log says "load-testing 498 packages" and then nothing
  # at all until the report -- and a package that loads *slowly* has nowhere
  # to show up, though every check of anything downstream of it pays that
  # cost again. 498 lines is a lot to scroll past, so they go in a collapsed
  # group and the interesting ones are repeated outside it.
  timed <- do.call(
    rbind,
    lapply(
      strsplit(grep("^(OK|FAIL) ", out, value = TRUE), " ", fixed = TRUE),
      function(p) {
        data.frame(
          package = p[[2]],
          seconds = suppressWarnings(as.numeric(utils::tail(p, 1))),
          ok = identical(p[[1]], "OK")
        )
      }
    )
  )
  if (!is.null(timed) && nrow(timed) > 0) {
    timed <- timed[order(-timed$seconds), ]
    print_group(
      sprintf("Load test: %d package(s), slowest first", nrow(timed)),
      sprintf(
        "%6.0fs  %-30s %s",
        timed$seconds,
        timed$package,
        ifelse(timed$ok, "", "FAILED")
      )
    )
    slow <- utils::head(timed[timed$ok, ], 5)
    inform(sprintf(
      "Load test: %d ok, %d failed, %s of CPU across %d job(s); slowest: %s",
      sum(timed$ok),
      sum(!timed$ok),
      format_duration(sum(timed$seconds)),
      load_jobs,
      paste(
        sprintf("%s (%.0fs)", slow$package, slow$seconds),
        collapse = ", "
      )
    ))
  }
  if (!run$ok) {
    inform("The load test did not finish: ", run$message)
  }
}

# What a failure means is worth a second look, so the ones that failed are
# re-run alone with their output kept. There are few of them by construction.
for (p in names(load_failures)) {
  if (out_of_time("the load test")) {
    break
  }
  single <- load_batch(p)
  if (length(single$failed) == 0) {
    load_failures[[p]] <- NULL
    next
  }
  if (!isTRUE(single$timed_out)) {
    load_failures[[p]] <- paste(
      utils::tail(sanitize_log(single$log), 20),
      collapse = "\n"
    )
  }
}

# A preinstalled package that will not load is a stale binary, not a broken
# package: the base image moved under the donor image's build of it -- a new
# base tag means new system libraries. Throw it away, let pak build it from
# source, and judge it on the second attempt. This is the one failure mode a
# delta build introduces, and it is cheap to undo.
stale <- intersect(names(load_failures), preinstalled)
if (length(stale) > 0) {
  inform(
    "Image: rebuilding ",
    length(stale),
    " preinstalled package(s) that would not load"
  )
  unlink(file.path(lib, stale), recursive = TRUE)
  for (p in stale) {
    run <- pak_install(
      p,
      lib = lib,
      upgrade = FALSE,
      timeout_seconds = install_timeout_seconds(),
      label = paste("Image: rebuilding", p)
    )
    if (!run$ok) {
      inform("Could not reinstall ", p, ": ", run$message)
    }
  }
  for (p in stale) {
    retried <- load_batch(p)
    if (length(retried$failed) == 0) {
      load_failures[[p]] <- NULL
    } else {
      load_failures[[p]] <- paste(
        utils::tail(sanitize_log(retried$log), 20),
        collapse = "\n"
      )
    }
  }
}
for (p in names(load_failures)) {
  failures[[length(failures) + 1]] <- list(
    package = p,
    phase = "load",
    message = load_failures[[p]]
  )
}

write_json(failures, file.path(out_dir, "depfail.json"))

# ------------------------------------------- what the checks themselves need --

# pak installs the system requirements of what *it* installs, and the checked
# packages themselves are never installed: `R CMD check` builds each one from
# its tarball inside a check container, where nothing resolves its
# SystemRequirements field and nothing may run apt. Libra and its
# `SystemRequirements: gsl` is the war story, told in full at
# ensure_check_sysreqs() in util.R. So the survey runs here, over every
# package the plan will check, and the missing apt packages are baked into
# the image -- as root, no sudo, which ensure_check_sysreqs() handles itself.
phase("surveying the checked packages' system requirements")
if (!out_of_time("the check system-requirements survey")) {
  ensure_check_sysreqs(checked_packages, "Image")
}

# ------------------------------------------------------------- the sweep-up --

# What the container wrote outside the library must not ride into the image:
# `docker commit` copies every byte of the rw layer, and on the delta path
# (FROM the previous universe image) anything committed once persists in
# every descendant image for as long as the lineage lives. The pak download
# and metadata cache is a host bind mount and never enters the layer; this
# sweeps what does enter it -- apt's package lists from the sysreqs runs
# (their .deb archives are auto-cleaned by the base image's docker-clean
# hook), and the /tmp build trees that killed subprocesses leave behind: a
# pak install that hits REVDEPX_INSTALL_TIMEOUT_MINUTES dies mid-build and
# never removes its extracted sources and objects. When the caller
# bind-mounts /tmp from the host too (the workflows now do), the /tmp part
# is a no-op here and the residue never even counts toward the delta.
phase("sweeping temporary files")
if (nzchar(Sys.which("apt-get"))) {
  system2("apt-get", "clean", stdout = FALSE, stderr = FALSE)
}
unlink("/var/lib/apt/lists", recursive = TRUE)
dir.create(
  "/var/lib/apt/lists/partial",
  recursive = TRUE,
  showWarnings = FALSE
)
tmp_junk <- setdiff(
  list.files("/tmp", all.files = TRUE, full.names = TRUE, no.. = TRUE),
  # This session's own tempdir stays: the report below still uses it.
  tempdir()
)
unlink(tmp_junk, recursive = TRUE)

# ------------------------------------------------------------------ the bake --

# The baked library must not hold the package under test at all. Each check
# container mounts a half-specific library in front of it holding exactly
# one copy -- CRAN's release or the dev build -- and a copy here would sit
# *behind* both, shadowing neither: a half whose own install failed would
# quietly check against whatever version the resolver left in the universe,
# the same one on both sides, and the comparison would come back clean and
# meaningless. With the copy gone, that failure is a loud missing-package
# error instead.
unlink(file.path(lib, package), recursive = TRUE)

phase("indexing the library")
ip <- utils::installed.packages(lib)
index <- list(
  r_version = paste(
    R.version$major,
    sub("[.].*$", "", R.version$minor),
    sep = "."
  ),
  r_full_version = paste(R.version$major, R.version$minor, sep = "."),
  platform = R.version$platform,
  base_image = env_chr("REVDEPX_BASE_IMAGE"),
  built_at = now_utc(),
  count = nrow(ip),
  packages = unname(Map(
    function(p, v) list(package = p, version = v),
    rownames(ip),
    unname(ip[, "Version"])
  ))
)
# The index is the library's passport: shard-prep.sh extracts it on every
# shard, and the depfail screen there reads it instead of walking the
# library.
write_json(index, "/opt/revdepx/lib-index.json")
# And the marker is the one-file answer to "did the build run to its end" --
# shard-prep.sh warns about images that lack it.
writeLines(now_utc(), "/opt/revdepx/universe-ok")

report <- c(
  "## revdepx universe image",
  "",
  sprintf(
    "The baked library holds %d package(s) after installing %s (%d planned; %d failed to install or load).",
    index$count,
    set_label,
    length(install_set),
    length(failures)
  ),
  "",
  sprintf(
    "%d package(s) were already in the library from the donor image%s; `%s` is evicted -- each check mounts its own copy in front.",
    length(preinstalled),
    if (length(stale) > 0) {
      sprintf(" (%d rebuilt after failing to load)", length(stale))
    } else {
      ""
    },
    package
  ),
  "",
  sprintf(
    "R %s on %s, base image `%s`.",
    index$r_full_version,
    index$platform,
    if (nzchar(index$base_image)) index$base_image else "unrecorded"
  ),
  ""
)
if (length(failures) > 0) {
  df <- data.frame(
    Package = vapply(failures, function(f) f$package, character(1)),
    Phase = vapply(failures, function(f) f$phase, character(1))
  )
  report <- c(report, md_table(df), "")
  for (f in failures) {
    report <- c(
      report,
      md_details(
        sprintf("<code>%s</code> &mdash; %s failure", f$package, f$phase),
        strsplit(f$message, "\n")[[1]]
      )
    )
  }
  inform(
    length(failures),
    " dependencies failed the image build; see depfail.json"
  )
}
writeLines(report, file.path(out_dir, "build-report.md"))
# GITHUB_STEP_SUMMARY does not exist inside the build container, and
# append_summary() then falls back to plain output (see util.R) -- so this
# lands in the container log, and build-report.md above is the copy the
# workflow uploads.
append_summary(report)
