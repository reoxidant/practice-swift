import UIKit

//Work on topic - "Computed Properties"

//stop reading on move square, 10 min was spent

struct Size{
    var width = 0.0, height = 0.0
}

struct Engine{
    var power = 0.0, maxSpeed = 0.0, speed = 0.0
}

struct Car{
    var size = Size()
    var engine = Engine()
    var tuning:Engine{
        get{
            let speed = engine.speed * 2
            let power = engine.speed * engine.maxSpeed / 2
            let maxSpeed = engine.speed * 7
            return Engine(power:power, maxSpeed:maxSpeed, speed:speed)
        }
        set(myEngine){
            engine.maxSpeed = myEngine.maxSpeed
            engine.power = myEngine.power
            engine.speed = myEngine.speed
        }
    }
}

var car = Car(
    size:Size(width:2500.0, height:1200.0),
    engine:Engine()
)
car.tuning = Engine(power: 2500.0, maxSpeed:250.0, speed:60.0)

print("You are car have a size: \(car.size)")
print("The Engine with props: \(car.engine)")
print("I am tuning you are engine now it's \(car.tuning)")

//subtop reading and practice - "Shorthand Getter Declaration"

struct SecondCar{
    var size = Size()
    var engine = Engine()
    var tuning:Engine{
        get{
            let speed = engine.speed * 2
            let power = engine.speed * engine.maxSpeed / 2
            let maxSpeed = engine.speed * 7
            return Engine(power:power, maxSpeed:maxSpeed, speed:speed)
        }
        set{
            engine.maxSpeed = newValue.maxSpeed
            engine.power = newValue.power
            engine.speed = newValue.speed
        }
    }
}

//subtop reading and practice - "Read-Only Computed Properties"

struct CircleEquations{
    var pi = 3.14, radius = 10.0
    var compute:Double{
        return pi * 2 * radius
    }
}

var circle = CircleEquations()

var res = circle.compute

print("The circle equation is \(res.rounded())")
