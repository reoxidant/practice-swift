//: [Previous](@previous)

import Foundation

//: ## For-in циклы

/*:
 
    for counter in lower…upper {
        some code
    }
 
 */
// как перебирать в массиве значения


// 1 час 41 мин

var arr = ["str1", "str48"]

for value in arr{
    print("Hello \(value)")
}

// выводится каждый элемент массива

for index in 1...5{
    print("Hello \(index)")
}

// 1 час 47 мин
// Сумма значений

var sum = 0
for value in 1...3 {
    sum += value
}

print(sum)

//1 + 2 + 3 = 6

sum = 0
for value1 in 1...3 {
    for value2 in 1...5 {
        print(value2)
    }
}

//print(sum)

// 1 + 2 + 3 = 6
//: ### Итерация по массиву
// 1 час 47 мин

let fruits = [
    "apple", "banana", "pineapple",
    "apple", "pear", "apple", "plum",
    "apricot", "apple"
]

var applesCount = 0

for fruit in fruits {
    if fruit == "apple" {
        applesCount += 1
    }
}

print(applesCount)
//: ### Итерация по словарю

let legsContDict = ["spider": 8, "bug": 6, "cat": 4]

for (key, value) in legsContDict {
    print("\(key) \(value)")
}
//: ### Итерация по тексту
// 1 час 55 мин

for char in "привет" {
    for char in "привет" {
        print(char)
    }
}
//: [Next](@next)
