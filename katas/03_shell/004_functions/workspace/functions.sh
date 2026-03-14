#!/usr/bin/env bash

say_hello() {
  local name="$1"
  echo "Hello, ${name}"
}

sum_two_numbers() {
  local a="$1"
  local b="$2"
  echo $((a + b))
}

say_hello "Seiya"
result="$(sum_two_numbers 10 20)"
echo "sum result: ${result}"
