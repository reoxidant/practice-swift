import Foundation

// Оператор присваивания

var const = 78

let result: () = const = 9 //Void return type

// оператор торжественности

class T {
    
}

let obj1 = T()

let obj2 = T()

let obj3 = obj2

print(obj2 === obj3) // имеют общую ссылку
print(obj2 === obj1)

// массивы


// диапазон элемента от 2 и до последнего индекса

let arr = [6, 47, 87]

arr[1...]

// 44 мин ссылки классов не понял что автор хочет сказать, ну ответ же что да, мы может сравнивать переменые ссылающийся на один обьект в памяти торжеством

// условные инструкции

var someNumber = 10

if someNumber < 4 ||  2 >= someNumber {
    let text = "hello"
    print("Everything is good")
    
    if text == "hello" {
        print(someNumber)
    }
}

//print(text) // not see

// else if

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

// 1
if haveBigSalary {
    print("Куплю авто")
} else if !haveCredits {
    print("возьму кредит")
} else {
    print("Не судьба купить")
}

// 2
if haveBigSalary {
    print("Куплю авто")
}

if !haveCredits {
    print("возьму кредит")
}

// логическое И

let num1 = 5
let num2 = 7

let isCondition1 = num1 < 21 && num2 > 3

if isCondition1 && haveBigSalary && num2 < 8 && num1 > 47 {
    print("Куплю авто")
}

// логическое или

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


// тернарный оператор

// condition ? some code : some code

let age = 39

let permissionMessage: String
if age < 65 {
    permissionMessage = "Разрешено"
} else {
    permissionMessage = "Запрешено"
}

print(permissionMessage)

let permissionMessage2 = age < 65 ? "Разрешено" : "Запрешено"
let permissionMessage3 = age < 65 ? age < 35 ? "Разрешено" : "Запрешено" : "Запрещено" // так лучше не писать
//let permissionMessage2 = age < 65 ? "Разрешено" : 1133 // error

print("Человеку выходить: \(permissionMessage2)")

// оператор Switch

// up, down, left, right
//let command = "up"
let command = "1"

if command == "up" {
    print("Идти вверх")
} else if command == "down" {
    print("Идти вниз")
} else {
    print("Ошибка")
}


switch command {
case "up", "UP":
    print("Идти вверх")
    fallthrough
case "down":
    print("Идти вниз")
default:
    print("Ошибка")
}

let commandNumber = 7

switch commandNumber {
case 5...7 where command == "up":
    print("Идти вверх")
case 8..<10:
    print("Идти вниз")
default:
    print("Ошибка")
}

// enum - перечисление

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

// исходные значение enum

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

// emum использование инструкции Switch

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
    print("Не используй default с enum")
}

// инициализация enum

let country4 = Countries.usa
let country5 = Countries(rawValue: "USA")! // будет ошибка нет нет такого значения строки в enum

print(country5)


// связанные значения (ассоциированные параметры)

// тип индефикатора человека
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
    print("Нет данных")
}

// опциональные типы

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

// извлечение опционала

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
