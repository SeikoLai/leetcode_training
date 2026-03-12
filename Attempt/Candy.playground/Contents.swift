/**
 There are `n` children standing in a line. Each child is assigned a rating value given in the integer array `ratings`.
 
 You are giving candies to these children subjected to the following requirements:
 
 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.
 
 ``Example 1:``
 
     Input: ratings = [1,0,2]
     Output: 5
     Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 
 ``Example 2:``
 
     Input: ratings = [1,2,2]
     Output: 4
     Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
     The third child gets 1 candy because it satisfies the above two conditions.
 
 
 ``Constraints:``
 
 `n == ratings.length`
 `1 <= n <= 2 * 10⁴`
 `0 <= ratings[i] <= 2 * 10⁴`
 */


class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var candies = 0
        var modifiedRatings = ratings
        
        while modifiedRatings.allSatisfy({ $0 > 0}) {
            var index = 0
            while index < modifiedRatings.count {
                if modifiedRatings[index] > 0 {
                    candies += 1
                } else if modifiedRatings[index - 1] > 0 && modifiedRatings[index] > modifiedRatings[index - 1] {
                    candies += 1
                }
                if modifiedRatings[index] > 0 {
                    modifiedRatings[index] -= 1
                }
                index += 1
            }
        }
        return candies
    }
}

let solution = Solution()
var testCase = [1,0,2]
var result = solution.candy(testCase)

testCase = [1,2,2]
result = solution.candy(testCase)

