import UIKit

class Human {
    
    let maxAge = 100
    var name: String
    
    var age: Int {
        didSet{
            if age > maxAge {
                age = oldValue
            }
        }
    }
    
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
}

struct Cat{
    var name:String
    static var maxAge = 20
    var age: Int {
        didSet{
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
}

//initialization name and age props for class

let human = Human(name:"Vitaliy", age: 26)
var cat = Cat(name:"Pushok", age: 15)

print(human.name,human.age, cat.name, cat.age)

//change name and age props for class and structure but it's not init because type prop maxAge not allow do it anymore by comparison

human.age = 1000
cat.age = 50

print(human.name,human.age, cat.name, cat.age)

//in example define stored types properties for diffrent

struct someStruct{
    static var storedStructStr = "struct"
    static var computeStructProp:Int {
        return 0 //changed in future therefore it's variable
    }
}

enum someEnum{
    static var storeEnumStr = "enum"
    static var computeEnumProp:Int{
        return 10 //changed in future therefore it's variable
    }
}

class someClass{
    static var storedClassStr = "class"
    var someIntVariable = 0
    
    //as i can to understand it's for
    class someSubClass{
        static var storedSubClassStr = "string of subclass"
    }
}

//in example we can to read stored props and edit props of type

print("The value of storedStructStr variable is '\(someStruct.storedStructStr)'")

someStruct.storedStructStr = "Hello World"

print("Changed value of storedStructStr variable is '\(someStruct.storedStructStr)'")

//in example we can to read computed props that haven been computed

print("Getting compute computeStructProp value that set value in processing and equal - \(someStruct.computeStructProp)")

print("Getting compute computeEnumProp value that set value in processing and equal - \(someEnum.computeEnumProp)")

class IndicatorOfVolume
{
    var thresholdIndicatorLevel = 10
    var maxIndicatorLever = 0
    
    var valueOfVolume = 0{
        didSet{
            if valueOfVolume > thresholdIndicatorLevel
            {
                valueOfVolume = thresholdIndicatorLevel
            }
            if valueOfVolume > maxIndicatorLever
            {
                maxIndicatorLever = valueOfVolume
            }
        }
    }
}

let leftIndicator = IndicatorOfVolume()
let rightIndicator = IndicatorOfVolume()

leftIndicator.valueOfVolume = 8
rightIndicator.valueOfVolume = 15

print("leftIndicator has a maxIndicatorLever equal = \(leftIndicator.maxIndicatorLever)")

print("rightIndicator has a maxIndicatorLever equal = \(rightIndicator.maxIndicatorLever)")
