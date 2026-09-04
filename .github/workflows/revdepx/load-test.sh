#!/usr/bin/env bash
# Load every named package in its own R session, several at a time, each on a
# clock.
#
# Usage:
#   load-test.sh <package-list-file> <library> <seconds> <jobs>
#
# Reads one package name per line. Prints one line per package on stdout:
#
#   OK   <package> <seconds>
#   FAIL <package> <timeout|error> <seconds>
#
# and the same verdict on stderr as it happens, with a running count:
#
#   [load  123/1173] OK    red                             19s
#
# The two streams are separate on purpose. stdout is the caller's data and is
# captured; stderr is the live log, so a sweep that takes half an hour says
# what it is doing while it does it instead of only afterwards. The caller
# still folds the sorted summary into a collapsed group at the end -- that is
# the one that answers "what was slow", which the arrival order cannot.
#
# Always exits 0: which packages failed is the caller's business, not the
# shell's.
#
# The `OK` lines are the whole log of a step that otherwise says nothing
# between "load-testing 498 packages" and the summary. They are also the only
# place a package that loads *slowly* -- half a minute of `.onLoad`, every
# time anything downstream of it is checked -- ever shows up. The caller folds
# them into a collapsed group, so the cost of the other 497 is a line nobody
# has to scroll past.
#
# Why one session per package rather than batches:
#
#   * a batch shares one clock, so one package that hangs spends the whole
#     budget and takes 39 innocent packages down with it, and the caller then
#     has to re-run each of them alone to find out which. Per package, the
#     answer is immediate and the blast radius is one.
#   * sessions are independent, so they run at once. A runner has four cores
#     and `loadNamespace()` is mostly I/O and dynamic linking, so the wall
#     clock falls by about the number of jobs.
#   * `timeout` sends TERM at the deadline and KILL a minute later, to the
#     process group, so a package whose `.onLoad` blocks on a socket is
#     actually killed rather than merely abandoned.

set -u

list=$1
lib=$2
seconds=$3
jobs=$4

total=$(grep -c . "${list}" || true)
width=${#total}

# The running count, without a lock. Every finished package appends one byte
# and reads the size back; single-byte appends to an O_APPEND descriptor do not
# interleave, so the number is exact rather than approximately right. A stale
# count would be cosmetic either way -- it is a progress indicator, not data.
progress=$(mktemp)
trap 'rm -f "${progress}"' EXIT

# One package, one session, one clock. `--vanilla` so nothing in a profile
# loads anything this is supposed to be testing.
load_one() {
  local pkg=$1 status=0 start=${EPOCHSECONDS}
  timeout --kill-after=60s "${seconds}s" \
    Rscript --vanilla -e \
    ".libPaths(c('${lib}', .libPaths())); loadNamespace('${pkg}')" \
    > /dev/null 2>&1 || status=$?
  local took=$((EPOCHSECONDS - start)) verdict
  if [ "${status}" -eq 0 ]; then
    verdict=OK
    echo "OK ${pkg} ${took}"
  # 124 is coreutils' timeout; anything else is R saying something.
  elif [ "${status}" -eq 124 ] || [ "${status}" -eq 137 ]; then
    verdict=TIMEOUT
    echo "FAIL ${pkg} timeout ${took}"
  else
    verdict=ERROR
    echo "FAIL ${pkg} error ${took}"
  fi
  printf '.' >> "${progress}"
  printf '[load %*d/%d] %-7s %-32s %ss\n' \
    "${width}" "$(wc -c < "${progress}")" "${total}" \
    "${verdict}" "${pkg}" "${took}" >&2
}
export -f load_one
export lib seconds progress total width

# GNU parallel where it exists, `xargs -P` where it does not -- the runners
# have both, but a local invocation may not, and the two are interchangeable
# for this.
if command -v parallel > /dev/null 2>&1; then
  parallel --will-cite -j "${jobs}" load_one :::: "${list}"
else
  xargs -a "${list}" -r -n 1 -P "${jobs}" -I '{}' \
    bash -c 'load_one "$@"' _ '{}'
fi

exit 0
