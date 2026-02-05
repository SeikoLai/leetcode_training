/**
 You are given an integer array `nums` of length `n`.
 
 A ``trionic subarray`` is a contiguous subarray `nums[l...r]` (with `0 <= l < r < n`) for which there exist indices `l < p < q < r` such that:
 
 `nums[l...p]` is ``strictly`` increasing,
 `nums[p...q]` is ``strictly`` decreasing,
 `nums[q...r]` is ``strictly`` increasing.
 Return the ``maximum`` sum of any trionic subarray in `nums`.
 
 
 
 ``Example 1:``
 
 Input: nums = [0,-2,-1,-3,0,2,-1]
 
 Output: -4
 
 Explanation:
 
 Pick `l = 1`, `p = 2`, `q = 3`, `r = 5`:
 
 `nums[l...p] = nums[1...2] = [-2, -1]` is strictly increasing `(-2 < -1)`.
 `nums[p...q] = nums[2...3] = [-1, -3]` is strictly decreasing `(-1 > -3)`
 `nums[q...r] = nums[3...5] = [-3, 0, 2]` is strictly increasing `(-3 < 0 < 2)`.
 Sum = `(-2) + (-1) + (-3) + 0 + 2 = -4`.
 ``Example 2:``
 
 Input: nums = [1,4,2,7]
 
 Output: 14
 
 Explanation:
 
 Pick `l = 0`, `p = 1`, `q = 2`, `r = 3`:
 
 `nums[l...p] = nums[0...1] = [1, 4]` is strictly increasing `(1 < 4)`.
 `nums[p...q] = nums[1...2] = [4, 2]` is strictly decreasing `(4 > 2)`.
 `nums[q...r] = nums[2...3] = [2, 7]` is strictly increasing `(2 < 7)`.
 Sum = `1 + 4 + 2 + 7 = 14`.
 
 
 Constraints:
 
 `4 <= n = nums.length <= 10⁵`
 `-10⁹ <= nums[i] <= 10⁹`
 ``It is guaranteed that at least one trionic subarray exists.``
 
 Hint 1
 Use dynamic programming
 
 Hint 2
 Let four arrays `dp0...dp3` where `dpk[i]` is the max sum of a subarray ending at `i` after finishing `k` of the four phases (start -> inc -> dec -> inc)
 
 Hint 3
 Process each `i>0`
 
 Hint 4
 If `nums[i] > nums[i‑1]`, set `dp1[i]=max(dp1[i‑1]+nums[i], dp0[i‑1]+nums[i]), dp3[i]=max(dp3[i‑1]+nums[i], dp2[i‑1]+nums[i])`
 
 Hint 5
 If `nums[i] < nums[i‑1]`, set `dp2[i]=max(dp2[i‑1]+nums[i], dp1[i‑1]+nums[i])`
 
 Hint 6
 Always carry over `dp0[i]=dp0[i‑1]+nums[i]` when `nums[i]>nums[i‑1]`
 
 Hint 7
 Return the maximum value in `dp3`
 */

class Solution {
    func maxSumTrionic(_ nums: [Int]) -> Int {
        print("The nums are \(nums)")
        var l = 0
        var p = 0
        print("l start at \(l) and is \(nums[l]), p start at \(p) is \(nums[p])")
        while l < nums.count - 1 {
            if nums[l] < nums[l + 1] {
                p = l + 1
                break
            }
            l += 1
        }
        print("l end at \(l) and is \(nums[l]), p end at \(p) is \(nums[p])")
        /**
         A ``trionic subarray`` is a contiguous subarray `nums[l...r]` (with `0 <= l < r < n`) for which there exist indices `l < p < q < r` such that:
         
         [0,-2,-1,-3,0,2,-1]
         */
        var q = p // index = 2, num = -1
        print("q start at \(q) and is \(nums[q])")
        while q < nums.count - 1 {
            if nums[q] > nums[q + 1] {
                q = q + 1
                break
            }
            q += 1
        }
        // q index = 3, num = -3
        print("q end at \(q) and is \(nums[q])")
        /**
         `nums[q...r] = nums[3...5] = [-3, 0, 2]` is strictly increasing `(-3 < 0 < 2)`.
         
         [0,-2,-1,-3,0,2,-1]
         */
        var r = q // index = 3, num = -3
        print("r start at \(r) and is \(nums[r])")
        while r < nums.count - 1 {
            if nums[r] > nums[r + 1] {
                break
            }
            r += 1
        }
        print("r end at \(r) and is \(nums[r])")
        print("l is \(l), p is \(p), q is \(q), and r is \(r)")
        print("The subarray are \(nums[l...p]), \(nums[p...q]), \(nums[q...r])")
        var index = 0
        var result = 0
        while index < nums.count {
            let num = nums[index]
            
            if index >= l && index <= p {
                result += num
            }
            if index > p && index <= q {
                result += num
            }
            if index > q && index <= r {
                result += num
            }
            index += 1
        }
        return result
    }
}

let s = Solution()
//var nums: [Int] = [0,-2,-1,-3,0,2,-1]
var nums: [Int] = [1,4,2,2,3,1,2] // Expected 8
var result = s.maxSumTrionic(nums)
print("The nums is \(nums), the result is \(result)")

//nums = [1,4,2,7]
//result = s.maxSumTrionic(nums)
//print("The nums is \(nums), the result is \(result)")
