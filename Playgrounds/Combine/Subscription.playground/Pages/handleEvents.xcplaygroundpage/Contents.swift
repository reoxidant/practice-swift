//: [Previous](@previous)

// handleEvents

/*
Performs the specified closures when publisher events occur.
Similar use like print, but can access data and error performing side effects without effecting publisher stream
*/

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Post: Codable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

let request = URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/posts/1001")!)
    .map(\.data)
    .decode(type: Post.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { completion in
        print("completion: \(completion)")
    }) { data in
        print("received data: \(data)")
    }

//: [Next](@next)
