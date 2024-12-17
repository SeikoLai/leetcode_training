// Example 1:
// Input: nums = [2,3,1,1,4]
// Output: true
// Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

// Example 2:
// Input: nums = [3,2,1,0,4]
// Output: false
// Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if i + nums[i] >= goal {
                goal = i
                print("Updated goal \(goal)")
            }
        }
        return goal == 0
    }
}

let solution = Solution()
var testCase: [Int] = [0,1]
var result = solution.canJump(testCase)

testCase = [3,2,1,0,4]
result = solution.canJump(testCase)

testCase = [2,3,1,1,4]
result = solution.canJump(testCase)

testCase = [2,0]
result = solution.canJump(testCase)

testCase = [2,0,0]
result = solution.canJump(testCase)

testCase = [2,5,0,0]
result = solution.canJump(testCase)
