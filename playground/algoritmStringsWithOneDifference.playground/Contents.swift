import UIKit

func theStringsSame(firstStr:String, secondStr:String) -> Bool
{
    if (secondStr.count - firstStr.count) >= 2 || (firstStr.count - secondStr.count) >= 2
    {
        return false
    }
    else if secondStr.count == firstStr.count
    {
        return comparingEqualCountString(firstStr:firstStr, secondStr:secondStr)
    }
    else if secondStr.count != firstStr.count
    {
        return comparingNotEqualCountString(firstStr:firstStr, secondStr:secondStr)
    }
    
    return true
}

func comparingEqualCountString(firstStr:String, secondStr:String) -> Bool
{
    var diffrentCount = 0
    for index in 0..<firstStr.count
    {
        let indexFirstStr = firstStr.index(firstStr.startIndex, offsetBy: index)
        let indexSecondStr = secondStr.index(secondStr.startIndex, offsetBy: index)
        
        if firstStr[indexFirstStr] != secondStr[indexSecondStr]
        {
            if diffrentCount < 1
            {
                diffrentCount += 1
            }
            else
            {
                return false
            }
        }
    }
    
    return true
}

func comparingNotEqualCountString(firstStr:String, secondStr:String) -> Bool
{
    var index = 0
    var diffrentCount = 0
    var countElems = 0
    
    if firstStr.count < secondStr.count
    {
        countElems = firstStr.count
    }
    else
    {
        countElems = secondStr.count
    }
    
    while index < countElems
    {
        let indexFirstStr = firstStr.index(firstStr.startIndex, offsetBy: (firstStr.count < secondStr.count) ? index : index + diffrentCount)
        let indexSecondStr = secondStr.index(secondStr.startIndex, offsetBy: (firstStr.count < secondStr.count) ? index + diffrentCount : index)
        
        if firstStr[indexFirstStr] != secondStr[indexSecondStr]
        {
            if diffrentCount < 1
            {
                diffrentCount += 1
            }
            else
            {
                return false
            }
        }
        else
        {
            index += 1
        }
    }
    
    return true
}
