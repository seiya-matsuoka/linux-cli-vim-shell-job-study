#!/usr/bin/env bash

while IFS= read -r user; do
  echo "user from file: $user"
done < users.txt
