import Foundation

// Given a positive integer n, write a function that returns the number of
// set bits
//  in its binary representation (also known as the Hamming weight).
//
// Example 1:
// Input: n = 11
// Output: 3
// Explanation:
// The input binary string 1011 has a total of three set bits.
//
// Example 2:
// Input: n = 128
// Output: 1
// Explanation:
// The input binary string 10000000 has a total of one set bit.
//
// Example 3:
// Input: n = 2147483645
// Output: 30
// Explanation:
// The input binary string 1111111111111111111111111111101 has a total of thirty set bits.

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        let binary = String(n, radix: 2)
        let binaries = Array(binary)
        var result = 0
        for i in 0...binaries.count-1 {
            if binaries[i] == "1" {
                result += 1
            }
        }
        return result
    }
}

let solution = Solution()
var testCase = 11
var assertion = solution.hammingWeight(testCase) == 3

testCase = 128
assertion = solution.hammingWeight(testCase) == 1

testCase = 2147483645
assertion = solution.hammingWeight(testCase) == 30
