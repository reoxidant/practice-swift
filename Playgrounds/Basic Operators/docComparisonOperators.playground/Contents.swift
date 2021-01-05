import UIKit

//Topic - Comparison Operators

//in example main operators

2 == 3
1 > 2
3 < 2
1 != 0
1 >= 2
2 <= 2

//in example if conditional statements

let inputNumValue = 2

if inputNumValue == 2{
    print("Numbers is equals")
} else {
    print("The numbers is not a equals")
}

//in example tuples conditional statements comparison by order first 5 and 3 then 4 and 7

(5, 4) > (3,7) //true, because 5 > 3

(1, "string") < (1, "string") //false, because 1 < 1 not equal to each other also as string and string

(5, "apple") > (1, "samsung") //true, because 5 > 1

(4, "masha") == (4, "masha") //true, equal to each other

//boolean value can't to compare >, < operators in tuples it's will get the error

("masha", -11) < ("vitaliy", 28) //true, normal state
//(true, "masha") > (false, "vitaliy")//error, can't to compare
