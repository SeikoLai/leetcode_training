/**
 You are given two 0-indexed strings `source` and `target`, both of length `n` and consisting of lowercase English letters. You are also given two 0-indexed character arrays `original` and `changed`, and an integer array `cost`, where `cost[i]` represents the cost of changing the character `original[i]` to the character `changed[i]`.
 
 You start with the string `source`. In one operation, you can pick a character `x` from the string and change it to the character `y` at a cost of `z` if there exists any index `j` such that `cost[j] == z`, `original[j] == x`, and `changed[j] == y`.
 
 Return the minimum cost to convert the string `source` to the string `target` using any number of operations. If it is impossible to convert `source` to `target`, return `-1`.
 
 Note that there may exist indices `i`, `j` such that `original[j] == original[i]` and `changed[j] == changed[i]`.
 
 
 
 Example 1:
 
 Input: source = "abcd", target = "acbe", original = ["a","b","c","c","e","d"], changed = ["b","c","b","e","b","e"], cost = [2,5,5,1,2,20]
 Output: 28
 Explanation: To convert the string "abcd" to string "acbe":
 - Change value at index 1 from 'b' to 'c' at a cost of 5.  a`b`cd -> a`c`cd
 - Change value at index 2 from 'c' to 'e' at a cost of 1.  ac`c`d -> ac`e`d
 - Change value at index 2 from 'e' to 'b' at a cost of 2.  ac`e`d -> ac`b`d
 - Change value at index 3 from 'd' to 'e' at a cost of 20. acb`d` -> acb`e`
 The total cost incurred is 5 + 1 + 2 + 20 = 28.
 It can be shown that this is the minimum possible cost.
 Example 2:
 
 Input: source = "aaaa", target = "bbbb", original = ["a","c"], changed = ["c","b"], cost = [1,2]
 Output: 12
 Explanation: To change the character 'a' to 'b' change the character 'a' to 'c' at a cost of 1, followed by changing the character 'c' to 'b' at a cost of 2, for a total cost of 1 + 2 = 3. To change all occurrences of 'a' to 'b', a total cost of 3 * 4 = 12 is incurred.
 Example 3:
 
 Input: source = "abcd", target = "abce", original = ["a"], changed = ["e"], cost = [10000]
 Output: -1
 Explanation: It is impossible to convert source to target because the value at index 3 cannot be changed from 'd' to 'e'.
 
 
 Constraints:
 
 `1 <= source.length == target.length <= 10⁵`
 `source, target consist of lowercase English letters.`
 `1 <= cost.length == original.length == changed.length <= 2000`
 `original[i], changed[i] are lowercase English letters.`
 `1 <= cost[i] <= 10⁶`
 `original[i] != changed[i]`
 
 Hint 1
 Construct a graph with each letter as a node, and construct an edge `(a, b)` with weight `c` if we can change from character `a` to letter `b` with cost `c`. (Keep the one with the smallest cost in case there are multiple edges between `a` and `b`).`
 
 Hint 2
 Calculate the shortest path for each pair of characters `(source[i], target[i])`. The sum of cost over all `i` in the range `[0, source.length - 1]`. If there is no path between `source[i]` and `target[i]`, the answer is `-1`.
 
 Hint 3
 Any shortest path algorithms will work since we only have `26` nodes. Since we only have at most `26 * 26` pairs, we can save the result to avoid re-calculation.
 
 Hint 4
 We can also use Floyd Warshall's algorithm to precompute all the results.
 */

class Solution {
    func minimumCost(_ source: String, _ target: String, _ original: [Character], _ changed: [Character], _ cost: [Int]) -> Int {
        var difference: [Int: [Character]] = [:]
        var index = 0
        let sourceArray = Array(source)
        let targetArray = Array(target)
        while index < source.count {
            if sourceArray[index] != targetArray[index] {
                difference[index] = [sourceArray[index], targetArray[index]]
            }
            index += 1
        }
        print("difference: \(difference.sorted(by: {$0.key < $1.key}))")
        
        func getCharacterCost(targetChar: Character, sourceChar: Character, original: [Character], changed: [Character], cost: [Int]) -> [Int] {
            var result: [Int] = []
            changed.enumerated().forEach { (index, value) in
                var needCost = -1
                // index = 4
                // targetChar = b
                if value == targetChar {
                    // originalCharr = e
                    let originalChar = original[index]
                    // Match the source char
                    if originalChar == sourceChar {
                        // Get the need cost from cost list then add it to the result list.
                        needCost = cost[index]
                        result.append(needCost)
                    }
                    else {
                        // Find other connect char by originalChar in changed list.
                        // The two chars `e` at index 3 and 5 in the changed list.
                        let connectedChars = changed
                            .enumerated()
                            .filter { $0.element == originalChar }
                        if connectedChars.isEmpty == false {
                            connectedChars.map { item in
                                let connectChar = original[item.offset]
                                if  connectChar == sourceChar {
                                    let originCost = cost[index]
                                    let connectCost = cost[item.offset]
                                    needCost = originCost+connectCost
                                    result.append(needCost)
                                }
                            }
                        }
                        else {
                            // Have other connect char in changed list, add -1 to the result list.
                            result.append(needCost)
                        }
                    }
                }
            }
            
            return result
        }
        
        let totalCost = difference.reduce(0) { (result, item) in
            if let targetChar = item.value.last,
                let sourceChar = item.value.first,
                let cost = getCharacterCost(targetChar: targetChar, sourceChar: sourceChar, original: original, changed: changed, cost: cost).filter({ $0 != -1 }).min() {
                let newCost = result + cost
                return newCost
            } else {
                return result == 0 ? -1 : result
            }
        }
        
        return totalCost
    }
}

let s = Solution()
//var source = "abcd"
//var target = "acbe"
//var original: [Character] = ["a","b","c","c","e","d"]
//var changed: [Character] = ["b","c","b","e","b","e"]
//var cost: [Int] = [2,5,5,1,2,20]
var source = "aaadbdcdac"
var target = "cdbabaddba"
var original: [Character] = ["a","c","b","d","b","a","c"]
var changed: [Character] = ["c","a","d","b","c","b","d"]
var cost: [Int] = [7,2,1,3,6,1,7]
var result = s.minimumCost(source, target, original, changed, cost) // Expected 39
print("Covert \(source) to \(target) with minimum cost: \(result)")

//source = "aaaa"
//target = "bbbb"
//original = ["a","c"]
//changed = ["c","b"]
//cost = [1,2]
//result = s.minimumCost(source, target, original, changed, cost)
//print("Covert \(source) to \(target) with minimum cost: \(result)")
//
//source = "abcd"
//target = "abce"
//original = ["a"]
//changed = ["e"]
//cost = [10000]
//result = s.minimumCost(source, target, original, changed, cost)
//print("Covert \(source) to \(target) with minimum cost: \(result)")
