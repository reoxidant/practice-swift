import Foundation

//: ## Concept и principles of OOP
//: ### Encapsulation

/// The class contains information about the post
class Post {
    /// Title
    var title: String
    
    /// Text
    var body: String
    
    /// Author
    var author: String
    
    /// Calculated property, returns number of comments
    var description: Int {
        get {
            numberOfComments
        }
    }
    
    /// The number of comments
    var numberOfComments = 0
    
    init(title: String, body: String, author: String) {
        self.title = title
        self.body = body
        self.author = author
    }
    
    /// Method adds comments
    func addComment() {
        numberOfComments += 1
        print("Comment №\(numberOfComments) added")
    }
}

let firstPost = Post(
    title: "This is my first post",
    body: "Hello!",
    author: "Igor"
)

firstPost.addComment()
firstPost.addComment()

// Try to change the number of comments directly, so you can not
firstPost.numberOfComments = 63
firstPost.description

print("The number of comments for the post \(firstPost.title) is \(firstPost.description)")

//: ### Inheritance

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Moving at speeds \(currentSpeed) miles per hour."
    }
    func makeNoise() {
        // do nothing as not every transport is noisy
    }
}


let someVehicle = Vehicle()
someVehicle.currentSpeed = 75

print("Transport: \(someVehicle.description)")

// Transport: Moving at 0.0 mph

//: ### Subclass inheritance
/*:
    class SomeSubclass: SomeSuperclass {
        // subclass is defined here
    }
 */


class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// Bicycle: Moving at 15.0 mph

//: ### The polymorphism

class Train: Vehicle {
    override func makeNoise() {
        print("Choo-Choo")
    }
}

let train = Train()
train.makeNoise()
// Print "Choo-Choo"


final class Car: Vehicle {
    var gear = 1
    final override var description: String {
        return super.description + " on the transfer \(gear)"
    }
    
    override func makeNoise() {
        print("Vroom-vroom")
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
car.makeNoise()
print("Car: \(car.description)")

// It says, "Car: moving at 25.0 miles per hour in gear 3."

func printVehicleDescription(_ vehicle: Vehicle) {
    print("Vehicle: \(vehicle.description)")
}

printVehicleDescription(car)
printVehicleDescription(bicycle)

//: ### Protocols

protocol TransportVehicle {
    /// Can it only carry small cargo?
    var onlySmallCargo: Bool { get }
    /// Calculates the cost per weight per distance
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double
}

class MiniVan: TransportVehicle {
    let onlySmallCargo: Bool = true
    private let priceMultiplier = 0.3
    
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double {
        return weight * transportationDistance * priceMultiplier
    }
}

class Plane: TransportVehicle {
    let onlySmallCargo: Bool = false
    private let priceMultiplier = 0.1
    
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double {
        return weight * transportationDistance * priceMultiplier
    }
}

/// The warehouse
class Warehouse {
    /// Weight of goods in kg
    private let productsWeight = 2532.0
    /// Distance to another warehouse
    private let distanceToNextWarehouse = 3748.0
    
    /// Transport price withdrawal
    func printPriceForTransportation(using vehicle: TransportVehicle) {
        let price = vehicle.calculatePrice(
            forWeight: productsWeight,
            transportationDistance: distanceToNextWarehouse
        )
        print("The shipping price will be: \(Int(price))")
    }
}

let warehouse1 = Warehouse()

let plane = Plane()
let minivan = MiniVan()

warehouse1.printPriceForTransportation(using: plane)
warehouse1.printPriceForTransportation(using: minivan)
