import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        let minPrice = prices.min() ?? 0
        guard var index = prices.firstIndex(where: { $0 == minPrice }) else { return profit }
        while index < prices.count - 1 {
            let next = prices[index+1]
            let current = prices[index]
            
            if current < next {
                profit += next - current
                index += 2
            } else {
                index += 1
            }
        }
        return profit
    }
}
