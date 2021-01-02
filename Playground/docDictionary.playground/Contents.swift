import UIKit

//Topic - Dictionary

//init empty dictionary

var phoneNumbers = [Int:String]()

//if context has a needed types we can to define an empty dictionary of it information

phoneNumbers[707870] = "Home number"

phoneNumbers = [:]

print("phoneNumber: \(phoneNumbers)")

//in example init literal dictionary as array

var flagsOfCountries:[String:String] = ["Blue":"Russian", "White":"France", "Yellow":"Ukraine"]

print("flagsOfCountries: \(flagsOfCountries)")

//u can init dictionary without point types and u can to append value in array literal

var secondFlagsOfCountries = ["Red":"Chine", "White":"Korea"]

print("secondFlagsOfCountries: \(secondFlagsOfCountries)")

//how to count elements in the dictionary by index

print("Count flags of countries is: \(secondFlagsOfCountries.count)")

//fast check equal dictionary is nil or not

if secondFlagsOfCountries.isEmpty
{
    print("Dictionary by name secondFlagsOfCountries is null")
}
else
{
    print("Dictionary have a \(secondFlagsOfCountries.count) items ")
}

//in example how to add element by name of key

secondFlagsOfCountries["Greece"] = "Green"

print("Add new item in dictionary not it's constraints \(secondFlagsOfCountries)")

//in example how to change element by key

secondFlagsOfCountries["White"] = "Japan"

//in example how to update value using method updateValue(:forKey)

var oldValue = flagsOfCountries.updateValue("Finland", forKey:"White")

print("oldValue which has updated on \(oldValue!), change on \(flagsOfCountries["White"]!)")

//in example get access to value by index, it's optional therefore it's may a have nil

if let nameCountry = flagsOfCountries["Yellow"]
{
    print("Yellow color of flag have a country with name \(nameCountry)")
}
else
{
    print("Nobody from \(flagsOfCountries) don't have a Yellow flag")
}

//in example u may to delete key and value assignment nil of item dictionary

flagsOfCountries["White"] = nil

print("flagsOfCountries: \(flagsOfCountries)") //now item is delete

//also u may to use method removeValue(forKey:)

if let removeValue = flagsOfCountries.removeValue(forKey: "White")
{
    print("The value \(removeValue) success delete")
}
else
{
    print("Dictionary don't contraint any items by that key")
}

//u may to iterate by value and key in dictionary use operator for-in

for (flagColor, countryName) in  flagsOfCountries
{
    print("The flag has a color \(flagColor) and the name \(countryName)")
}

//u also may to get any keys and any values use the same properties

var i = 1
for countryName in flagsOfCountries.values
{
    print("The \(i) country have a name \(countryName)")
    i+=1
}

i = 1
for colorFlag in flagsOfCountries.keys
{
    print("The \(i) country have a color of flag \(colorFlag)")
    i+=1
}

//if u use a API which using as a value Array u may to create values or keys array Dictionary

let arrayColorsFlags = [String](flagsOfCountries.keys)
let arrayContriesNames = [String](flagsOfCountries.values)

print("The arrayColorsFlags constains \(arrayColorsFlags) items")
print("The arrayContriesNames constrains \(arrayContriesNames) items")

//u may sort array keys and values of dictunary using method sorted(by: ) "<, >"

let colors = arrayColorsFlags.sorted(by:>)
let names = arrayContriesNames.sorted(by: <)

print("Sorted by > from \(arrayColorsFlags) to \(colors)")
print("Sorted by < from \(arrayContriesNames) to \(names)")
