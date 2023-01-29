
public class QueueLinkedList<T>: Queue {

    public var isEmpty: Bool {
        list.isEmpty
    }

    public var peek: T? {
        list.first?.value
    }

    private var list = DoublyLinkedList<T>()
    public init() {}

    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }

    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }

        return list.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: list)
    }
}

var queue = QueueLinkedList<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
