import UIKit

//Topic - For-In Loops

//in example initialize array and do for-on operation

let names = ["Anna", "Alex", "Sasha", "Masha"]
for name in names {
    print("Hello, \(name)")
}

//in example initialize iteration by dictionary using for in

let someDicNameAndAges: [String: Int] = ["Vitaliy":26, "Mary":27, "Igor": 15, "Sasha": 19]

for (name, age) in someDicNameAndAges{
    print("name - \(name), age - \(age)")
}

//in example use iteration in range

var resTenMultiplyValue = 1

for n in 1...10{
    resTenMultiplyValue *= n
}

print("ten myltiply values - \(resTenMultiplyValue)")

//in example u can to ignore value use _ symbol in iteration for in

let countJump = 10
var i = 0
var n = countJump

for _ in 0..<countJump{
    i += 1
    n -= 1
    print("jump: - \(i) last \(n)")
}

// in example u can use close range iteration as ..<

let hours = 24
let mitutesInHour = 60
var result = 0
for _ in 0..<hours{
    result += mitutesInHour
}
print("In \(hours) hours = \(result) minutes")

// in example u can to get interval value using function stride

let interval = 5

for intervalValue in stride(from: 0, to: mitutesInHour, by: interval){
    print("Tick \(interval) minutes: past \(intervalValue) from \(mitutesInHour)")
}
