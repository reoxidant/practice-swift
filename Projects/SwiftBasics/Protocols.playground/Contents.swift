

//: ## Протоколы
let string = "Hello, World!"
print(string)

let number = 10
print(number)

let bool = true
print(bool)
//: ### CustomStringConvertable
class Shoes: CustomStringConvertible {
    
    let color: String
    let size: Int
    let hasLaces: Bool
    
    var description: String {
        "Shoes(color: \(color), size: \(size), hasLaces: \(hasLaces))"
    }
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
}

let myShoes = Shoes(color: "Brown", size: 41, hasLaces: true)
print(myShoes)
//: ### Equatable
struct Employee : Equatable, Comparable {
    
    let firstName: String
    let lastName: String
    let jotTitle: String
    let phoneNumber: String
    
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        lhs.lastName == rhs.lastName && lhs.phoneNumber == rhs.phoneNumber
    }
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

let employees = [
    Employee(firstName: "Alexey", lastName: "Efimov", jotTitle: "Teacher", phoneNumber: "8-999-888-66-77"),
    Employee(firstName: "Ivan", lastName: "Akulov", jotTitle: "Head", phoneNumber: "8-999-787-67-98"),
    Employee(firstName: "Ivan", lastName: "Danilin", jotTitle: "Teacher", phoneNumber: "8-999-555-44-33")
]

let someEmployee = Employee(firstName: "Ivan", lastName: "Akulov", jotTitle: "", phoneNumber: "8-999-787-67-98")

for employee in employees {
    if employee == someEmployee {
        print("The employee is registered in the company")
    }
}
//: ### Comparable
let sortedEmployees = employees.sorted(by: <)
for employee in sortedEmployees {
    print(employee.lastName)
}
//: ### Создание собственноо протокола
protocol FullyNameProtocol {
    var fullName: String { get }
    func sayHello()
    func doSomething()
}

extension FullyNameProtocol {
    func doSomething() { }
}

struct Person: FullyNameProtocol {
    
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    func sayHello() {
        print("Hello, \(fullName)")
    }
}

let person = Person(firstName: "Tim", lastName: "Cook")
person.sayHello()

