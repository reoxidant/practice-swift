import UIKit

//Topic - Where in Conditional Statements

//in example have a green and orange line

let somePoint = (5,-5)

switch somePoint {
case let(x, y) where -x == -y:
    print("point x:\(x) and y:\(y) placing on green lower left square")
case let(x, y) where x == -y:
    print("point x:\(x) and y:\(y) placing on orange lower right square")
case let(x, y) where -x == y:
    print("point x:\(x) and y:\(y) placing on orange upper left square")
case let(x, y) where x == y:
    print("point x:\(x) and y:\(y) placing on green upper left square")
case let(x, y):
    print("point x:\(x) and y:\(y) placing on missing line")
}
