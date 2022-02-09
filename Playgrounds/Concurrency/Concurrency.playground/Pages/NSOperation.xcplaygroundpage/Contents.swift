import UIKit
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Operation and Operation Queue"

//print(Thread.current)

//let operation1 = {
//    print("Start")
//    print(Thread.current)
//    print("Finish")
//}
//
//let queue = OperationQueue()
//queue.addOperation(operation1)

//print(Thread.current)
//
//var result: String?
//let concatOperation = BlockOperation {
//    result = "The Swift" + " " + "Developers"
//    print(Thread.current)
//}

//concatOperation.start()

//print(result)

//var queue = OperationQueue()
//queue.addOperation(concatOperation)
//print(result)
//print(Thread.current)
//let queue1 = OperationQueue()
//queue1.addOperation {
//    print("Test")
//    print(Thread.current)
//}

//class MyThread: Thread {
//    override func main() {
//        print("Test main thread")
//    }
//}
//
//let myThread = MyThread()
//myThread.start()

print(Thread.current)
class OperationA: Operation {
    override func main() {
        print("Test operation A")
        print(Thread.current)
    }
}

let operationA = OperationA()
//operationA.start()

let queue1 = OperationQueue()
queue1.addOperation(operationA)
