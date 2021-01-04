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

//in example

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
