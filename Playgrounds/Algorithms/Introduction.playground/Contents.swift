import UIKit

//Constant time

//O(1)

func checkFirst(names: [String]) {
    if let first = names.first {
        print(first)
    } else {
        print("no names")
    }
}

// Linear time

//O(N)

func printNames(names: [String]) {
    for name in names {
        print(name)
    }
}

// Quadratic time

//O(N2)

func printNames2(names: [String]) {
    for _ in names {
        for name in names {
            print(name)
        }
    }
}

// Logarithmic time

let numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450]

func naiveContains(_ value: Int, in array: [Int]) -> Bool {
    for element in array {
        if element == value {
            return true
        }
    }
    
    return false
}

//O(log n)

func naiveContainsOptimized(_ value: Int, in array: [Int]) -> Bool {
    guard !array.isEmpty else { return false }
    let middleIndex = array.count / 2
    
    if value <= array[middleIndex] {
        for index in 0...middleIndex {
            if array[index] == value {
                return true
            }
        }
    } else {
        for index in middleIndex..<array.count {
            if array[index] == value {
                return true
            }
        }
    }
    
    return false
}

//O(n)

func sumFromOne(upto n: Int) -> Int {
    var result = 0
    for i in 1...n {
        result += i
    }
    return result
}

sumFromOne(upto: 10000)

// also O(n)

func sumFromOne2(upto n: Int) -> Int {
    (1...n).reduce(0, +)
}

sumFromOne2(upto: 10000)

func sumFromOne3(upto n: Int) -> Int {
    (n + 1) * n / 2
}

sumFromOne3(upto: 10000)

// Space complexity

// O(n)

func printSorted(_ array: [Int]) {
    let sorted = array.sorted()
    for element in sorted {
        print(element)
    }
}

// also sorted function but have O(1) complexity

func printSorted2(_ array: [Int]) {
    // 1
    guard !array.isEmpty else { return }
    
    // 2
    var currentCount = 0
    var minValue = Int.min
    
    // 3
    for value in array {
        if value == minValue {
            print(value)
            currentCount += 1
        }
    }
    
    while currentCount < array.count {
        
        // 4
        var currentValue = array.max()!
        
        for value in array {
            if value < currentCount && value > minValue {
                currentValue = value
            }
        }
        
        // 5
        for value in array {
            if value == currentCount {
                print(value)
                currentCount += 1
            }
        }
        
        // 6
        minValue = currentValue
    }
}

printSorted2([1, 100, 500, 1000])
