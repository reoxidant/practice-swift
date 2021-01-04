import UIKit

//Topic - Functions with Multiple Return Values

//in example define max and min value for int array and return optional value tuples(max and min value) so we can to call tuple by the name as var.max or var.min

func maxMin(numarr:[Int]) -> (max:Int, min:Int)
{
    var currentMax = numarr[0]
    var currentMin = numarr[1]
    
    for num in numarr[0..<numarr.count]
    {
        if currentMax < num
        {
            currentMax = num
        }
        else if num < currentMin
        {
            currentMin = num
        }
    }
    
    return (currentMax, currentMin)
}

let res = maxMin(numarr:[1,2,3,4,5,6,10,43,2,4,5,1,9])
print("The max value of array is \(res.max) and minimum value is \(res.min)")
