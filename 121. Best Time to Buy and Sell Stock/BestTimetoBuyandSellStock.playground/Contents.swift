class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // Get the min value
        var min = prices.min(by: {$0<$1})!
        print(min)
        // Get the min value index
        var minIndex = prices.firstIndex(of: min)!
        // Get the max value by above remaining values
        let max = prices.max(by: {$0<$1})!
        // Get the max value index
        let maxIndex = prices.firstIndex(of: max)!
        
        if maxIndex < minIndex {
//            // Get the max value by above remaining values
//            max = prices.max(by: {$0<$1})!
//            // Get the max value index
//            maxIndex = prices.firstIndex(of: max)!
            // Get the min value
            min = prices[0...maxIndex].min(by: {$0<$1})!
            print(min)
            // Get the min value index
            minIndex = prices.firstIndex(of: min)!
//            print(min)
            if max - min > 0 { return max - min }
        }
        
        
        // Return 0 if max index is less then min index
        guard maxIndex > minIndex else { return 0 }
        // Return the maximum profit
        return max - min
    }
}

var prices = [7,1,5,3,6,4] // Output: 5
var result = Solution().maxProfit(prices)

//prices = [7,6,4,3,1] // Output: 0
//result = Solution().maxProfit(prices)

//prices = [2,4,1] // Output: 2
//result = Solution().maxProfit(prices)
