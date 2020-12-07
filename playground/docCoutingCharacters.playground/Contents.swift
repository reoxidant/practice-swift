import UIKit

let stringMeasure = "Hello my name is vitaliy i am from Omsk, i am 25 year old"

print("stringMeasure содержит \(stringMeasure.count) символов")

//check couting with special chars

var word = "home"

print("count of chars into word of \(word) is \(word.count)")

//adding char into the word, combine it

word += "\u{301}"

//the count is not of changes
print("count of chars into word of \(word) is \(word.count)")
