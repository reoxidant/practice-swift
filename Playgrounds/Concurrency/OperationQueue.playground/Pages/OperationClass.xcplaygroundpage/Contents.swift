import Foundation

enum CustomError: Error, LocalizedError {
    case customError
    
    var errorDescription: String? {
        switch self {
        case .customError:
            return NSLocalizedString("Not value", comment: "value")
        }
    }
}

final class FirstOperation: Operation {
    private(set) var result: Result<String, Error>?
    
    override func main() {
        print("First operation")
        result = .success("Admin")
        result = .failure(CustomError.customError)
    }
}

final class MyOperation: Operation {
    var value = "some value"
    
    override func main() {
        print("Hello \(value)!")
    }
}

let operation = FirstOperation()
let operation2 = MyOperation()
let operation3 = BlockOperation { [operation, operation2] in

    switch operation.result {
    case let .success(result):
        operation2.value = result
    case let .failure(error):
        operation2.value = error.localizedDescription
    case .none:
        operation2.value = "no result"
    }
}

let queue = OperationQueue()
queue.name = "operation-queue"
queue.maxConcurrentOperationCount = 5

let queue2 = OperationQueue()
queue2.name = "operation-queue2"
queue2.maxConcurrentOperationCount = 5

operation2.addDependency(operation3)
operation3.addDependency(operation)

queue.addOperation(operation)
queue2.addOperation(operation2)
queue2.addOperation(operation3)

DispatchQueue.global().async {
    print("First operation GCD")
    
    var result: Result<String, Error> = .success("Admin GCD")
    
    DispatchQueue.global().async { [result] in
        
        var value = "no result GCD"
    
        switch result {
        case let .success(result):
            value = result
        case let .failure(error):
            value = error.localizedDescription
        }
        
        print("Hello, \(value)!")
    }
}
