/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let array: [Any] = [1.2, 5.5, 1, 5, "hello", "world", true, false]

array.forEach {
    print($0)
}

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
array.forEach {
    if $0 is Int {
        print("Целое число \($0)")
    } else if $0 is Double {
        print("Вещественное число \($0)")
    } else if $0 is String {
        print("Строковое значение \($0)")
    } else if $0 is Bool {
        print("Булевое значение \($0)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
var dictionary = [String: Any]()
dictionary["hello"] = "5"
dictionary["false"] = false
dictionary["10"] = 10
dictionary["world"] = "4"
dictionary["12"] = 12
dictionary["5.4"] = 5.4
dictionary["10.4"] = 10.4
dictionary["true"] = true
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0

for (_, value) in dictionary {
    if let int = value as? Int {
        total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if value is String {
        total += 1
    } else if let bool = value as? Bool {
        if bool == true {
            total += 2
        } else {
            total -= 3
        }
    }
}

print("Total is \(total)")
/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0

for (_, value) in dictionary {
    if let int = value as? Int {
        total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if let string = value as? String {
        if let double = Double(string) {
            total += double
        } else {
            total += 1
        }
    }
}

print("Total is \(total)")

//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
