import UIKit

//Topic - Working with Characters

//The string constrains from all characters types and we can to through all string using
//for in cycle

let str = "The test of String"

for ch in str
{
    print("\(ch) has a type \(type(of: ch))")
}

//u can to create character type only use one symbol

let char:Character = "?"

print("Init a new char \(char) has a type \(type(of: char))")

//u can to merge array string items into the one string value
//for example

let strArray:[Character] = ["I", " ", "a", "m", " ", "i","n", " ", "l", "o", "v", "e" ," ", "M", "a", "r", "y"]

let resToConvertCharToString = String(strArray)

print("I say to you that, \"\(resToConvertCharToString)\"")

// Prints "I say to you that, I am in love Mary"
