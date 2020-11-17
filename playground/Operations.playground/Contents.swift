import UIKit

//basics operators

var a = 1
let bl = "hello"
var b = 0

var plus = 5 + 5
var minus = 5 - 1
var del = 5/5
var multiple = 5*10

var plusOne = 1
plusOne += 1
var minusOne = 2
minusOne -= 1
var deleteOne = 3
deleteOne /= 1
var multiOne = 4
multiOne *= 1

var operationWithLastPart: Int = 155 % 3

if a > b{
   if a == b{
       if a < b{
           if a >= b{
              if a <= b{
                    print("Wow are you here!")
                }
            }
        }
    }
}

var defaultName = "Masha"
var emptyString = ""
var voidString: String? = nil

var myName: String = voidString ?? defaultName

var myAge = 25

var areYouOld = (myAge > 50) ? "Yes": "No"

var number1 = 1 + 2
var number2 = 5 + 5

if number1 > 0 && number2 > 0 && number1 < 5 && number2 < 5{
    print("number1 && number2 more than 0 and lower that 5")
}

if (number1 % 2) == 0 || (number2 % 2) == 0{
    print("number1 or number2 can delete on 2")
}

var bool1 = true
var bool2 = !bool1

if(bool1 != bool2){
    print("bool1 is not equal bool2")
}

//1...10 //Closure range
//1..<10 //Open range
