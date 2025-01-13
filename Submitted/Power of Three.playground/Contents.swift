import Foundation

// Given an integer n, return true if it is a power of three. Otherwise, return false.
//
// An integer n is a power of three, if there exists an integer x such that n == 3x.
//
// Example 1:
// Input: n = 27
// Output: true
// Explanation: 27 = 3³
//
// Example 2:
// Input: n = 0
// Output: false
// Explanation: There is no x where 3ˣ = 0.
//
// Example 3:
// Input: n = -1
// Output: false
// Explanation: There is no x where 3ˣ = (-1).

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n < 1 {
            return false
        } else if n == 1 {
            return true
        }
        
        func validateNumber(_ n: Int) -> Int {
            let result = Int(pow(3.0, Double(n)))
            return result
        }
        
        for i in 0...n {
            let validatedNumber = validateNumber(i)
            if validatedNumber == n {
                return true
            } else if validatedNumber > n {
                return false
            }
        }
        
        return false
    }
}


let solution = Solution()
var testCase = 27
var assert = solution.isPowerOfThree(testCase) == true

testCase = 0
assert = solution.isPowerOfThree(testCase) == false

testCase = -1
assert = solution.isPowerOfThree(testCase) == false

testCase = 1
assert = solution.isPowerOfThree(testCase) == true

testCase = -27
assert = solution.isPowerOfThree(testCase) == false

testCase = 45
assert = solution.isPowerOfThree(testCase) == false

testCase = 6
assert = solution.isPowerOfThree(testCase) == false

testCase = 9
assert = solution.isPowerOfThree(testCase) == true
