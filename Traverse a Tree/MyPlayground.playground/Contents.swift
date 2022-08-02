//  Definition for a binary tree node.

import CoreFoundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var numbers:[Int] = []
        numbers.append(root!.val)
        numbers += postorderTraversal(root?.left)
        numbers += postorderTraversal(root?.right)
        return numbers
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var numbers:[Int] = []
        numbers += postorderTraversal(root?.left)
        numbers += postorderTraversal(root?.right)
        numbers.append(root!.val)
        return numbers
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var numbers: [Int] = []
        numbers += inorderTraversal(root?.left)
        numbers.append(root!.val)
        numbers += inorderTraversal(root?.right)
        return numbers
    }
    
    func levelorderTraversal(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var queue = [TreeNode]()
        var output = [[Int]]()
        queue.append(root!)
        
        while queue.isEmpty == false {
            var levelCount = queue.count
            var levelNodes = [Int]()
            
            while levelCount > 0 {
                let node = queue.first!
                queue.removeFirst()
                levelCount -= 1
                
                levelNodes.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            output.append(levelNodes)
        }
        return output
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return false }
        return isSymmetric(root?.left, root?.right)
    }
    
    func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil { return right == nil }
        guard right != nil else { return false }
        guard left!.val == right!.val else { return false }
        return isSymmetric(left?.left, right?.right) && isSymmetric(left?.right, right?.left)
    }
    
    func isSymmetricWithQueue(_ root: TreeNode?) -> Bool {
        guard root != nil else { return false }
        var queue = [TreeNode?]()
        queue.append(root?.left)
        queue.append(root?.right)
        
        while queue.isEmpty == false {
            let node1 = queue.popLast()!
            let node2 = queue.popLast()!
            
            if node1 == nil && node2 == nil {
                continue
            }
            
            if node1?.val != node2?.val {
                return false
            }
            
            queue.append(node1?.left)
            queue.append(node2?.right)
            queue.append(node1?.right)
            queue.append(node2?.left)
        }
        
        return true
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if targetSum == root.val && root.left == nil && root.right == nil { return true }
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }    
}

var root = TreeNode(1, nil, TreeNode(2, TreeNode(3), TreeNode(4)))
// Pre-order Traversal
var result = Solution().preorderTraversal(root)

// In-order Traversal
result = Solution().inorderTraversal(root)

// Post-order Traversal
result = Solution().postorderTraversal(root)

root = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)) , TreeNode(3, TreeNode(6), nil))

result = Solution().preorderTraversal(root)

result = Solution().postorderTraversal(root)

result = Solution().inorderTraversal(root)


// [1,2,2,null,3,null,3]
root = TreeNode(1, TreeNode(2, nil, TreeNode(3)), TreeNode(2, nil, TreeNode(3)))

result = Solution().inorderTraversal(root)

var result1 = Solution().levelorderTraversal(root)

// [3,9,20,null,null,15,7]
root = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))

var result2 = Solution().maxDepth(root)

// [1,null,2]
root = TreeNode(1, nil, TreeNode(2))
result2 = Solution().maxDepth(root)

// [1,2,3]
root = TreeNode(1, TreeNode(2), TreeNode(3))
result2 = Solution().maxDepth(root)


// [1,2,2,3,4,4,3]
root = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
var result3 = Solution().isSymmetric(root)
result3 = Solution().isSymmetricWithQueue(root)

// [5,4,8,11,null,13,4,7,2,null,null,null,1]
root = TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2)), nil), TreeNode(8, TreeNode(13, nil, nil), TreeNode(4, nil, TreeNode(1))))
var result4 = Solution().hasPathSum(root, 22)
