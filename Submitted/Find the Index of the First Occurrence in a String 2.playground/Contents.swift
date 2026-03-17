/**
 Given two strings `needle` and `haystack`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.
 
 
 
 ``Example 1:``
 
     Input: haystack = "sadbutsad", needle = "sad"
     Output: 0
     Explanation: "sad" occurs at index 0 and 6.
     The first occurrence is at index 0, so we return 0.
 
 ``Example 2:``
 
     Input: haystack = "leetcode", needle = "leeto"
     Output: -1
     Explanation: "leeto" did not occur in "leetcode", so we return -1.
 
 
 ``Constraints:``
 
 `1 <= haystack.length, needle.length <= 10⁴`
 `haystack and needle consist of only lowercase English characters.`
 */

func strStr(_ haystack: String, _ needle: String) -> Int {

    guard 1 <= haystack.count && haystack.count <= 10_000 && 1 <= needle.count && needle.count <= 10_000 && haystack.lowercased() == haystack && needle.lowercased() == needle && needle.count <= haystack.count else {
        return -1
    }
    return haystack.range(of: needle)?.lowerBound.utf16Offset(in: haystack) ?? -1
}

let haystack1 = "hello", needle1 = "ll" // Output: 2
let haystack2 = "a", needle2 = "a" // Output: 0
let haystack3 = "abc", needle3 = "c" // Output: 2
let haystack4 = "aaaaa", needle4 = "bba" // Output: -1
let haystack5 = "mississippi", needle5 = "issip"

//let result1 = strStr(haystack1, needle1) // Output: 2
let result2 = strStr(haystack2, needle2) // Output: 0
//let result3 = strStr(haystack3, needle3) // Output: 2
let result4 = strStr(haystack4, needle4) // Output: -1
let result5 = strStr(haystack5, needle5) // 4
