#!/usr/bin/env bash
set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

LOG_DIR="/srv/phase05/logs"
LOG_FILE="${LOG_DIR}/failing-job.log"
TAG="${1:-phase05-fail}"

mkdir -p "${LOG_DIR}"

timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
user_name="$(id -un)"
message="[ERROR] [${TAG}] timestamp=${timestamp} user=${user_name} pid=$$ reason=intentional_failure"

echo "${message}" >&2
echo "${message}" >> "${LOG_FILE}"

exit 1
