/**
 You are given an integer array `nums` and an integer `k`.
 
 An array is considered balanced if the value of its ``maximum`` element is ``at most`` `k` times the ``minimum`` element.
 
 You may remove ``any`` number of elements from `nums`​​​​​​​ without making it ``empty``.
 
 Return the ``minimum`` number of elements to remove so that the remaining array is balanced.
 
 ``Note``: An array of size 1 is considered balanced as its maximum and minimum are equal, and the condition always holds true.
 
 
 
 ``Example 1:``
 
 Input: nums = [2,1,5], k = 2
 
 Output: 1
 
 Explanation:
 
 Remove `nums[2] = 5` to get `nums = [2, 1]`.
 Now `max = 2`, `min = 1` and `max <= min * k` as `2 <= 1 * 2`. Thus, the answer is 1.
 Example 2:
 
 Input: nums = [1,6,2,9], k = 3
 [1, 2, 6, 9]
 [1, 2] ==> 2 <= 1 * 3 / i = 0, j = 1
 [1, 6] ==> 6 > 1 * 3 / i = 0, j = 2
 [1, 9] ==> 9 > 1 * 3 / i = 0, j = 3
 [2, 6] ==> 6 <= 2 * 3 / i = 1, j = 2
 [2, 9] ==> 9 > 2 * 3 / i = 1, j = 3
 [6, 9] ==> 9 <= 6 * 3 / i = 2, j = 3
 Output: 2
 
 Explanation:
 
 Remove `nums[0] = 1` and `nums[3] = 9` to get `nums = [6, 2]`.
 Now `max = 6`, `min = 2` and `max <= min * k` as `6 <= 2 * 3`. Thus, the answer is 2.
 Example 3:
 
 Input: nums = [4,6], k = 2
 
 Output: 0
 
 Explanation:
 
 Since `nums` is already balanced as `6 <= 4 * 2`, no elements need to be removed.
 
 
 Constraints:
 
 `1 <= nums.length <= 10⁵`
 `1 <= nums[i] <= 10⁹`
 `1 <= k <= 10⁵`
 
 Hint 1
 Sort `nums` and use two pointers `i` and `j` so that the window's minimum is `nums[i]` and maximum is `nums[j]`.
 
 Hint 2
 Expand `j` while `nums[j] <= k * nums[i]` to maximize the balanced window; answer = `n - (j - i + 1)`.
 */

class Solution {
    func minRemoval(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= 2 else { return 0 }
        var sorted = nums.sorted(by: <)
        
        var i = 0, j = 1
        var index = 0
        while index < sorted.count - 1, i < sorted.count - 1 {
//            print("Index \(index), i \(i), j \(j)")
            if sorted[j] <= sorted[i] * k {
//                print("Because \(sorted[j]) <= \(sorted[i]) * \(k), increment j(\(j)) to j+1(\(j + 1))")
                j += 1
            }
            if j == sorted.count - 1 {
//                print("Because j(\(j)) == sorted.count(\(sorted.count)), increment i(\(i)) to i+1(\(i + 1))")
                i += 1
                j = i + 1
            }
//            print("Increment index = \(index) to \(index + 1)")
            index += 1
        }
        return nums.count - (j - i + 1)
    }
}

let s = Solution()
var nums: [Int] = [2,1,5]
var k: Int = 2
var result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [1,6,2,9]; k = 3
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [4,6]; k = 2
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [2,12]; k = 2
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [6,18]; k = 1
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [33,6,19]; k = 1 // Expected 2
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

nums = [30,32,30]; k = 2 // Expected 0
result = s.minRemoval(nums, k)
print("The result is \(result) from \(nums) with \(k)")

// [30, 30, 32]
// [30, 30] ==> 30 <= 30 * 2
// [30, 32] ==> 32 <= 30 * 2
