//: [Previous](@previous)

// How to create a subscription?
// What does a publisher without a subscription?
// What does data stream mean?

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var subscription: AnyCancellable? = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()
    .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
    .scan(0, { (count, _) in
        return count + 1
    })
//    .removeDuplicates()
    .filter({ count in
        return count < 6
    })
    .sink { completion in
        print("data stream completion \(completion)")
    } receiveValue: { (timestamp) in
        print("receive value: \(timestamp)")
    }

// How do you cancel a subscription

DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
    // subscription.cancel()
    subscription = nil
}

//: [Next](@next)
