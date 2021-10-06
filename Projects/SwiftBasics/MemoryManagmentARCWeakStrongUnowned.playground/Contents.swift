import Foundation

// 1ч 12 мин

//Memory management in iOS.
//The ARC is weak, strong, belonging to no one. Strong reference cycle.

class DecimalNumber {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    deinit {
        print("Обьект с value \(value) удаляется")
    }
}

var firstNum = DecimalNumber(value: 10) // колл ссылок firstNum 1
var secondNum = DecimalNumber(value: 5) // колл ссылок secondNum 1

var num3 = secondNum // колл ссылок secondNum 2
var num4 = secondNum // колл ссылок secondNum 3

// колл ссылок firstNum 0, колл ссылок secondNum 4
firstNum = num4


// 1ч 15 мин

// ARC

class Person {
    
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) инициализируется")
    }
    
    deinit {
        print("\(name) деинициализируется")
    }
}

var reference1: Person? = nil
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed") // 1
reference2 = reference1 // 2
reference3 = reference1 // 3


reference1 = nil // 2

reference2 = nil // 1

reference3 = nil // 0
// ARC delete object

print("next")

// 1ч 23 мин

// Цикл сильных ссылок

/// Квартира
class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("\(unit) инициализируется")
    }
    
    deinit {
        print("Апартаменты \(unit) освобождаются")
    }
}

// 1ч 32 мин

// Как обойти цикл сильных ссылок

// Создадим квартиру и жильца

var john: Person? = Person(name: "Mary Sokolova") // колл ссылок john 1

var unit4A: Apartment? = Apartment(unit: "313") // колл ссылок unit4A 1

// Поселим жильца в квартиру

john?.apartment = unit4A // колл ссылок unit4A 2
unit4A?.tenant = john // weak = колл ссылок john 1

// колл ссылок john 0 и тут же unit4A уменьшилась на 1 тк удалился обьект john и ссылка внутри, но все еще есть Apartment(unit: "313") самая начальная ссылка
john = nil

unit4A = nil // колл ссылок unit4A 0, только тут удалилась

// 1ч 49 мин

// Циклы сильных ссылок в замыканиях

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) деинициализируется")
    }
}

var heading: HTMLElement? = HTMLElement(name: "h1", text: "some default text")
print(heading!.asHTML())
heading = nil
