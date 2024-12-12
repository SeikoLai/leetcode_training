import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let numbers = Array(Set(nums)).sorted(by: <)
        nums = numbers
        return numbers.count
    }
}
