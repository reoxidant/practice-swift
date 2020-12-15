import UIKit

//Topic - Nested Function

//in example define how many minutes in a hour

var minutes = 666

func howManyHoursInTheMinutes(stateNums:Bool) -> (Int) -> Int
{
    func countPositiveMinutes(input:Int) -> Int {return input / 60}
    func countNegativeMinutes(input:Int) -> Int {return 0}
    return stateNums ? countPositiveMinutes:countNegativeMinutes
}

let whileMinutesIsNotNull = howManyHoursInTheMinutes(stateNums: minutes > 0)

if minutes > 0
{
    let hours = whileMinutesIsNotNull(minutes)
    print("\(hours) HOURS...")
}

//in example move number to zero

func chooseStepNumber(condition:Bool) -> (Int) -> Int
{
    func stepForwardNumber(number:Int) -> Int {return number + 1}
    func stepBackwardNumber(number:Int) -> Int {return number - 1}
    
    return condition ? stepForwardNumber : stepBackwardNumber
}

var currentValue = 10

let moveToZero = chooseStepNumber(condition:currentValue < 0)

while currentValue != 0
{
    print("\(currentValue)...")
    currentValue = moveToZero(currentValue)
}

print("Now the number is Zero")

//in example calculate how minutes in a hour

func calcHours(condition:Bool) -> (Int) -> Int
{
    func hours(minutes:Int) -> Int {return minutes / 60}
    func hoursIsZero(minutes:Int) -> Int{return 0}
    return condition ? hours : hoursIsZero
}

var min = 666666

var hours = calcHours(condition: min >= 60)

print(hours(min))
