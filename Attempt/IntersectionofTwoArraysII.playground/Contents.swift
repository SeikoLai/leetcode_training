import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let target = nums1.count <= nums2.count ? nums1 : nums2
        var numbers = nums2 == target ? nums1 : nums2
        var result: [Int] = []
        for num in target {
            if numbers.contains(num) {
                result.append(num)
                numbers.removeFirst(num)
            }
        }
        return result
    }
}

