import UIKit

//Topic - Range Operators

//Swift has 2 type range in close a...b include both and

//Subtopic - "Closed Range Operator"

//table multiple
for i in 1...9{
    print("Counting table of multiple for number \(i)")
    for n in 1...9
    {
        let res:Int = i * n
        print("\(i) * \(n) = \(res)")
    }
}

//often u will be use Closed Range Operator in for-in cycles

//Sub topic - "Half-Open Range Operator" or a..<b

//value a always smaller that b

let namesOfFamily = ["Masha", "Vitaliy", "Ura", "Nadya", "Arkasha", "Svetochka"]

for i in 0..<namesOfFamily.count
{
    let name:String = namesOfFamily[i]
    print("Member of family \(i+1) has name \(name) ")
}

//Sub topic - "One-Sided Ranges" have values only in one side

for name in namesOfFamily[1...]
{
    print("Name member of family in range one-side 1... is \(name)")
}

for name in namesOfFamily[...3]
{
    print("Name member of family in range one-side ...3 is \(name)")
}

//One-Sided Range without ending value ..<10 don't include last number

//for example

for name in namesOfFamily[..<5]
{
    print("Name member of family in range one-side ..<5 without ending value is \(name)")
}

//u may check if isset index of range in the context as array

//for exmaple

let range = ..<namesOfFamily.count

range.contains(1) //check include range it's true

range.contains(6) //check include range it's false
