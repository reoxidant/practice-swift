//: [Previous](@previous)

// breakpointOnError()

// When the upstream publisher fails with an error, this publisher raises the SIGTRAP signal, which stops the process in the debugger. Otherwise, this publisher passes through values and completions as-is.

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct CustomError : Error {}

let publisher = PassthroughSubject<String?, Error>()
let cancellable = publisher
    .tryMap { stringValue in
        throw CustomError()
    }
    .sink(
        receiveCompletion: { completion in print("Completion: \(String(describing: completion))") },
        receiveValue: { aValue in print("Result: \(String(describing: aValue))") }
    )

publisher.send("TEST DATA")

breakpoint(receiveSubscription: ((Subscription) -> Bool)? = nil,
           receiveOutput: ((Self.Output) -> Bool)? = nil,
           receiveCompletion: ((Subscribers.Completion<Self.Failure>) -> Bool)? = nil) -> Publishers.Breakpoint<Self>

// A publisher that raises a debugger signal when one of the provided closures returns true.

let publisher = PassthroughSubject<String?, Never>()
let cancellable = publisher
    .breakpoint(
        receiveOutput: { value in return value == "DEBUGGER" }
    )
    .sink { print("\(String(describing: $0))" , terminator: " ") }

publisher.send("DEBUGGER")

// does not work well in playground

//: [Next](@next)
