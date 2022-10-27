import UIKit

//Topic - Unicode Representations of Strings

// in example create string using utf unicode that using in text files, sites and another text presentation

let dogString = "Dog\u{203C}\u{1F436}"

print(dogString)

//Subtopic - UTF-8 Representation

//Separate all string by UTF8 symbols use for in operator for getting unit code symbol


func everyUnitCodeInUTF8(){
    let dogString = "Dog\u{203C}\u{1F436}"
    
    print(dogString)
    
    
    for codeUnit in dogString.utf8{
        print(" \(codeUnit) ", terminator:" ")
    }
    
    print("")
}

//Subtopic - UTF-16 Representation

//in example get every unit code utf 16 skalar value

func everyUnitCodeInUTF16(){
    let dogString = "Dog\u{203C}\u{1F436}"
    
    print("UnitCode in UTF16")
    for codeUnit in dogString.utf16{
        print(" \(codeUnit) ", terminator:" ")
    }
    print("")
}

//68 111 103 equal value so that they used ASCII symbols

//Subtopic - Unicode Scalar Representation

//get a skalar view Unicode value

func unicodeViewInScalar(){
    let dogString = "Dog\u{203C}\u{1F436}"
    
    print("Unicode in Scalars ")
    for scalar in dogString.unicodeScalars{
        print(" \(scalar.value) ", terminator:" ")
    }
    print("")
}

//in example u may to create a new value with unicode scalar

func newStringWithUnicodeViewInScalar(){
    let dogString = "Dog\u{203C}\u{1F436}"
    
    for scalar in dogString.unicodeScalars{
        print("\(scalar) ")
    }
}

//D
//o
//g
//!!
//🐶
