import Foundation

// Example 1:
// Input: s = "egg", t = "add"
// Output: true
// Explanation:
// The strings s and t can be made identical by:
// Mapping 'e' to 'a'.
// Mapping 'g' to 'd'.
//
// Example 2:
// Input: s = "foo", t = "bar"
// Output: false
// Explanation:
// The strings s and t can not be made identical as 'o' needs to be mapped to both 'a' and 'r'.
//
// Example 3:
// Input: s = "paper", t = "title"
// Output: true

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        
        guard sArray.count == tArray.count else { return false }
        
        var sToT: [Character: Character] = [:]
        var tToS: [Character: Character] = [:]
        
        for i in 0..<sArray.count {
            let currentS = sArray[i]
            let currentT = tArray[i]
            if let existingT = sToT[currentS] {
                if existingT != currentT {
                    return false
                }
            } else {
                sToT[currentS] = currentT
            }
            
            if let existingS = tToS[currentT] {
                if existingS != currentS {
                    return false
                }
            } else {
                tToS[currentT] = currentS
            }
        }
        return true
    }
}

let solution = Solution()
var testCase = ("egg", "add")
var assert = solution.isIsomorphic(testCase.0, testCase.1) == true

testCase = ("foo", "bar")
assert = solution.isIsomorphic(testCase.0, testCase.1) == false

testCase = ("paper", "title")
assert = solution.isIsomorphic(testCase.0, testCase.1) == true

testCase = ("badc", "baba")
assert = solution.isIsomorphic(testCase.0, testCase.1) == false
