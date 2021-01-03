import UIKit

//Topic - "Function Parameters and Return Values" was spent 15 min

//func wiout parametes in example

func withoutParam() -> String{
    return "It's a func without parameters"
}

//calling

print(withoutParam())

//func with many parameters

func isLoginUser(userName: String, alreadyLogin: Bool) -> String
{
    if alreadyLogin
    {
        return "Hello again, (userName)."
    }
    else
    {
        return "Welcome, (userName)."
    }
}

print(isLoginUser(userName: "vshapovalov", alreadyLogin: false))

print(isLoginUser(userName: "enfatiko", alreadyLogin: true))

//function that not return a value,

func sayStr(s:String, nstr:String) -> String
{
    print("We wrote the word (s)")
    print("the word (s) converting to the new word (nstr)")
    return s
}

func generateNewWordBy(str:String)
{
    var newStr = ""
    
    for _ in 0..<str.count
    {
        let nIndex = Int.random(in:0..<str.count)
        newStr += String(str[str.index(str.startIndex, offsetBy:nIndex)])
    }
    
    let _ = sayStr(s:str, nstr:newStr) // just ignore return value, it's a bad practice
}

generateNewWordBy(str:"masha")
