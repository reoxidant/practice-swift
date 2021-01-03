import UIKit

// Topic - Optionals

//variable have a value it's may be string or int type, but if u convert it use Int() function, it's return optional value
let convertStringNumber = "abc" //string "abc" return nil, but string "123" convert it success
let convertedCount = Int(convertStringNumber)

//optional variable
var serverResponseCode:Int? = 404
//u may to inizialise optional variable as nil
serverResponseCode = nil

//by default value optional variable is nil
var answer:String?

if convertedCount != nil {
    print("convertStringNumber is not nil and have some a string value")
}

//! if has not a value call a runtime error
if convertedCount != nil{
    print("I exactly sure that convertStringNumber has a value: \(convertedCount!)")
}

//bind optionals

//note: use let or var and u don't need to unwrap value with ! operand

if let integerValue = Int(convertStringNumber){
    print("The convertStringNumber success convert to integer number and has a \(integerValue) value")
}else{
    print("The convertStringNumber can not to convert into integer value")
}

//use mulitple bind optionals

//note: if one condition of value will be a false type conditional has not a able to go forward

if let firstNumber = Int("10"), let secondNumber = Int("5"), firstNumber > secondNumber && secondNumber > 1 {
    print("\(firstNumber) > \(secondNumber) and \(secondNumber) > 1")
}


//use multiple input conditions

if let firstNumber = Int("20") {
    if let secondNumber = Int("10"){
        if firstNumber > secondNumber && secondNumber > 1{
            print("firstNumber: \(firstNumber) > secondNumber: \(secondNumber) and secondNumber \(secondNumber) < 1")
        }
    }
}

//example using implicity upwrap optional

let hasPossibleString: String? = "it's a optional value"
let forcedToString:String = hasPossibleString! //unwrap possible string

//use always ! after value, because u need to use ! anytime where u will be umwrap value, if you has not a value u will be get a runtime error
let assumedString:String! = "An implicity unwrapped optional string!"
let implicitString:String = assumedString

//u can use condition for a implicity optional

if let definiteString = assumedString{
    print(definiteString)
}

//don't use implicit optional if u will be know that it value has be nil value, just check value it's a main rule


