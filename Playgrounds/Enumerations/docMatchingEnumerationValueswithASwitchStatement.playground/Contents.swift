import UIKit

//Topic - Matching Enumeration Values with a Switch Statement

//in example enums working with switch

enum Human
{
    case hands, legs, body, head
}

let someBody = Human.hands

switch someBody
{
case .hands:
    print("It is a hands")
case .legs:
    print("It is a legs")
case .body:
    print("It is a body")
case .head:
    print("It is a head")
}

//in example using operator switch in default value

let touchHuman = Human.body

switch touchHuman
{
case .body:
    print("It is body of human which holding a head or hands")
case .head:
    print("It is head of human which can be think")
    
default:
    print("U can't touch to part of Human")
}
