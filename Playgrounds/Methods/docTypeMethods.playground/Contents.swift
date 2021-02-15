import UIKit

//Topic - Type Methods

class someClass{
    class func someTypeMethod(){
        let greeting = "Hello Admin!"
        print(greeting)
    }
}

//call type methods that u use self construction

someClass.someTypeMethod()

//in example define class LevelTracker where we can to manage the player leve l of game

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock (_ level: Int)
    {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
            print("highestUnlockedLevel is \(highestUnlockedLevel)")
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    @discardableResult mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//init Player class
class Player {
    var tracker = LevelTracker()
    let playerName:String
    func complete (level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to:level + 1)
    }
    init(name:String)
    {
        playerName = name
    }
}

var player = Player(name: "Masha")

player.complete(level:1)
print("Last level access is \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "Vitaliy")
if player.tracker.advance(to: 2)
{
    print("The player on a new level")
} else {
    print("The player has not access on this level")
}

//also for now understood how it's work and practice below

struct TrackerPrice{
    var currentPrice = 1
    static var maxPrice = 1000
    
    static func setNewMaxValue(_ inputVal:Int)
    {
        if inputVal <= maxPrice {
            maxPrice = inputVal
        }
    }
    
    static func canToHighPrice(_ inputVal:Int) -> Bool
    { return inputVal <= maxPrice }
    
    
    @discardableResult mutating func evaluate(to price:Int) -> Bool
    {
        print("canToHighPrice = \(TrackerPrice.canToHighPrice(price))")
        if TrackerPrice.canToHighPrice(price) {
            currentPrice = price
             print("currentPrice now is \(price)")
            return true
        }
        
        return false
    }
}

class Customer{
    var tracker = TrackerPrice()
    let name:String = ""
    func buy(price:Int){
        TrackerPrice.setNewMaxValue(price + 1)
        print("maxPrice is \(TrackerPrice.maxPrice)")
        tracker.evaluate(to: price + 1)
    }
}

let customer = Customer()
if customer.tracker.evaluate(to: 923) {
    print("customer evaluate price is 923")
} else {
    print("customer evaluate price has blocked")
}

print("-----new buying-----")

customer.buy(price:1)
