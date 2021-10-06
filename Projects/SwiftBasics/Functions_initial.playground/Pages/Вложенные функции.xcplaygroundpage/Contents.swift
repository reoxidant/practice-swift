//: [Previous](@previous)

import Foundation


// 1ч 39 мин
//: ### Вложенные функции
// задача описать функцию которая из положительного или отрицательного значение будет шагом двигаться к 0, пока не будет равно 0

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

// другой вариант, пример возврата необходимой функции по условию и ее выполнение в цикле

print("следующая функция")

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
