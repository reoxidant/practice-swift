import UIKit

//Topic - Closure Expressions

// Sub topic - Method sorted

let names = ["Misha", "Masha", "Dima", "Sanya", "Nastya", "Vitaliy", "Gena", "Maks", "Timur", "Polina"]

func sortedClosure( name1: String, name2: String) -> Bool
{
    return name1 < name2
}

let resultOfSorting = names.sorted(by: sortedClosure)

print("Array with reverse order \(resultOfSorting)")

// now need to write with using closure

let resultOfClosure = names.sorted(by:{(s1:String, s2:String) -> Bool in return s1 > s2}
)

print("Array with in direct order \(resultOfClosure)")

//Define type from context

let sortingNames = names.sorted(by: {s1, s2 in return s1 < s2})

print("array will sorting in direct order \(sortingNames)")

//Sub topic Implicit return values from single-expression closures

//u can down key work return in the function expression closure

let withoutReturn = names.sorted(by: {s1, s2 in s1 > s2})

print("array will sorting by reverse order \(sortingNames)")

//sub topic - "reduce parameters names" using $0, $1, $2 naming

let sortArrayInDirect = names.sorted(by: {$0 > $1})

print("Reduce params and get sorted array \(sortArrayInDirect)")

//sub topic - "operator functions"

let reversedNames = names.sorted(by: >)

print("array will sorting by reverse order \(reversedNames)")
