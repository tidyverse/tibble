#!/usr/bin/env bash
# Ensure the revdepx base image exists, and name it.
#
# The base image is rocker/r-ver plus what `R CMD check --as-cran` needs and
# an R distribution deliberately does not carry -- qpdf and ghostscript for
# the PDF checks, pandoc for vignettes, enough of TeX Live to build manuals
# and vignettes, tidy for HTML validation, the tcl/tk runtime libraries
# (tcltk is a *base* R package, so pak's sysreqs machinery never sees it as
# a dependency and never installs libtcl for it: in run 32281237129 a
# universe built for a small package set had no other package pulling tcl
# in, and every tcltk-using package failed to *install* with "libtcl8.6.so:
# cannot open shared object file") -- plus pak, jsonlite and callr, so
# an image build or an in-container install can start without bootstrapping
# any of them. callr (and the processx it brings) is not a convenience: it is
# what puts a clock on the calls that have none of their own -- util.R's
# run_with_timeout() degrades to an *unbounded* inline call without it, and
# image.R's chunked installs, metadata probes and sysreqs surveys all run
# inside this container. pak vendors its own private copies of both and
# exports neither, which is why they are installed here in their own right
# (the same lesson revdep2 learnt on the host). Everything downstream (the
# universe image, every check container) stands on this.
#
# Usage:
#   base-image.sh <r-version> <registry-image>   # ensure it exists, print ref
#   base-image.sh --tag-only <r-version>         # print the tag; no docker
#
# <r-version> is a RESOLVED version like 4.5.3, never an alias. The default
# of "oldrel" lives in the yaml, which resolves the alias before calling:
# an alias is a moving target, and everything downstream -- this tag, the
# baseline-validity comparison in plan.R -- needs one fixed string that
# means the same thing in every job of the run.
#
# The tag is r-<version>-<first 12 hex digits of the md5 of this very file>.
# That buys two properties at once. The image is a fixed target: as long as
# this script is byte-identical, the tag names exactly one recipe, rebuilds
# are no-ops (the manifest already exists), and a run in flight keeps the
# image it resolved. And the tag is computable *without docker and without
# running this script* -- plan.R, running in a parallel job, hashes its own
# checkout's copy of this file with tools::md5sum() and gets the same string
# for its baseline comparison. The price is that ANY edit to this file --
# the package list, a comment, this sentence -- rolls the tag and forces one
# rebuild. Accepted: a rebuild costs minutes, a tag that fails to roll on a
# recipe change serves stale images for ever, and a hash of anything less
# than the whole file would reintroduce exactly that gap.
#
# Environment:
#   REVDEPX_PUSH=1      - push :<tag> and :latest-r-<version> after building
#                         (only jobs with packages:write set this). A push
#                         failure under REVDEPX_PUSH=1 is a hard error: every
#                         downstream job pulls this ref from the registry and
#                         the base image has no artifact fallback, so failing
#                         here is the one loud failure instead of four
#                         confusing ones later.
#   GITHUB_STEP_SUMMARY - appended to when set.
#
# Everything informational goes to stderr. The LAST line on stdout is the
# full image ref (image:tag) -- that line is what callers capture.

set -eu

hash=$(md5sum "$0" | cut -c1-12)

if [ "${1:-}" = "--tag-only" ]; then
  version=${2:?usage: base-image.sh --tag-only <r-version>}
  echo "r-${version}-${hash}"
  exit 0
fi

version=${1:?usage: base-image.sh <r-version> <registry-image>}
image=${2:?usage: base-image.sh <r-version> <registry-image>}
tag="r-${version}-${hash}"
ref="${image}:${tag}"

summary() {
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    echo "$1" >> "${GITHUB_STEP_SUMMARY}"
  fi
}

# `docker manifest inspect` asks the registry without pulling anything; the
# caller has already run `docker login`. A missing manifest and a registry
# error look the same here, and are treated the same: build it ourselves.
if docker manifest inspect "${ref}" > /dev/null 2>&1; then
  echo "Base image ${ref} exists in the registry; nothing to build." >&2
  summary "Base image: reused \`${ref}\`."
  echo "${ref}"
  exit 0
fi

echo "Base image ${ref} not found in the registry; building it." >&2

# The Dockerfile, piped straight into docker build; no context directory is
# needed because nothing is COPYed. Two traps are handled inside it:
#   * rocker's baked CRAN repository is a p3m.dev snapshot frozen on the day
#     rocker built the image, so pak and jsonlite are installed from the
#     rolling `latest` binary snapshot for the image's own Ubuntu release
#     instead -- resolved from /etc/os-release, not hard-coded, so an
#     r-version whose rocker base moved to a newer Ubuntu keeps working.
#   * the org.opencontainers.image.source label ties the GHCR package to
#     this repository, which is what makes GITHUB_TOKEN pushes land in the
#     right place with the right visibility controls.
docker build --tag "${ref}" - >&2 <<EOF
FROM rocker/r-ver:${version}
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \\
    && apt-get install -y --no-install-recommends \\
      qpdf ghostscript pandoc \\
      texlive-latex-base texlive-latex-recommended texlive-latex-extra \\
      texlive-fonts-recommended texlive-fonts-extra-links fonts-dejavu \\
      xvfb xauth xfonts-base \\
      libtcl8.6 libtk8.6 \\
      tidy curl file git locales unzip \\
    && rm -rf /var/lib/apt/lists/*
# Rust, for the reverse dependencies that compile cargo crates -- run
# 32260705703 left exactly six packages uninstallable, every one of them
# "sh: 1: rustc: not found" (caugi needs rustc >= 1.80; Ubuntu 24.04's apt
# rustc is 1.75, hence rustup). The toolchain lives system-wide under
# /opt/rust, resolved to current stable at build time and frozen in the
# image -- the way CRAN's own check machines track stable. RUSTUP_HOME must
# persist (the rustc/cargo binaries are rustup proxies that read it), but
# CARGO_HOME must NOT: at check time cargo runs as the mounted-HOME user and
# defaults to a writable ~/.cargo, where /opt/rust is root-owned.
ENV RUSTUP_HOME=/opt/rust
RUN curl -fsSL https://sh.rustup.rs \\
    | CARGO_HOME=/opt/rust sh -s -- -y --no-modify-path --profile minimal --default-toolchain stable \\
    && ln -s /opt/rust/bin/cargo /opt/rust/bin/rustc /usr/local/bin/ \\
    && rustc --version
RUN Rscript -e 'lines <- readLines("/etc/os-release"); \\
    codename <- sub("^VERSION_CODENAME=", "", grep("^VERSION_CODENAME=", lines, value = TRUE)[[1]]); \\
    options(repos = c(CRAN = sprintf("https://p3m.dev/cran/__linux__/%s/latest", codename))); \\
    install.packages(c("pak", "jsonlite", "callr")); \\
    stopifnot(requireNamespace("pak"), requireNamespace("jsonlite"), requireNamespace("callr"))'
LABEL org.opencontainers.image.source=https://github.com/${GITHUB_REPOSITORY}
EOF

if [ "${REVDEPX_PUSH:-0}" = "1" ]; then
  alias_ref="${image}:latest-r-${version}"
  if docker tag "${ref}" "${alias_ref}" >&2 \
    && docker push "${ref}" >&2 \
    && docker push "${alias_ref}" >&2; then
    echo "Pushed ${ref} and ${alias_ref}." >&2
    summary "Base image: built and pushed \`${ref}\`."
  else
    # Loudly, unlike the universe image's push failure: the universe has an
    # artifact fallback, the base does not -- build, universe and every
    # shard's local fallback all pull this ref from the registry. Carrying on
    # here would trade one clear failure at its cause for four confusing
    # ones far from it, on a run that cannot succeed anyway.
    echo "ERROR: pushing ${ref} failed, and everything downstream pulls it from the registry." >&2
    echo "If GITHUB_TOKEN may not write packages here, allow it (or pre-push a base image by hand)." >&2
    summary "Base image: built \`${ref}\` but the push FAILED; the run cannot proceed."
    exit 1
  fi
else
  echo "REVDEPX_PUSH is not 1; built ${ref} locally without pushing." >&2
  summary "Base image: built \`${ref}\` locally (no push)."
fi

echo "${ref}"
