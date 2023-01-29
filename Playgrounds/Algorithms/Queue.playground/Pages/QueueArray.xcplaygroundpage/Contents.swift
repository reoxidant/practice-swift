
public struct QueueArray<T>: Queue {
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }

    private var array: [T] = []
    public init() {}

    public var isEmpty: Bool {
        array.isEmpty // 1
    }

    public var peek: T? {
        array.first // 2
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek

