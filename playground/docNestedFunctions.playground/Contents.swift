import UIKit

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
