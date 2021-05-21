import UIKit

//Topic - Concatenating Strings and Characters

//in example create concatenated string Welcome

let string1 = "Hello"
let string2 = "Vitaliy"

let welcome = string1 + " " + string2

//in example append the string value to another string

var newStr = "Hello "
newStr += "Masha"

//in example using method append u can to adding the character to the string value

//but u can't to adding char or string to char variable

var addingChar: Character = "!"

newStr.append(addingChar)

//in example adding to multilines string end line break with string

var addingString = "third"

var badMultilineString = """
first
second
"""

var goodMultilineString = """
first
second

"""

badMultilineString += addingString
goodMultilineString += addingString

print("badMultilineString - \n\(badMultilineString)")
// Prints three lines:
// first
// second
// third

print("goodMultilineString - \n\(goodMultilineString)")
// Prints three lines with empty line:
// first
// second
//
// third
