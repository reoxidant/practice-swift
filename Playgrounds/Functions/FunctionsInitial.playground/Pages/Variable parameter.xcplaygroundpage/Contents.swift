//: [Previous](@previous)

import Foundation

//: ### Variable parameters

print(7, 4, 874, 784, 478, 443, 233)

// Function that calculates arithmetic average

func arithmeticMean(_ numbers: Double...) -> Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}

var sum = arithmeticMean(7, 4, 874, 784, 478, 443, 23)

print(sum)

//: [Next](@next)
