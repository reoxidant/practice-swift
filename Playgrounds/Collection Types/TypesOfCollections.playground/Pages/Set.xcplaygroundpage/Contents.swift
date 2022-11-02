//: [Previous](@previous)

import Foundation

// Set
// > Store disordered but unique values of the same type

// Empty set

var strings1 = [Set<String>]()

var strings2: Set<String> = []

var strings: Set = ["xs", "a", "a", "hd"] // Creating set with a String type

// Adding a new element to a set

strings.insert("hd")
strings

// Check for a certain element in a set

if strings.contains("a") {
    print("contains a")
}

// Remove from the list of students with unique names

// Sorted by sorted() for iteration by set

let sorderArray = strings.sorted()

// Check if set is superset

var strings3: Set = ["hd"]

strings.isSuperset(of: strings3)

//: [Next](@next)
