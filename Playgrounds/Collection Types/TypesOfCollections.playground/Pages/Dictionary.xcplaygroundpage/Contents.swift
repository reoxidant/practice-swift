//: [Previous](@previous)

import Foundation

// Full dictionary entry form

var carsWashQueue = Dictionary<String, String>()
var carsWashQueue1 = Dictionary<String, Int>()

// Abbreviated dictionary entry form

var carsWashQueue2 = [String: String]()
var carsWashQueue3 = [String: Int]()

// Data dictionary initialization

carsWashQueue = [
    "Y73NJB": "BMW X6",
    "GHGHh778": "Lada Vesta"
]

// Change key value

carsWashQueue["GHGHh778"] = "Jeep GC"
carsWashQueue

// Convenient to calculate how many Ivans in a group

var namesQuantity = [String: Int]()

namesQuantity["Иван"] = 4
namesQuantity

// Changing the value with preservation the old value

let oldValue = carsWashQueue.updateValue("Gray BMW X6", forKey: "GHGHh778")

// Adding a new key-value pair

carsWashQueue["TUHBJKN"] = "Lada niva"
carsWashQueue

// Delete key value with save value

carsWashQueue["GHGHh778"] = nil
carsWashQueue

carsWashQueue.removeValue(forKey: "TUHBJKN")

//: [Next](@next)
