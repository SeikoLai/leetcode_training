// Constraints:
//
// 0 <= nums.length <= 100
// 0 <= nums[i] <= 50
// 0 <= val <= 100

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    let count = nums.count
    guard 0 <= nums.count && nums.count <= 100 && nums.map({0 <= $0 && $0 >= 50 }).count == count && 0 <= val && val <= 100 else {
        return 0
    }
    nums = nums.filter({$0 != val })
    return nums.count
}

var nums1 = [3,2,2,3], val1 = 3 // Output: 2, nums = [2,2,_,_]
var nums2 = [0,1,2,2,3,0,4,2], val2 = 2 // Output: 5, nums = [0,1,4,0,3,_,_,_]
let result1 = removeElement(&nums1, val1) // Output: 2, nums = [2,2,_,_]
let result2 = removeElement(&nums2, val2) // Output: 5, nums = [0,1,4,0,3,_,_,_]
