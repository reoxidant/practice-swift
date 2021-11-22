import UIKit

//Topic Classes Are Reference Types

//init Class Car and describe

class Car{
    var color = "while"
    var wheels = 4
    var speed = 100
    var brand = "audi"
}

//it's constant but you can change a props for the class Car and because it's reference

let car1 = Car()

print("instance Car1 has a color: \(car1.color), wheels: \(car1.wheels), speed: \(car1.speed), brand: \(car1.brand)")

//Create a new variable which have a reference on class Car

let car2 = car1

car2.color = "red"
car2.speed = 250
car2.brand = "Mercedes"

print("instance Car2 has a color: \(car2.color), wheels: \(car2.wheels), speed: \(car2.speed), brand: \(car2.brand)")

//Now car1 has the same parameters as car2 because

print("Now Car1 has the same props: \(car1.color), wheels: \(car1.wheels), speed: \(car1.speed), brand: \(car1.brand)")

//subtopic Identity Operators

class SecondCar{
    var color = "while"
    var wheels = 4
    var speed = 100
    var brand = "audi"
}

let car3 = SecondCar()

let car4 = car3

//using identity operator === for comparing instance of two variables

if car3 === car4 {
    print("Car1 has the same instance of which had car2")
}

//comparing contain variable car1 and car 2 use operator == is not a good idea and u will getting error

//if car3 == car4 {
//    print("Operator equal")
//}

//using identity operator == for comparing ony value of instace constains

if car3.brand == car4.brand
{
    print("Tha car1 has the same brand to car2 and may be them instance is ")
}
