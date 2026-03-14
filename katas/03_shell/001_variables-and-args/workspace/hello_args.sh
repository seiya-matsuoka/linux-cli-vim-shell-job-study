#!/usr/bin/env bash

name="${1:-guest}"
shift_count="$#"

echo "Hello, ${name}"
echo "Argument count: ${shift_count}"
echo "All args: $*"
echo "All args with quotes:"
for arg in "$@"; do
	echo "[$arg]"
done
