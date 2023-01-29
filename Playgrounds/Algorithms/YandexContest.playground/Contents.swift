import Foundation

if let path = Bundle.main.path(forResource: "input", ofType: "txt") {
    freopen(path, "r", stdin)
}

let tempArray = readLine()?.split(separator: " ").compactMap { Int($0) }
let tRoom = tempArray?.first ?? 0
let tCond = tempArray?.last ?? 0
let mode = readLine()

switch mode {
case "heat" where tRoom <= tCond:
    print(tCond)
case "heat" where tRoom > tCond:
    print(tRoom)
case "freeze" where tRoom >= tCond:
    print(tCond)
case "freeze" where tRoom < tCond:
    print(tRoom)
case "auto":
    print(tCond)
case "fan":
    print(tRoom)
    default:
    break
}
