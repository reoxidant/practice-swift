import UIKit

//Topic - "Comparing Strings"

//comparing string and character for this need to use operator "==", "!="

let strFirComparison = "Apple"

let strSecComparison = "Apple"

if strFirComparison == strSecComparison
{
    print("The strings is equal")
}

if strFirComparison.prefix(1) == strSecComparison.prefix(1)
{
    print("The first character is equal")
}

//Comparing string with using canonical unicode

//in example

let firNumCanon = "Op\u{E9}n the door!"
let secNumCanon = "Op\u{65}\u{301}n the door!"

print("firNumCanon: \(firNumCanon)")
print("secNumCanon: \(secNumCanon)")

if firNumCanon == secNumCanon
{
    print("The strings is equals!")
}

//Try to create letter in other language using canonical unicode and compare it

let latinCapitalLetterA:Character = "\u{41}"
let englishCapitalLetterA:Character = "\u{0410}"

print("latinCapitalLetterA has a letter: \(latinCapitalLetterA)")
print("englishCapitalLetterA has a letter: \(englishCapitalLetterA)")

if latinCapitalLetterA != englishCapitalLetterA
{
    print("Both string is not equal to each other")
}

// prefix and suffix equality and check a constants value

let pieceRomeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var sceneCountAct1 = 0

for scene in pieceRomeoAndJuliet
{
    if scene.hasPrefix("Act 1 ")
    {
        sceneCountAct1 += 1
    }
    print(scene)
}

print("All scene in the act 1 is: \(sceneCountAct1)")

//count preffix and suffix value into the array

var cellCount = 0
var mansionCount = 0

for scene in pieceRomeoAndJuliet
{
    if scene.hasSuffix("Capulet's mansion")
    {
        mansionCount += 1
    }
    else if scene.hasSuffix("Friar Lawrence's cell")
    {
        cellCount += 1
    }
}

print("\(mansionCount) scene into the mansion; \(cellCount) Friar Lawrence's cells")
