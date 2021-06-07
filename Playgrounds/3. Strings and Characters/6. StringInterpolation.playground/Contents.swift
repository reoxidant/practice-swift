import UIKit

// Topic - String Interpolation

// in example use string interpolication, insert it into the string literal is wrapperd in a pair of parentheses, prefix by a backslash (\):

var countNumber: Float = 9

var countStringText = "\(countNumber) if delete on 3 will equal to \(countNumber * 3)"

print(countStringText)

// message is "9.0 times 3 is 27.0"

var myName = "Vitaliy"
var myAge = 30
var city = "Moskow"

print("I am \(myName), \(myAge) years old, i live in \(city)")

// the message is "I am Vitaliy, 30 years old, i live in Moskow"

// We can entering and counting literals of numbers

let number = 200

let stringOfCounting = "\(number) / 5 is \(number / 5)"

print(stringOfCounting)

// the message is 200 / 5 is 40
