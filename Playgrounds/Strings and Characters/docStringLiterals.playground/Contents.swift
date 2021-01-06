import UIKit

//Topic - String Literals

//in example how to define the string with literals

let newString = "here is a new string in literals"

//Sub topic - Multiline String Literals

//in example init Multiline String Literals

let answer = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
"""

//in example the literals begin and end with " - quorites here is not an any transfer symbol

let someString = "here is literal."
let quotation = """
return multiline string
"""

//in example use symbol transfer multilines for reading in code

let someQuotation = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
"Lorem Ipsum has been the industry's \
standard dummy text ever since the 1500s"
"""

//in example use space as /r symbol for creating empty spaces in multiline string

let lineBreaks = """

Line string start
Line string end

"""

//in example use space in multiline text for spaces

let lineWithSpaces = """
The string without spaces
    The string with 4 spaces
The string withot spaces
"""

//Sub topic - Special Characters in String Literals

//The string literals can include special symbols as:

//0, \\, \t, \n, \r, \", \' and Unicode symbols \u{u} n - (1-8) some values

//example bellow

let wiseString = "\"String in the quories\" - Vitaliy"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//in example into multiline strings u can to use "" symbol without special characters but if u want to use """ sign u need to escape at least one marks

let someMuitilineString = """
    Two marks ""
    Three marks with escaping at least one \"""
"""

//Sub topic - Extended String Delimiters

//in example u can to use ## symbols for include special charts

print(#"Line 1\nLine 2"#)

//in example u can to use \#n as separator so that special charts will be worked

print(#"Line 1\#nLine 2"#)

//also it will be worked here

print(###"Line1\###nLine2"###)

//in example here """ included into the quotatione using # symbols that wrapped text

let threeMoreDoubleQuotationMarks = #"""
Hello my friend: """
"""#

print(threeMoreDoubleQuotationMarks)
