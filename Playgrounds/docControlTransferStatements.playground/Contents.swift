import UIKit

//Topic - Control Transfer Statements

//practice with operator continue

//puzzle string

let puzzleInput = "I love my little girl her name is Masha"
var puzzleOutput = ""
var charactedToRemove:[Character] = ["a", "e", "i", "o", "u", " "]

for char in puzzleInput{
    if charactedToRemove.contains(char)
    {
        continue
    }
    else
    {
        puzzleOutput.append(char)
    }
}

print(puzzleOutput)

//find summ odd numbers in example 1000

let integer = 1000
var output = 0

for n in 0..<integer{
    if n % 2 == 0 {
        continue
    }
    else
    {
        output += n
    }
}

print(output)

//delete all vowel words

let str = "Masha and Vitaliy"
let removeArr:[Character] = ["a", "o", "i", "y", " "]
var outputStr = ""

for s in str
{
    if removeArr.contains(s) {
        continue
    }
    else
    {
        outputStr.append(s)
    }
}

print(outputStr)

//what letter is in language

let letter = "iв"
var result = ""

switch(letter){
    case "i", "a", "o", "e", "q", "y":
        result = "English"
    case "":
        result = "Russian"
    default:
        break
}

print(result)

//Operator Fallthrough

let integerValue = 28
var desc = "(integer) is"

switch integerValue % 2 == 0
{
    case true:
        desc += " even number, and"
        fallthrough
    default:
        desc += " has a type integer"
}

print(desc)

//was spent on reading and practice almost 2h
