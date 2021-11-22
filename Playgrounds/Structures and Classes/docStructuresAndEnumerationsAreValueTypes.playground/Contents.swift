import UIKit

//Topic - Structures and Enumerations Are Value Types

struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 50, height: 100)
var cinema = hd

//here is copying struct Resolution to hd and cinema
print("Resolution video in the cinema is: \(hd) and \(cinema)")

//in example how create copy of struct

struct Human{
    var name = ""
    var age = 18
}

var mary = Human(name:"Masha", age:27)

var vitaliy = mary

print("In the world have a two mans: \(mary) and \(vitaliy)")

vitaliy.name = "Vitaliy"
vitaliy.age = 26

print("Change props of vitaliy: \(vitaliy)")

print("Changes is not a touches class \(mary)")

//in exaple the same behavior on working memory in enum operator

enum Colors
{
    case black, white, red
    mutating func whiteColor()
    {
        self = .white
    }
}

var currentColor = Colors.red

print("The currentColor is \(currentColor)")

var secondColor = currentColor

currentColor.whiteColor()

print("Change red color to \(currentColor) in currentColor enum")

print("But secondColor not have any changes and has color \(secondColor)")
