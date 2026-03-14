#!/usr/bin/env bash
set -euo pipefail

cleanup() {
	echo "cleanup called"
}

trap cleanup EXIT

name="${1:-guest}"

echo "start script"
echo "name=${name}"

tmp_file="temp-output.txt"
echo "temporary data" >"$tmp_file"

echo "script finished"
