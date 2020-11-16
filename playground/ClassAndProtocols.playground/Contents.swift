class Player{
    let name: String
    var age: Int
    let game: String
    
    var playerInfo: String {
        let playerInfo = """
        I am \(name).
        My favorite game is \(game).
        I am \(age) years old.
        """
        return playerInfo
    }
    
    init(name:String, age:Int, game:String) {
        self.name = name
        self.game = game
        self.age = age
    }
}

let player = Player(name: "Masha", age: 27, game: "piska")

//print(player.playerInfo)

class ProfessionalPlayer: Player{
    let experience: Int
    let retirementAge: Int
    
    init(name: String, age: Int, game: String, experience:Int, retirementAge: Int) {
        self.experience = experience
        self.retirementAge = retirementAge
        super.init(name: name, age: age, game: game)
    }
}

protocol angryPlayer{
    var enemies: [Player] { get }
    var haveAEnemies: Bool { get }
    
    func angry()
    func saySomethingTerrible() -> String
}

extension ProfessionalPlayer: angryPlayer{
    var enemies: [Player] {
        return [
            Player(name: "Nadya", age: 22, game: "Lineage 2"),
            Player(name: "Petya", age: 40, game: "Vodka")
        ]
    }
    
    var haveAEnemies: Bool {
        return !enemies.isEmpty
    }
    
    func angry() {
        print("I am very Angry!")
    }
    
    func saySomethingTerrible() -> String {
        return "I hate you"
    }
}

let proPlayer = ProfessionalPlayer(name: "Vitaliy", age: 25, game:"dota 2", experience: 2, retirementAge: 35)
print(proPlayer.saySomethingTerrible())
