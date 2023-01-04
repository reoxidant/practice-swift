import Combine
import SwiftUI
import PlaygroundSupport

let valuesPerSecond = 1.0
let delayInSecond = 1.5

let sourcePublisher = PassthroughSubject<Date, Never>()

let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSecond), scheduler: DispatchQueue.main)

let subscription = Timer
    .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)
    .autoconnect()
    .subscribe(sourcePublisher)

let sourceTimeline = TimelineView(title: "Emitted values (\(valuesPerSecond) per sec.)")

let delayedTimeline = TimelineView(title: "Delayed values (with a \(delayInSecond)s delay):")

let view = VStack(spacing: 50) {
    sourceTimeline
    delayedTimeline
}

PlaygroundPage.current.liveView = UIHostingController(rootView: view)

sourcePublisher.displayEvents(in: sourceTimeline)
delayedPublisher.displayEvents(in: delayedTimeline)
//: [Next](@next)
