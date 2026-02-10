/**
 You are given an integer array `nums`.
 
 A ``subarray``(A subarray is a contiguous non-empty sequence of elements within an array.) is called ``balanced`` if the number of ``distinct even`` numbers in the subarray is equal to the number of ``distinct odd`` numbers.
 
 Return the length of the ``longest`` balanced subarray.

 
 ``Example 1:``
 
 Input: nums = [2,5,4,3]
 
 Output: 4
 
 Explanation:
 
 The longest balanced subarray is `[2, 5, 4, 3]`.
 It has 2 distinct even numbers `[2, 4]` and 2 distinct odd numbers `[5, 3]`. Thus, the answer is 4.
 
 ``Example 2:``
 
 Input: nums = [3,2,2,5,4]
 
 Output: 5
 
 Explanation:
 
 The longest balanced subarray is `[3, 2, 2, 5, 4]`.
 It has 2 distinct even numbers `[2, 4]` and 2 distinct odd numbers `[3, 5]`. Thus, the answer is 5.
 
 ``Example 3:``
 
 Input: nums = [1,2,3,2]
 
 Output: 3
 
 Explanation:
 
 The longest balanced subarray is `[2, 3, 2]`.
 It has 1 distinct even number `[2]` and 1 distinct odd number `[3]`. Thus, the answer is 3.
 
 
 Constraints:
 
 `1 <= nums.length <= 1500`
 `1 <= nums[i] <= 10⁵`
 
 Hint 1
 Use brute force
 
 Hint 2
 Try every subarray and use a map/set data structure to track the distinct even and odd numbers
 */


class Solution {
    func longestBalanced(_ nums: [Int]) -> Int {
        var max_len = 0
        
        for i in 0..<nums.count {
            var odd: [Int: Int] = [:]
            var even: [Int: Int] = [:]
                       
            for j in i..<nums.count {
                let num = nums[j]
                if num&1 == 1 {
                    odd[num] = (odd[num] ?? 0) + 1
                }
                else {
                    even[num] = (even[num] ?? 0) + 1
                }
                
                if odd.count == even.count {
                    max_len = max(max_len, j-i+1)
                }
            }
        }
        
        return max_len
    }
}

let s = Solution()
var nums: [Int] = [2,5,4,3]
var result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [3, 2, 2, 5, 4]
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [1,2,3,2]
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [6,2]
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [1,4] // Expected 2
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [13,1,12] // Expected 2
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [14,10,9] // Expected 2
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")

nums = [10,6,10,7]
result = s.longestBalanced(nums)
print("The nums is \(nums), result is \(result)")
