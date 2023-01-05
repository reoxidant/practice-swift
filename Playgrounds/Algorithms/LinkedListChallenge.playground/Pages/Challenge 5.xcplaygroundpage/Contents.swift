// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 5: Remove all occurrences of a specific element

 Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
 */
/*
extension LinkedList where Value: Equatable {

    mutating func removeAll(_ value: Value) {

        let isTail = value == tail?.value

        if head?.value == value {
            head = head?.next
        } else if isTail {
            removeLast()
        } else {
            while let node = head?.next {
                if node.value == value {
                    head?.next = node.next
                }

                if tail?.value == node.value {
                    break
                }
            }
        }

        print("list after removing all occurrences of \(value)", head!)
    }

}

var list = LinkedList<Int>()
list.push(4)
list.push(3)
list.push(3)
list.push(3)
list.push(1)

list.removeAll(3)
 */

extension LinkedList where Value: Equatable {

    mutating func removeAll(_ value: Value) {
        while let head = head, head.value == value {
            self.head = head.next
        }

        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }

            prev = current
            current = current?.next
        }

        tail = prev
    }

}

example(of: "deleting duplicate nodes") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(1)

    list.removeAll(2)
    print(list)
}
