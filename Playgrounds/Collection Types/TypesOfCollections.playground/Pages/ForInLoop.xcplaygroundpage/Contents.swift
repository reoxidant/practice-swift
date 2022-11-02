import Foundation

//: ## For-in loop

/*:
 
    for counter in lower…upper {
        some code
    }
 
 */

// How to search in an array of values

var arr = ["str1", "str48"]

for value in arr{
    print("Hello \(value)")
}

// Displays each element of the array

for index in 1...5{
    print("Hello \(index)")
}

// Sum of the values

var sum = 0
for value in 1...3 {
    sum += value
}

print(sum)

// 1 + 2 + 3 = 6

sum = 0
for value1 in 1...3 {
    for value2 in 1...5 {
        print(value2)
    }
}

//print(sum)

// 1 + 2 + 3 = 6

//: ### Iteration by array

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

//: ### Iteration by vocabulary

let legsContDict = ["spider": 8, "bug": 6, "cat": 4]

for (key, value) in legsContDict {
    print("\(key) \(value)")
}

//: ### Iteration by text

for char in "hello" {
    for char in "hello" {
        print(char)
    }
}

//: [Next](@next)
