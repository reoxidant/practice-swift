//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа
//1 час 27 мин

//Полная форма записи словаря
var carsWashQueue = Dictionary<String, String>()
var carsWashQueue1 = Dictionary<String, Int>()

// Сокращенная форма записи словаря
var carsWashQueue2 = [String: String]()
var carsWashQueue3 = [String: Int]()

// Инициализация словаря с данными
carsWashQueue = [
    "Y73NJB": "BMW X6",
    "GHGHh778": "Lada Vesta"
]

// 1 час 31 мин

// Изменение значения для ключа

carsWashQueue["GHGHh778"] = "Jeep GC"

carsWashQueue

// удобно подсчитывать сколько иванов в группе

var namesQuantity = [String: Int]()

namesQuantity["Иван"] = 4

namesQuantity

// 1 час 34 мин

// Изменение значения с сохранением старого значения
let oldValue = carsWashQueue.updateValue("Gray BMW X6", forKey: "GHGHh778")

// Добавление новой пары ключ-значение
carsWashQueue["TUHBJKN"] = "Lada niva"
carsWashQueue

// Удаление значения по ключу с сохранением значения

carsWashQueue["GHGHh778"] = nil
carsWashQueue

carsWashQueue.removeValue(forKey: "TUHBJKN")


//: [Next](@next)

