#!/usr/bin/env bash
# What the machine has left, sampled while the work is still running.
#
# A job that is killed rather than failed takes its post-steps with it: when
# the runner receives a shutdown signal, `if: always()` steps never run, the
# artifact is never uploaded, and the only record that survives is what was
# already streamed to the log. So the numbers that explain such a death have
# to be emitted *during* the work, not after it -- which is what this does.
#
# Usage:
#   watch-resources.sh once  [label]              one sample, labelled
#   watch-resources.sh watch [seconds] [label]    a sample every `seconds`,
#                                                 until the process is killed
#   watch-resources.sh oom                        what the kernel killed, if
#                                                 anything -- the difference
#                                                 between "out of memory" and
#                                                 "the host went away"
#
# Every sample also goes to $RESOURCE_LOG when that is set, so a job that does
# reach its upload step carries the series in its artifact too.
#
# In `watch` mode the label may move: with $RESOURCE_PHASE_FILE set, each sample
# reads its first line and uses that instead of the fixed argument. The sampler
# outlives any one phase of the work -- that is the point of it -- so a label
# fixed when it starts is wrong for everything after. The preflight labelled
# half an hour of load-testing `installing` because of exactly this.

set -u

mode="${1:-once}"

emit() {
  printf '[resources] %s\n' "$1"
  if [ -n "${RESOURCE_LOG:-}" ]; then
    mkdir -p "$(dirname "${RESOURCE_LOG}")" 2> /dev/null || true
    printf '%s\n' "$1" >> "${RESOURCE_LOG}" || true
  fi
}

# One line: clock, memory, swap, disk on the two filesystems that fill up
# here, load, and the three largest processes -- which is what names the
# thing that grew just before the machine stopped answering.
sample() {
  local label="${1:-}"
  local mem disk load top
  if [ -n "${RESOURCE_PHASE_FILE:-}" ] && [ -r "${RESOURCE_PHASE_FILE}" ]; then
    label=$(head -n 1 "${RESOURCE_PHASE_FILE}" 2> /dev/null) || label="${1:-}"
  fi

  mem=$(awk '
    /^MemTotal:/     { total = $2 }
    /^MemAvailable:/ { avail = $2 }
    /^SwapTotal:/    { swap_total = $2 }
    /^SwapFree:/     { swap_free = $2 }
    END {
      printf "mem %.1f/%.1fG used, %.1fG available; swap %.1f/%.1fG used",
        (total - avail) / 1048576, total / 1048576, avail / 1048576,
        (swap_total - swap_free) / 1048576, swap_total / 1048576
    }' /proc/meminfo)

  # `/mnt` is the runner's large ephemeral disk, and `/` the one everything
  # here actually writes to; duplicates collapse, so naming a path twice or
  # naming one that does not exist costs nothing.
  disk=$(df -BG --output=target,avail \
    / /mnt /tmp "${RUNNER_TEMP:-/tmp}" "${TMPDIR:-/tmp}" 2> /dev/null |
    awk 'NR > 1 && !seen[$1]++ { printf "%s %s free; ", $1, $2 }' |
    sed 's/; $//')

  load=$(cut -d ' ' -f 1-3 < /proc/loadavg)

  top=$(ps -eo rss=,comm= --sort=-rss 2> /dev/null |
    head -n 3 |
    awk '{ printf "%s %.1fG; ", $2, $1 / 1048576 }' |
    sed 's/; $//')

  emit "$(date -u +%H:%M:%S)${label:+ ${label}} -- ${mem}; ${disk}; load ${load}; largest: ${top}"
}

case "${mode}" in
  once)
    sample "${2:-}"
    ;;
  watch)
    interval="${2:-30}"
    label="${3:-}"
    while true; do
      sample "${label}"
      sleep "${interval}"
    done
    ;;
  oom)
    # `dmesg` needs privileges on a stock kernel; on a hosted runner sudo is
    # passwordless, and where it is not, saying so beats saying nothing.
    if kills=$(sudo -n dmesg 2> /dev/null |
      grep -iE 'out of memory|oom-kill|oom_reaper|killed process' |
      tail -n 5) && [ -n "${kills}" ]; then
      emit "the kernel reports out-of-memory kills:"
      printf '[resources] %s\n' "${kills}"
    elif [ -n "${kills:-}" ]; then
      emit "no out-of-memory kills in dmesg"
    else
      emit "no out-of-memory kills in dmesg (or dmesg is not readable here)"
    fi
    ;;
  *)
    echo "usage: watch-resources.sh {once [label]|watch [seconds] [label]|oom}" >&2
    exit 2
    ;;
esac
