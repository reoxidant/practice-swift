import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "collect") {
    ["A", "B", "C", "D", "E"].publisher
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "collect") {
    ["A", "B", "C", "D", "E"].publisher
        .collect()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "collect") {
    ["A", "B", "C", "D", "E"].publisher
        .collect(2)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "map") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    [123, 4, 56].publisher
        .map {
            formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
        }
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "map key paths") {
    let publisher = PassthroughSubject<Coordinate, Never>()
    
    publisher
        .map(\.x, \.y)
        .sink(receiveValue: { x, y in
            print(
                "The coordinate at (\(x), \(y)) is in quadrant",
                quadrantOf(x: x, y: y)
            )
        })
        .store(in: &subscriptions)
    
    publisher.send(Coordinate(x: 10, y: -8))
    publisher.send(Coordinate(x: 0, y: 5))
}

example(of: "tryMap") {
    
    Just("Directory name than does not exist")
        .tryMap { try FileManager.default.contentsOfDirectory(atPath: $0) }
        .sink(receiveCompletion: { print("receiveCompletion \($0)") },
              receiveValue: { print("receiveValue \($0)") })
        .store(in: &subscriptions)
}

example(of: "flatMap") {
    
    let charlotte = Chatter(name: "Charlotte", message: "Hi, I'm Charlotte")
    let james = Chatter(name: "James", message: "Hi, I'm James!")
    
    let chat = CurrentValueSubject<Chatter, Never>(charlotte)
    
    //    chat
    //        .sink(receiveValue: { print($0.message.value) })
    //        .store(in: &subscriptions)
    
    chat
    //        .flatMap { $0.message }
        .flatMap(maxPublishers: .max(2)) { $0.message }
    
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    charlotte.message.value = "Charlotte: How's is going?"
    
    chat.value = james
    
    james.message.value = "James: Doing great. You?"
    charlotte.message.value = "Charlotte: I'm doing fine thanks."
    
    let morgan = Chatter(name: "Morgan", message: "Hey guys, what are you up to?")
    
    chat.value = morgan
    
    charlotte.message.value = "Did you hear something?"
    
    example(of: "replaceNil") {
        ["A", nil, "C"].publisher
            .replaceNil(with: "-")
        //.replaceNil(with: "-" as String?)
            .map { $0! }
            .sink(receiveValue: { print($0) }) // 3
            .store(in: &subscriptions)
    }
    
    example(of: "replaceEmpty(with:)") {
        
        let empty = Empty<Int, Never>()
        
        empty
            .replaceEmpty(with: 1)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
            .store(in: &subscriptions)
    }
    
    example(of: "scan") {
        
        var dailyGainLoss: Int { .random(in: -10...10) }
        
        let august2019 = (0..<22)
            .map { _ in dailyGainLoss }
            .publisher
        
        august2019
            .scan(50) { latest, current in
                max(0, latest + current)
            }
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}
