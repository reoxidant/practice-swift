import Combine
import Foundation


// A subject you get values from
let subject = PassthroughSubject<Int, Never>()

let valuesPerSecond = 0.5

let strings = subject
    .collect(.byTime(DispatchQueue.main, .seconds(valuesPerSecond)))
    .map { array in
        String(array.map { Character(Unicode.Scalar($0)!) })
    }

let spaces = subject.measureInterval(using: DispatchQueue.main)
    .map { interval in
        interval > 0.9 ? "👏" : ""
    }

let subcription = strings
    .merge(with: spaces)
    .filter { !$0.isEmpty }
    .sink {
        print($0)
    }

// Let's roll!
startFeeding(subject: subject)
