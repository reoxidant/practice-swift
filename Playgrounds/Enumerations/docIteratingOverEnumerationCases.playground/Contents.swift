import UIKit

//Topic - Iterating over Enumeration Cases

//in example using CaseIterable u will be can allow have a access in iteration for all cases

enum Colors: CaseIterable
{
    case red, yellow, blue, white, black
}

let countColors = Colors.allCases.count

print("Count of colors in enumeration is: \(countColors)")

//iteration for in Colors

print("Main colors cases in enumeration:")

var i = 0

for color in Colors.allCases
{
    i += 1
    print("\(i): \(color)")
}
