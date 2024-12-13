class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var sortedPrices = prices
        sortedPrices.sort(by: > )
        if prices == sortedPrices { return 0 }
        
        var min: Int = prices.min() ?? -1
        var max: Int = prices.max() ?? -1
        
        if min == prices.last, let newMin = prices.dropLast().min() {
            min = newMin
        }
        if max == prices.first, let newMax = prices.dropFirst().max() {
            max = newMax
        }
        
        return max - min
    }
}

var prices = [7,1,5,3,6,4] // Expected: 5
var result = Solution().maxProfit(prices)

prices = [7,6,4,3,1] // Expected: 0
result = Solution().maxProfit(prices)

prices = [2,4,1] // Expected: 2
result = Solution().maxProfit(prices)

prices = [2,1,4] // Expected: 3
result = Solution().maxProfit(prices)

prices = [2,1,2,0,1] // Expected: 1
result = Solution().maxProfit(prices)
