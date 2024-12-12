import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard 1 <= haystack.count &&
                haystack.count <= 10_000 &&
                1 <= needle.count &&
                needle.count <= 10_000 &&
                haystack.lowercased() == haystack &&
                needle.lowercased() == needle &&
                needle.count <= haystack.count else {
            return -1
        }
        guard let range = haystack.range(of: needle) else {
            return -1
        }
        return range.lowerBound.utf16Offset(in: haystack)
    }
}
