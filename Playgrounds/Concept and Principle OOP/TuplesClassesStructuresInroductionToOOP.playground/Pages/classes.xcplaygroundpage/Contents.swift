//: [Previous](@previous)

//: ## Classes

let postTitle = "Classes"
let postBody = "Text"
let postAuthor = "Vasya Pupkin"

let postTitle2 = "Tuples"
let postBody2 = "Text about tuples"
let postAuthor2 = "Vasya Pupkin"

class Post {
    var title: String = ""
    var body: String = ""
    var author: String = ""
}

let post1 = Post()

post1.title = "Classes"
post1.body = "Text"
post1.author = "Vasya"

print(post1.author)

let post2 = post1

post2.title = "Classes 2"
post2.body = "Text 2"
post2.author = "Vasya 2"

print("Author \(post1.author) has published new post '\(post1.title)' with text '\(post1.body)'")
print("Author \(post2.author) has published new post '\(post2.title)' with text '\(post2.body)'")

//: ### Class method

class Post2 {
    var title = ""
    var body = ""
    var author = ""
    
    static var descr = "Class Post"
    
    var description: Int { numberOfComments }
    
    var numberOfComments = 0
    
    init() {
        print("I was created")
    }
    
    func addComment() {
        numberOfComments += 1
        print(getDescription())
    }

    func getDescription() -> Int {
        numberOfComments
    }
}

let post3 = Post2()

post3.title = "4uiydhu"

post3.addComment()
post3.addComment()

print(Post2.descr)

//: ### Initialization

class Human {
    var name = ""
    var age = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func walk() {
        print("I can walk")
    }
    
    func sleep() {
        print("I need sleep")
    }
    
    func eat() {
        print("I need food \(name)")
    }
}

let human1 = Human(name: "Igor", age: 12)
let human2 = Human(name: "Igorxxbxh hx", age: 12)

human1.eat()
human2.eat()
