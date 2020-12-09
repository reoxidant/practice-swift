import UIKit

//my subtop "Defining and Calling Functions" was spent 15min

//func and call func with return value in example

func login(loginName:String) -> String{
    if !loginName.isEmpty {
        return "Welcome (name), you are log in into system"
    } else {
        return "Write your login name so u can to log in into system"
    }
}

print(login(loginName:"Vitaliy"))
//Welcome Vitaliy, you are log in into system

print(login(loginName:"Masha"))
//Welcome Masha, you are log in into system
