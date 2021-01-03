import UIKit

var arrayOne = Array<Int>()
var arrayTwo:[Int] = []
var arrayThree = [Int]()
var arrayFour = [1,2,3,4]
var arrayFive = [Int](repeating: 8, count: 9)

arrayFive.reverse()

arrayThree.insert(92, at:0)

arrayOne = arrayFive + arrayThree + arrayFour

arrayTwo += arrayOne

arrayOne[3...4] = [45,71]
arrayOne

let removeElement = arrayOne.remove(at: 7)

arrayOne.removeLast()
arrayOne

arrayOne[6]

arrayOne.count-2

arrayOne.append(contentsOf: arrayTwo)

arrayOne.reverse()

//from 07.12.2020 reading assignment of array

//Init array empty

var arrIntOne = Array<Int>()
var arrIntTwo = [Int]()


//Creating default array

var arrayIntThree = Array(repeating: 0, count: 5)

//Adding value into array

arrIntOne.append(0)

//and clear that value

arrIntOne = []

//combine two arrays

arrIntTwo = arrIntOne + arrayIntThree

//show count

print("array2 containts \(arrIntTwo) values and have a \(arrIntTwo.count) elements")


//init array with literal value

var studentNames:[String] = ["Sasha", "Masha", "Peter", "Nadya"]

//show count items if arrays is not empty

if !arrIntTwo.isEmpty && !studentNames.isEmpty
{
    print("array2 containts \(arrIntTwo) values and have a \(arrIntTwo.count) items")

    print("Names of students containts \(studentNames) and count students is \(studentNames.count) in a class")
}

// i can to add item as last item of array

studentNames.append("Vitaliy")

print("studentNames constrain: \(studentNames)")

//and u can to change array size and adding value by key or array

studentNames[0] = "Ura"
studentNames += ["Nastya"]

let randNumber = Int.random(in:0..<studentNames.count)

print("random student names from list is \(studentNames[randNumber])")


let randNumberOne = Int.random(in:0..<studentNames.count)
let randNumberTwo = Int.random(in:0..<studentNames.count)

if(randNumberOne < randNumberTwo){
    print("get 2 students and more with range array is \(studentNames[randNumberOne...randNumberTwo])")
}

//u can to insert item what u want at any index

var customName:String = "John"
var customIndex:Int = 4
studentNames.insert(customName, at: customIndex)
print("Now \(customName) put in \(studentNames) array by index \(customIndex)")

// insert to array by range 

var intRangeOne = 0
var intRangeTwo = 4

studentNames[intRangeOne...intRangeTwo] = ["Vasya", "Dima"]

print("Now array is \(studentNames)")
      
// remove elements from array for example i wanna delete item from 2 index

let removeItemFromArray = studentNames.remove(at:2)
print("deleting item from studentNames is \(removeItemFromArray)")


//remove only last item and return it
let lastItemName = studentNames.removeLast()
print("remove last name of studentName is \(lastItemName)")

// create iteration for all array studentNames

for name in studentNames{
    print("student name is \(name)")
}

//cortage witch out of elements as index and value of array

for (index, name) in studentNames.enumerated(){
    print("student number is: \(index + 1) has a name \(name)")
}
