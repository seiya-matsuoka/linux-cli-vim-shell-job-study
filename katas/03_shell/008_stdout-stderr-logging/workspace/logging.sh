#!/usr/bin/env bash

log_info() {
  echo "[INFO] $*"
}

log_error() {
  echo "[ERROR] $*" >&2
}

input_file="${1:-input.csv}"

if [ ! -f "$input_file" ]; then
  log_error "file not found: $input_file"
  exit 1
fi

log_info "start processing: $input_file"
line_count="$(wc -l < "$input_file")"
log_info "line count: $line_count"
log_info "finished"
