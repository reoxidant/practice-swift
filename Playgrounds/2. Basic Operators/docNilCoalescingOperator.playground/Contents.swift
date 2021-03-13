import UIKit

//Topic Nil-Coalescing Operator

//in example how working nil operator by ?? action

let a:String? = "a value"
let b = "b value"

let c = a ?? b

print("c value now equal: (c)")

//it's code have a meaning in less record

let d = a != nil ? a! : b

print("d value now equal: (d)")

//in next example u may to choose between two variables

let nameForMyChild:String? = nil

let defaultNameForChild = "Zahar"

let childName = nameForMyChild ?? defaultNameForChild

print("Child has a name: \(childName)")

//in otherwise u can install a new variable

let nameForMySecondChild:String? = "Vanya"

let defaultNameForSecondChild = "Inokentiy"

let childSecondName = nameForMyChild ?? defaultNameForSecondChild

print("Child has a name: \(childSecondName)")
