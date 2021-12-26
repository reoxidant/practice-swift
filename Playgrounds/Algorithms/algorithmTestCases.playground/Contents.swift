import UIKit


//Given a zero-based permutation nums (0-indexed), build an array ans of the same length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it.

//A zero-based permutation nums is an array of distinct integers from 0 to nums.length - 1 (inclusive).

var nums = [0,2,1,5,3,4]
var ans = [Int]()

func buildArray(_ nums: [Int]) -> [Int] {
    for (i, _) in nums.enumerated() {
        ans.append(nums[nums[i]])
    }
    return ans
}

let array = buildArray(nums)

//Given an integer array nums of length n, you want to create an array ans of length 2n where ans[i] == nums[i] and ans[i + n] == nums[i] for 0 <= i < n (0-indexed).
//Specifically, ans is the concatenation of two nums arrays.
//Return the array ans

let firstNums = [1,2,1]
let secondNums = [1,3,2,1]

func getConcatenation(_ nums: [Int]) -> [Int] {
    ans = nums
    for (i, _) in nums.enumerated() {
        ans.append(nums[i])
    }
    return ans
}
let a2 = getConcatenation(firstNums)
let a3 = getConcatenation(secondNums)

//There is a programming language with only four operations and one variable X:
//++X and X++ increments the value of the variable X by 1.
//--X and X-- decrements the value of the variable X by 1.
//Initially, the value of X is 0.
//Given an array of strings operations containing a list of operations, return the final value of X after performing all the operations.


func finalValueAfterOperations(_ operations: [String]) -> Int {
    
    var answer = 0
    
    for operation in operations {
        switch operation {
        case "--X", "X--":
            answer -= 1
        case "++X", "X++":
            answer += 1
        default:
            break
        }
    }
    
    return answer
}

finalValueAfterOperations(["--X","X++","X++"])

//Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
//Return the running sum of nums.

func runningSum(_ nums: [Int]) -> [Int] {
//    var answers: [Int] = nums
    var answers: [Int] = [nums[0]]
    
    for index in nums.indices where index > 0 {
        answers.append(nums[index] + (answers.last ?? 0))
    }

    return answers
    
//    for index in nums.indices where index > 0{
//        answers[index] += answers[index - 1]
//    }
//
//    return answers
}

runningSum([3,1,2,10,1])
//[1,3,6,10]
//[1,2,3,4,5]
//[3,4,6,16,17]

//Given a valid (IPv4) IP address, return a defanged version of that IP address.
//A defanged IP address replaces every period "." with "[.]".

func defangIPaddr(_ address: String) -> String {
    address.split(separator: ".").joined(separator: "[.]")
}

defangIPaddr("1.1.1.1")
defangIPaddr("255.100.50.0")


//You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.
//A customer's wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.

//Вам предоставляется m x n целочисленных счетов сетки, где счета [i][j] - это сумма денег, которую i-й клиент имеет в j-м банке. Верните богатство, которое есть у самого богатого клиента.
//Богатство клиента - это сумма денег, которую он имеет на всех своих банковских счетах. Самый богатый клиент - это клиент, обладающий максимальным богатством.

func maximumWealth(_ accounts: [[Int]]) -> Int {
    
    var maxCustomersWeather = 0
    
    for account in accounts {
        var customerWealth = 0
        
        for value in account {
            customerWealth += value
        }
        
        maxCustomersWeather = max(maxCustomersWeather, customerWealth)
    }
    
    return maxCustomersWeather
}

maximumWealth([[1,5],[7,3],[3,5]])

//1st customer has wealth = 1 + 2 + 3 = 6
//2nd customer has wealth = 3 + 2 + 1 = 6
//Both customers are considered the richest with a wealth of 6 each, so return 6.

//Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
//Return the array in the form [x1,y1,x2,y2,...,xn,yn].

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var res = [Int]()
    for index in nums.indices {
        if (index % 2 == 0) {
            res.append(nums[index / 2])
            // 1
            // 1, 2, 1
        } else {
            // 1, 2
            // 1, 2, 1, 2
            res.append(nums[n + index / 2])
        }
    }
    
    return res
}
shuffle([1,1,2,2], 2)

//There are n kids with candies. You are given an integer array candies, where each candies[i] represents the number of candies the ith kid has, and an integer extraCandies, denoting the number of extra candies that you have.
//
//Return a boolean array result of length n, where result[i] is true if, after giving the ith kid all the extraCandies, they will have the greatest number of candies among all the kids, or false otherwise.
//
//Note that multiple kids can have the greatest number of candies.

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    
    var results = [Bool]()

    for candy in candies {
        let maxCandies = candy + extraCandies
        var isMaxValue = true
        
        for candy in candies {
            if maxCandies < candy {
                isMaxValue = false
            }
        }
        results.append(isMaxValue)
    }
    
    
    return results
}

//candies = [12,1,12], extraCandies = 10
//[true,false,true]

kidsWithCandies([4,2,1,1,2], 1)

//Given an array of integers nums, return the number of good pairs.
//A pair (i, j) is called good if nums[i] == nums[j] and i < j.


func numIdenticalPairs(_ nums: [Int]) -> Int {
    var dictionary = [Int:Int]()
    var count = 0
    
    for num in nums {
        if let value = dictionary[num] { count += value }
        dictionary[num, default: 0] += 1
    }
    
    return count
}

numIdenticalPairs([1,2,3,1,1,3])

//You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

//Letters are case sensitive, so "a" is considered a different type of stone from "A".

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    let jewelsSet = Set(jewels)
    var count = 0
    
    for stone in stones {
        if jewelsSet.contains(stone) {
            count += 1
        }
    }
    
    return count
}

numJewelsInStones("aA", "aAAbbbb")

func sum(numbers: [Int]) -> Int{
    var count = numbers.first ?? 0
    
    for number in numbers.dropFirst() {
        count += number
    }
    return count
}

sum(numbers: [])

func sum2(numbers: [Int]) -> Int{
    var count = 0
    
    if let first = numbers.first {
        let elements = Array(numbers[1..<numbers.endIndex])
        count = first + sum2(numbers: elements)
    }

    
    return count
}

sum2(numbers: [])

//Design a parking system for a parking lot. The parking lot has three kinds of parking spaces: big, medium, and small, with a fixed number of slots for each size.
//Implement the ParkingSystem class:

// - ParkingSystem(int big, int medium, int small) Initializes object of the ParkingSystem class. The number of slots for each parking space are given as part of the constructor.
// - bool addCar(int carType) Checks whether there is a parking space of carType for the car that wants to get into the parking lot. carType can be of three kinds: big, medium, or small, which are represented by 1, 2, and 3 respectively. A car can only park in a parking space of its carType. If there is no space available, return false, else park the car in that size space and return true.

//["ParkingSystem", "addCar", "addCar", "addCar", "addCar"]
//[[1, 1, 0], [1], [2], [3], [1]]

class ParkingSystem {
    
    var big: Int, medium: Int, small: Int

    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.big = big
        self.medium = medium
        self.small = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        
        switch carType {
            case 1:
                big -= 1
                return big >= 0
            case 2:
                medium -= 1
                return medium >= 0
            case 3:
                small -= 1
                return small >= 0
            default:
                return false
        }
    }
}


let parkingSystem = ParkingSystem(1, 1, 0)

parkingSystem.addCar(1)
parkingSystem.addCar(2)
parkingSystem.addCar(3)
parkingSystem.addCar(1)

let parkingSystem2 = ParkingSystem(0, 0, 2)

parkingSystem2.addCar(1)
parkingSystem2.addCar(2)
parkingSystem2.addCar(3)

func findMaxValue(numbers: [Int]) -> Int{
    var max = numbers[0]
    
    for number in numbers.dropFirst() {
        if max < number {
            max = number
        }
    }
    
    return max
}

findMaxValue(numbers: [324324,11234,223,2343,433244,512312,43243,12,323423,322,0])

func findValue(value: Int, in values: [Int]) -> Int? {
    let sortedValues = values.sorted(by: <)
    
    var lowerIndex = 0
    var upperIndex = values.count - 1
    
    while true {
        let currentIndex = (lowerIndex + upperIndex) / 2
        
        if sortedValues[currentIndex] == value {
            return value
        } else if lowerIndex > upperIndex {
            return nil
        } else {
            if sortedValues[currentIndex] > value {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
        
    }
}
findValue(value: 999, in: [324324,11234,223,2343,433244,512312,43243,12,323423,322,0])


//Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
//Return the answer in an array.

//Учитывая количество чисел в массиве, для каждого числа [i] выясните, сколько чисел в массиве меньше его. То есть для каждого числа [i] вы должны посчитать количество допустимых j, таких что j!= i и числа[j] < числа[i].
//Верните ответ в виде массива.

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    
    let sortedNums = nums.sorted()
    var results = [Int]()
    
    for i in 0..<sortedNums.count {
        results.append(sortedNums.firstIndex(of: nums[i]) ?? -1)
    }
    
    return results
}

smallerNumbersThanCurrent([6,5,4,8])

//You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
//Return the shuffled string.

func restoreString(_ s: String, _ indices: [Int]) -> String {
    var str = Array<Character>(repeating: Character("0"), count: s.count)
    
    for (i, char) in s.enumerated() {
        str[indices[i]] = char
    }
    
    return String(str)
}

//restoreString("omm", [1,0,2])
restoreString("codeleet", [4,5,6,7,0,2,1,3])

//s = "codeleet", indices = [4,5,6,7,0,2,1,3]
//Output: "leetcode"

//There is a hidden integer array arr that consists of n non-negative integers.

//It was encoded into another integer array encoded of length n - 1, such that encoded[i] = arr[i] XOR arr[i + 1]. For example, if arr = [1,0,2,1], then encoded = [1,2,3].

//You are given the encoded array. You are also given an integer first, that is the first element of arr, i.e. arr[0].

//Return the original array arr. It can be proved that the answer exists and is unique.

func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    return [0]
}

//Given an integer x, return true if x is palindrome integer.

//An integer is a palindrome when it reads the same backward as forward.

//For example, 121 is a palindrome while 123 is not.

func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }
    var xCopy = x, reverse = 0
    while xCopy != 0 {
        let remainder: Int
        (xCopy, remainder) = xCopy.quotientAndRemainder(dividingBy: 10)
        reverse *= 10
        reverse += remainder
    }
    return x == reverse
}

isPalindrome(121)


// Given an integer number n, return the difference between the product of its digits and the sum of its digits.

func subtractProductAndSum(_ n: Int) -> Int {
    if 1 <= n && n <= 10 ^ 5 { return 0 }
    var cp = n, products = [Int]()
    while cp > 0 {
        products.insert(cp % 10, at: 0)
        cp /= 10
    }
    let product = products.reduce(1, *)
    let sum = products.reduce(0, +)
    return product - sum
}

subtractProductAndSum(690)
