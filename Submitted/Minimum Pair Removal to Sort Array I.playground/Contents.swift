import UIKit

/**
 Given an array `nums`, you can perform the following operation any number of times:
 
 Select the adjacent pair with the minimum sum in `nums`. If multiple such pairs exist, choose the leftmost one.
 Replace the pair with their sum.
 Return the minimum number of operations needed to make the array non-decreasing.
 
 An array is said to be non-decreasing if each element is greater than or equal to its previous element (if it exists).
 
 
 
 Example 1:
 
 Input: nums = [5,2,3,1]
 
 Output: 2
 
 Explanation:
 
 The pair `(3,1)` has the minimum sum of 4. After replacement, `nums = [5,2,4]`.
 The pair `(2,4)` has the minimum sum of 6. After replacement, `nums = [5,6]`.
 The array nums became non-decreasing in two operations.
 
 Example 2:
 
 Input: nums = [1,2,2]
 
 Output: 0
 
 Explanation:
 
 The array `nums` is already sorted.
 
 
 
 Constraints:
 
 `1 <= nums.length <= 50`
 `-1000 <= nums[i] <= 1000`
 */

class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {

        func _minimumPairRemoval(_ numbers: [Int], _ operations: inout Int) -> Int {
            guard numbers != numbers.sorted(by: <) else {
                print("The array \(numbers) is already sorted.")
                return operations
            }
            
            var index = 0
            var value = Int.max
            numbers.enumerated().forEach { (i, num) in
                if i+1 < numbers.count, numbers[i]+numbers[i+1] < value {
                    value = numbers[i]+numbers[i+1]
                    index = i
                }
                if i+1 >= numbers.count {
                    var modifiedNumbers = numbers
                    modifiedNumbers.replaceSubrange(index...index+1, with: [value])
                    operations += 1
                    _minimumPairRemoval(modifiedNumbers, &operations)
                }
            }
            
            return operations
        }
        
        var operations = 0
        _ = _minimumPairRemoval(nums, &operations)
        return operations
    }
}

let s = Solution()
var numbers: [Int] = [2,2,-1,3,-2,2,1,1,1,0,-1]
var operations = s.minimumPairRemoval(numbers)
print("Numbers = \(numbers), operations = \(operations)")

numbers = [1,2,2]
operations = s.minimumPairRemoval(numbers)
print("Numbers = \(numbers), operations = \(operations)")

