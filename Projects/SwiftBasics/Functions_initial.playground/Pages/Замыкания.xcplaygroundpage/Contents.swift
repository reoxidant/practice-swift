//: [Previous](@previous)

import Foundation

//: ### Функции как замыкания
// 1ч 53 мин

//: Отбираем числа меньше заданного значения


func filterLessThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers = [Int]()

    for number in numbers {
        if number < value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}


let someValue = 5
let numbers = [5, 8, 20, 13, 1, 4, 3, 6]

filterLessThanValue(value: someValue, numbers: numbers)



//: Отбираем числа больше заданного значения


func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers = [Int]()

    for number in numbers {
        if number > value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

filterGreaterThanValue(value: someValue, numbers: numbers)



//: Функция для отбора чисел, относительно заданного значения


func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var filterNumbers = [Int]()

    for number in numbers {
        if closure(number, value) {
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}


//: Функция для отбора числе меньше указанного значения
func lessThanValue(number: Int, value: Int) -> Bool {
    number < value
}

//: Функция для отбора числе больше указанного значения
func greaterThanValue(number: Int, value: Int) -> Bool {
    number > value
}

// приведем основные отличия от замыкания

let closure1 = { (number: Int, value: Int) -> Bool in
    number > value
}

greaterThanValue(number: 4, value: 8)
closure1(4,7)

[5].filter({$0 > 7})

func greaterThan7(numberToCompare: Int) -> Bool {
    return numberToCompare > 7
}

[5].filter(greaterThan7)

//: Отбор чисел меньше указанного значения
filterWithPredicateClosure(value: someValue, numbers: numbers, closure: lessThanValue)
//: Отбор чисел больше указанного значения
filterWithPredicateClosure(value: someValue, numbers: numbers, closure: greaterThanValue)


//: ### Замыкающие выражения
// 2ч 4 мин
/*:
 
 Замыкания бывают трех видов:
 
 - Глобальные функции — это замыканиями, у которых есть имя и которые не захватывают никакие значения.
 
 - Вложенные функции — это замыканиями, у которых тоже есть имя, но при этом они могут использовать или захватывать значения из родительской функции.
 
 - Замыкающие выражения - это безымянные функции, которые написаны в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста
 
 */


/*:
    { (параметры) -> тип результата in
        тело замыкающего выражения
    }
 */
//
//func greaterThanValue(number: Int, value: Int) -> Bool {
//    number > value
//}

// перепишем функцию под замыкание

let greaterThanValueClosure = { (number: Int, value: Int) -> Bool in
    return number > value
}

let isGreater = greaterThanValueClosure(43, 4)

// замыкание подсчета колличества символом в строке

let strLen = {(str: String) -> Int in
    return str.count
}

let count = strLen("dji")

print(count)
//: Отбор чисел больше указанного значения
// задаем замыкание как аргумент в функции

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { (number: Int, value: Int) -> Bool in
    return number > value
})

let result = [54, 87, 5, 45, 23].filter({ (number: Int) -> Bool in return number > 50})
print(result)
//: Вывод типа из контекста

// closure без типов аргументов

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { number, value in
    return number > value
})


//: Неявные возвращаемые значения из замыканий с одним выражением
// closure без ключ слова return

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { number, value in number > value })

//: Сокращенные имена параметров
filterWithPredicateClosure(value: someValue, numbers: numbers, closure: { $0 > $1 })


// что делает closure? извиняюсь за тупой вопрос...

// ответ - это функция без имени и много примеров сверху как основные отличия
//: Последующее замыкание
// если closure в конце можем его вынести за функцию

filterWithPredicateClosure(value: someValue, numbers: numbers) { $0 > $1 }

func getPostsNames(byTopic topic: String, callback: ([String]) -> Void) {
    if topic == "News" {
        callback(["USA Electtion", "Russia"])
    }
}

getPostsNames(byTopic: "News", callback: { names in
    print(names)
    print(names.first)
})

// более сокращенная запись callback замыкания

getPostsNames(byTopic: "News") { names in
    print(names)
    print(names.first)
}
//: Операторные функции
// самый упрощеный вариант функции closure >

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: >)

// Следовательно все переменные (если они нужны) стоит писать внутри функции ?


