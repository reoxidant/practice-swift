//: [Previous](@previous)

// Important note
// assign(to, on: self) -> memory cycle

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct User {
    let name: String
    let id: Int
}

class ViewModel {
    
    var user = CurrentValueSubject<User, Never>(User(name: "Bob", id: 1))
    var userID: Int = 1 {
        didSet {
            print("userId changed \(userID)")
        }
    }

    var subscriptions = Set<AnyCancellable>()
    
    init() {}
    
    deinit {
        print("deinit")
    }
}

var viewModel = ViewModel()

//: [Next](@next)
