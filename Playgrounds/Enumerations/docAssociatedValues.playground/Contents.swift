import UIKit

//Topic - Associated Values

//in example init enum and associated values in here

enum Being{
    case human(String, Int, String)
    case animal(String, Int, String)
}

var currentBeing = Being.human("Masha", 27, "Female")
currentBeing = .animal("Pig", 3, "Male")

//in exaple use operator switch for define enum with accosiate values and extract value for do some operation in body of case

switch currentBeing
{
case .human(let name, let age, let sex):
    print("It's a Human with name: \(name), age: \(age) years, sex: \(sex)")
case let .animal(name, age, sex):
    print("It's a Animal with name: \(name), age:\(age) years, sex:\(sex)")
}
