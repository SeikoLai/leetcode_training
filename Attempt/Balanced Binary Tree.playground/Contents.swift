/**
 Given a binary tree, determine if it is ``height-balanced``(A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.).
 
 ``Example 1:``
 |----------------------|
 |        3             |
 |       /  \           |
 |      /    \          |
 |     9     20         |
 |          /  \        |
 |         /    \       |
 |        15     7      |
 |----------------------|
 Input: root = [3,9,20,null,null,15,7]
 Output: true
 
 ``Example 2:``
 |----------------------|
 |             1        |
 |            /  \      |
 |           /    \     |
 |          2      2    |
 |         /  \         |
 |        /    \        |
 |       3      3       |
 |      /  \            |
 |     /    \           |
 |    4      4          |
 |----------------------|
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 
 ``Example 3:``
 Input: root = []
 Output: true
 
 ``Constraints:``
 
 `The number of nodes in the tree is in the range [0, 5000].`
 `-10⁴ <= Node.val <= 10⁴`
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        guard root?.right != nil || root?.left != nil else { return true }
        var current = root
        var hasNext = true
        while hasNext {
            if let left = current?.left?.val, let right = current?.right?.val {
                if abs(left - right) <= 1 {
                    hasNext = current?.left?.left != nil || current?.left?.right != nil || current?.right?.left != nil || current?.right?.right != nil
                    if hasNext == false {
                        return false
                    } else {
                        current = (current?.left?.left != nil || current?.left?.right != nil) ? current?.left : current?.right
                    }
                }
                else if current?.left != nil && current?.left?.left != nil || current?.left?.right != nil {
                    current = current?.left
                }
                else if current?.right != nil && current?.right?.left != nil || current?.right?.right != nil {
                    current = current?.right
                }
                else {
                    return true
                }
            } else {
                if current?.left != nil && current?.left?.left != nil || current?.left?.right != nil {
                    current = current?.left
                }
                else if current?.right != nil && current?.right?.left != nil || current?.right?.right != nil {
                    current = current?.right
                }
            }
        }
        return true
    }
}

let s = Solution()
var input = "[3,9,20,null,null,15,7]"
var root : TreeNode? = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
var result = s.isBalanced(root)
print("The input is \(input), the result is \(result)")

input = "[1,2,2,3,3,null,null,4,4]"
root = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2)
)
result = s.isBalanced(root)
print("The input is \(input), the result is \(result)")
