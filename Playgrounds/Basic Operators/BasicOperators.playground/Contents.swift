import UIKit

// Arithmetical operators

var number1 = 9
var number2 = 4

number1 + number2
number1 - number2
number1 * number2
number1 / number2

let num = 6 * 7 / 10

// Remainder of division

number1 % number2
-number1 % number2 // -9 remainder -1
number1 % -number2 // 9 от -4 remainder 1

// Assigment operators

number1 = 10

number1 += 23
number1 -= 23
number1 *= 23
number1 /= 23

// Comparison operators

let a = 5
let b = 5

a == b // true
a != b // false
a > b // false
a < b // false
a >= b // true
a <= b // true

// Range operators

3...6 ~= 3
3...6 ~= 6
3...6 ~= 8
3..<6 ~= 6
...6 ~= -70000

// Prefix operator !

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

let allowEntry = false

if allowEntry {
    print(welcomeMessage)
}

if a == 0 {
    print(welcomeMessage)
}

// Logical operator &&

let entereDoorCode = true
let passedRetineScan = true
let isIOSDeveloper = false

if entereDoorCode && passedRetineScan && !isIOSDeveloper {
    print(welcomeMessage)
}

// Logical operator ||

let hasDoorKey = false

// Special password
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


// Strings and symbols

let name: String
let name2 = String()

"""
hello
world
"""

// Concatenation of strings

let text = "IOS" + " " + "Developer " + String(28)
print(text)

// Interpolation

"IOS Deleveper \(28)"
