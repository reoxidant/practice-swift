import UIKit

func reverseChars(arrchars:[Character]) -> Array<Character>
{
    var changedArray = arrchars
    var firstIndex = 0
    var lastIndex = arrchars.count - 1
    
    while(firstIndex < lastIndex)
    {
        let temp = arrchars[lastIndex]
        changedArray[lastIndex] = changedArray[firstIndex]
        changedArray[firstIndex] = temp
        
        
        firstIndex += 1
        lastIndex -= 1
    }
    
    return changedArray
}

let reverseArr:[Character] = ["a", "b", " ", "c", "d", "o", " ", " "]

reverseChars(arrchars:reverseArr)
