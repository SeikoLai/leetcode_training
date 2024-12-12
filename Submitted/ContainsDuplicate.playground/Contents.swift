import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var index = 0
        while index < nums.count - 1 {
            let current = nums[index]
            if nums.dropFirst(index+1).contains(current) {
                return true
            } else {
                index += 1
            }
        }
        return false
    }
}
