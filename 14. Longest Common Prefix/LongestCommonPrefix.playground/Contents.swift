import UIKit

func longestCommonPrefix(_ strs: [String]) -> String {
    /// Constraints:
    /// 1 <= strs.length <= 200
    /// 0 <= strs[i].length <= 200
    /// strs[i] consists of only lowercase English letters.
    guard strs.count >= 1 && strs.count <= 200 && strs.map({  $0.count >= 0 && $0.count <= 200 && $0 == $0.lowercased() }).count == strs.count else {
        return ""
    }
    var common = ""
    // Sort the strings by string length
    let sortedStrings = strs.sorted { $0.count < $1.count }
    // Use the shortest string to compare all strings
    let shortest = sortedStrings.first!
    var index = 0
    while index < shortest.count {
        // Get the char index
        let charIndex = shortest.index(shortest.startIndex, offsetBy: index)
        // Use the char index to get the char
        let char = shortest[charIndex]
        // Add the string to list if char at index equal char
        let filterStrings = sortedStrings.filter({
            $0[charIndex] == char })
        // If filter strings' total equal original strings total
        if filterStrings.count == strs.count {
            // Append char to common string
            common.append(char)
        }
        else {
            // Otherwise break loop
            break
        }
        // Shift index
        index = index + 1
    }
    return common
}

let strs1 = ["flower","flow","flight"] // Output: "fl"
let strs2 = ["dog","racecar","car"] // Output: ""
let strs3 = ["cir", "car"] // Output: "c"
let strs4 = ["reflower","flow","flight"] // Output: ""

let result1 = longestCommonPrefix(strs1)
let result2 = longestCommonPrefix(strs2)
let result3 = longestCommonPrefix(strs3)
let result4 = longestCommonPrefix(strs4)
