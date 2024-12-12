import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let numbers = nums
        let uniques = Set(numbers)
        var majority: Int = 0
        var count: Int = 0

        for num in uniques {
            let amount = numbers.filter { $0 == num }.count
            if amount > count {
                count = amount
                majority = num
            }
        }
        return majority
    }
}

print(Solution().majorityElement([2,2,1,1,1,2,2]))
