class Player{
    var name: String
    var age: Int
    var game: String
    
    var playerInfo:String{
        let playerInfo = {
            return """
            My name is \(self.name).
            I am \(self.age) years old.
            I love playing in \(self.game).
            """
        }
        return playerInfo()
    }
    
    init(name:String, game:String, age:Int) {
        self.name = name
        self.age = age
        self.game = game
    }
}

let player = Player(name: "Vitaliy", game: "Warcraft 3", age: 25)
//print(player.playerInfo)

class ProfessionalPlayer: Player{
    var experience: Int
    var retirementTime: Int
    
    init(name: String, game: String, age: Int, experience:Int, retirementTime: Int) {
        self.experience = experience
        self.retirementTime = retirementTime
        
        super.init(name: name, game: game, age: age)
    }
}

protocol CutePlayer{
    var friends:[Player] {get}
    var haveAFriends: Bool {get}
    
    func smile() -> String
    
    func saySomethingCute()
}

extension ProfessionalPlayer:CutePlayer{
    func smile() -> String {
        return "I am smiling everythings in the world!"
    }
    
    var friends: [Player] {
        return [
            Player(name: "Maria", game: "Dota 2", age: 28),
            Player(name: "Andrew", game: "CS GO", age: 23)
        ]
    }
    
    var haveAFriends: Bool {
        return !self.friends.isEmpty
    }
    
    func saySomethingCute() {
        print("I am very glad to see you!")
    }
}

var proPlayer = ProfessionalPlayer(name: "Nadya", game: "Sims 4", age: 24, experience: 7, retirementTime: 20)
print(proPlayer.playerInfo)
proPlayer.saySomethingCute()
if proPlayer.haveAFriends{
    print("I have a friends")
}else{
    print("I am alone")
}
print(proPlayer.smile())
