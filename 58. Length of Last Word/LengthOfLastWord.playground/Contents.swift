func lengthOfLastWord(_ s: String) -> Int {
    // Constraints:
    //
    // 1 <= s.length <= 10^4
    // s consists of only English letters and spaces ' '.
    // There will be at least one word in s.
    guard 1 <= s.count && s.count <= 10_000 else {
        return 0
    }
    
    return s.split(separator: " ").last?.count ?? 0
}

let s1 = "Hello World" // Output: 5
let s2 = "   fly me   to   the moon  " // Output: 4
let s3 = "luffy is still joyboy" // Output: 6

let result1 = lengthOfLastWord(s1) // 5
let result2 = lengthOfLastWord(s2) // 4
let result3 = lengthOfLastWord(s3) // 6

