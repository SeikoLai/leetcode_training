// https://leetcode.com/problems/merge-sorted-array/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m > 0 else {
            nums1 = nums2
            return
        }
        if m > 0 && m < nums1.count  {
            let removeRange = Range(m...nums1.count-1)
            nums1.removeSubrange(removeRange)
        }
        nums1 = (nums1+nums2).sorted()
    }
}

let solution = Solution()
var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
let result1: () = solution.merge(&nums1, m, nums2, n) // Output: [1,2,2,3,5,6]
nums1 = [1]; m = 1; nums2 = []; n = 0
let result2: () = solution.merge(&nums1, m, nums2, n) // Output: [1]
nums1 = [0]; m = 0; nums2 = [1]; n = 1
let result3: () = solution.merge(&nums1, m, nums2, n) // Output: [1]
nums1 = [-1,0,0,3,3,3,0,0,0]; m = 6; nums2 = [1,2,2]; n = 3
let result4: () = solution.merge(&nums1, m, nums2, n)
