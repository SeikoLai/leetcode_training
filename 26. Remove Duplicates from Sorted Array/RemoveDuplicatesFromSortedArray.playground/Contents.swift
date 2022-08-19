func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard case let count = nums.count, count >= 1 && count <= 3*10_000 && nums.map({ $0 >= -100 && $0 <= 100}).count == count else {
        return 0
    }
    nums = Set(nums).sorted()
    return nums.count
}

var nums1 = [1,1,2] // Output: 2, nums = [1,2,_]
var nums2 = [0,0,1,1,1,2,2,3,3,4] // Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
let result1 = removeDuplicates(&nums1)
let result2 = removeDuplicates(&nums2)
