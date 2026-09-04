#!/usr/bin/env bash
# Check one package against both versions of the package under test at once.
#
# The two checks are independent -- separate processes, separate check
# directories, and separate library stacks that differ in exactly one package
# -- so there is no reason to run them one after the other. A runner has four
# cores and one `R CMD check` keeps about one of them busy; running the pair
# concurrently halves a package's wall clock and, when one of them hangs, still
# gets the other's answer instead of never reaching it.
#
# The library stacks cascade. `R_LIBS` is a search path, so the shared library
# holding every dependency is named by both, and the version-specific library
# in front of it holds exactly one package: the CRAN release for `old`, the dev
# build for `new`. Nothing is installed or uninstalled between the phases,
# which is what used to force them apart.
#
# Usage:
#   check-pair.sh <tarball> <workdir> <lib-old> <lib-new> <lib-shared> <seconds>
#
# Leaves <workdir>/{old,new}/ holding the .Rcheck directory, `driver.log` (what
# R CMD check said) and `status` (its exit code; 124 is the timeout, per
# coreutils `timeout`). Always exits 0: which of the two failed, and how, is
# for the caller to read out of those files.

set -u

# The checks run at a lower priority than everything else on the runner.
#
# Two `R CMD check` processes at once, each with children of its own -- a test
# suite that opens a PSOCK cluster, a vignette that knits -- can take every core
# the runner has. The runner agent is a process on that machine too, and it has
# to reach the service regularly or the job dies with
#
#   The hosted runner lost communication with the server.
#
# which names starvation as one of its causes. `nice` costs nothing when there
# is headroom: the scheduler only consults priority when there is more work than
# cores, which is exactly the case worth protecting. `ionice` does the same for
# the disk, where a check writing its .Rcheck directory competes with the agent
# writing logs; it is best-effort, since not every image has it.
low_priority=(nice -n 10)
if command -v ionice > /dev/null 2>&1 && ionice -c3 true > /dev/null 2>&1; then
  low_priority+=(ionice -c3)
fi

tarball=$1
work=$2
lib_old=$3
lib_new=$4
lib_shared=$5
seconds=$6

# Seconds since the check started, in front of every line it prints.
#
# `R CMD check` only reports a stage's own time when it exceeds its threshold,
# and never for the stage it was killed in -- which is the one worth knowing
# about. Stamping the stream costs nothing and turns "timed out at * checking
# examples with --run-donttest" into how long every stage before it took, and
# how long that one had been running. `EPOCHSECONDS` is a bash builtin, so
# this spawns nothing per line.
stamp() {
  local start=${EPOCHSECONDS} line
  while IFS= read -r line; do
    printf '[%5ds] %s\n' "$((EPOCHSECONDS - start))" "${line}"
  done
}

check_one() {
  local phase=$1
  local lib=$2
  local port=$3
  local out="${work}/${phase}"
  mkdir -p "${out}"
  # `timeout` sends TERM at the deadline and KILL a minute later, and R CMD
  # check's own children go with it because it runs in its own process group.
  # The status is PIPESTATUS[0] because the stamping is downstream of it.
  R_LIBS="${lib}:${lib_shared}" \
    R_PARALLEL_PORT="${port}" \
    "${low_priority[@]}" \
    timeout --kill-after=60s "${seconds}s" \
    R CMD check --no-manual --as-cran --output="${out}" "${tarball}" 2>&1 |
    stamp > "${out}/driver.log"
  echo "${PIPESTATUS[0]}" > "${out}/status"
}

# A port each, because the two halves would otherwise pick the same one.
#
# `parallel` chooses its default PSOCK port once, when its namespace loads:
#
#   ran1 <- sample.int(.Machine$integer.max - 1L, 1L) / .Machine$integer.max
#   port <- 11000 + 1000 * ((ran1 + unclass(Sys.time())/300) %% 1)
#
# The random term is drawn from the session's RNG stream, so it is only random
# while the stream is. Anything that calls `set.seed()` before `parallel` is
# first loaded -- which examples, vignettes and testthat do constantly, for
# reproducibility -- makes it deterministic, and both halves then draw the same
# number. Measured: three sessions seeded with 42 gave 11181, 11183, 11183,
# against 11005, 11214, 11652 unseeded.
#
# The time term cannot separate them either. It sweeps 1000 ports over 300
# seconds -- 3.3 ports per second -- so two halves that load `parallel` within
# a third of a second of each other land on the same integer port. They start
# together and run the same script, so they do. And the choice is made once per
# session, not per cluster, so from then on *every* cluster either half opens
# races for that one port.
#
# In run 31893156685 that cost `cia` (port 11477) and `TDApplied` (11058),
# both reported as newly broken having nothing wrong with them. Staggering the
# halves is not a fix: the separation would have to hold at the moment each
# loads `parallel`, the two drift apart by minutes over a check, and at 300
# seconds the sweep wraps back onto itself.
#
# Setting the port explicitly costs nothing that was not already the case --
# R fixes one port per session and reuses it regardless -- and the two ranges
# are far from R's own 11000-12000 band, so a session that inherits neither
# cannot wander into either.
check_one old "${lib_old}" 20000 &
old_pid=$!
check_one new "${lib_new}" 30000 &
new_pid=$!

wait "${old_pid}"
wait "${new_pid}"

exit 0
