import UIKit

//Topic - Enumeration Syntax

//in example cases of hour

//many cases

enum Hour
{
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
}

//case in one line

enum Human
{
    case hands, legs, body, head
}

//initialization enum any variables

var partBody = Human.hands

print(partBody)

partBody = .legs

print(partBody)
