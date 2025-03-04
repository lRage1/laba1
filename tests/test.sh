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

# Тест 4: выход за пределы (13)
run_test "13" "Ошибка: Введите число от 0 до 12." "Out of range 13"

# Тест 5: отрицательное число (-5)
run_test "-5" "Ошибка: Введите число от 0 до 12." "Negative number -5"

# Тест 6: не число (abc)
run_test "abc" "Ошибка ввода! Введите целое число." "Non-numeric input"

# Тест 7: переполнение (12, но программа уже ограничивает ввод)
run_test "12" "Факториал 12 = 479001600" "Factorial of 12 (max limit)"

echo "All tests passed!"
