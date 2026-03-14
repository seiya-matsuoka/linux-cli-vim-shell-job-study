#!/usr/bin/env bash

value="${1:-hello}"

if [ "$value" = "hello" ]; then
	echo "[ ] matched hello"
fi

if [[ "$value" == h* ]]; then
	echo "[[ ]] pattern matched"
fi
