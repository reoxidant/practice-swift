import UIKit

// Race Condition

var value = 0
let serialQueue = DispatchQueue(label: "ru.vshapovalov.serial-queue")

func increment() { value += 1 }

/*
 serialQueue.async {
 sleep(5)
 increment()
 print("Race condition")
 }
*/

serialQueue.sync {
    sleep(5)
    increment()
    print("No race condition")
}

print(value)

value = 10

serialQueue.sync {
    increment()
}

print(value)

// Dead lock

serialQueue.sync {
    /*
     serialQueue.sync {
     print("Deadlock 1")
     }
     */
    
    serialQueue.async {
        print("No deadlock 1")
    }
}

let concurrentQueue = DispatchQueue(label: "ru.vshapovalov.concurrent-queue", attributes: .concurrent)

concurrentQueue.sync {
    concurrentQueue.sync {
        print("No deadlock 2")
    }
}
