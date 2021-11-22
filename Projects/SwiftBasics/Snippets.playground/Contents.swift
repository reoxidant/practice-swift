class Animal {
    var name = ""
    var description: String {
        "Animal"
    }
    
    init () {}
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    override var description: String {
        "Dog"
    }
}

class Cat: Animal {
    override var description: String {
        "Cat"
    }
}

class Bird: Animal {
    override var description: String {
        "Bird"
    }
}

let animal = Animal()
let dog = Dog()
let cat = Cat()
let bird = Bird()

private func getClientPet(_ animal: Animal) -> Animal {
    animal
}

let pet = getClientPet(dog)

if pet is Dog {
    print("The animal is Dog")
} else if pet is Cat {
    print("The animal is Cat")
} else if pet is Bird {
    print("The animal is Bird")
}

//animal is Animal
//animal is Dog
//animal is Cat
//animal is Bird
//
//dog is Animal
//dog is Dog
//dog is Cat
//dog is Bird

func getPets() -> [Animal] {
    var pets: [Animal] = []
    
    let numberOfDogs = Int.random(in: 1...10)
    let numberOfCats = Int.random(in: 1...10)
    let numberOfBirds = Int.random(in: 1...10)
    
    for _ in 1...numberOfDogs {
        let dog = Dog()
        pets.append(dog)
    }
    
    for _ in 1...numberOfCats {
        let cat = Cat()
        pets.append(cat)
    }
    
    for _ in 1...numberOfBirds {
        let bird = Bird()
        pets.append(bird)
    }
    
    return pets
}

let pets = getPets()

var dogCount = 0
var catCount = 0
var birdCount = 0

pets.forEach({
    if $0 is Dog {
        dogCount += 1
    } else if $0 is Cat {
        catCount += 1
    } else if $0 is Bird {
        birdCount += 1
    }
})

//for pet in pets {
//    if pet is Dog {
//        dogCount += 1
//    } else if pet is Cat {
//        catCount += 1
//    } else if pet is Bird {
//        birdCount += 1
//    }
//}

print("There are \(dogCount) dogs, \(catCount) cats, \(birdCount) birds")


func walk(with dog: Dog) {
    print("Walking \(dog.name)")
}

func cleanLittlerBox(for cat: Cat) {
    print("Cleaning the \(cat.name) litter box")
}

func cleanCage(for bird: Bird){
    print("Remove the \(bird.name) featers at the bottom of the cage")
}

pets.forEach {
    if let dog = $0 as? Dog {
        walk(with: dog)
    } else if let cat = $0 as? Cat {
        cleanLittlerBox(for: cat)
    } else if let bird = $0 as? Bird {
        cleanCage(for: bird)
    }
}

let item: [Any] = [1, "Tod", 7.6, dog]

let firstItem = item.first

if let firstItem = firstItem as? Int {
    print(firstItem + 4)
}

var cards: [Any] = [2, 3, 5, "Qeeen", "King"]

func getSum(cards: [Any]) -> Int {
    var total = 0
    
    for card in cards {
        if let cardWithNumber = card as? Int {
            total += cardWithNumber
        } else if let _ = card as? String {
            total += 10
        }
    }
    
    return total
}

print("total cards \(getSum(cards: cards))")
