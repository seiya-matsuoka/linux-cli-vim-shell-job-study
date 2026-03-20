#!/usr/bin/env bash
set -euo pipefail

timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
message="[phase04-heartbeat] ${timestamp}"

echo "$message" >> /var/log/phase04-heartbeat.log
logger "$message"
