import Foundation

let pi = 3.14
var name = "Igor"
name = "Petya"

let name2:String
name = "igor"

// name = "misha"

// Types of constants define the compiler
let name3 = """
misha
Igor
"""

// Declare types
let surname: String

// Int:
let age = 45

// Float, Double:
let someNumber = 4.6
let someNumber2: Float = 4.6
var someFloat: Float = 10.0

someFloat = 123.345777
someFloat = 1234.345777
someFloat = 12345.345777
someFloat = 123456.345777

var someDouble: Double = 10.0

someDouble = 123.345777
someDouble = 1234.345777
someDouble = 12345.345777
someDouble = 123456.345777

// Bool

let isLessonLong = false

// Type casting

let someNumber3: Double = 1277.98
let age2: Int = 45

// Int to Double
let caseIntToDouble = someNumber + Double(age2)

// Double to Int
let caseDoubleToInt = Int(someNumber) + age2

// Int to String
let caseIntToString = String(age2)

// Int to Int
let stringToInt = Int(caseIntToString)

let number1 = 5
var number2 = 1

print(number1 + number2)
