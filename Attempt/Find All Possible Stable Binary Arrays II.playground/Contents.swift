/**
 You are given 3 positive integers `zero`, `one`, and `limit`.
 
 A ``binary array`` `arr` is called ``stable`` if:
 
 The number of occurrences of 0 in `arr` is ``exactly`` `zero`.
 The number of occurrences of 1 in `arr` is ``exactly`` `one`.
 Each ``subarray`` of `arr` with a size greater than `limit` must contain both 0 and 1.
 Return the total number of ``stable`` binary arrays.
 
 Since the answer may be very large, return it ``modulo`` `10⁹ + 7`.
 
 
 
 ``Example 1:``
 
     Input: zero = 1, one = 1, limit = 2
     
     Output: 2
     
     Explanation:
     
     The two possible stable binary arrays are `[1,0]` and `[0,1]`.
 
 ``Example 2:``
 
     Input: zero = 1, one = 2, limit = 1
     
     Output: 1
     
     Explanation:
     
     The only possible stable binary array is `[1,0,1]`.
 
 ``Example 3:``
 
     Input: zero = 3, one = 3, limit = 2
     
     Output: 14
     
     Explanation:
     
     All the possible stable binary arrays are `[0,0,1,0,1,1]`, `[0,0,1,1,0,1]`, `[0,1,0,0,1,1]`, `[0,1,0,1,0,1]`, `[0,1,0,1,1,0]`, `[0,1,1,0,0,1]`, `[0,1,1,0,1,0]`, `[1,0,0,1,0,1]`, `[1,0,0,1,1,0]`, `[1,0,1,0,0,1]`, `[1,0,1,0,1,0]`, `[1,0,1,1,0,0]`, `[1,1,0,0,1,0]`, and `[1,1,0,1,0,0]`.
 
 
 
 ``Constraints:``
 
 `1 <= zero, one, limit <= 1000`
 
 Hint 1
 Let `dp[x][y][z = 0/1]` be the number of stable arrays with exactly `x` zeros, `y` ones, and the last element is `z`. (0 or 1). `dp[x][y][0] + dp[x][y][1]` is the answer for given `(x, y)`.
 
 Hint 2
 If we have already placed `x` 1 and `y` 0, if we place a group of `k` 0, the number of ways is `dp[x-k][y][1]`. We can place a group with size `i`, where `i` varies from 1 to `min(limit, zero - x)`. Similarly, we can solve by placing a group of ones.
 
 Hint 3
 Speed up the calculation using prefix arrays to store the sum of `dp` states.
 */
