/// Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
/// You must write an algorithm with O(log n) runtime complexity.
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    // Constraints:
    //
    // 1 <= nums.length <= 10^4
    // -10^4 <= nums[i] <= 10^4
    // nums contains distinct values sorted in ascending order.
    // -10^4 <= target <= 10^4
    guard 1 <= nums.count && nums.count <= 10_000 && nums.map({ -10_000 <= $0 && $0 <= 10_000 }).count == nums.count && -10_000 <= target && target <= 10_000 else {
        return 0
    }
    var index = 0
    repeat {
        if nums[index] == target { return index }
        if index > 0 && nums[index - 1] < target && nums[index] > target { return index }
        if index + 1 == nums.count && nums[index] < target { return index + 1 }
        if nums[index] > target { return index }
        index = index + 1
    } while ( index < nums.count )
    return index
}


let nums1 = [1,3,5,6], target1 = 5 // Output: 2
let nums2 = [1,3,5,6], target2 = 2 // Output: 1
let nums3 = [1,3,5,6], target3 = 7 // Output: 4
let nums4 = [1,3,5,6], target4 = 0 // Output: 0


let result1 = searchInsert(nums1, target1) // Output: 2
let result2 = searchInsert(nums2, target2) // Output: 1
let result3 = searchInsert(nums3, target3) // Output: 4
let result4 = searchInsert(nums4, target4) // Output: 4
