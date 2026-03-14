#!/usr/bin/env bash

check_file_exists() {
	local target="$1"

	if [ -f "$target" ]; then
		return 0
	fi

	return 1
}

touch existing.txt

if check_file_exists "existing.txt"; then
	echo "existing.txt found"
fi

if check_file_exists "missing.txt"; then
	echo "missing.txt found"
else
	echo "missing.txt not found"
fi
