
struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []

    init() {}

    var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }

    mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }

    mutating func dequeue() -> T? {
        if leftStack.isEmpty { // 1
            leftStack = rightStack.reversed() // 2
            rightStack.removeAll() // 3
        }
        return leftStack.popLast() // 4
    }
}

extension QueueStack: CustomStringConvertible {
    var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
}

var queue = QueueStack<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
queue.enqueue("Masha")
queue
queue.dequeue()
queue
