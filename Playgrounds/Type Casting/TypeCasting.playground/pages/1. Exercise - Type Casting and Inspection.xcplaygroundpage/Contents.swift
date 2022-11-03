/*:
 ## Exercise - Bringing Types and Controlling Them
 
 Create a collection of type [Any], including several real numbers, integers, strings and boolean values. Print the contents of the collection.
 */

let array: [Any] = [1.2, 5.5, 1, 5, "hello", "world", true, false]

array.forEach {
    print($0)
}

/*:
 Go through all elements of the collection. For each whole, type "Integer" and its meaning. Repeat the same for real numbers, strings, and boolean values.
 */

array.forEach {
    if $0 is Int {
        print("The integer \($0)")
    } else if $0 is Double {
        print("Real number \($0)")
    } else if $0 is String {
        print("String value \($0)")
    } else if $0 is Bool {
        print("Boolean value \($0)")
    }
}

/*:
 Create a dictionary [String : Any], where all values are a mixture of real and integers, strings, and boolean values. Print key/value pairs for all collection elements.
 */

var dictionary = [String: Any]()
dictionary["hello"] = "5"
dictionary["false"] = false
dictionary["10"] = 10
dictionary["world"] = "4"
dictionary["12"] = 12
dictionary["5.4"] = 5.4
dictionary["10.4"] = 10.4
dictionary["true"] = true

/*:
 Create a total Double variable equal to 0. Review all dictionary values and add the value of each integer and real number to the value of your variable. For each row, add 1. For each boolean value, add 2, if true, or subtract 3 if false. Type value `total`.
 */

var total: Double = 0

for (_, value) in dictionary {
    if let int = value as? Int {
        total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if value is String {
        total += 1
    } else if let bool = value as? Bool {
        if bool == true {
            total += 2
        } else {
            total -= 3
        }
    }
}

print("Total is \(total)")

/*:
 Reset the total variable and go through the entire collection again, adding all integers and real numbers. For each string encountered on the path, try to convert it into a number, and add this value to the common. Ignore the boolean values. Print out the summary.
 */

total = 0

for (_, value) in dictionary {
    if let int = value as? Int {
        total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if let string = value as? String {
        if let double = Double(string) {
            total += double
        } else {
            total += 1
        }
    }
}

print("Total is \(total)")

//: page 1 of 2  |  [Next: Application Exercise - Types of Workouts](@next)
