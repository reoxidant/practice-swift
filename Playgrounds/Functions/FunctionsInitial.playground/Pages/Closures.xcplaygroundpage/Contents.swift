//: [Previous](@previous)

import Foundation

//: ### Functions as closures

//: Select a number lower than a given value.

func filterLessThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers = [Int]()

    for number in numbers {
        if number < value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

let someValue = 5
let numbers = [5, 8, 20, 13, 1, 4, 3, 6]

filterLessThanValue(value: someValue, numbers: numbers)

//: Select a number over a certain value.

func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers = [Int]()

    for number in numbers {
        if number > value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

filterGreaterThanValue(value: someValue, numbers: numbers)

//: The function of selecting numbers from a given value.

func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var filterNumbers = [Int]()

    for number in numbers {
        if closure(number, value) {
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}

//: Function to select number less than specified value

func lessThanValue(number: Int, value: Int) -> Bool {
    number < value
}

//: Function for selecting a number larger than the specified value.

func greaterThanValue(number: Int, value: Int) -> Bool {
    number > value
}

// The main differences from closure

let closure1 = { (number: Int, value: Int) -> Bool in
    number > value
}

greaterThanValue(number: 4, value: 8)
closure1(4,7)

[5].filter({$0 > 7})

func greaterThan7(numberToCompare: Int) -> Bool {
    return numberToCompare > 7
}

[5].filter(greaterThan7)

//: Selection of numbers below the specified value

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: lessThanValue)

//: Selecting the number greater than the specified value.

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: greaterThanValue)

//: ### Closing expressions

/*:
 
 There are three types of closures:
 
 - Global functions are closures that have a name and that do not capture any value.
 
 - Nested functions are closures which also have a name, but may use or capture values of the parent function.
 
 - Closing expressions are unnamed features written in lightweight syntax that can capture values from the surrounding context.
 
 */


/*:
 { (parameters) -> result type in
 body closing expressions
 }
 */

/*
 func greaterThanValue(number: Int, value: Int) -> Bool {
 number > value
 }
 */

// Rewrite the function for closure.

let greaterThanValueClosure = { (number: Int, value: Int) -> Bool in
    return number > value
}

let isGreater = greaterThanValueClosure(43, 4)

// Closure of the countdown with a character in a chain.

let strLen = {(str: String) -> Int in
    return str.count
}

let count = strLen("dji")

print(count)

//: Select the number in excess of the specified value.

// Specify closure as argument in function

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { (number: Int, value: Int) -> Bool in
    return number > value
})

let result = [54, 87, 5, 45, 23].filter({ (number: Int) -> Bool in return number > 50})
print(result)

//: Type output

// Closure without argument types

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { number, value in
    return number > value
})

//: Implicit return values from single-expression closures

// Closure without the return key

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { number, value in number > value })

//: Reduced parameter name

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { $0 > $1 })

// if closure at the end we can carry it out for function

filterWithPredicateClosure(value: someValue, numbers: numbers) { $0 > $1 }

func getPostsNames(byTopic topic: String, callback: ([String]) -> Void) {
    if topic == "News" {
        callback(["USA Electtion", "Russia"])
    }
}

getPostsNames(byTopic: "News", callback: { names in
    print(names)
    print(names.first)
})

// morer shorter record callback closure

getPostsNames(byTopic: "News") { names in
    print(names)
    print(names.first)
}

//: Operator functions

// the simplest version of the function closure >

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: >)
