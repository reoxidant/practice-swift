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
