import Foundation

//Memory management in iOS.
//The ARC is weak, strong, belonging to no one. Strong reference cycle.

class DecimalNumber {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    deinit {
        print("Object with value \(value) removed")
    }
}

var firstNum = DecimalNumber(value: 10) // number of references firstNum 1
var secondNum = DecimalNumber(value: 5) // number of references secondNum 1

var num3 = secondNum // number of references secondNum 2
var num4 = secondNum // number of references secondNum 3

// number of references firstNum 0, number of references secondNum 4
firstNum = num4

// ARC

class Person {
    
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

var reference1: Person? = nil
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// ARC delete object

print("next")

// Strong link cycle

/// Apartment
class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("\(unit) is initialized")
    }
    
    deinit {
        print("Apartment \(unit) is exempt")
    }
}

// How to get aroung a chain of strong links

// Create an apartment and renter

var john: Person? = Person(name: "Mary Sokolova") // number of references john 1

var unit4A: Apartment? = Apartment(unit: "313") // number of references unit4A 1

// Let's get the tenant in the flat

john?.apartment = unit4A // number of references unit4A 2
unit4A?.tenant = john // weak = number of references john 1

// The number of links john 0 and immediately unit4A decreased to 1 as the object john and the link inside was removed, but still there is Apartment(unit: "313") the most initial link

john = nil
unit4A = nil // number of references unit4A 0, here has left

// Strong link cycles in closures

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

var heading: HTMLElement? = HTMLElement(name: "h1", text: "some default text")
print(heading!.asHTML())
heading = nil
