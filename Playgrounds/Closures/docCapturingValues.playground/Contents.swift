import UIKit

//Topic - Capturing Values

func captureValue(amount:Int) -> () -> Int
{
    var  returnVal = 0
    
    func increaseVal() -> Int
    {
        returnVal += amount
        return returnVal
    }
    
    return increaseVal
}

var vals = captureValue(amount:20)

print(vals())

//in example increse on 50 each time u call a function

func increseValTo(amount:Int) -> () -> Int
{
    var returnNewValue = 0
    func increateAction() -> Int
    {
        returnNewValue += amount
        return returnNewValue
    }
    
    return increateAction
}

var sum50ToVal = increseValTo(amount:50)

//the closure can be store a compute value

print(sum50ToVal()) //50
print(sum50ToVal()) //100
print(sum50ToVal()) //150

var sum7ToVal = increseValTo(amount:7)

print(sum7ToVal()) //7
print(sum7ToVal()) //14
print(sum7ToVal()) //21
