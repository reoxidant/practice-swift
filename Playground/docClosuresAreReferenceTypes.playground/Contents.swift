import UIKit

//Topic - Closures Are Reference Types

//in example do function

func incrementValue(amount:Int) -> () -> Int
{
    var returnValue = 0
    func totalIncrement() -> Int
    {
        returnValue += amount
        return returnValue
    }
    return totalIncrement
}

let firstCountingValue = incrementValue(amount: 10)
let secondCoutingValue = firstCountingValue

print(firstCountingValue()) //10
print(secondCoutingValue()) //20
print(firstCountingValue()) //30
print(secondCoutingValue()) //40
