import UIKit

//Topic - Constants and Variables

//let never changes
let maximumNumberOfLoginAttempts = 10
// var get able to change
var currectLoginAttemp = 0

//place and declare many variable ONE TYPE
var x = 0.0, y = 0.0, z = 0.0

//anotation type of variable
var welcomeMessage:String
welcomeMessage = "Hello"

//creating many variable of ONE TYPES
var red, green, blue: Double

//any symbols of naming, without begin number of special symbols $

let п = 3.1459
let 你好 = "你好世界"
let 🐮 = "dowcow"

//Error u can't change type value of variable

let variableToConstant:Int = 0
//var variableToConstant = 2
//variableToConstant = "String value"

//Bad practice to use the same naming of variables, and use the same naming of main words swift language
//let example:String
//var `example`:String

//key words of swift language
//var, let, swift, if and etc

//U can to change value of variables if the type the same
var myName:String = "Vitaliy"
myName = "Masha"


//u can't to change value of constant, if u try the code can't be a runner
let const = "any text"
//const = "i wanna have another text" //get a error of compilation

//print variable or string into console
print("console log")

//or variable
print(myName)

//if u don't need replace the line of string
print(myName, terminator:"")

//interpolation var or let type in a string value
print("The name of create is \(myName)")
