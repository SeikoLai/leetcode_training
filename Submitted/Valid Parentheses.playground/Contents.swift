/**
 Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.
 
 An input string is valid if:
 
 1. Open brackets must be closed by the same type of brackets.
 2. Open brackets must be closed in the correct order.
 3. Every close bracket has a corresponding open bracket of the same type.
 
 
 ``Example 1:``
 
     Input: s = "()"
     
     Output: true
 
 ``Example 2:``
 
     Input: s = "()[]{}"
     
     Output: true
 
 ``Example 3:``
 
     Input: s = "(]"
     
     Output: false
 
 ``Example 4:``
 
     Input: s = "([])"
     
     Output: true
 
 ``Example 5:``
 
     Input: s = "([)]"
     
     Output: false
 
 
 
 ``Constraints:``
 
 `1 <= s.length <= 10⁴`
 `s consists of parentheses only '()[]{}'.`
 
 Hint 1
 Use a stack of characters.
 
 Hint 2
 When you encounter an opening bracket, push it to the top of the stack.
 
 Hint 3
 When you encounter a closing bracket, check if the top of the stack was the opening for it. If yes, pop it from the stack. Otherwise, return false.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count > 1 else { return false }
        guard s.count%2 == 0 else { return false }
        var characters: [Character] = Array(s)
//        var openIndex: Int = Int.min
//        var closeIndex: Int = Int.min
//        var isFinish: Bool = false
//        while isFinish == false {
//            if characters.isEmpty {
//                isFinish = true
//            }
//            
//            // Find the first closing symbol in the modifiable array.
//            for i in stride(from: 0, through: characters.count-1, by: 1) {
//                if characters[i] == ")" || characters[i] == "]" || characters[i] == "}" {
//                    closeIndex = i
//                    break
//                }
//                if i == characters.count-1 && closeIndex == Int.min {
//                    return false
//                }
//            }
//            let closeSymbol: Character = characters[closeIndex]
//            // In the modifiable array, find the opening symbol that is closest to the closing symbol.
//            for i in stride(from: closeIndex, through: 0, by: -1) {
//                if characters[i] == "(" && closeSymbol == ")" ||
//                    characters[i] == "[" && closeSymbol == "]" ||
//                    characters[i] == "{" && closeSymbol == "}" {
//                    openIndex = i
//                    if closeIndex != openIndex + 1 {
//                        return false
//                    }
//                    break
//                }
//                else {
//                    if i == 0 {
//                        return false
//                    }
//                }
//            }
//            
//            let openSymbol: Character = characters[openIndex]
//            if closeIndex != Int.min && openIndex != Int.min {
//                characters.remove(at: closeIndex)
//                characters.remove(at: openIndex)
//            }
//            
//            isFinish = characters.isEmpty
//            if characters.isEmpty {
//                return true
//            }
//            
//            openIndex = 0
//            closeIndex = 0
//            
//        }
        
        var left: Int = 0
        var right: Int = characters.count-1
        while true {
            if characters.isEmpty {
                return true
            }
            let closeSymbol: Character = characters[left]
            // Find the first closing symbol in the modifiable array.
            if closeSymbol == "(" || closeSymbol == "[" || closeSymbol == "{" {
                left += 1
                right = left - 1
                if left == characters.count {
                    return false
                }
            }
            else if left < right {
                return false
            }
            else if closeSymbol == ")" && characters[right] == "(" ||
                        closeSymbol == "]" && characters[right] == "[" ||
                        closeSymbol == "}" && characters[right] == "{" {
                // In the modifiable array, find the opening symbol that is closest to the closing symbol.
                characters.remove(at: left)
                characters.remove(at: right)
                left = 0
                right = characters.count-1
            }
            else {
                return false
            }
        }
    }
}

let solution = Solution()
var s: String = "()"
//var s: String = "[({])}"
//var s: String = "[({(())}[()])]"
var result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "()[]{}"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "(]"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "([])"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "([)]"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "({{{{}}}))"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "(([]){})"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "[({])}"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "[({(())}[()])]"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "(}{)"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "{}{{}}"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "(("
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "[[[]"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")

s = "(){}}{"
result = solution.isValid(s)
print("\(s) is \(result ? "valid" : "invalid")")
