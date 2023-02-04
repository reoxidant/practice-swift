
//: [Previous Challenge](@previous)
/*:
 ## Reverse Queue
 
 Implement a method to reverse the contents of a queue.
 
 > Hint: The `Stack` data structure has been included in the **Sources** folder.
 */

extension QueueArray {
    
    func reversed() -> QueueArray {

        var queue = self

        var stack = Stack<T>()

        while let next = queue.dequeue() {
            stack.push(next)
        }

        while let next = stack.pop() {
            queue.enqueue(next)
        }

        return queue // return a copy of the reversed queue
    }
}

var queue = QueueArray<String>()
queue.enqueue("1")
queue.enqueue("21")
queue.enqueue("18")
queue.enqueue("42")

print("before: \(queue)")
print("after: \(queue.reversed())")

//: [Next Challenge](@next)
