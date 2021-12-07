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
