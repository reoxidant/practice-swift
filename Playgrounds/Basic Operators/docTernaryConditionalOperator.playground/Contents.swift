import UIKit

//Topic - Ternary Conditional Operator

//in example how it would if we used if conditional statement

let weightBox = 100
var needCarForTransfer = false

if weightBox >= 60{
   needCarForTransfer = true
} else {
   needCarForTransfer = false
}

//in example use ternary operator

needCarForTransfer = weightBox >= 60 ? false : true

//anothe example

//need to put in on wheels on the truck

var truckWheels = 0
let veryBigWeight = true

if veryBigWeight {
    truckWheels = 6
} else {
    truckWheels = 4
}

//use ternary operator

truckWheels = veryBigWeight ? 6 : 4
