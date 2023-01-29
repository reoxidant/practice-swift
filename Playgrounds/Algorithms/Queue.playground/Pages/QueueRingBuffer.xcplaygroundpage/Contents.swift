
struct QueueRingBuffer<T>: Queue {

    private var ringBuffer: RingBuffer<T>

    init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }

    var isEmpty: Bool {
        ringBuffer.isEmpty
    }

    var peek: T? {
        ringBuffer.first
    }

    mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }

    mutating func dequeue() -> T? {
        ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    var description: String {
        String(describing: ringBuffer)
    }
}

var queue = QueueRingBuffer<String>(count: 10)
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
