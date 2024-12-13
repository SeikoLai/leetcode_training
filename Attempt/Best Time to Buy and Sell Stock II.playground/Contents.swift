import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var previousPrice: Int = Int.min
        var holdPrice: Int = Int.min
        for price in prices {
            if previousPrice == Int.min {
                previousPrice = price
                continue
            } else if previousPrice > price && profit == 0 {
                previousPrice = price
                continue
            } else if previousPrice < price {
                profit = price - previousPrice + profit
                holdPrice = previousPrice
                previousPrice = price
                continue
            } else if holdPrice > Int.min && price < previousPrice {
                previousPrice = price
                holdPrice = Int.min
                continue
            }
        }
        return profit
    }
}
