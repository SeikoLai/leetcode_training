import Foundation

// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
// Note that you must do this in-place without making a copy of the array.
//
// Example 1:
// Input: nums = [0,1,0,3,12]
// Output: [1,3,12,0,0]
//
// Example 2:
// Input: nums = [0]
// Output: [0]

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        let lastIndex = nums.count-1
        var removedIndex: [Int] = []
        for i in 0...lastIndex {
            if nums[i] == 0 {
                removedIndex.append(i)
                nums.append(0)
            }
        }
        if !removedIndex.isEmpty {
            print(removedIndex)
            for index in removedIndex.reversed() {
                nums.remove(at: index)
            }
        }
    }
}

let solution = Solution()
var testCase = [0,1,0,3,12]
solution.moveZeroes(&testCase)
var assert = testCase == [1,3,12,0,0]

testCase = [0]
solution.moveZeroes(&testCase)
assert = testCase == [0]

testCase = [0,0,1]
solution.moveZeroes(&testCase)
assert = testCase == [1,0,0]

