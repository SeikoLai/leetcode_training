/**
 You are given a directed, weighted graph with `n` nodes labeled from 0 to `n - 1`, and an array `edges` where `edges[i] = [uᵢ, vᵢ, wᵢ]` represents a directed edge from node `uᵢ` to node `vᵢ` with cost `wᵢ`.
 
 Each node `uᵢ` has a switch that can be used at most once: when you arrive at `uᵢ` and have not yet used its switch, you may activate it on one of its incoming edges `vᵢ → uᵢ` reverse that edge to `uᵢ → vᵢ` and immediately traverse it.
 
 The reversal is only valid for that single move, and using a reversed edge costs `2 * wᵢ`.
 
 Return the minimum total cost to travel from node 0 to node `n - 1`. If it is not possible, return -1.
 
 
 
 Example 1:
 
 Input: n = 4, edges = [[0,1,3],[3,1,1],[2,3,4],[0,2,2]]
 
 Output: 5
 
 Explanation:
 
 
 
 Use the path `0 → 1` (cost 3).
 At node 1 reverse the original edge `3 → 1` into `1 → 3` and traverse it at cost `2 * 1 = 2`.
 Total cost is `3 + 2 = 5`.
 Example 2:
 
 Input: n = 4, edges = [[0,2,1],[2,1,1],[1,3,1],[2,3,3]]
 
 Output: 3
 
 Explanation:
 
 No reversal is needed. Take the path `0 → 2` (cost 1), then `2 → 1` (cost 1), then `1 → 3` (cost 1).
 Total cost is 1 + 1 + 1 = 3.
 
 
 Constraints:
 
` 2 <= n <= 5 * 10⁴`
` 1 <= edges.length <= 10⁵`
` edges[i] = [uᵢ, vᵢ, wᵢ]`
` 0 <= uᵢ, vᵢ <= n - 1`
` 1 <= wᵢ <= 1000`
 
 Hint 1
 Do we only need to reverse at most one edge for each node? If so, can we add reversed edges for each node and use the one that helps in the shortest path?
 
 Hint 2
 Add reverse edges: `{u, v, w}` -> `{v, u, 2 * w}`, and use Dijkstra.
 */

class Solution {
    func minCost(_ n: Int, _ edges: [[Int]]) -> Int {
        var reversed: [[Int]] = []
        
        edges.forEach { edge in
            if edge[0] > edge[1] {
                reversed.append(edge)
                reversed.append([edge[1], edge[0], 2 * edge[2]])
            }
            else {
                reversed.append(edge)
            }
        }
        
        reversed.sort(by: {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            }
            else {
                return $0[1] > $1[1]
            }
        })
        
        var cost:[Int] = []
        var index = 0
        
        // Find the root edges.
        reversed.filter { $0[0] == 0 }.forEach { edge in
            var match: Bool = false
            var value = 0
            var nextEdge: [Int] = edge
            
            index = 1
            while index < n {
                let otherEdges = reversed.filter { $0[0] >= index }
                
                for otherEdge in otherEdges {
                    
                    if nextEdge[1] == otherEdge[0] && otherEdge[1] == n - 1 {
                        value += nextEdge[2] + otherEdge[2]
                        match = true
                        
                        break
                    }
                    else if nextEdge[1] == otherEdge[0] {
                        value += otherEdge[2]
                        nextEdge = otherEdge
                        
                    }
                }
                if match { break }
                index += 1
            }
            
            cost.append(value)
            
        }
        
        
        return cost.min()!
    }
}

let s = Solution()
var edges: [[Int]] = [[0,1,3],[3,1,1],[2,3,4],[0,2,2]]
var result = s.minCost(4, edges)
print("The result is \(result)")


edges = [[0,2,1],[2,1,1],[1,3,1],[2,3,3]]
result = s.minCost(4, edges)
print("The result is \(result)")
