import UIKit


//15 мин понять почему нельзя делать print(firstString, " ", secondString)

// Операции и пробелы надо разделять для читаемости кода

// 33 мин Как выводить корень правильно pow sqrtRoot

// 43 мин Зачем нужен тип Character

// Арифметические операторы

var number1 = 9
var number2 = 4

number1 + number2
number1 - number2
number1 * number2
number1 / number2

// приоритеты как в математике

let num = 6 * 7 / 10

// остаток от деления

number1 % number2
-number1 % number2 // -9 остаток -1
number1 % -number2 // 9 от -4 остаток 1

// 52 мин не понял про нужно ли округлять остаток от деления %

// операторы присваивания

number1 = 10

number1 += 23
number1 -= 23
number1 *= 23
number1 /= 23

// операторы сравнения

let a = 5
let b = 5

a == b // true
a != b // false
a > b // false
a < b // false
a >= b // true
a <= b // true

// операторы диапазона

3...6 ~= 3
3...6 ~= 6
3...6 ~= 8
3..<6 ~= 6
...6 ~= -70000

// Префиксный оператор НЕ

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

let allowEntry = false

if allowEntry {
    print(welcomeMessage)
}

if a == 0 {
    print(welcomeMessage)
}

// Оператор логического И:

// человек ввел правильный код
let entereDoorCode = true
let passedRetineScan = true
let isIOSDeveloper = false

if entereDoorCode && passedRetineScan && !isIOSDeveloper {
    print(welcomeMessage)
}

// Посмотреть еще раз, чтот прослушал про оператор ИЛИ

// Оператор логического ИЛИ:

let hasDoorKey = false

// Спецпароль
let knowsOverridePassword = false

if hasDoorKey || knowsOverridePassword {
    print(welcomeMessage)
}

let isValidUser = entereDoorCode && passedRetineScan && !isIOSDeveloper
let isHack = hasDoorKey || knowsOverridePassword

if  isHack || isValidUser {
    print(welcomeMessage)
}

if  entereDoorCode && (passedRetineScan && isIOSDeveloper || hasDoorKey) || knowsOverridePassword{
    print(welcomeMessage)
}


// строки и символы

let name: String
let name2 = String()

"""
hello
world
"""

// конкатенация строк:

let text = "IOS" + " " + "Developer " + String(28)
print(text)

// интерполяция

"IOS Deleveper \(28)"
