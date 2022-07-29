// Input: n = 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps
let n1 = 2

// Input: n = 3
// Output: 3
// Explanation: There are three ways to climb to the top.
// 1. 1 step + 1 step + 1 step
// 2. 1 step + 2 steps
// 3. 2 steps + 1 step
let n2 = 3

// 1. 1 step + 1 step + 1 step + 1 step
// 2. 1 step + 1 step + 2 steps
// 3. 1 step + 2 steps + 1 step
// 4. 2 steps + 1 step + 1 step
// 5. 2 steps + 2 steps
let n3 = 4

// 1. 1 step + 1 step + 1 step + 1 step + 1 step
// 2. 1 step + 1 step + 1 step + 2 steps
// 3. 1 step + 1 step + 2 steps + 1 step
// 4. 1 step + 2 steps + 1 step + 1 step
// 5. 2 steps + 1 step + 1 step + 1 step
// 6. 2 steps + 2 steps + 1 step
// 7. 2 steps + 1 step + 2 steps
let n4 = 6
func climbStairs(_ n: Int) -> Int {
    var a = 1
    var b = 1
    guard n > 1 else { return a }
    
    (2...n).forEach { _ in
        (a, b) = (a + b, a)
    }
    return a
}
let result1 = climbStairs(n1) // 2
let result2 = climbStairs(n2) // 3
let result3 = climbStairs(n3) // 5
//let result4 = climbStairs(n4) // 7


