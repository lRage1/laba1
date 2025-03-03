#include <iostream>

using namespace std;

// Функция для вычисления факториала
int factorial(int n) {
    if (n < 0) {
        cout << "Факториал определен только для неотрицательных чисел.\n";
        return -1;
    }

    int result = 1;
    for (int i = 2; i <= n; i++) {
        if (result > (2147483647 / i)) { 
            cout << "Ошибка: Переполнение при вычислении факториала!\n";
            return -1;
        }
        result *= i;
    }
    return result;
}

int main() {
    int n;
    
    while (true) {
        cout << "Введите число (от 0 до 12): ";
        cin >> n;

        // Проверяем корректность ввода
        if (cin.fail()) {  
            cout << "Ошибка ввода! Введите целое число.\n";
            cin.clear();  
            while (cin.get() != '\n');  // Очищаем буфер ввода
            continue;
        }

        // Ограничиваем диапазон
        if (n < 0 || n > 12) {
            cout << "Ошибка: Введите число от 0 до 12.\n";
            continue;
        }

        break;
    }

    int fact = factorial(n);
    if (fact != -1) {
        cout << "Факториал " << n << " = " << fact << endl;
    }

    return 0;
}
