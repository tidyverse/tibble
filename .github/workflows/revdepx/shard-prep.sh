#!/usr/bin/env bash
# Make the universe image available on a shard runner, and extract its
# library index.
#
# Three ways to an image, tried in order until one works:
#   1. pull the ref the universe job published (the normal path);
#   2. load the docker-save artifact the universe job uploads when its push
#      failed (revdepx-universe-image: universe-image.tar or .tar.zst);
#   3. build a local, shard-sized image from the base image: run image.R
#      with REVDEPX_UNIVERSE_OVERRIDE_SHARD so that only this shard's
#      install union is installed, and commit the container as
#      revdepx-universe:local-shard-<n>. Slow, but the shard stays alive --
#      and it pays only for its own slice, not the whole universe.
#
# Whatever succeeds: the ref is written to <image-ref-out-path> (the file
# shard.R reads through REVDEPX_IMAGE_FILE), /opt/revdepx/lib-index.json is
# extracted to <index-out-path> for the depfail screen, and the
# /opt/revdepx/universe-ok marker is checked -- its absence is a warning,
# not an error, because the depfail screen catches what an unfinished build
# left out.
#
# Usage:
#   shard-prep.sh <image-ref-or-empty> <fallback-artifact-dir-or-empty> \
#                 <index-out-path> <image-ref-out-path>
#
# Environment (the local fallback only):
#   REVDEPX_BASE_IMAGE - base image ref to build from
#   PLAN               - plan.json path
#   SHARD              - this shard's index
#
# Exits 0 when an image was procured, however roundabout the way; exits 1
# only when none could be -- that is a real infrastructure failure, and the
# yaml step failing the shard on it is correct.

set -u

ref_in=${1:-}
fallback_dir=${2:-}
index_out=${3:?usage: shard-prep.sh <image-ref> <fallback-dir> <index-out> <ref-out>}
ref_out=${4:?usage: shard-prep.sh <image-ref> <fallback-dir> <index-out> <ref-out>}

note() {
  echo "shard-prep: $*" >&2
}

# A tag alone proves nothing: the containerd store once produced a 1336-byte
# manifest shell that docker-loaded cleanly, carried the right tag and held
# no filesystem at all (run 32148999976) -- and the shard died on it instead
# of building locally. An image is usable when its library index reads back
# non-empty; the index lands in ${index_out} as a side effect, so the rung
# that wins has already extracted it.
usable() {
  mkdir -p "$(dirname "${index_out}")"
  docker run --rm "$1" cat /opt/revdepx/lib-index.json \
    > "${index_out}" 2> /dev/null && [ -s "${index_out}" ]
}

got=""

# ------------------------------------------------------------------ 1: pull --

# Retried, because a registry blip on one shard of forty would otherwise
# send that one shard down the fallback path and cost it an hour of local
# building over a transient 5xx.
if [ -n "${ref_in}" ]; then
  for attempt in 1 2 3; do
    if docker pull "${ref_in}" >&2; then
      if usable "${ref_in}"; then
        got="${ref_in}"
      else
        # Retrying the pull would fetch the same broken content.
        note "${ref_in} pulled but holds no readable library index; falling through"
      fi
      break
    fi
    note "pull of ${ref_in} failed (attempt ${attempt} of 3)"
    if [ "${attempt}" -lt 3 ]; then
      sleep $((attempt * 20))
    fi
  done
fi

# ------------------------------------------------------ 2: loaded artifact --

# The universe job's escape hatch: when its push to GHCR failed it uploaded
# the image as a docker-save artifact instead, and the yaml downloaded it
# next to us. `docker load` restores the tags the save carried, and prints
# them; the printed ref is the one to use.
if [ -z "${got}" ] && [ -n "${fallback_dir}" ]; then
  tarball=""
  for candidate in \
    "${fallback_dir}/universe-image.tar.zst" \
    "${fallback_dir}/universe-image.tar"; do
    if [ -f "${candidate}" ]; then
      tarball="${candidate}"
      break
    fi
  done
  if [ -n "${tarball}" ]; then
    note "loading ${tarball}"
    case "${tarball}" in
      *.zst) loaded=$(zstd -dc "${tarball}" | docker load) || loaded="" ;;
      *) loaded=$(docker load -i "${tarball}") || loaded="" ;;
    esac
    printf '%s\n' "${loaded}" >&2
    got=$(printf '%s\n' "${loaded}" | sed -n 's/^Loaded image: //p' | tail -n 1)
    if [ -z "${got}" ]; then
      note "docker load reported no image ref; falling through"
    elif ! usable "${got}"; then
      note "${got} loaded but holds no readable library index; falling through to the local build"
      got=""
    fi
  fi
fi

# ------------------------------------------------------- 3: local fallback --

if [ -z "${got}" ]; then
  base=${REVDEPX_BASE_IMAGE:-}
  plan=${PLAN:-plan.json}
  shard=${SHARD:-}
  if [ -z "${base}" ] || [ -z "${shard}" ] || [ ! -f "${plan}" ]; then
    note "no image to pull or load, and the local fallback is missing its inputs (REVDEPX_BASE_IMAGE='${base}', SHARD='${shard}', PLAN='${plan}')"
    exit 1
  fi
  note "building a local image for shard ${shard} from ${base} -- slower than a pull, but the shard stays alive"

  for attempt in 1 2 3; do
    if docker pull "${base}" >&2; then
      break
    fi
    note "pull of the base image ${base} failed (attempt ${attempt} of 3); a local copy may still serve"
    if [ "${attempt}" -lt 3 ]; then
      sleep $((attempt * 20))
    fi
  done

  script_dir=$(cd "$(dirname "$0")" && pwd)
  plan_dir=$(cd "$(dirname "${plan}")" && pwd)
  plan_abs="${plan_dir}/$(basename "${plan}")"
  scratch="${RUNNER_TEMP:-${TMPDIR:-/tmp}}/revdepx-universe-fallback"
  # The container's /tmp lives on the host, not in the rw layer: killed
  # subprocesses leave their build trees in /tmp, and `docker commit` would
  # otherwise copy that residue into the image.
  scratch_tmp="${scratch}-tmp"
  mkdir -p "${scratch}" "${scratch_tmp}"
  # A /tmp needs 1777: apt-key writes its temporary config there, and with
  # a plain 755 directory every repository fails signature verification and
  # every apt-get the build runs fails with it.
  chmod 1777 "${scratch_tmp}"
  cidfile="${scratch}/cid"
  rm -f "${cidfile}"

  # The container runs image.R exactly as the universe job would, except that
  # the override limits the install to this shard's union. Root, as image
  # builds are; no --rm, because the exited container is what gets committed.
  # depfail.json and build-report.md land in the scratch directory -- they
  # are this runner's log material, not an artifact; the depfail screen works
  # from the committed index either way. The REVDEPX_* knobs are forwarded by
  # name where set, so the yaml's install/load budgets apply here too.
  knob_args=()
  for knob in \
    REVDEPX_INSTALL_CHUNK \
    REVDEPX_INSTALL_TIMEOUT_MINUTES \
    REVDEPX_INSTALL_DEADLINE_MINUTES \
    REVDEPX_JOB_DEADLINE_MINUTES \
    REVDEPX_LOAD_TIMEOUT_MINUTES \
    REVDEPX_LOAD_JOBS \
    REVDEPX_LOAD_SWEEP_MINUTES \
    REVDEPX_METADATA_PROBE \
    REVDEPX_METADATA_TIMEOUT_MINUTES \
    REVDEPX_SYSREQS_TIMEOUT_MINUTES; do
    if [ -n "${!knob+x}" ]; then
      knob_args+=(-e "${knob}")
    fi
  done
  if docker run \
    --cidfile "${cidfile}" \
    --memory 12g --memory-swap 12g \
    -v "${script_dir}:/revdepx/scripts:ro" \
    -v "${plan_abs}:/revdepx/plan.json:ro" \
    -v "${scratch}:/revdepx/out" \
    -v "${scratch_tmp}:/tmp" \
    -e PLAN=/revdepx/plan.json \
    -e OUT_DIR=/revdepx/out \
    -e PKG_SYSREQS=true \
    -e REVDEPX_UNIVERSE_OVERRIDE_SHARD="${shard}" \
    -e REVDEPX_BASE_IMAGE="${base}" \
    ${knob_args[@]+"${knob_args[@]}"} \
    "${base}" \
    Rscript /revdepx/scripts/image.R >&2; then
    got="revdepx-universe:local-shard-${shard}"
    if ! docker commit "$(cat "${cidfile}")" "${got}" >&2; then
      note "committing the fallback container failed"
      exit 1
    fi
    docker rm "$(cat "${cidfile}")" > /dev/null 2>&1 || true
  else
    note "the fallback build failed; see its log above"
    if [ -s "${cidfile}" ]; then
      docker rm -f "$(cat "${cidfile}")" > /dev/null 2>&1 || true
    fi
    exit 1
  fi
fi

# ------------------------------------------------- index and sanity checks --

mkdir -p "$(dirname "${index_out}")" "$(dirname "${ref_out}")"

# Rungs 1 and 2 already proved their image usable (or fell through); the
# locally built one gets the same test, and failing it here is right --
# there is no further rung, and limping on would only move the failure into
# the driver where it is harder to read.
if ! usable "${got}"; then
  note "the image ${got} has no readable /opt/revdepx/lib-index.json; it is not a universe image"
  exit 1
fi

if ! docker run --rm "${got}" test -f /opt/revdepx/universe-ok \
  > /dev/null 2>&1; then
  note "WARNING: ${got} lacks /opt/revdepx/universe-ok -- the build may not have run to its end; proceeding, the depfail screen will name what is missing"
fi

printf '%s\n' "${got}" > "${ref_out}"
note "using image ${got}"
exit 0
