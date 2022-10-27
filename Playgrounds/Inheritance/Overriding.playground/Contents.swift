import UIKit

//Topic -  Inheritance - Subtopic Overriding

//in example define 2 classes car and computer for practice section

class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "traveling \(currentSpeed) miles per hour"
    }
    
    func makeNoise(){
        
    }
}

class Computer{
    var powerProcessor = 0.0
    var resolution:Int = 1080
    var description:String{
        return "The computer has power: \(powerProcessor) and resolution: \(resolution)"
    }
}


let comp = Computer()
//in example call compute property it has only reading value as let
print(comp.description)

class Car: Vehicle{
    var gear = 1
    //in example override methods
    override func makeNoise(){
        print("Car has a noise Beep Beep")
    }
    //in example override method and call super variable parent class
    override var description:String{
        return "\(super.description) and has gear on \(gear)"
    }
}
print("-----")
let car = Car()
car.makeNoise()
print(car.description)
print("-----")

//in example here is inheritance from Computer

class MacMini: Computer{
    var countCores = 4
    override var description:String{
        return "\(super.description) and more \(countCores) cores"
    }
}

let mac = MacMini()
mac.powerProcessor = 2200
mac.resolution = 1440
print(mac.description)

//subtopic Overriding Property Observers

//try to compute gear from speed of car, not hang out observers props for let variable or computed properties

class AutomaticCar: Car {
    override var currentSpeed:Double{
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let autoCar = AutomaticCar()
autoCar.currentSpeed = 30
print("value gear is \(autoCar.gear)")

//also try compute count cores for iphone

class Iphone: MacMini{
    override var powerProcessor:Double{
        didSet {
            countCores = Int(powerProcessor / 700) + 1
        }
    }
}

let iphone12 = Iphone()
iphone12.powerProcessor = 2100
print("in iphone count cores is \(iphone12.countCores)")
