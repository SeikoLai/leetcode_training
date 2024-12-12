import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var index = 0
        while index < k {
            guard let last = nums.last else { break }
            var numbers = Array(arrayLiteral: last)
            numbers.append(contentsOf: nums.dropLast())
            nums = numbers
            index += 1
        }
    }
}
