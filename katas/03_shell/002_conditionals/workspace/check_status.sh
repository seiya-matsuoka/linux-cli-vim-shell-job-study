#!/usr/bin/env bash

status="${1:-unknown}"

if [ "$status" = "active" ]; then
  echo "status is active"
elif [ "$status" = "inactive" ]; then
  echo "status is inactive"
else
  echo "status is unknown"
fi
