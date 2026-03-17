/**
 You are given a ``sorted unique`` integer array `nums`.
 
 A ``range`` `[a,b]` is the set of all integers from `a` to `b` (inclusive).
 
 Return the ``smallest sorted`` list of ranges that ``cover all the numbers in the array exactly``. That is, each element of `nums` is covered by exactly one of the ranges, and there is no integer `x` such that `x` is in one of the ranges but not in `nums`.
 
 Each range `[a,b]` in the list should be output as:
 
 ● `"a->b"` if `a != b`
 ● `"a"` if `a == b`
 
 
 ``Example 1:``
 
     Input: nums = [0,1,2,4,5,7]
     Output: ["0->2","4->5","7"]
     Explanation: The ranges are:
     [0,2] --> "0->2"
     [4,5] --> "4->5"
     [7,7] --> "7"
 
 ``Example 2:``
 
     Input: nums = [0,2,3,4,6,8,9]
     Output: ["0","2->4","6","8->9"]
     Explanation: The ranges are:
     [0,0] --> "0"
     [2,4] --> "2->4"
     [6,6] --> "6"
     [8,9] --> "8->9"
 
 
 ``Constraints:``
 
 ● `0 <= nums.length <= 20`
 ● `-2³¹ <= nums[i] <= 2³¹ - 1`
 ● `All the values of nums are unique.`
 ● `nums is sorted in ascending order.`
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard let min = nums.min() else {
            return []
        }
        var result: [String] = []
        var previous = min
        var current = min
        var next = min
        for i in stride(from: 0, to: nums.count, by: 1) {
            current = nums[i]
            if i+1 > nums.count - 1 {
                if let last = result.last {
                    let components = last.components(separatedBy: "->")
                    if let last = components.last, last == String(current) {
                        continue
                    }
                    else {
                        result.append("\(current)")
                    }
                }
                else {
                    result.append("\(current)")
                }
                break
            }
            next = nums[i+1]
            if i-1 >= 0 {
                previous = nums[i-1]
            }
            if previous + 1 == current, current + 1 == next {
                if let last = result.last {
                    let components = last.components(separatedBy: "->")
                    result[result.count-1] = "\(components[0])->\(next)"
                }
            }
            else if current + 1 == next {
                result.append("\(current)->\(next)")
            }
            else {
                if let last = result.last {
                    let components = last.components(separatedBy: "->")
                    if let last = components.last, last == String(current) {
                        continue
                    }
                    else {
                        result.append("\(current)")
                    }
                }
                else {
                    result.append("\(current)")
                }
            }
        }
        return result
    }
}

let s = Solution()
var nums: [Int] = [0,2,3,4,6,8,9]
var result: [String] = s.summaryRanges(nums)
print("The nums \(nums) has the following summary ranges: \(result)")

nums = [0,1,2,4,5,7]
result = s.summaryRanges(nums)
print("The nums \(nums) has the following summary ranges: \(result)")
