import UIKit

//Topic - Binding Values in Conditional Statements

let enterPoints = (1,-2)

switch enterPoints{
case (let x, 0):
    print("Axis enter points closes at x:\(x) asix")
case (0, let y):
    print("Axis enter points closes at y:\(y) asix")
case let (x, y):
    print("Enter points placed on x:\(x) and y:\(y) asix")
}

//without default case because x and y has ending meaning
