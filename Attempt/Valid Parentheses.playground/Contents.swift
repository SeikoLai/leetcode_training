// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
// An input string is valid if:
//
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.

func isValid(_ s: String) -> Bool {
    // Constraints:
    //
    // 1 <= s.length <= 10^4
    // s consists of parentheses only '()[]{}'.
    guard s.count >= 1 && s.count <= 10_000 && s.filter({ $0 == "(" || $0 == ")" || $0 == "[" || $0 == "]" || $0 == "{" || $0 == "}" }).count == s.count && s.count % 2 == 0 else {
        return false
    }
    
    let chars: [Character] = Array(s)
    let reversedChars = Array(String(s.reversed()))
    var index = 0
    var shift = 1
    while index < chars.count {
        
        index = index + shift
    }

    
    return true
}

let s1 = "()" // Output: true
let s2 = "()[]{}" // Output: true
let s3 = "(]" // Output: false
let s4 = "Swift"
let s5 = "{[()]}"
let s6 = "{[(Swift)]}"
let s7 = "(){}}{"
let s8 = "({{{{}}}))"
let s9 = "[([]])"
let s10 = "}{"

//let result1 = isValid(s1) // true
let result2 = isValid(s2) // true
//let result3 = isValid(s3) // false
//let result4 = isValid(s4) // false
//let result5 = isValid(s5) // true
//let result6 = isValid(s6) // false
//let result7 = isValid(s7) // false
//let result8 = isValid(s8) // false
//let result9 = isValid(s9) // false
//let result10 = isValid(s10) // false


