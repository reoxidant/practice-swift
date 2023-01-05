//: [Previous](@previous)

// Publishers that will pass a limited number of values

import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let foodbank: Publishers.Sequence<[String], Never> = ["apple","bread","orange","milk"].publisher

let subscription = foodbank.sink { completion in
    print("completion \(completion)")
} receiveValue: { foodItem in
    print("receive item \(foodItem)")
}

let timer = Timer.publish(every: 2, on: .main, in: .common)
    .autoconnect()

let subscription2 = foodbank.zip(timer)
    .sink { completion in
        print("completion: \(completion)")
    } receiveValue: { foodItem, timestamp in
        print("receive item: \(foodItem) with \(timestamp)")
    }

//: [Next](@next)
