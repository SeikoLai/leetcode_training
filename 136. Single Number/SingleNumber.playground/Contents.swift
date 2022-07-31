class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var unique:[Int] = []
        var index = 0
        
        while index < nums.count {
            let num = nums[index]
            if unique.contains(num) {
                unique.removeAll(where: { $0 == num })
            }
            else {
                unique.append(num)
            }
            index += 1
        }
        return unique.first!
    }
    func singleNumber2(_ nums: [Int]) -> Int {
        var index = 0
        
        while index < nums.count {
            let number = nums[index]
            let unique = nums.filter({ $0 == number })
            if unique.count == 1 {
                return unique.first!
            }
            index += 1
        }
        return 0
    }
    func singleNumber3(_ nums: [Int]) -> Int {
        var numbers = nums
        while true {
            let unique = numbers.popLast()
            if !numbers.contains(unique!) {
                return unique!
            }
            else {
                numbers = numbers.filter({$0 != unique})
            }
        }
    }
}

let solution = Solution()

var nums = [2,2,1]

let result1 = solution.singleNumber3(nums)

nums = [4,1,2,1,2]
let result2 = solution.singleNumber3(nums)

nums = [1]
let result3 = solution.singleNumber3(nums)
