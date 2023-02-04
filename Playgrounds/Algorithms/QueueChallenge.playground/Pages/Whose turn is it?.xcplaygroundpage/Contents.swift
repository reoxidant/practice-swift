
/*:
 # Queue Data Structure Challenges
 
 ## Whose turn is it?
 
 Imagine that you are playing a game of Monopoly with your friends. The problem
 is that everyone always forget whose turn it is! Create a Monopoly organizer
 that always tells you whose turn it is. Below is a protocol that you can
 conform to:
 */

public protocol BoardGameManager {
  
  associatedtype Player
  mutating func nextPlayer() -> Player?
}

extension QueueArray: BoardGameManager {
    public typealias Player = T

    public mutating func nextPlayer() -> Player? {
        guard let next = dequeue() else {
            return nil
        }
        enqueue(next)
        return next
    }
}


var queue = QueueArray<String>()
queue.enqueue("Vincent")
queue.enqueue("Remel")
queue.enqueue("Lukiih")
queue.enqueue("Allison")
print(queue)

print("===== boardgame =======")
queue.nextPlayer()
print(queue)
queue.nextPlayer()
print(queue)
queue.nextPlayer()
print(queue)
queue.nextPlayer()
print(queue)

//: [Next Challenge](@next)
