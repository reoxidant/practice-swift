
/*:
 # Stack Challenges
 
 ## #1. Reserve an Array
 
 Create a function that prints the contents of an array in reversed order.
 */

let array: [Int] = [1, 2, 3, 4, 5]

printInReverse(array)
print("Right example:")
rightPrintInReverse(array)

func printInReverse<Element>(_ array: [Element]) {
    var elements = array
    var countOfArray = array.count

    while countOfArray != 0 {
        print(elements.popLast() ?? 0)

        countOfArray -= 1
    }
}

func rightPrintInReverse<T>(_ array: [T]) {
    var stack = Stack<T>()

    for value in array {
        stack.push(value)
    }

    while let value = stack.pop() {
        print(value)
    }
}

//: [Next Challenge](@next)
