import Foundation

//: # Lesson 7
//: ## Понятие и принципы ООП


//: ### Инкапсуляция

/// Класс содержит информацию о посте
class Post {
    /// Название
    var title: String
    
    /// Текст
    var body: String
    
    /// Автор
    var author: String
    
    /// Вычисляемое свойство, возвращает количество коммантариев
    var description: Int {
        get {
            numberOfComments
        }
    }
    
    /// Количество комментариев
    var numberOfComments = 0
    
    init(title: String, body: String, author: String) {
        self.title = title
        self.body = body
        self.author = author
    }
    
    /// Метод прибавляет комментарии
    func addComment() {
        numberOfComments += 1
        print("Комментарий №\(numberOfComments) добавлен")
    }
}

let firstPost = Post(
    title: "This is my first post",
    body: "Hello!",
    author: "Igor"
)

firstPost.addComment()
firstPost.addComment()

// Попробуем напрямую изменить кол-во комментов, так делать нельзя
firstPost.numberOfComments = 63
firstPost.description

print("The number of comments for the post \(firstPost.title) is \(firstPost.description)")


//: ### Наследование
// 47 мин класс транспорт

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "движется на скорости \(currentSpeed) миль в час"
    }
    func makeNoise() {
        //ничего не делаем, так как не каждый транспорт шумит
    }
}


let someVehicle = Vehicle()
someVehicle.currentSpeed = 75

print("Транспорт: \(someVehicle.description)")
//Транспорт: движется на скорости 0.0 миль в час

//: ### Наследование подклассом
// 50 мин
/*:
 
 class SomeSubclass: SomeSuperclass {
 // определение подкласса проводится тут
 }
 
 */


class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Велосипед: \(bicycle.description)")
//Велосипед: движется на скорости 15.0 миль в час

// 1 час и 3 мин
//: ### Полиморфизм

class Train: Vehicle {
    override func makeNoise() {
        print("Чу-чу")
    }
}

let train = Train()
train.makeNoise()
// Выведет "Чу-чу"


final class Car: Vehicle {
    var gear = 1
    final override var description: String {
        return super.description + " на передаче \(gear)"
    }
    
    override func makeNoise() {
        print("Врум врум")
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
car.makeNoise()
print("Машина: \(car.description)")
// Выведет "Машина: движется на скорости 25.0 миль в час на передаче 3"


func printVehicleDescription(_ vehicle: Vehicle) {
    print("Транспортное средство: \(vehicle.description)")
}

printVehicleDescription(car)
printVehicleDescription(bicycle)


// 1ч 30 мин
//: ### Протоколы

protocol TransportVehicle {
    /// Может перевозить только маленький груз?
    var onlySmallCargo: Bool { get }
    /// Считает стоимость за перевозимый вес на дистанцию
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double
}

class MiniVan: TransportVehicle {
    let onlySmallCargo: Bool = true
    private let priceMultiplier = 0.3
    
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double {
        return weight * transportationDistance * priceMultiplier
    }
}

class Plane: TransportVehicle {
    let onlySmallCargo: Bool = false
    private let priceMultiplier = 0.1
    
    func calculatePrice(forWeight weight: Double, transportationDistance: Double) -> Double {
        return weight * transportationDistance * priceMultiplier
    }
}

/// Склад
class Warehouse {
    /// Вес грузов в кг
    private let productsWeight = 2532.0
    /// Дистанция до другого склада
    private let distanceToNextWarehouse = 3748.0
    
    /// Вывод цены перевозки
    func printPriceForTransportation(using vehicle: TransportVehicle) {
        let price = vehicle.calculatePrice(
            forWeight: productsWeight,
            transportationDistance: distanceToNextWarehouse
        )
        print("Цена перевозки груза составит: \(Int(price)) рублей")
    }
}

let warehouse1 = Warehouse()

let plane = Plane()
let minivan = MiniVan()

warehouse1.printPriceForTransportation(using: plane)
warehouse1.printPriceForTransportation(using: minivan)
