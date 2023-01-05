
/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Reverse a linked list

 Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
 */
/*
extension LinkedList {
    
  mutating func reverse() {
      print("Before: \(head!)")

      var newNode = LinkedList<Int>()

      while let node = removeLast() {
          let value = node as! Int
          newNode.append(value)
      }

      print("After: \(newNode)")
  }
}

var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)

list.reverse()
*/

extension LinkedList {
    mutating func reverse() {

        // 1
        var tmpList = LinkedList<Value>()
        for value in self {
            tmpList.push(value)
        }

        // 2
        head = tmpList.head
    }

    mutating func secondReverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil

        // more to come

        while current != nil {
            let next = current?.next
            print("current: \(current!)")
            print("prev: \(prev!)")
            print("next: \(next)")
            current?.next = prev
            print("changed current: \(current!)")
            prev = current
            print("changed prev: \(prev!)")
            current = next
            print("changed current 2: \(current)")
        }

        head = prev
    }
}

example(of: "reversing a list") {
    var list = LinkedList<Int>()
    list.push(2)
    list.push(1)

    print("Original list: \(list)")
    list.secondReverse()
    print("Reversed list: \(list)")
}
//: [Next Challenge](@next)
