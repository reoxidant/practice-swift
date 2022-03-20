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
