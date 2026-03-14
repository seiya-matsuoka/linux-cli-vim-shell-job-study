#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=../lib/common.sh
source "$SCRIPT_DIR/../lib/common.sh"

input_file="${1:-}"

if [ -z "$input_file" ]; then
  log_error "usage: $0 <csv-file>"
  exit 1
fi

if [ ! -f "$input_file" ]; then
  log_error "file not found: $input_file"
  exit 1
fi

log_info "building status report: $input_file"

tail -n +2 "$input_file" | cut -d',' -f3 | sort | uniq -c
