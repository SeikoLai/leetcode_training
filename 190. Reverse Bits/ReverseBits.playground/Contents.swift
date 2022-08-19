class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        
        for i in 0..<32 {
            result += (n & 1)
            n >>= 1
            if i < 31 {
                result <<= 1
            }
        }
        return result
    }
}
