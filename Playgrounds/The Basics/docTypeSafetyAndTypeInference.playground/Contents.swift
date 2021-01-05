import UIKit

//Topic - Type Safety and Type Inference

//in example assign the literals

let years = 100 //Type Automatic assign as Int because swift suppose that
let pi = 3.14159 //Type Automatic assign as Double because swift suppose that

//let result = pi * years //here is will be a error, because types was defined and not be computed

let resultOperate = 100 * 3.14159 //Type Automatic assign as Double because swift suppose that by summing two numbers

print("resultOperate - \(resultOperate)")
