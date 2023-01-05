//: [Previous](@previous)

/*
assign(to published: inout Published<Output>.Publisher)

 - available: iOS 14+, macOS 11+ tvOS 14+ and watchOS 7+

Apple documentation:
The assign(to:) operator manages the life cycle of the subscription, canceling the subscription automatically when the Published instance deinitializes. Because of this, the assign(to:) operator doesn’t return an AnyCancellable that you’re responsible for like assign(to:on:) does.
*/

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyModel: ObservableObject {
    @Published var lastUpdated: Date = Date()
    init() {
         Timer.publish(every: 1.0, on: .main, in: .common)
             .autoconnect()
    }
}

import SwiftUI

struct ClockView: View {

    @StateObject var clockModel = MyModel()
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter
    }
    
    var body: some View {
        Text("enter date here")
            .fixedSize()
            .padding(50)
    }
}

PlaygroundPage.current.setLiveView(ClockView())

//: [Next](@next)

Text(dateFormatter.string(from:  clockModel.lastUpdated))
