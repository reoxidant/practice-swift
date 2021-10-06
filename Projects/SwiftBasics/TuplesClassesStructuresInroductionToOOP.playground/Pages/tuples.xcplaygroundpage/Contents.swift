import UIKit
import Foundation

//: # Lesson 6
//: ## Кортежи

// 56 мин

/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/
var weather = (23, "Sunny")


//: ### Получение доступа к элементам
weather.0

weather.0 = 78

print(weather.0)
//: ### Именование элементов кортежа
var currentWeather = (temp: 23, atmos: "Sunny")

currentWeather.atmos = "xsk"
//: ### Массовое присвоение значений
var numberOne = 1
var numberTwo = 2
var numberThree = 3

(numberOne, numberTwo, numberThree) = (4, 5, 6)
print(numberOne)


func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: 5...24)
    return (city, temp)
}


let tupleTemp = getTemp(in: "Moscow")

print(tupleTemp.city)
