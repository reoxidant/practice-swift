import Foundation

// Assignment operator

var const = 78

let result: () = const = 9 // Void return type

// Solemnity operator

class T {
    
}

let obj1 = T()

let obj2 = T()

let obj3 = obj2

print(obj2 === obj3) // has a common reference
print(obj2 === obj1)

// Arrays

// Element range from 2 to the last index

let arr = [6, 47, 87]

arr[1...]

// Condition instruction

var someNumber = 10

if someNumber < 4 ||  2 >= someNumber {
    let text = "hello"
    print("Everything is good")
    
    if text == "hello" {
        print(someNumber)
    }
}

someNumber = 10

if someNumber < 4 { //false
    print("The first condition is true")
} else if someNumber < 8 { //false
    print("The second condition is true")
} else {
    print("error")
}

let haveBigSalary = false
let haveCredits = true

if haveBigSalary {
    print("Will buy an auto")
} else if !haveCredits {
    print("Will take a loan")
} else {
    print("Is not destiny")
}

if haveBigSalary {
    print("Will buy an auto")
}

if !haveCredits {
    print("Will take a loan")
}

// Logical &&

let num1 = 5
let num2 = 7

let isCondition1 = num1 < 21 && num2 > 3

if isCondition1 && haveBigSalary && num2 < 8 && num1 > 47 {
    print("Will buy an auto")
}

// Logical ||

let a = 1
let b = 10

if a < 4 || b < 4 {
    print("The first condition is true")
} else if a < 8 {
    print("The second condition is true")
} else if a == 10 {
    print("The third condition is true")
} else {
    print("Nothing was true")
}


// Ternary operator

// condition ? some code : some code

let age = 39

let permissionMessage: String
if age < 65 {
    permissionMessage = "Allow"
} else {
    permissionMessage = "Deny"
}

print(permissionMessage)

let permissionMessage2 = age < 65 ? "Allow" : "Deny"
let permissionMessage3 = age < 65 ? age < 35 ? "Allow" : "Deny" : "Deny" // так лучше не писать
//let permissionMessage2 = age < 65 ? "Accepted" : 1133 // error

print("Person to go out: \(permissionMessage2)")

// Switch operator

// up, down, left, right
//let command = "up"
let command = "1"

if command == "up" {
    print("Go up")
} else if command == "down" {
    print("Go down")
} else {
    print("Error")
}

switch command {
case "up", "UP":
    print("Go up")
    fallthrough
case "down":
    print("Go down")
default:
    print("Error")
}

let commandNumber = 7

switch commandNumber {
case 5...7 where command == "up":
    print("Go up")
case 8..<10:
    print("Go down")
default:
    print("Error")
}

// enum - enumeration

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

enum Directions {
    case up
    case down
    case left
    case right
}

let currentDay = Weekday.friday
let currentDay2: Weekday = .monday

// reference value enum

enum Countries: String {
    case usa = "USA"
    case russian = "Russia"
    case china = "China"
}

enum Countries2: Int {
    case usa = 1
    case russian
    case china
}

enum Countries3: String {
    case usa
    case russian
    case china
}

let country: Countries = .russian
let country2: Countries2 = .china
let country3: Countries3 = .usa

let value = country.rawValue
print(value)

let value2 = country2.rawValue
print(value2)

let value3 = country3.rawValue
print(value3)

// usage instruction Switch

enum Command {
    case up
    case down
    case left
    case right
}

let command2: Command = .up

switch command2 {
case .up:
    print("Go up")
case .down:
    print("Go down")
case .left:
    print("Go left")
case .right:
    print("Go right")
}

enum Command2 {
    case up
    case down
    case left
    case right
    case leftUp
    case rightUp
}

let command3: Command2 = .rightUp

switch command3 {
case .up:
    print("Go up")
case .down:
    print("Go down")
case .left:
    print("Go left")
case .right:
    print("Go right")
case .leftUp:
    print("Go left up")
default:
    print("Don't use default with enum")
}

// initialization enum

let country4 = Countries.usa
let country5 = Countries(rawValue: "USA")! // будет ошибка нет нет такого значения строки в enum

print(country5)


// connected values (associated parameters)

// human identification type
enum IdType {
    case passport(number: String)
    case driverLicense(number: String, expirationDate: Date)
    case noId
}

let id: IdType = .passport(number: "123213 4324 43434")
let license: IdType = .driverLicense(number: "1323 4324 1233", expirationDate: Date())

switch license {
case .passport(let number):
    print(number)
case .driverLicense(let number, let expirationDate):
    print(number)
    print(expirationDate)
case .noId:
    print("Do")
}

// optional types

let someString: String = "hello"
var someOptString: String?
var someOptString2: String? = "hello"

print(someString)
//print(someOptString) // nil
//print(someOptString2) // Optional("hello")

var someOptInt: Int?

someOptInt = 50
//print(someOptInt) // Optional(50)
someOptInt = nil
//print(someOptInt) // nil

var str = "25hello"

let someNum = Int(str)

// optional extraction

if someNum == nil {
    print("error converting int")
}

str = "25"
let someNum2 = Int(str)

let notOptionalNum = someNum2!

print(notOptionalNum)

if let value = someNum {
    print(value)
}

var minusTwo = -2
let anotherMinusTwo = +minusTwo
print(anotherMinusTwo)
