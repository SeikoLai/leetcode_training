/**
 You are given a ``0-indexed`` array of integers `nums` of length `n`, and two ``positive integers`` `k` and `dist`.
 
 The ``cost`` of an array is the value of its ``first`` element. For example, the cost of `[1,2,3]` is `1` while the cost of `[3,4,1]` is `3`.
 
 You need to divide `nums` into `k` ``disjoint contiguous`` subarrays`(A subarray is a contiguous non-empty sequence of elements within an array.)`, such that the difference between the starting index of the ``second`` subarray and the starting index of the `kth` subarray should be ``less than or equal to`` `dist`. In other words, if you divide `nums` into the subarrays `nums[0..(i₁ - 1)], nums[i₁..(i2 - 1)], ..., nums[iₖ₋₁..(n - 1)]`, then `iₖ₋₁ - i₁ <= dist`.
 
 Return the ``minimum`` possible sum of the cost of these subarrays.
 
 
 
 Example 1:
 
 Input: nums = [1,3,2,6,4,2], k = 3, dist = 3 
 Output: 5
 Explanation: The best possible way to divide nums into 3 subarrays is: [1,3], [2,6,4], and [2]. This choice is valid because iₖ₋₁ - i₁ is 5 - 2 = 3 which is equal to dist. The total cost is nums[0] + nums[2] + nums[5] which is 1 + 2 + 2 = 5.
 It can be shown that there is no possible way to divide nums into 3 subarrays at a cost lower than 5.
 Example 2:
 
 Input: nums = [10,1,2,2,2,1], k = 4, dist = 3
 Output: 15
 Explanation: The best possible way to divide nums into 4 subarrays is: [10], [1], [2], and [2,2,1]. This choice is valid because iₖ₋₁ - i₁ is 3 - 1 = 2 which is less than dist.Ｌ The total cost is nums[0] + nums[1] + nums[2] + nums[3] which is 10 + 1 + 2 + 2 = 15.
 The division [10], [1], [2,2,2], and [1] is not valid, because the difference between iₖ₋₁ and i₁ is 5 - 1 = 4, which is greater than dist.
 It can be shown that there is no possible way to divide nums into 4 subarrays at a cost lower than 15.
 Example 3:
 
 Input: nums = [10,8,18,9], k = 3, dist = 1
 Output: 36
 Explanation: The best possible way to divide nums into 4 subarrays is: [10], [8], and [18,9]. This choice is valid because iₖ₋₁ - i₁ is 2 - 1 = 1 which is equal to dist.The total cost is nums[0] + nums[1] + nums[2] which is 10 + 8 + 18 = 36.
 The division [10], [8,18], and [9] is not valid, because the difference between iₖ₋₁ and i₁ is 3 - 1 = 2, which is greater than dist.
 It can be shown that there is no possible way to divide nums into 3 subarrays at a cost lower than 36.
 
 
 Constraints:
 
 `3 <= n <= 10⁵`
 `1 <= nums[i] <= 10⁹`
 `3 <= k <= n`
 `k - 2 <= dist <= n - 2`
 
 Hint 1
 For each `i > 0`, try each `nums[i]` as the first element of the second subarray. We need to find the sum of `k - 2` smallest values in the index range `[i + 1, min(i + dist, n - 1)]`.
 
 Hint 2
 Typically, we use a max heap to maintain the top `k - 2` smallest values dynamically. Here we also have a sliding window, which is the index range `[i + 1, min(i + dist, n - 1)]`. We can use another min heap to put unselected values for future use.
 
 Hint 3
 Update the two heaps when iteration over `i`. Ordered/Tree sets are also a good choice since we have to delete elements.
 
 Hint 4
 If the max heap’s size is less than `k - 2`, use the min heap’s value to fill it. If the maximum value in the max heap is larger than the smallest value in the min heap, swap them in the two heaps.
 */

class Solution {
    func minimumCost(_ nums: [Int], _ k: Int, _ dist: Int) -> Int {
        
    }
}
