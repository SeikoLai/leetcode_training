import Foundation

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var result: [String] = []
        var range: String = ""
        for num, index in nums.enumerated() {
            if nums[index+1] - 1 != num {
                result.append(String(num))
            } else {
                range += String(num)
            }
        }
    }
}
