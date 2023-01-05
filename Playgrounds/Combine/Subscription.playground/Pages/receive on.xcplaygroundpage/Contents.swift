//: [Previous](@previous)

// Multithreading
// Where and how to change threads?

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let intSubject = PassthroughSubject<Int, Never>()

let subscription = intSubject
    .sink(receiveValue: { value in
        print("receive value \(value)")
    })

intSubject.send(1)

DispatchQueue.global().async {
  intSubject.send(2)
}

//: [Next](@next)
