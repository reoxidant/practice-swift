import Foundation

func binarySearch <T: Comparable>(_ list: [T], item: T) -> Int? {

    var low = 0
    var high = list.count - 1

    while low <= high {
        let mid = (low + high) / 2
        let guess = list[mid]

        if guess == item {
            return mid
        }

        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return nil
}

let list = [1,3,5,7,9]

print(binarySearch(list, item: 3) ?? "Not found value")
print(binarySearch(list, item: 6) ?? "Not found value")
