#!/bin/bash

echo "Running tests..."

run_test() {
  input="$1"
  expected="$2"
  description="$3"

  output=$(echo -e "$input" | ./first)

  if echo "$output" | grep -q "$expected"; then
    echo "[PASS] $description"
  else
    echo "[FAIL] $description"
    echo "Expected: '$expected'"
    echo "Got: '$output'"
    return 1
  fi
}

# Тест 1: факториал 5 (120)
run_test "5" "Факториал 5 = 120" "Factorial of 5"

# Тест 2: факториал 0 (1)
run_test "0" "Факториал 0 = 1" "Factorial of 0"

# Тест 3: факториал 10 (3628800)
run_test "10" "Факториал 10 = 3628800" "Factorial of 10"

echo "All tests passed!"
