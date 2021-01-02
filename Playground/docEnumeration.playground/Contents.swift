import UIKit

//Here is 3 TOPIC on practice Enumeration

//Topic - Enumeration Syntax

//in example cases of hour

//many cases

enum Hour
{
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
}

//case in one line

enum Human
{
    case hands, legs, body, head
}

//initialization enum any variables

var partBody = Human.hands

print(partBody)

partBody = .legs

print(partBody)

//Topic - Matching Enumeration Values with a Switch Statement

//in example enums working with switch

let someBody = Human.hands

switch someBody
{
case .hands:
    print("It is a hands")
case .legs:
    print("It is a legs")
case .body:
    print("It is a body")
case .head:
    print("It is a head")
}

//in example using operator switch in default value

let touchHuman = Human.body

switch touchHuman
{
case .body:
    print("It is body of human which holding a head or hands")
case .head:
    print("It is head of human which can be think")
    
default:
    print("U can't touch to part of Human")
}

//Topic - Iterating over Enumeration Cases

//in example using CaseIterable u will be can allow have a access in iteration for all cases


enum Colors: CaseIterable
{
    case red, yellow, blue, white, black
}

let countColors = Colors.allCases.count

print("Count of colors in enumeration is: \(countColors)")

//iteration for in Colors

print("Main colors cases in enumeration:")

var i = 0

for color in Colors.allCases
{
    i += 1
    print("\(i): \(color)")
}

//Topic - Associated Values

//in example init enum and associated values in here

enum Being{
    case human(String, Int, String)
    case animal(String, Int, String)
}

var currentBeing = Being.human("Masha", 27, "Female")
currentBeing = .animal("Pig", 3, "Male")

//in exaple use operator switch for define enum with accosiate values and extract value for do some operation in body of case

switch currentBeing
{
case .human(let name, let age, let sex):
    print("It's a Human with name: \(name), age: \(age) years, sex: \(sex)")
case let .animal(name, age, sex):
    print("It's a Animal with name: \(name), age:\(age) years, sex:\(sex)")
}
