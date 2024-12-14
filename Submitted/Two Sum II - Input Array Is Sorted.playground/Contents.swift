import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        for (i, number) in numbers.enumerated() {
            for (j, otherNumber) in numbers.enumerated() where i != j {
                if number + otherNumber == target {
                    return [i+1, j+1]
                }
            }
        }
        return []
    }
    
    func bestTwoSumSolution(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
}

let solution = Solution()
var testCase = [2,7,11,15]
var target = 9
var result = solution.twoSum(testCase, target)

testCase = [2,3,4]
target = 6
result = solution.twoSum(testCase, target)

testCase = [-1,0]
target = -1
result = solution.twoSum(testCase, target)


