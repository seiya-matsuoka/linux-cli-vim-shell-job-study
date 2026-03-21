#!/usr/bin/env bash
set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

LOG_DIR="/srv/phase05/logs"
LOG_FILE="${LOG_DIR}/status-job.log"
TAG="${1:-phase05-status}"

mkdir -p "${LOG_DIR}"

timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
user_name="$(id -un)"
message="[INFO] [${TAG}] timestamp=${timestamp} user=${user_name} pid=$$ pwd=$(pwd)"

echo "${message}"
echo "${message}" >> "${LOG_FILE}"
