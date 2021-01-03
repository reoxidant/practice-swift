import UIKit

//Topic - "Stored Properties"

//describe count students

struct CountStudents{
    var firstStudent:Int
    let length:Int
}

var rangeOfStudents = CountStudents(firstStudent: 0, length: 3)

//now range of students is 0,1,2

rangeOfStudents.firstStudent = 10

//install new range of students 10,11,12

//sub topic - "Stored Properties of Constant Structure Instances"

let secondRangeOfStudent = CountStudents(firstStudent: 5, length: 5)

//now init new range of student that started from 5 to 10

//secondRangeOfStudent.length = 9 //error

//Call error because let is constant type of structure. All strustures depend by type values.
