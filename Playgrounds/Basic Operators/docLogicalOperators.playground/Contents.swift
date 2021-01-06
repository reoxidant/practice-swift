import UIKit

//Topic - Logical Operators

//in example how to use operator !bool change state from false to true

let allowEntryToTheHome = false

if !allowEntryToTheHome {
    print("ACCESS DENIED")
}

//Sub topic - Logical NOT Operator

//logic operator (> and <) can't comparison to eath other

//if true > true {
//    print(123)
//}

//Sub topic - Logical AND Operator

//in example use operator && as true and true = true

var hasAKeyFromDoor = true
var hasACodeFromDoor = true

if hasAKeyFromDoor && hasACodeFromDoor{
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

//Sub topic - Logical OR Operator

//in example use operator || as true or false = true

hasAKeyFromDoor = true
hasACodeFromDoor = false

if hasAKeyFromDoor || hasACodeFromDoor{
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

//Sub topic - Combining Logical Operators

//in example use combinator operator || and && compilator going from left to right operator and compare them

if hasAKeyFromDoor && hasACodeFromDoor || hasAKeyFromDoor {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

//Sub topic - Explicit Parentheses

//in example use parentheses for direct comparison in condition

hasAKeyFromDoor = false

//it's easier to explain what going first and in later

if hasAKeyFromDoor && (hasACodeFromDoor || hasAKeyFromDoor){
    print("Welcome")
} else {
    print("ACCESS DENIED")
}
