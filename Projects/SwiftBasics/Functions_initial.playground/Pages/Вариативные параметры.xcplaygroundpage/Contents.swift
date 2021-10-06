//: [Previous](@previous)

import Foundation

//: ### Вариативные параметры

// 1ч 26 мин

print(7, 4, 874, 784, 478, 443, 233)

// функция которая расчитывает среднее арифметическое

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
