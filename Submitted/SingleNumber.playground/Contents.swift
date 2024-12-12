import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        
        let uniqueNums = Set(nums)
        for number in uniqueNums {
            if nums.filter({ $0 == number }).count == 1 {
                return number
            }
        }
        return 0
    }
}

