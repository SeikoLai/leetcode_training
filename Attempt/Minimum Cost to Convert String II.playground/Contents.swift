/**
 You are given two 0-indexed strings `source` and `target`, both of length `n` and consisting of lowercase English characters. You are also given two 0-indexed string arrays `original` and `changed`, and an integer array `cost`, where `cost[i]` represents the cost of converting the string `original[i]` to the string `changed[i]`.
 
 You start with the string `source`. In one operation, you can pick a substring `x` from the string, and change it to `y` at a cost of `z` if there exists any index `j` such that `cost[j] == z`, `original[j] == x`, and `changed[j] == y`. You are allowed to do any number of operations, but any pair of operations must satisfy either of these two conditions:
 
 The substrings picked in the operations are `source[a..b]` and `source[c..d]` with either `b < c` or `d < a`. In other words, the indices picked in both operations are ``disjoint``.
 The substrings picked in the operations are `source[a..b]` and `source[c..d]` with `a == c` and `b == d`. In other words, the indices picked in both operations are ``identical``.
 Return the ``minimum`` cost to convert the string `source` to the string `target` using ``any`` number of operations. If it is impossible to convert `source` to `target`, return `-1`.
 
 Note that there may exist indices `i`, `j` such that `original[j] == original[i]` and `changed[j] == changed[i]`.
 
 
 
 Example 1:
 
 Input: source = "abcd", target = "acbe", original = ["a","b","c","c","e","d"], changed = ["b","c","b","e","b","e"], cost = [2,5,5,1,2,20]
 Output: 28
 Explanation: To convert "abcd" to "acbe", do the following operations:
 
 step1: a``b``cd -> a``c``cd (source[1..1] cost = 5)
 - Change substring source[1..1] from "b" to "c" at a cost of 5.
 
 step2: ac``c``d -> ac``e``d (source[2..2] cost = 1)
 - Change substring source[2..2] from "c" to "e" at a cost of 1.
 
 step3: ac``e``d -> ac``b``d (source[2..2] cost = 2)
 - Change substring source[2..2] from "e" to "b" at a cost of 2.
 
 step4: acb``d`` -> acb``e`` (source[3..3] cost = 20)
 - Change substring source[3..3] from "d" to "e" at a cost of 20.
 
 The total cost incurred is 5 + 1 + 2 + 20 = 28.
 It can be shown that this is the minimum possible cost.
 
 Example 2:
 
 Input: source = "abcdefgh", target = "acdeeghh", original = ["bcd","fgh","thh"], changed = ["cde","thh","ghh"], cost = [1,3,5]
 Output: 9
 Explanation: To convert "abcdefgh" to "acdeeghh", do the following operations:
 
 step1: a``bcd``efgh -> a``cde``efgh (source[1..3] cost = 1)
 - Change substring source[1..3] from "``bcd``" to "``cde``" at a cost of 1.
 
 step1: acdee``fgh`` -> acdee``thh`` (source[5..7] cost = 3)
 - Change substring source[5..7] from "``fgh``" to "``thh``" at a cost of 3. We can do this operation because indices [5,7] are ``disjoint`` with indices picked in the first operation.
 
 step3: acdee``thh`` -> acdee``ghh`` (source[5..7] cost = 5)
 - Change substring source[5..7] from "``thh``" to "``ghh``" at a cost of 5. We can do this operation because indices [5,7] are ``disjoint`` with indices picked in the first operation, and ``identical`` with indices picked in the second operation.
 
 The total cost incurred is 1 + 3 + 5 = 9.
 It can be shown that this is the minimum possible cost.
 
 Example 3:
 
 Input: source = "abcdefgh", target = "addddddd", original = ["bcd","defgh"], changed = ["ddd","ddddd"], cost = [100,1578]
 Output: -1
 Explanation: It is impossible to convert "abcdefgh" to "adddefgh".
 
 tryA: a``bcd``efgh -> a``ddd``efgh -> add``defgh`` -> add``ddddd`` (source[1..3] ``joint`` with source[3..7] so can not operation)
 If you select substring source[1..3] as the first operation to change "abcdefgh" to "adddefgh", you cannot select substring source[3..7] as the second operation because it has a common index, 3, with the first operation.
 
 tryB: abc``defgh`` -> abc``ddddd`` -> a``bcd``dddd -> a``ddd``dddd (source[3..7] ``joint`` with source[1..3] so can not operation)
 If you select substring source[3..7] as the first operation to change "abcdefgh" to "abcddddd", you cannot select substring source[1..3] as the second operation because it has a common index, 3, with the first operation.
 
 
 Constraints:
 
 `1 <= source.length == target.length <= 1000`
 `source, target consist only of lowercase English characters.`
 `1 <= cost.length == original.length == changed.length <= 100`
 `1 <= original[i].length == changed[i].length <= source.length`
 `original[i], changed[i] consist only of lowercase English characters.`
 `original[i] != changed[i]`
 `1 <= cost[i] <= 10⁶`
 
 Hint 1
 Give each unique string in `original` and `changed` arrays a unique id. There are at most `2 * m` unique strings in total where `m` is the length of the arrays. We can put them into a hash map to assign ids.
 
 Hint 2
 We can pre-compute the smallest costs between all pairs of unique strings using Floyd Warshall algorithm in `O(m ^ 3)` time complexity.
 
 Hint 3
 Let `dp[i]` be the smallest cost to change the first `i` characters (prefix) of `source` into `target`, leaving the suffix untouched. We have `dp[0] = 0`.
 `dp[i] = min(dp[i - 1] if (source[i - 1] == target[i - 1]),dp[j-1] + cost[x][y] where x is the id of source[j..(i - 1)] and y is the id of target e[j..(i - 1)]))`.
 If neither of the two conditions is satisfied, `dp[i] = infinity`.
 
 Hint 4
 We can use Trie to check for the second condition in `O(1)`.
 
 Hint 5
 The answer is `dp[n]` where `n` is `source.length`.
 */

class Solution {
    func minimumCost(_ source: String, _ target: String, _ original: [String], _ changed: [String], _ cost: [Int]) -> Int {
        
        let sourceArray = Array(source)
        let targetArray = Array(target)
        var index = 0
        
        while index < sourceArray.count {
            let sourceChar = sourceArray[index]
            let targetChar = targetArray[index]
            
            if sourceChar != targetChar {
                changed.enumerated().filter { $0.element == String(targetChar) }.map { changedItem in
                    original.enumerated().map { originalItem in
                        if changedItem.offset == originalItem.offset {
                    
                        }
                    }
                }
            }
            
            index += 1
        }
        
        return 0
    }
}

let s = Solution()
var source = "abcd"
var target = "acbe"
var original: [String] = ["a","b","c","c","e","d"]
var changed: [String] = ["b","c","b","e","b","e"]
var cost: [Int] = [2,5,5,1,2,20]
//var source = "aaadbdcdac"
//var target = "cdbabaddba"
//var original: [Character] = ["a","c","b","d","b","a","c"]
//var changed: [Character] = ["c","a","d","b","c","b","d"]
//var cost: [Int] = [7,2,1,3,6,1,7]
var result = s.minimumCost(source, target, original, changed, cost) // Expected 39
print("Covert \(source) to \(target) with minimum cost: \(result)")
