import UIKit

//Study sub topic "Function Types"

//functional type in example

func addingTwoNumbers(n1:Int,n2:Int) -> Int
{
    return n1 + n2
}

func multiplyTwoNumbers(n1:Int, n2:Int) -> Int
{
    return n1 * n2
}

print(addingTwoNumbers(n1: 2, n2: 10))

print(multiplyTwoNumbers(n1:10, n2:23))

//using functional types as return value for another variable in example

func devideTwoNumber(n1:Int, n2:Int) -> Int
{
    if n1 > n2
    {
        return n1 / n1
    }
    
    print("First number \(n1) can't will be devided on second \(n2)")
    return 0
}

var mathOperation: (Int,Int) -> Int = addingTwoNumbers

print("adding op = (mathOperation(10, 23))")

var secondMathOperation: (Int, Int) -> Int = multiplyTwoNumbers

print("multiply op = (secondMathOperation(30,22))")

var anotherMathOperaion = devideTwoNumber

print("devide op = (anotherMathOperaion(50,20))")

//use function arguments, where u can define function types and variables types

func performAnyMathOperation(_ mathOperation: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Int
{
    return mathOperation(a,b)
}

print(performAnyMathOperation(addingTwoNumbers, 20, 5))
print(performAnyMathOperation(multiplyTwoNumbers, 7543, 255))
