import UIKit

/**
 Given an array of distinct integers `arr`, find all pairs of elements with the minimum absolute difference of any two elements.
 
 Return a list of pairs in ascending order(with respect to pairs), each pair `[a, b]` follows
 
 `a, b` are from `arr`
 `a < b`
 `b - a` equals to the minimum absolute difference of any two elements in `arr`
 
 
 Example 1:
 
 Input: arr = [4,2,1,3]
 Output: [[1,2],[2,3],[3,4]]
 Explanation: The minimum absolute difference is 1. List all pairs with difference equal to 1 in ascending order.
 Example 2:
 
 Input: arr = [1,3,6,10,15]
 Output: [[1,3]]
 Example 3:
 
 Input: arr = [3,8,-10,23,19,-4,-14,27]
 Output: [[-14,-10],[19,23],[23,27]]
 
 
 Constraints:
 
 `2 <= arr.length <= 10⁵`
 `-10⁶ <= arr[i] <= 10⁶`
 */

class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let sorted = arr.sorted(by: <)
        guard arr.count > 2  else { return [sorted] }
        var result: [[Int]] = []
        
        var minimumDiff = Int.max
        var index = 0
        var replace = false
        while index < sorted.count - 1 {
            let current = sorted[index]
            let next = sorted[index+1]
            let currentDiff = next - current
            if currentDiff < minimumDiff {
                minimumDiff = currentDiff
                replace = true
            }
            else if currentDiff >= minimumDiff {
                replace = false
            }
            if replace {
                result.removeAll()
            }
            if currentDiff == minimumDiff {
                result.append([current, next])
            }
            index += 1
        }
        
        return result
    }
}

let s = Solution()
var array = [4,2,1,3]
var result = s.minimumAbsDifference(array)
print("Array = \(array), result = \(result)")

array = [1,3,6,10,15]
result = s.minimumAbsDifference(array)
print("Array = \(array), result = \(result)")

array = [3,8,-10,23,19,-4,-14,27]
result = s.minimumAbsDifference(array)
print("Array = \(array), result = \(result)")

array = [40,11,26,27,-20]
result = s.minimumAbsDifference(array)
print("Array = \(array), result = \(result)")
