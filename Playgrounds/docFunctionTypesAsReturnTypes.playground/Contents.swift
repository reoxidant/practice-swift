import UIKit

//1h was spent on time

//return functional type from the funcyion resultOperation

func multiplyNums(n1:Int, n2:Int) -> Int
{
    return n1 * n2
}

func multiplyOperation() -> (Int, Int) -> Int
{
    return multiplyNums
}

var currentValue = 2
var countCyrcles = 0
var valueNeedToReach = 28

let resultOperation = multiplyOperation()

while currentValue < valueNeedToReach
{
    currentValue = resultOperation(currentValue, 2)
    countCyrcles += 1
}

print("currentValue - \(currentValue) countCyrcles - \(countCyrcles) ")
