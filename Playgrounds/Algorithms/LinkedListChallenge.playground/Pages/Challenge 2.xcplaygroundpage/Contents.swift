
/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Find the middle node

 Create a function that finds the middle node of a linked list.
 */
/*

func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {

    let middleIndex = list.count / 2

    let node = list.node(at: middleIndex)

    return node
}

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.append(4)

var list2 = LinkedList<Int>()
list2.append(1)
list2.append(2)
list2.append(3)

print("middle is \(getMiddle(list)!.value)")
print("middle is \(getMiddle(list2)!.value)")

*/

func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head

    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }

    return slow
}
example(of: "getting the middle node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print(list)

    if let middleNode = getMiddle(list) {
        print("middleNode: \(middleNode)")
    }
}
//: [Next Challenge](@next)
