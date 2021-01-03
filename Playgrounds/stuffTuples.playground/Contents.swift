import UIKit

//was practice 19 november some stuff in dictionary

var dict = [String:String]()
var dict2:[String:String] = [:]
var dict3 = Dictionary<String,String>()

var namesOfAge = ["Vitalik":30, "Sasha":40, "Ivan": 66]

namesOfAge.count
namesOfAge.isEmpty

namesOfAge.removeValue(forKey: "Sasha")
namesOfAge

namesOfAge.updateValue(25, forKey: "Vitalik")
namesOfAge

namesOfAge["Ivan"]
namesOfAge["Ivan"] = 45
namesOfAge

namesOfAge["Ivan"] = nil
namesOfAge

namesOfAge = [:]

namesOfAge["Alex"] = 22
namesOfAge["Kostya"] = 18

namesOfAge.removeValue(forKey: "Alex")

var numbers = [1,2,3,4]

numbers += [12]

let first = ["Apple", "Samsung"]
let twice = ["Sony", "LG"]
let third = first + twice
