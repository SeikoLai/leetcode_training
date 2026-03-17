/**
 Given an integer `n`, return `true` if it is a power of two. Otherwise, return `false`.
 
 An integer `n` is a power of two, if there exists an integer `x` such that `n == 2x`.
 
 
 
 ``Example 1:``
 
     Input: n = 1
     Output: true
     Explanation: 2⁰ = 1
 
 ``Example 2:``
 
     Input: n = 16
     Output: true
     Explanation: 2⁴ = 16
 
 ``Example 3:``
 
     Input: n = 3
     Output: false
 
 
 ``Constraints:``
 
 `-2³¹ <= n <= 2³¹ - 1`
 
 
 ``Follow up:`` Could you solve it without loops/recursion?
 */

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        guard case var num = abs(n), num > 1 else { return true }
        while num > 0 {
            if num % 2 != 0 && num > 1 {
                return false
            }
            num /= 2
        }
        return true
    }
    func isPowerOfTwoWithRecursion(_ n: Int) -> Bool {
        return n%2 == 0 ? isPowerOfTwoWithRecursion(n/2) : n == 1
    }
}

var n = 1 // Output: true
var result = Solution().isPowerOfTwoWithRecursion(n)

n = -16 // Output: true
result = Solution().isPowerOfTwoWithRecursion(n)

n = 3 // Output: false
result = Solution().isPowerOfTwoWithRecursion(n)

n = 64
result = Solution().isPowerOfTwoWithRecursion(n)

n = 32
result = Solution().isPowerOfTwoWithRecursion(n)

n = 27
result = Solution().isPowerOfTwoWithRecursion(n)
