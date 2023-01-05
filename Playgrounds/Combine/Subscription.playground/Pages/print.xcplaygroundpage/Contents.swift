//: [Previous](@previous)

// Get additional information about the state of your data stream

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let subscription = [1, 2, 3].publisher
    .sink(receiveCompletion: {
            print("receive completion: \($0)")
    },receiveValue: {
        print("receive value \($0)")
    })





















//better print readablility-----------------
// .print(_ text: String, to: TextOutputStream)

class IndexLogger: TextOutputStream {
    var index: Int = 0
    private var previous = Date()
    private let formatter = NumberFormatter()
    private var text: String = ""
    
    init(_ text: String = "") {
        formatter.maximumFractionDigits = 5
        formatter.minimumFractionDigits = 5
        self.text = text
    }
    
    func write(_ string: String) {
        guard !string.isEmpty && string != "\n" else {
            return
        }
        let now = Date()
        print(" \(text)  \(index) after \(formatter.string(for: now.timeIntervalSince(previous))!)s  --> \(string)")
        index += 1
    }
}

//
//let subscription = (1...5).publisher
//  .print("", to: IndexLogger("😁"))
//  .filter({ $0 < 3 })
//  .print("hello", to: IndexLogger("❤️"))
//  .sink { _ in }



//---- example print to file
//https://nshipster.com/textoutputstream/
struct FileHandlerOutputStream: TextOutputStream {
    private let fileHandle: FileHandle
    let encoding: String.Encoding

    init(_ fileHandle: FileHandle, encoding: String.Encoding = .utf8) {
        self.fileHandle = fileHandle
        self.encoding = encoding
    }

    mutating func write(_ string: String) {
        if let data = string.data(using: encoding) {
            fileHandle.write(data)
        }
    }
}
//let url = URL(fileURLWithPath: "/path/to/file.txt")
//let fileHandle = try FileHandle(forWritingTo: url)
//var output = FileHandlerOutputStream(fileHandle)
//
//print("\(Date())", to: &output)

//: [Next](@next)
