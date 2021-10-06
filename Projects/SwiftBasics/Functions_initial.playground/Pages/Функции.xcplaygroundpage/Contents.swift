
import Foundation
//: # Lesson 5

//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */
// 45 мин - неправильное написание функции

var a = 7
var b = 87

func add_numbers() {
    print(a + b)
}

// правильное написание функции

func printSum() {
    let number1 = 7
    let number2 = 87
    print("сумма \(number1 + number2)")
}

printSum()
printSum()
printSum()

var func1 = printSum

func1()
//: ### Функции с возвращаемыми значениями
// 52 мин - стандартные функции которые возвращают результат

let isExists = [4,7].contains(4)
let maxValue = [4,7].max()
print(isExists)
print(maxValue!)
/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */

func getSum() -> Int {
    let number1 = 7
    let number2 = 8
    
    return number1 + number2
}


var sum = getSum()

print("сумма \(sum)")

// return сразу выйдет из функции

func getSum2() -> Int {
    for index in 1...100 {
        return 6
    }
    
    let number1 = 7
    let number2 = 8
    
    return number1 + number2
}

sum = getSum2()

print("сумма2 \(sum)")





//: ### Функции с параметрами
// 1ч
/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */

// Функция с параметрами без меток аргументов (argument label)
func addingTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

var languge = "russian"

var test = {[languge] in print(languge)}

func addingTwoNumbersClosure(number1: Int, number2: Int, callback: ([String]) -> Int) -> Int {
    
    callback([languge])
    return number1 + number2
}

languge = "china"

let testSum = addingTwoNumbersClosure(number1: 1, number2: 2, callback: {
    strings in
    print(strings)
    return strings.count
})

let sum2 = addingTwoNumbers(number1: 6, number2: 7)

let sum6 = addingTwoNumbers(number1: 6, number2: 7)

print(sum2)

let sum3 = addingTwoNumbers(number1: 100000, number2: 7)

print(sum3)

// 1ч 6 мин

// Функция с параметрами и метками аргументов(argument label)


func addingTwoNumbersV2(withNumber number1:Int, andNumber number2: Int) -> Int {
    return number1 + number2
}

sum = addingTwoNumbersV2(withNumber: 12000, andNumber: 800)

print(sum)

// тоже имя функции то с разными параметрами

func addingTwoNumbersV2(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
}

sum = addingTwoNumbersV2(6000, 1000)

print(sum)

func contains(number: Int, in array: [Int]) -> Bool {
    return array.contains(number)
}


let isContainNumber = contains(number: 7, in: [7, 675, 68])

print(isContainNumber)

//: [Next](@next)
