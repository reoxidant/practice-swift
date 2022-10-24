import UIKit

//Topic - Tuples

//in example how to create Tuples

let http404error = (404, "The page is not allow")

print(http404error)

//http404error has a type (Int, String) and have a value (404, "The page is not allow")

//u can to decompose data on any variables

let (status, httpContent) = http404error

print("Status: \(status), HttpContent: \(httpContent)")

//u can to ignore some data just point _ instead of variable

let (httpStatus, _) = http404error

print("status: \(httpStatus)")

//also u can to use key for access with data tuples

print("http status: \(http404error.0)")
print("http message: \(http404error.1)")

//u can to get a name key for value of Tuples

let status200http = (status:200, message: "The page is access to load")

print("Create a new tuples status200http: \(status200http)")

//to get by name tuples value

print("Tuples status200http has status: \(status200http.status) and messsage: \(status200http.message)")

// MARK: - Practice

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
