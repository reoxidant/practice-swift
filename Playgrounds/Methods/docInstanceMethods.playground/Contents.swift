import UIKit

//Topic - Instance Methods

//in example use class counter and define methods of INSTANCE CLASS

class Counter{
    var count = 0
    func increaseValue()
    {
        count += 1
    }
    func increaseValue(by num:Int)
    {
        count += num
    }
    func decreaseValue()
    {
        count -= 1
    }
    func decreaseValue(by num:Int)
    {
        count = count - num
    }
    func resetValue()
    {
        count = 0
    }
}

var counter = Counter()

counter.increaseValue(by: 100)

print("Increase variable count of instance Counter and it's equal \(counter.count)")

counter.decreaseValue(by: 1000)

print("Decrease variable count of instance Counter and it's equal \(counter.count)")

counter.resetValue()

print("Reset value of variable count and it's equal \(counter.count)")

//in example use self then u need to separate instance pops and functions parameters

class Point{
    var x:Int = 0, y:Int = 0
    
    func installNewPositionX(x:Int)
    {
        //direct where is pops x parameters and where is class instance props
        if x > 1{
            self.x = x
        }
    }
}

var pointInTheSquare = Point()
pointInTheSquare.installNewPositionX(x:2)

if pointInTheSquare.x > 0
{
    print("The point placed on X position!")
}

//describe moving the man there i define mutating function for change the variable of structure

struct Man{
    var x:Int, y:Int
    //mutating for changing x,y variables
    mutating func moveBy(x posx:Int, y posy:Int){
        x += posx
        y += posy
    }
}

var man = Man(x: 0, y: 0)

man.moveBy(x:10, y:5)
print("Now the point x is \(man.x) and the point y is \(man.y)")

//if you define let constant you don't have to change his variables

var errorMan = Man(x: 1, y: 3)
errorMan.moveBy(x:20, y: 12) // error

//in example Mutating Method Swift

enum switchingLevel
{
    case low, middle, high
    mutating func next()
    {
        //take value from variable that define in level
        switch self{
        //Assign new value by switch
        case .low:
            self = .middle
        case .middle:
            self = .high
        case .high:
            self = .low
        }
    }
}

var level = switchingLevel.low
level.next()
print("Now the level equal = \(level)")
level.next()
print("Now the level equal = \(level)")
