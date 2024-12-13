// Example 1:
//
// Input: s = "the sky is blue"
// Output: "blue is sky the"
// Example 2:
//
// Input: s = "  hello world  "
// Output: "world hello"
// Explanation: Your reversed string should not contain leading or trailing spaces.
// Example 3:
//
// Input: s = "a good   example"
// Output: "example good a"
// Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let trimmedWhitespaceSentence = s.trimmingCharacters(in: .whitespaces)
        let words = trimmedWhitespaceSentence.split(separator: " ")
        let trimmedWhitespaceWords = words.compactMap { $0.trimmingCharacters(in: .whitespaces) }
        return trimmedWhitespaceWords.reversed().joined(separator: " ")
    }
}

let solution = Solution()
var s = "the sky is blue"
var result = solution.reverseWords(s)
print(result)

s = "  hello world  "
result = solution.reverseWords(s)
print(result)

s = "a good   example"
result = solution.reverseWords(s)
print(result)
