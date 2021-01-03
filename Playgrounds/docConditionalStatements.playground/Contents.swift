import UIKit

//Topic - Conditional Statements

//how to use if in example

var tempCelsius = -10

if tempCelsius <= 0
{
    print("It's a very cold. Need to wear a scarf!")
}

//work with else in example

tempCelsius = 25

if tempCelsius > 0
{
    print("It's a good temperature. Need to wear a shirt!")
} else {
    print("It's a very cold. Need to wear a scarf!")
}

//work with if else and more branches conditions

let old = 40

if old > 40 {
    print("Seems are you grandfather")
} else if (old < 40 ){
    print("Seems are you a man")
} else {
    print("Seems are you a student")
}

//default value if statements in example

let name = "Masha"
let findingLetterOne:[Character] = ["a", "o"]
let findingLetterTwo:[Character] = ["s", "v"]

var countVovel = 0
var countСonsonant = 0

for letter in name{
    if findingLetterOne.contains(letter)
    {
        countVovel += 1
    }
    else if findingLetterTwo.contains(letter)
    {
        countСonsonant += 1
    }

    //if not finding
    //else is not define
}

print(countСonsonant, countVovel)

let anyInt = Int.random(in: 2...10)

//if u don't have any inner scope, u will get the error

//switch anyInt {
//    case 5:
//        print("\(anyInt) is equal 5")
//    case 10:
//    default:
//        print("\(anyInt) is not equal 5 or 10 number")
//}

//merge cases 5 and 10 for pass the error that have a empty condition

switch anyInt {
    case 5, 10:
        print("\(anyInt) equal 5 or 10")
    default:
        print("\(anyInt) is not equal 5 or 10")
}


//range switch in example

let randAge = Int.random(in: 1...100)

switch randAge
{
    case 0..<14:
        print("you are junior man")
    case 14...18:
        print("you got a passport!")
    case 19...25:
        print("you have a new work!")
    case 25..<50:
        print("you have a children")
    case 50...100:
        print("you are very old man")
    default:
        print("oO you are unusual man!")
}

//switch binding case value in example

let myPositionOnTheMap = (10,90)

switch myPositionOnTheMap {
case (0, let axis), (let axis, 90):
    print("I have right position and stay at home by \(axis)")
default:
    print("Currently i am not at home")
}
