import UIKit

func removeDuplicates(inputArr:inout [Int]) -> [Int]{
    
    if !inputArr.isEmpty {
        var lastNum:Int?
        var index = 0
        
        while index != inputArr.count {
            if lastNum == inputArr[index]{
                inputArr.remove(at: index)
            }else{
                lastNum = inputArr[index]
                index += 1
            }
        }
    }
    return inputArr
}

var myTestArray = [2,1,2,2,5,6,6,8,2,3,4,5,5]

var arrayWithoutDubles = removeDuplicates(inputArr:&myTestArray)
