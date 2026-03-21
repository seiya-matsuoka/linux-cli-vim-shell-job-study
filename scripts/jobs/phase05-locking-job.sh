#!/usr/bin/env bash
set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

LOG_DIR="/srv/phase05/logs"
LOG_FILE="${LOG_DIR}/locking-job.log"
LOCK_FILE="/tmp/phase05-locking-job.lock"
DURATION="${1:-90}"

mkdir -p "${LOG_DIR}"

log_info() {
  local timestamp
  timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
  echo "[INFO] [phase05-lock] timestamp=${timestamp} pid=$$ $*" | tee -a "${LOG_FILE}"
}

log_warn() {
  local timestamp
  timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
  echo "[WARN] [phase05-lock] timestamp=${timestamp} pid=$$ $*" | tee -a "${LOG_FILE}" >&2
}

on_term() {
  log_warn "signal_received=TERM"
  exit 130
}

trap on_term TERM INT

exec 9>"${LOCK_FILE}"

if ! flock -n 9; then
  log_warn "lock_busy lock_file=${LOCK_FILE}"
  exit 200
fi

log_info "lock_acquired duration=${DURATION}"
sleep "${DURATION}"
log_info "job_completed"
