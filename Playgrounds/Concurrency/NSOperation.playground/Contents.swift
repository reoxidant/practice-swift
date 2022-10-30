import UIKit

// Queue

let opQueue = OperationQueue()
opQueue.name = "operationQueue"
opQueue.maxConcurrentOperationCount = 5

let secondOpQueue = OperationQueue()
secondOpQueue.name = "secondOpQueue"
secondOpQueue.maxConcurrentOperationCount = 5

// очередь можно остановить или запустить

opQueue.isSuspended = false // false

enum MyErrors: Error, LocalizedError {
    case someError

    var errorDescription: String?  {
        switch self {
        case .someError: return "get some error"
        }
    }
}

final class MyOperation: Operation {

    var valueOperation: String?

    override func main() {
        guard !isCancelled else {
            return
        }

        if let valueOperation = valueOperation {
            print("perform MyOperation with value: \(valueOperation)")
        } else {
            print("perform MyOperation")
        }
    }
}

final class DependencyOperation: Operation {
    private(set) var result: Result<String, Error>?

    override func main() {

        print("perform DependencyOperation")

//        result = .success("success")
        result = .failure(MyErrors.someError)
    }
}

// Operations

let someOp = MyOperation()
let depOp = DependencyOperation()
let doOperation = BlockOperation { [someOp, depOp] in
    switch depOp.result {
    case .success(let value):
        someOp.valueOperation = value
    case .failure(let error):
        someOp.valueOperation = error.localizedDescription
    case .none:
        someOp.valueOperation = "no result"
    }
}

someOp.addDependency(doOperation)
doOperation.addDependency(depOp)

opQueue.addOperation(someOp)
secondOpQueue.addOperation(depOp)
secondOpQueue.addOperation(doOperation)
