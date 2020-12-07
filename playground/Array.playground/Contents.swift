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

var array = Array<Int>()
var array2 = [Int]()

//Creating default array

var array3 = Array(repeating: 0, count: 5)

//Adding value into array

array.append(23)

//combine two arrays

array2 = array + array3

//show count

print("array2 containts \(array2) values and have a \(array2.count) elements")

//Init array empty

var array = Array<Int>()
var array2 = [Int]()


//Creating default array

let array3 = Array(repeating: 0, count: 5)


//init array with literal value

var studentNames:[String] = ["Sasha", "Masha", "Peter", "Nadya"]

//Adding value into array

array.append(23)

//combine two arrays

array2 = array + array3

//show count items if arrays is not empty

if !array2.isEmpty && !studentNames.isEmpty
{
    print("array2 containts \(array2) values and have a \(array2.count) items")

    print("Names of students containts \(studentNames) and count students is \(studentNames.count) in a class")
}
