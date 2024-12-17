import Foundation

// Example 1:
// Input: prices = [7,1,5,3,6,4]
// Output: 7
// Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
// Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
// Total profit is 4 + 3 = 7.
//
// Example 2:
// Input: prices = [1,2,3,4,5]
// Output: 4
// Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
// Total profit is 4.
//
// Example 3:
// Input: prices = [7,6,4,3,1]
// Output: 0
// Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var bp = prices[0]
        var profit = 0
        let count = prices.count
        for i in 0..<count {
            let price = prices[i]
            if price > bp {
                profit += price - bp
                bp = price
            }
            if bp > price {
                bp = price
            }
        }
        return profit
    }
}

let solution = Solution()
var testCase = [7,1,5,3,6,4]
var assert = solution.maxProfit(testCase) == 7

testCase = [1,2,3,4,5]
assert = solution.maxProfit(testCase) == 4

testCase = [7,6,4,3,1]
assert = solution.maxProfit(testCase) == 0
