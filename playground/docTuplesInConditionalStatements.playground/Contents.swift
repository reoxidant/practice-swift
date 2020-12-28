import UIKit

//Topic - Tuples in Conditional Statements

//in example we define the point on the asix y and x using tuples

let tuplesValue = (1, 0)

func defineAxisBy(tuplesPoint: (Int, Int))
{
    switch tuplesPoint{
    case (0,0):
        print("\(tuplesPoint) is at the origin")
    case (_,0):
        print("\(tuplesPoint) is on the Y axis")
    case (0,_):
        print("\(tuplesPoint) is on the X axis")
    case (-2...2, -2...2):
        print("\(tuplesPoint) is inside the box")
    default:
        print("\(tuplesPoint) is outside the box")
    }
}

defineAxisBy(tuplesPoint: tuplesValue)

//we have a square -2 to 2 point by X and Y axis and define where point it is

let tuplesSecondValue = (0, 2)

func defineSecondAxisBy(tuplesPoint: (Int, Int))
{
    switch tuplesPoint{
    case (0, 0):
        print("\(tuplesPoint) it is point origin position 0,0")
    case (0, _):
        print("\(tuplesPoint) the point x axis")
    case (_, 0):
        print("\(tuplesPoint) the point y axis")
    case (_, _):
        print("You missing out the square bounds")
    }
}

defineSecondAxisBy(tuplesPoint: tuplesSecondValue)
