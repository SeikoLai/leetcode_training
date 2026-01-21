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

class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var numbers = nums.enumerated().sorted(by: { $0.element < $1.element })
        
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left].element + numbers[right].element
            if sum == target {
                return [numbers[left].offset, numbers[right].offset]
            }
            else if sum < target {
                left += 1
            }
            else {
                right -= 1
            }
        }
        
        return []
    }
}

let solution = Solution2()
var nums = [2,7,11,15]
var target = 9
var result: [Int] = solution.twoSum(nums, target)
print("target = \(target), numbers = \(nums), result = \(result)")

nums = [3,2,4]
target = 6
result = solution.twoSum(nums, target)
print("target = \(target), numbers = \(nums), result = \(result)")

nums = [3,3]
target = 6
result = solution.twoSum(nums, target)
print("target = \(target), numbers = \(nums), result = \(result)")

nums = [0,4,3,0]
target = 0
result = solution.twoSum(nums, target)
print("target = \(target), numbers = \(nums), result = \(result)")

nums = [-3,4,3,90]
target = 0
result = solution.twoSum(nums, target)
print("target = \(target), numbers = \(nums), result = \(result)")
