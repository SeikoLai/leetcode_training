import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let removeIndicator: Int = (nums.min() ?? 0) - 1
        var index: Int = 0
        
        while index <= nums.count - 1 {
            if nums[nums.startIndex...index].filter { $0 == nums[index]}.count > 2 {
                nums[index] = removeIndicator
            }
            index += 1
        }
        nums.removeAll(where: { $0 == removeIndicator })
        return nums.count
    }
}

let solution = Solution()
var nums: [Int] = [1,1,1]
print(solution.removeDuplicates(&nums))
