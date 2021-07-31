import UIKit

// Topic - Counting Characters

// U can to get a count of characters use the count property for the String types

let stringMeasure = "Hello my name is Vitaliy i am from Omsk, i am 25 year old"

print("stringMeasure contains \(stringMeasure.count) symbols")

// counting characters with special chars

var word = "cafe"

print("count of chars into word of \(word) is \(word.count)")

// adding char into the word, combine it

word += "\u{301}" // COMBINING ACUTE ACCENT, U+0301

// the count has not of changes

print("count of characters into word of \(word) is \(word.count)")

// Prints "count characters in word café equal 4"
