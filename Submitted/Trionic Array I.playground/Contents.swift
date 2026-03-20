/**
 You are given an integer array `nums` of length `n`.
 
 An array is ``trionic`` if there exist indices `0 < p < q < n − 1` such that:
 
 `nums[0...p]` is ``strictly`` increasing,
 `nums[p...q]` is ``strictly`` decreasing,
 `nums[q...n − 1]` is ``strictly`` increasing.
 Return `true` if `nums` is trionic, otherwise return `false`.
 
 
 
 Example 1:
 
 Input: nums = [1,3,5,4,2,6]
 
 Output: true
 
 Explanation:
 
 Pick `p = 2`, `q = 4`:
 
 `nums[0...2] = [1, 3, 5]` is strictly increasing `(1 < 3 < 5)`.
 `nums[2...4] = [5, 4, 2]` is strictly decreasing `(5 > 4 > 2)`.
 `nums[4...5] = [2, 6]` is strictly increasing `(2 < 6)`.
 Example 2:
 
 Input: nums = [2,1,3]
 
 Output: false
 
 Explanation:
 
 There is no way to pick `p` and `q` to form the required three segments.
 
 
 
 Constraints:
 
 `3 <= n <= 100`
 `-1000 <= nums[i] <= 1000`
 
 Hint 1
 Use brute force
 */

class Solution {
    func isTrionic(_ nums: [Int]) -> Bool {
        var p = 0
        let count = nums.count - 1
        while p < count {
            if nums[p] > nums[p + 1] {
                break
            }
            p += 1
        }
        var q = count
        while q > 0 {
            if nums[q] < nums[q - 1] {
                break
            }
            q -= 1
        }
        let part1 = Array(nums[...p])
        let uniquePart1 = Set(part1).sorted()
        if part1 != uniquePart1 {
            return false
        }
        if p >= q {
            return false
        }
        let part2  = Array(nums[p...q])
        let uniquePart2 = Set(part2).sorted(by: >)
        if part2 != uniquePart2 {
            return false
        }
        let part3 = Array(nums[q...])
        let uniquePart3 = Set(part3).sorted()
        if part3 != uniquePart3 {
            return false
        }
        return p > 0 && q < count && p < q
    }
}

let s = Solution()
var nums = [1,3,5,4,2,6]
var result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [2,1,3]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [2,4,3,3]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [1,6,6,3,7]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [6,7,5,1]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [1,2,3]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")

nums = [1,2,1]
result = s.isTrionic(nums)
print("The nums is \(nums) which is\(result ? "" : " not") trionic")
