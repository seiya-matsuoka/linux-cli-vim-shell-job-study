#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=../lib/common.sh
source "$SCRIPT_DIR/../lib/common.sh"

input_file="${1:-}"

if [ -z "$input_file" ]; then
  log_error "usage: $0 <log-file>"
  exit 1
fi

if [ ! -f "$input_file" ]; then
  log_error "file not found: $input_file"
  exit 1
fi

log_info "summarizing log: $input_file"

error_count="$(grep -c 'ERROR' "$input_file" || true)"
warn_count="$(grep -c 'WARN' "$input_file" || true)"
info_count="$(grep -c 'INFO' "$input_file" || true)"

echo "ERROR=${error_count}"
echo "WARN=${warn_count}"
echo "INFO=${info_count}"
