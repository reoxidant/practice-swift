import UIKit

//Topic - Comparing Classes and Structures

//Syntax declaration

class SomeClass{}

struct SomeStructure{}

//example from live experience

struct Profession{
    var experienceOfYears = 0
    let name: String?
    let education: String?
}

class Human{
    let age = 0
    var name: String? = nil
    let sex: String? = nil
    var profession = Profession(name: "artist", education: "Master's degree")
}

//instance Class and Structures

let someClassHuman = Human()
let someStructureProfession = Profession(name:"Programmer", education: "Student's degree")

//sub topic access to properties

print("The name of profession is \(someClassHuman.profession.name!)")

//in another case

print("The education of human is \(someStructureProfession.education!)")

//change class of properties

someClassHuman.name = "Vitaliy"
someClassHuman.profession.experienceOfYears = 2

print("The class someClassHuman is changed now here's properties name is \(someClassHuman.name!) and his experience is \(someClassHuman.profession.experienceOfYears) years")
