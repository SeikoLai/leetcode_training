import Foundation

// Example 1:
// Input: pattern = "abba", s = "dog cat cat dog"
// Output: true
// Explanation:
// The bijection can be established as:
// 'a' maps to "dog".
// 'b' maps to "cat".
//
// Example 2:
// Input: pattern = "abba", s = "dog cat cat fish"
// Output: false
//
// Example 3:
// Input: pattern = "aaaa", s = "dog cat cat dog"
// Output: false

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let patternArray = Array(pattern)
        let wordArray = Array(s.components(separatedBy: " "))
        guard patternArray.count == wordArray.count else { return false }
        
        var patternToWord: [Character: String] = [:]
        var wordToPattern: [String: Character] = [:]
        
        for i in 0..<patternArray.count {
            let currentPattern = patternArray[i]
            let currentWord = wordArray[i]
            
            if let existingWord = patternToWord[currentPattern] {
                if existingWord != currentWord {
                    return false
                }
            } else {
                patternToWord[currentPattern] = currentWord
            }
            
            if let existingPattern = wordToPattern[currentWord] {
                if existingPattern != currentPattern {
                    return false
                }
            } else {
                wordToPattern[currentWord] = currentPattern
            }
        }
        return true
    }
}

let solution = Solution()
var testCase: (String, String) = ("abba", "dog cat cat dog")
var assert = solution.wordPattern(testCase.0, testCase.1) == true

testCase = ("abba", "dog cat cat fish")
assert = solution.wordPattern(testCase.0, testCase.1) == false

testCase = ("aaaa", "dog cat cat dog")
assert = solution.wordPattern(testCase.0, testCase.1) == false

testCase = ("abba", "dog dog dog dog")
assert = solution.wordPattern(testCase.0, testCase.1) == false

testCase = ("abc", "dog cat dog")
assert = solution.wordPattern(testCase.0, testCase.1) == false

testCase = ("aba", "cat cat cat dog")
assert = solution.wordPattern(testCase.0, testCase.1) == false

testCase = ("aba", "dog cat cat")
assert = solution.wordPattern(testCase.0, testCase.1) == false
