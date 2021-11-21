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
