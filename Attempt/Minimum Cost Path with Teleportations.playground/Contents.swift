/**
 You are given a `m x n` 2D integer array `grid` and an integer `k`. You start at the top-left cell `(0, 0)` and your goal is to reach the bottom‐right cell `(m - 1, n - 1)`.
 
 There are two types of moves available:
 
 Normal move: You can move right or down from your current cell `(i, j)`, i.e. you can move to `(i, j + 1)` (right) or `(i + 1, j)` (down). The cost is the value of the destination cell.
 
 Teleportation: You can teleport from any cell `(i, j)`, to any cell `(x, y)` such that `grid[x][y] <= grid[i][j]`; the cost of this move is 0. You may teleport at most `k` times.
 
 Return the minimum total cost to reach cell `(m - 1, n - 1)` from `(0, 0)`.
 
 
 
 Example 1:
 
 Input: grid = [[1,3,3],[2,5,4],[4,3,5]], k = 2
 
 Output: 7
 
 Explanation:
 
 Initially we are at (0, 0) and cost is 0.
 ```
 Current Position   Move                New Position    Total Cost
 (0, 0)             Move Down           (1, 0)          0 + 2 = 2
 (1, 0)             Move Right          (1, 1)          2 + 5 = 7
 (1, 1)             Teleport to (2, 2)  (2, 2)          7 + 0 = 7
 The minimum cost to reach bottom-right cell is 7.
 ```
 Example 2:
 
 Input: grid = [[1,2],[2,3],[3,4]], k = 1
 
 Output: 9
 
 Explanation:
 
 Initially we are at (0, 0) and cost is 0.
 
 ```
 Current Position       Move        New Position    Total Cost
 (0, 0)                 Move Down    (1, 0)         0 + 2 = 2
 (1, 0)                 Move Right   (1, 1)         2 + 3 = 5
 (1, 1)                 Move Down    (2, 1)         5 + 4 = 9
 The minimum cost to reach bottom-right cell is 9.
 ```
 
 
 Constraints:
 
 `2 <= m, n <= 80`
 `m == grid.length`
 `n == grid[i].length`
 `0 <= grid[i][j] <= 10⁴`
 `0 <= k <= 10`
 
 Hint 1
 Use dynamic programming to solve the problem efficiently.
 
 Hint 2
 Think of the solution in terms of up to `k` teleportation steps. At each step, compute the minimum cost to reach each cell, either through a normal move or a teleportation from the previous step.
 */

class Solution {
    func minCost(_ grid: [[Int]], _ k: Int) -> Int {
        let goal = [grid.count - 1, grid[0].count - 1]
        print("\nThe grid is \(grid) and k is \(k), goal is \(goal)")
        print("Current Position |  Move             |  New Position  |   Total Cost")
        var cost = 0
        var teleportCount: Int = k
        var position: [Int] = [0, 0]
        var reach: Bool = false
        while !reach{
            if position == goal {
                reach = true
                break
            }
            if isEnableTeleport(position, goal, teleportCount) {
                position = goal
                teleportCount -= 1
                print("\(position)              Teleport to \(goal)  \(goal)            \(cost) + 0 = \(cost)")
                reach = true
                break
            }
            
            let enableMoveRight = enableMoveRight(position, grid)
            let enableMoveDown = enableMoveDown(position, grid)
            let moveRight = enableMoveRight ? moveRight(position) : position
            let moveDown = enableMoveDown ? moveDown(position) : position
            let moveRightCost = enableMoveRight ? moveRightCost(position) : 0
            let moveDownCost = enableMoveDown ? moveDownCost(position) : 0
            if isEnableTeleport(moveRight, goal, teleportCount)
            {
                print("\(position)              Move Right1          \(moveRight)            \(cost) + \(moveRightCost) = \(cost+moveRightCost)")
                cost += moveRightCost
                position = moveRight
            }
            else if isEnableTeleport(moveDown, goal, teleportCount)
            {
                print("\(position)              Move Down1           \(moveDown)            \(cost) + \(moveDownCost) = \(cost+moveDownCost)")
                cost += moveDownCost
                position = moveDown
            }
            else if moveRightCost <= moveDownCost && enableMoveRight ||
                        moveDownCost <= moveRightCost && !enableMoveDown
            {
                print("\(position)              Move Right2          \(moveRight)            \(cost) + \(moveRightCost) = \(cost+moveRightCost)")
                cost += moveRightCost
                position = moveRight
            }
            else if moveDownCost <= moveRightCost && enableMoveDown ||
                        moveRightCost <= moveDownCost && !enableMoveRight
            {
                print("\(position)              Move Down2           \(moveDown)            \(cost) + \(moveDownCost) = \(cost+moveDownCost)")
                cost += moveDownCost
                position = moveDown
            }

        }
        func enableMoveRight(_ position: [Int], _ grid: [[Int]]) -> Bool {
            let enable = position[1] + 1 <= grid[0].count - 1
            return enable
        }
        func moveRight(_ position: [Int]) -> [Int] {
            let newPosition = [position[0], position[1] + 1]
            return newPosition
        }
        func moveRightCost(_ position: [Int]) -> Int {
            let next = [position[0], position[1] + 1]
            let cost = grid[next[0]][next[1]]
            return cost
        }
        func enableMoveDown(_ position: [Int], _ grid: [[Int]]) -> Bool {
            let enable = position[0] + 1 <= grid.count - 1
            return enable
        }
        func moveDown(_ position: [Int]) -> [Int] {
            let newPosition = [position[0] + 1, position[1]]
            return newPosition
        }
        func moveDownCost(_ position: [Int]) -> Int {
            let next = [position[0] + 1, position[1]]
            let cost = grid[next[0]][next[1]]
            return cost
        }
        /// `grid[x][y] <= grid[i][j]`
        func isEnableTeleport(_ position: [Int], _ next: [Int], _ currentCost: Int) -> Bool {
            // position[0] = grid[i] && position[1] = grid[j] / next[0] = grid[x] && next[1] = grid[y]
            let isValid = next[0] <= position[0] && next[1] <= position[1]
            return isValid && currentCost > 0
        }
        
        return cost
    }
}

let s = Solution()
var grid: [[Int]] = [[1,3,3],[2,5,4],[4,3,5]]
var teleportCount: Int = 2
//var grid: [[Int]] = [[3,1],[10,4]]
//var teleportCount: Int = 7
var result = s.minCost(grid, teleportCount)
print(
    "===========\nThe grid is \(grid) , teleport count \(teleportCount) is result is \(result)\n==========="
)

grid = [[1,2],[2,3],[3,4]]
teleportCount = 1
result = s.minCost(grid, teleportCount)
print(
    "===========\nThe grid is \(grid) , teleport count \(teleportCount) is result is \(result)\n==========="
)
