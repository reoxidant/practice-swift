//: [Previous](@previous)

//: ## Arrays
//: > Store ordered but not unique values of the same type

let strings = ["a", "b", "c"] // Immutable array with String data type
let strings1:[String] = ["dd", "syhud"]

// getting element

strings[0]
strings[2]
// strings[67] - error, no such index

// Declaring an empty array with String type.

let strings2 = [String]()
let strings4 = Array<String>()

let string4 = Array<Int>() // Empty array with Int type
var integers = [Int]()

integers = [4, 75, 89] // Array assignment
integers = [4, 8] // Now our array has other data
integers += [4788, 8778] // Append new values to existing values.
integers += [4] // Append new values to existing values.

integers.append(5) // Adding a new value using the append method

integers.insert(10, at: 0) // Adding a new item by Index
integers.insert(5, at: 1)

var array3 = integers + [87,478,74]

// Remove the last element from the array and save it to a constant

var lastValue = integers.removeLast()

// The result after removing the last element

integers

// Remove the first element from the array and save it to a constant

var firstValue = integers.removeFirst()

// The result after removing the first element

integers

// Removing value by index

integers.remove(at: 1)

// The result after deleting the index value

integers

// Array element count

integers.count

// Removing all array elements

integers.removeAll()

// Zeroing an array by assigning it an empty array

integers = []

// Replace index 2 value with new value.

integers[2] = 999
integers[0] += 1

// Result after replacement

integers

//: ### Usage of the isEmpty logic property.
if integers.isEmpty {
    print("empty")
} else {
    print("not empty")
}

//: [Next](@next)
