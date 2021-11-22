import UIKit

//Topic - Optional Tuple Return Types 12

//in example define max and min value for int array and return optional value tuples so we can to return nil value from the function

func minMax(array:[Int]) -> (min:Int, max:Int)?
{
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }
        else if value > currentMax
        {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let arr:[Int] = [0,21,3432,4445,394,512]

print(minMax(array:arr)!)

/*if let bounds = minMax(array:[4,-2,43,55,22,1,4,5]){
    print("min value is \(arr.min) and max value \(arr.max)")
}*/
