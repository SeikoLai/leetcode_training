import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k <= nums.count else {
            innerRotate(&nums, k)
            return
        }
        let count = nums.count
        let firstPart = Array(nums.suffix(from: count-k))
        let lastPart = Array(nums.prefix(through: count-1-k))
        nums = firstPart + lastPart
    }
    
    private func innerRotate(_ nums: inout [Int], _ k: Int) {
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

let solution = Solution()
var nums = [1,2,3,4,5,6,7]
let k = 3
print(solution.rotate(&nums, k))
