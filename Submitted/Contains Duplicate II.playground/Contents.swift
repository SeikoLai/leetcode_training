/**
 Given an integer array `nums` and an integer `k`, return `true` if there are two distinct indices `i` and `j` in the array such that `nums[i] == nums[j]` and `abs(i - j) <= k`.
 
 
 
 ``Example 1:``
 
     Input: nums = [1,2,3,1], k = 3
     Output: true
 
 ``Example 2:``
 
     Input: nums = [1,0,1,1], k = 1
     Output: true
 
 ``Example 3:``
 
     Input: nums = [1,2,3,1,2,3], k = 2
     Output: false
 
 
 ``Constraints:``
 
 `1 <= nums.length <= 10⁵`
 `-10⁹ <= nums[i] <= 10⁹`
 `0 <= k <= 10⁵`
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let uniqueNums = Set(nums).sorted()
        let enumeratedNums = nums.enumerated()
        for num in uniqueNums {
            let duplicateNums = enumeratedNums.filter { $0.element == num }
            for i in 0..<duplicateNums.count where duplicateNums.count > 1 {
                let current = duplicateNums[i]
                let nextIndex = i+1
                let remainingNums = duplicateNums[nextIndex...]
                for remainingNum in remainingNums {
                    if remainingNum.offset - current.offset <= k {
                        return true
                    }
                }
            }
        }
        return false
    }
}

let s = Solution()
var nums: [Int] = [1,2,3,1]
var k: Int = 3
var result = s.containsNearbyDuplicate(nums, k)
print("The nums is \(nums) and the k is \(k), the result is \(result)")

nums = [1,0,1,1]
k = 1
result = s.containsNearbyDuplicate(nums, k)
print("The nums is \(nums) and the k is \(k), the result is \(result)")

nums = [1,2,3,1,2,3]
k = 2
result = s.containsNearbyDuplicate(nums, k)
print("The nums is \(nums) and the k is \(k), the result is \(result)")

