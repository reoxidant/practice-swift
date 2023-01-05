//: [Previous](@previous)

/*
 The pattern
 
 ------  Subscription ------
 - A protocol representing the connection of a subscriber to a publisher.
 
 protocol Subscription : Cancellable, CustomCombineIdentifierConvertible {
     /// Tells a publisher that it may send more values to the subscriber.
      func request(_ demand: Subscribers.Demand)
      func cancel() { //do some clean up }
 }
 
  attaching sink { }, which is a Subscriber to a Publisher
  -> create subscription -> returns Subscription as Cancellable

 ------ Publisher ------
 
protocol Publisher {
  associatedtype Output
  associatedtype Failure: Error
 
  func receive<S>(subscriber: S) where S : Subscriber,
                                       Self.Failure == S.Failure,
                                       Self.Output == S.Input {
    // creates a subscription
    // sends subscription to subscriber with S.receive(subscription: S)
  }
}
 
------ Subscriber ------
 
protocol Subscriber {
  associatedtype Input
  associatedtype Failure: Error

  func receive(subscription: Subscription)
  func receive(_ value: Input) -> Subscribers.Demand
  func receive(completion: Subscribers.Completion<Failure>)
}

 Subscriber: assign
 extension Subscribers {
    class Assign<Root, Input>: Subscriber, Cancellable {
       typealias Failure = Never
       init(object: Root, keyPath: ReferenceWritableKeyPath<Root, Input>)
    }
 }
 
 extension Publisher where Self.Failure == Never {
   public func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>,
                            on object: Root) -> AnyCancellable
 }
 
 extension Publisher {
 /// Attaches a subscriber with closure-based behavior.
 /// This method creates the subscriber and immediately requests an unlimited number of values,
     prior to returning the subscriber.
 
 // Returns: A cancellable instance, which you use when you end assignment of the received value.
    Deallocation of the result will tear down the subscription stream.
 
    public func sink(receiveCompletion: @escaping ((Subscribers.Completion<Self.Failure>) -> Void),
                     receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
}

extension Publishers {
  struct Map<Upstream: Publisher, Output>: Publisher {
      typealias Failure = Upstream.Failure
      let upstream: Upstream
      let transform: (Upstream.Output) -> Output
  }
}
 
 */

// Example:

import Combine

class MyClass {
    var anInt: Int = 0 {
        didSet {
            print("didSet \(anInt)")
        }
    }
}

// Compare to playground page assign

let obj = MyClass()
let pub = (0...2).publisher
let subscriber = Subscribers.Assign(object: obj, keyPath: \MyClass.anInt)

// This does not return a subscription/cancellable

pub.receive(subscriber: subscriber)

//: [Next](@next)
