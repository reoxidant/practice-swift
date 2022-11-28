//: [Previous](@previous)

import Foundation

//: ### Nested functions

// The task of describing a function which of a positive or negative value is a step towards 0 until it is 0.

func stepForward(number: Int) -> Int {
    number + 1
}

func stepBackward(number: Int) -> Int {
    number - 1
}

var currentValue = -3

while currentValue != 0 {
    print(currentValue)
    if currentValue > 0 {
        currentValue = stepBackward(number: currentValue)
    } else {
        currentValue = stepForward(number: currentValue)
    }
}

print("zero")

// Another variant, an example of returning the required function by condition and running it in the loop

print("The following function")

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(number: Int) -> Int { number + 1 }
    func stepBackward(number: Int) -> Int { number - 1 }
    
    return backward ? stepBackward : stepForward
}

currentValue = 5

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print(currentValue)
    currentValue = moveNearerToZero(currentValue)
}

print("zero")

//: [Next](@next)
