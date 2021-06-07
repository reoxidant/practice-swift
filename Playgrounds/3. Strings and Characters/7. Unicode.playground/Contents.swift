import UIKit

//Topic - Unicode

//The unicode allows you to represent almost any character from any languages in a standardized form

//Subtopic - Extended Grapheme Clusters

// in example create symbol e and e' just use unicode value

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
 
print("Unicode skalar value \u{E9} enter \(eAcute) and here is combined two unicode skalar values \u{65}\u{301} and so that enter \(combinedEAcute)")

// in example the korean symbol can be init as precomposed character or as decomposed character use one of symbol \u{D55C} or many of symbols \u{1112}\u{1161}\u{11AB}

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

print("Korean skalar symbol created with precomposed(one) unicode value \(precomposed)")
print("Korean skalar symbol created with decomposed(multy) unicode value \(precomposed)")

// in example create more combined unicode skalar values

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

print("The skalar symbols enclosedEAcute equal: \(enclosedEAcute)")

let regionalIndicatorForUs: Character = "\u{1F1FA}\u{1F1F8}"

print("The skalar symbols regionalIndicatorForUs equal: \(regionalIndicatorForUs)")
