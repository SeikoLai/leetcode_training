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
 
 `1 <= nums.length <= 10⁵`
 `-10⁹ <= nums[i] <= 10⁹`
 
 Hint 1
 We can perform the simulation using data structures.
 Hint 2
 Maintain an array index and value using a map since we need to find the next and previous ones.
 Hint 3
 Maintain the indices to be removed using a hash set.
 Hint 4
 Maintain the neighbor sums with the smaller indices (set or priority queue).
 Hint 5
 Keep the 3 structures in sync during the removals.
 */

class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        
        func _minimumPairRemoval(_ nums: [Int], _ operations: inout Int) -> Int {
            guard nums != nums.sorted(by: <) else { return operations }
            var sorted = nums.enumerated().sorted { $0.offset < $1.offset }
            
            var index = 0
            var count = sorted.count
            var value = Int.max
            var current = Int.min
            var next = Int.min
            var loop = true
            
            while loop {
                current = sorted[index].element
                index += 1
                next = sorted[index].element
                if current + next < value {
                    value = current + next
                }
                if index == sorted.count - 1, let targetIndex = sorted.firstIndex(
                    where: { $0.element == current }
                ) {	
                    var modified = nums
                    operations += 1
                    let range = targetIndex...targetIndex+1
                    modified.replaceSubrange(range, with: [value])
                    _minimumPairRemoval(modified, &operations)
                    loop = false
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
//var numbers: [Int] = [1,1,4,4,2,-4,-1]
var numbers: [Int] = [2,2,-1,3,-2,2,1,1,1,0,-1]
//var numbers: [Int] = [5,2,3,1]
var operations = s.minimumPairRemoval(numbers)
print("Numbers = \(numbers), operations = \(operations)")
