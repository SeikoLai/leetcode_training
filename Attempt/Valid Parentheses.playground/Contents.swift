import Foundation

// Example 1:
// Input: s = "()"
// Output: true
//
// Example 2:
// Input: s = "()[]{}"
// Output: true
//
// Example 3:
// Input: s = "(]"
// Output: false
//
// Example 4:
// Input: s = "([])"
// Output: true

class Solution {
    func isValid(_ s: String) -> Bool {
        let parenthesesDict = ["(":")", "[":"]", "{":"}"]
        let parenthesesList = Array(String(s))
        guard parenthesesList.count % 2 == 0 else {
            return false
        }
        let openingParentheses = parenthesesList.filter({ $0 == "(" })
        let closingParentheses = parenthesesList.filter({ $0 == ")" })
        guard openingParentheses.count >= 0 && openingParentheses.count == closingParentheses.count else {
            return false
        }
        let openingBraces = parenthesesList.filter({ $0 == "[" })
        let closingBraces = parenthesesList.filter({ $0 == "]" })
        guard openingBraces.count >= 0 && openingBraces.count == closingBraces.count else {
            return false
        }
        let openingCurlyBraces = parenthesesList.filter({ $0 == "{" })
        let closingCurlyBraces = parenthesesList.filter({ $0 == "}" })
        guard  openingCurlyBraces.count >= 0 && openingCurlyBraces.count == closingCurlyBraces.count else {
            return false
        }
        
        let remaining: [Character] = parenthesesList.reduce(into: parenthesesList) { partialResult, char in
            let target = parenthesesDict[String(char)]
            print("target: \(target)")
            var found = false
            if let index = partialResult.lastIndex(where: { String($0) == target }) {
                print("lastIndex: \(index)")
                if index == 1 {
                    partialResult = Array(partialResult.dropFirst(2))
                    found = true
                } else if index == partialResult.count - 1 {
                    partialResult = Array(partialResult.dropFirst())
                    partialResult = Array(partialResult.dropLast())
                    found = true
                }
            }
            if found == false {
                if let index = partialResult.firstIndex(where: { String($0) == target }) {
                    if index % 2 == 1 {
                        partialResult.remove(at: index)
                        partialResult = Array(partialResult.dropFirst())
                        found = true
                    }
                }
            }
        }
        return remaining.count == 0
    }
}

let solution = Solution()
var testCase = "[({(())}[()])]"
//var testCase = "([])"
var assert = solution.isValid(testCase) == true

//testCase = "()[]{}"
//assert = solution.isValid(testCase) == true
//
//testCase = "(]"
//assert = solution.isValid(testCase) == false
//
//testCase = "([])"
//assert = solution.isValid(testCase) == true
//
//testCase = "(([]){})"
//assert = solution.isValid(testCase) == true
//
//testCase = "[({(())}[()])]"
//assert = solution.isValid(testCase) == true
//
//testCase = "({{{{}}}))"
//assert = solution.isValid(testCase) == false


// [({(())}[()])]
// ({(())}[()])
// {(())}[()]
// (())[()]
// (())[()]
