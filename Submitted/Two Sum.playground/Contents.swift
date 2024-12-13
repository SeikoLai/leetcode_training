class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (i, num) in nums.enumerated() {
            for (j, otherNum) in nums.enumerated() where i != j && num + otherNum <= target {
                if num + otherNum == target {
                    return [i, j]
                }
            }
        }
        return []
    }
}

let solution = Solution()
var nums = [2,7,11,15]
var target = 9
var result: [Int] = solution.twoSum(nums, target)
print(result)

nums = [3,2,4]
target = 6
result = solution.twoSum(nums, target)
print(result)

nums = [3,3]
target = 6
result = solution.twoSum(nums, target)
print(result)

nums = [0,4,3,0]
target = 0
result = solution.twoSum(nums, target)
print(result)

nums = [-3,4,3,90]
target = 0
result = solution.twoSum(nums, target)
print(result)
