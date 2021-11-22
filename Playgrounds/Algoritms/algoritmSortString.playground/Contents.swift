import UIKit
import Darwin

// N - lenght of string

// Time: O(N^2)
// Memory: O(N)

var name = "hello world"
var result: Character = "."
var resultCount = 0

for letter in name {
    var number = 0
    for letter2 in name {
        if letter == letter2 {
            number += 1
        }
    }
    
    if number > resultCount {
        result = letter
        resultCount = number
    }
}

print(result)

// N - lenght of string
// K - count of symbols

// Time: O(N * K)
// Memory: O(N + K) = O(N)

name = "ababagegere"
result = "."
resultCount = 0

let setNames = Set(name)

for letter in setNames {
    var number = 0
    for letter2 in name {
        if letter == letter2 {
            number += 1
        }
    }
    
    if number > resultCount {
        result = letter
        resultCount = number
    }
}

print(result)

// N - lenght of string
// K - count of symbols

// Time: O(N + K) = K < N = O(N)
// Memory: O(K)

var dictionary = [Character: Int]()
name = "vitaliypupsmalishlubitsex"
result = "."
resultCount = 0

for letter in name {
    if dictionary[letter] == nil {
        dictionary[letter] = 0
    }
    var number = dictionary[letter] ?? 0
    number += 1
    dictionary[letter] = number
}

for dict in dictionary {
    if resultCount < dict.value {
        resultCount = dict.value
        result = dict.key
    }
}

print(result, resultCount)
