    //: [Previous](@previous)

//: ## Структуры


/*:
    struct StructureName {
        var nameOfVarioable: DataType
        func someFunction {
            some code
        }
    }
 
 */
// Как правило используются  для хранения значений

// Тип значения - копируется при присвоении, пример ниже
struct PositionOnMap {
    var name: String
    var x: Int
    var y: Int
    
    // инициализация генерируется самостоятельно
}

var point = PositionOnMap(name: "p1", x: 0, y: 0)

var point2 = point
point2.name = "dhkjgfghsdgfx"

print(point.name)
print(point2.name)

// Сылочный тип - копируется ссылка при присвоении, пример ниже
class Phone {
    let model: String
    var price: Double
    
    init(model: String, price: Double) {
        self.model = model
        self.price = price
    }
}


let phone = Phone(model: "Iphone", price: 34476.98)


let phone2 = phone


phone2.price = 999999


print(phone.price)
print(phone2.price)
//: ### Сравение классов и структур

//: ### Методы в структурах

