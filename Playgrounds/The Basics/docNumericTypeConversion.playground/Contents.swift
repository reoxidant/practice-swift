import UIKit

//Topic - Numeric Type Conversion

//Subtopic - Integer Conversion

//in example use Int8 with range -128-128 and UInt8 0-255 as defined values and not another

//let cannotBeAcceptValue: UInt8 = -1 // cannot be a negative

//let cannotBeMoreThatMax: Int8 = Int8.max + 1 // cannot be more that max

//in example transform number value in one type to two types

let oneThousand: UInt16 = 1_000
let one: UInt8 = 1

let oneThousandAndOne = oneThousand + UInt16(one)

print("Result is \(oneThousandAndOne)")

//Subtopic - Integer and Floating-Point Conversion

//in example try to transform integer number to double number

let three = 3
let twentyEight = 28.0
let doubleResult = Double(three) + twentyEight

print("Result is \(doubleResult) transform \(three) to Double type")

let intResult = Int(twentyEight)

print("Result is \(intResult) transform \(twentyEight) to Int type")

//in other example define literal values for example the numbers has not a type in this case and type will be initialized later

let value = 2 + 0.12

print("result sum of let var is \(value) and it's has a Double type")
