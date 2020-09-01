import UIKit

//Консольная программа на закрепление
//Напишите консольную программу, которая принимает от пользователя два параметра: букву, число.
//Вывести в консоль список всех фамилий, начинающихся на данную букву, если их владелец имеет пол, соответствующий введённому числу. Источником является массив, подготовленный заранее.

func listFamilies(firstLetter: String, sexNumber: Int){
    let peoples:[String:Int] = ["Vanya":0,"Vasya":0,"Masha":1,"Dasha":1,"Sveta":1,"Olyga":1,"Volodya":0,"Nastya":1,"Andrey":0]
    
    let uppercase = firstLetter.first?.isUppercase
    
    let sex = sexNumber == 0 || sexNumber == 1
    
    guard sex && (uppercase != nil && uppercase!) else {return print("Error: is not a correct function arguments")}
    
    var flag = false
    
    for man in peoples{
        if man.key.first == firstLetter.first, man.value == sexNumber {
            flag = true
            let sexName:String = (man.value == 0) ? "Male" : "Female"
            print("Name: \(man.key), Sex is: \(sexName)")
        }else{
            continue
        }
    }
    
    if(!flag){
        print("This is name or sex value is not a found in my Array list")
    }
}

listFamilies(firstLetter: "V", sexNumber: 1)
