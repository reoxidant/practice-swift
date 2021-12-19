import UIKit

func findUnsortedArray(array: [Int]) -> Int
{
    let n = array.count - 1
    
    var maxNum = array[0]
    var minNum = array[n]
    
    var start = 1
    var end = 0
    
    for (index, curVal) in array.enumerated() {
        maxNum = max(curVal, maxNum)
        
        if curVal < maxNum
        {
            end = index
        }
    }
    
    for (index, _) in array.enumerated() {
        
        let lastIndex = n - index
        
        minNum = min(array[lastIndex], minNum)
        
        if array[lastIndex] > minNum
        {
            start = lastIndex
        }
    }
    
    return end - start + 1
}

findUnsortedArray(array: [1,4,2,3,2,6])
findUnsortedArray(array: [2,5,33,11,62,12,92,1,102])
findUnsortedArray(array: [2,5,33,11,62])
findUnsortedArray(array: [1,1])
