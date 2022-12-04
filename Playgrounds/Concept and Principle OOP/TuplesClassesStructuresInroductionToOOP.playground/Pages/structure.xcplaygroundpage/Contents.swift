//: [Previous](@previous)

//: ## Structures

/*
 struct StructureName {

 var nameOfVarioable: DataType

 func someFunction {
 some code
 }
 }
 */

// Typically, structures are used to store values

// Value type - copied when assigned, example below

struct PositionOnMap {

    var name: String
    var x: Int
    var y: Int
    
    // initialization is generated independently
}

var point = PositionOnMap(name: "p1", x: 0, y: 0)

var point2 = point
point2.name = "dhkjgfghsdgfx"

print(point.name)
print(point2.name)

// Filling type - copy the link at assignment, example below

class Phone {

    let model: String
    var price: Double
    
    init(model: String, price: Double) {
        self.model = model
        self.price = price
    }
}

let phone = Phone(model: "Iphone", price: 34476.98)
let phone2 = phone

phone2.price = 999999

print(phone.price)
print(phone2.price)

//: ### Comparison of classes and structures
//: ### Methods in the structure
