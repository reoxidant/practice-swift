import UIKit

//Topic Trailing Closures

//Try to convert number value to letter and collects in one string value

let letterDictionary =
    [
        1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six",
        7:"Seven", 8:"Eight", 9:"Nine"
]

let numbers = [44, 33, 22]

let stringNumbers = numbers.map { (number) -> String in
    var number = number
    
    var output = ""
    
    repeat{
        output = letterDictionary[number % 10]! + output
        number /= 10
    } while number > 0
    
    
    return output
}

print(stringNumbers)

//in example use more than one closures

//func loadPicture(from server:Server, complete:(Picture) -> Void, failure: () -> Void)
//{
//    if let picture = download("picture.png", Server)
//    {
//        complete(picture)
//    }
//    else
//    {
//        failure()
//    }
//}


//in example from server get picture and install it to a view of app, using closure if u get failure loading

//func loadPictureFromTheServer(from: String)
//{
//    picture in view.currentPicture = picture
//} onFailure: {
//    print("Couldn't to load picture from the server.")
//}
