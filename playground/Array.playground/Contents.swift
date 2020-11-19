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
