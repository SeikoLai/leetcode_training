/**
 Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

 ``Example 1:``

------------------
    ❶        ❶
   /  \     /  \
  ❷    ❸  ❷    ❸
-------------------

Input: p = [1,2,3], q = [1,2,3]
Output: true

 ``Example 2:``

------------------
   ❶        ❶
  /           \
 ❷             ❷
-------------------

Input: p = [1,2], q = [1,null,2]
Output: false

 ``Example 3:``

 ------------------
   ❶        ❶
  /  \     /  \
 ❷    ❶  ❶    ❷
 -------------------

 Input: p = [1,2,1], q = [1,1,2]
 Output: false

 ``Constraints:``

 `The number of nodes in both trees is in the range [0, 100].`
 `-10⁴ <= Node.val <= 10⁴`
 */

// Definition for a binary tree node.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        if p == nil && q == nil {
            return true
        }
        else if p == nil && q != nil || p != nil && q == nil {
            return false
        }
        var queue: [[TreeNode]] = []
        var visitedQueue: [[TreeNode]] = []
        queue.append([p!, q!])

        while let currentNode = queue.popLast() {
            
            if currentNode.first!.val != currentNode.last!.val {
                return false
            }
            if currentNode.first!.left == nil && currentNode.last!.left != nil ||
                currentNode.first!.left != nil && currentNode.last!.left == nil ||
                currentNode.first!.right == nil && currentNode.last!.right != nil ||
                currentNode.first!.right != nil && currentNode.last!.right == nil {
                return false
            }
            if !visitedQueue.contains(where: {
                $0.first!.val == currentNode.first!.val &&
                $0.first!.left === currentNode.first!.left &&
                $0.first!.right === currentNode.first!.right
            }) {
                visitedQueue.append(currentNode)

                if let rightP = currentNode.first!.right,
                   let rightQ = currentNode.last!.right {
                    queue.append([rightP, rightQ])
                }
                if let leftP = currentNode.first!.left,
                   let leftQ = currentNode.last!.left {
                    queue.append([leftP, leftQ])
                }
            }
        }

        return true
    }
}

let s = Solution()
var p: TreeNode? = TreeNode(1, TreeNode(2), TreeNode(3))
var q: TreeNode? = TreeNode(1, TreeNode(2), TreeNode(3))
//var p: TreeNode? = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//var q: TreeNode? = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
var result = s.isSameTree(p, q)
print("The p is [1,2,3] and the q is [1,2,3], so the result is \(result)")
//print("The p is [1,null,2,3] and the q is [1,null,2,null,3], so the result is \(result)")
p = TreeNode(1, TreeNode(2), nil)
q = TreeNode(1, nil, TreeNode(2))
result = s.isSameTree(p, q)
print("The p is [1,2] and the q is [1,nil,2], so the result is \(result)")

p = TreeNode(1, TreeNode(2), TreeNode(1))
q = TreeNode(1, TreeNode(1), TreeNode(2))
result = s.isSameTree(p, q)
print("The p is [1,2,1] and the q is [1,1,2], so the result is \(result)")

p = nil
q = nil
result = s.isSameTree(p, q)
print("Both p and q are nil, so the result is \(result)")

//[1]
//[1,null,2]
p = TreeNode(1)
q = TreeNode(1, nil, TreeNode(2))
result = s.isSameTree(p, q)
print("The p is [1] and the q is [1,nil,2], so the result is \(result)")

p = nil
q = TreeNode(0)
result = s.isSameTree(p, q)
print("The p is nil and the q is [0], so the result is \(result)")

//[1,null,2,3]
//[1,null,2,null,3]
p = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
q = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
result = s.isSameTree(p, q)
print("The p is [1,null,2,3] and the q is [1,null,2,null,3], so the result is \(result)")

/*
 ------------------------------------
         ❶             ❶
          \             \
           ❷             ❷
          /  \          /  \
         ❸    ❶       ❶     ❸
               \            /
                ❹          ❹
 -------------------------------------
 */
p = TreeNode(1,
             nil,
             TreeNode(2,
                      TreeNode(3),
                      TreeNode(1,
                               nil,
                               TreeNode(4)
                              )
                     )
)
q = TreeNode(1,
             nil,
             TreeNode(2,
                      TreeNode(1),
                      TreeNode(3,
                               TreeNode(4),
                               nil)
                     )
)
result = s.isSameTree(p, q)
print("The p is [1,null,2,3,1,null,4] and the q is [1,null,2,1,3,4,null], so the result is \(result)")

// [390,255,2266,-273,337,1105,3440,-425,4113,null,null,600,1355,3241,4731,-488,-367,16,null,565,780,1311,1755,3075,3392,4725,4817,null,null,null,null,-187,152,395,null,728,977,1270,null,1611,1786,2991,3175,3286,null,164,null,null,4864,-252,-95,82,null,391,469,638,769,862,1045,1138,null,1460,1663,null,1838,2891,null,null,null,null,3296,3670,4381,null,4905,null,null,null,-58,null,null,null,null,null,null,null,null,734,null,843,958,null,null,null,1163,1445,1533,null,null,null,2111,2792,null,null,null,3493,3933,4302,4488,null,null,null,null,null,null,819,null,null,null,null,1216,null,null,1522,null,1889,2238,2558,2832,null,3519,3848,4090,4165,null,4404,4630,null,null,null,null,null,null,1885,2018,2199,null,2364,2678,null,null,null,3618,3751,null,4006,null,null,4246,null,null,4554,null,null,null,1936,null,null,null,null,2444,2642,2732,null,null,null,null,null,null,null,4253,null,null,null,null,2393,2461,null,null,null,null,4250,null,null,null,null,2537]
//[390,255,2266,-273,337,1105,3440,-425,4113,null,null,600,1355,3241,4731,-488,-367,16,null,565,780,1311,1755,3075,3392,4725,4817,null,null,null,null,-187,152,395,null,728,977,1270,null,1611,1786,2991,3175,3286,null,164,null,null,4864,-252,-95,82,null,391,469,638,769,862,1045,1138,null,1460,1663,null,1838,2891,null,null,null,null,3296,3670,4381,null,4905,null,null,null,-58,null,null,null,null,null,null,null,null,734,null,843,958,null,null,null,1163,1445,1533,null,null,null,2111,2792,null,null,null,3493,3933,4302,4488,null,null,null,null,null,null,819,null,null,null,null,1216,null,null,1522,null,1889,2238,2558,2832,null,3519,3848,4090,4165,null,4404,4630,null,null,null,null,null,null,1885,2018,2199,null,2364,2678,null,null,null,3618,3751,null,4006,null,null,4246,null,null,4554,null,null,null,1936,null,null,null,null,2444,2642,2732,null,null,null,null,null,null,null,4253,null,null,null,null,2461,2393,null,null,null,null,4250,null,null,null,null,2537]

p = TreeNode(
    390,
    TreeNode(
        255,
        TreeNode(
            -273,
             TreeNode(
                -425,
                 TreeNode(-488),
                 TreeNode(-367)
             ),
             TreeNode(
                4113,
                TreeNode(
                    16,
                    TreeNode(
                        -187,
                         TreeNode(-252),
                         TreeNode(
                            -95,
                             nil,
                             TreeNode(-58)
                         )
                    ),
                    TreeNode(
                        152,
                        TreeNode(82),
                        nil
                    )
                ),
                nil
             )
        ),
        TreeNode(337)
    ),
    TreeNode(
        2266,
        TreeNode(
            1105,
            TreeNode(
                600,
                TreeNode(
                    565,
                    TreeNode(
                        395,
                        TreeNode(391),
                        TreeNode(469)
                    ),
                    nil
                ),
                TreeNode(
                    780,
                    TreeNode(
                        728,
                        TreeNode(638),
                        TreeNode(
                            769,
                            TreeNode(734),
                            nil
                        )
                    ),
                    TreeNode(
                        977,
                        TreeNode(
                            862,
                            TreeNode(
                                843,
                                TreeNode(819),
                                nil
                            ),
                            TreeNode(958)
                        ),
                        TreeNode(1045)
                    )
                )
            ),
            TreeNode(
                1355,
                TreeNode(
                    1311,
                    TreeNode(
                        1270,
                        TreeNode(
                            1138,
                            nil,
                            TreeNode(
                                1163,
                                nil,
                                TreeNode(1216)
                            )
                        ),
                        nil
                    ),
                    nil
                ),
                TreeNode(
                    1755,
                    TreeNode(
                        1611,
                        TreeNode(
                            1460,
                            TreeNode(1445),
                            TreeNode(
                                1533,
                                TreeNode(1522),
                                nil
                            )
                        ),
                        TreeNode(1663)
                    ),
                    TreeNode(
                        1786,
                        nil,
                        TreeNode(
                            1838,
                            nil,
                            TreeNode(
                                2111,
                                TreeNode(
                                    1889,
                                    TreeNode(
                                        1885
                                    ),
                                    TreeNode(
                                        2018,
                                        TreeNode(1936),
                                        nil
                                    )
                                ),
                                TreeNode(
                                    2238,
                                    TreeNode(2199),
                                    nil
                                )
                            )
                        )
                    )
                )
            )
        ),
        TreeNode(
            3440,
            TreeNode(
                3241,
                TreeNode(
                    3075,
                    TreeNode(
                        2991,
                        TreeNode(
                            2891,
                            TreeNode(
                                2792,
                                TreeNode(
                                    2558,
                                    TreeNode(
                                        2364,
                                        nil,
                                        TreeNode(
                                            2444,
                                            TreeNode(2393),
                                            TreeNode(
                                                2461,
                                                nil,
                                                TreeNode(2537)
                                            )
                                        )
                                    ),
                                    TreeNode(
                                        2678,
                                        TreeNode(2642),
                                        TreeNode(2732)
                                    )
                                ),
                                TreeNode(2832)
                            ),
                            nil
                        ),
                        nil
                    ),
                    TreeNode(3175)
                ),
                TreeNode(
                    3392,
                    TreeNode(
                        3286,
                        nil,
                        TreeNode(3296)
                    ),
                    nil
                )
            ),
            TreeNode(
                4731,
                TreeNode(
                    4725,
                    TreeNode(
                        164,
                        TreeNode(
                            3670,
                            TreeNode(
                                3493,
                                nil,
                                TreeNode(
                                    3519,
                                    nil,
                                    TreeNode(3618)
                                )
                            ),
                            TreeNode(
                                3933,
                                TreeNode(
                                    3848,
                                    TreeNode(3751),
                                    nil
                                ),
                                TreeNode(
                                    4090,
                                    TreeNode(4006),
                                    nil
                                )
                            )
                        ),
                        TreeNode(
                            4381,
                            TreeNode(
                                4302,
                                TreeNode(
                                    4165,
                                    nil,
                                    TreeNode(
                                        4246,
                                        nil,
                                        TreeNode(
                                            4253,
                                            TreeNode(4250),
                                            nil
                                        )
                                    )
                                ),
                                nil
                            ),
                            TreeNode(
                                4488,
                                TreeNode(4404),
                                TreeNode(
                                    4630,
                                    TreeNode(4554),
                                    nil
                                )
                            )
                        )
                    ),
                    nil
                ),
                TreeNode(
                    4817,
                    nil,
                    TreeNode(
                        4864,
                        nil,
                        TreeNode(4905)
                    )
                )
            )
        )
    )
)

q = TreeNode(
    390,
    TreeNode(
        255,
        TreeNode(
            -273,
             TreeNode(
                -425,
                 TreeNode(-488),
                 TreeNode(-367)
             ),
             TreeNode(
                4113,
                TreeNode(
                    16,
                    TreeNode(
                        -187,
                         TreeNode(-252),
                         TreeNode(
                            -95,
                             nil,
                             TreeNode(-58)
                         )
                    ),
                    TreeNode(
                        152,
                        TreeNode(82),
                        nil
                    )
                ),
                nil
             )
        ),
        TreeNode(337)
    ),
    TreeNode(
        2266,
        TreeNode(
            1105,
            TreeNode(
                600,
                TreeNode(
                    565,
                    TreeNode(
                        395,
                        TreeNode(391),
                        TreeNode(469)
                    ),
                    nil
                ),
                TreeNode(
                    780,
                    TreeNode(
                        728,
                        TreeNode(638),
                        TreeNode(
                            769,
                            TreeNode(734),
                            nil
                        )
                    ),
                    TreeNode(
                        977,
                        TreeNode(
                            862,
                            TreeNode(
                                843,
                                TreeNode(819),
                                nil
                            ),
                            TreeNode(958)
                        ),
                        TreeNode(1045)
                    )
                )
            ),
            TreeNode(
                1355,
                TreeNode(
                    1311,
                    TreeNode(
                        1270,
                        TreeNode(
                            1138,
                            nil,
                            TreeNode(
                                1163,
                                nil,
                                TreeNode(1216)
                            )
                        ),
                        nil
                    ),
                    nil
                ),
                TreeNode(
                    1755,
                    TreeNode(
                        1611,
                        TreeNode(
                            1460,
                            TreeNode(1445),
                            TreeNode(
                                1533,
                                TreeNode(1522),
                                nil
                            )
                        ),
                        TreeNode(1663)
                    ),
                    TreeNode(
                        1786,
                        nil,
                        TreeNode(
                            1838,
                            nil,
                            TreeNode(
                                2111,
                                TreeNode(
                                    1889,
                                    TreeNode(
                                        1885
                                    ),
                                    TreeNode(
                                        2018,
                                        TreeNode(1936),
                                        nil
                                    )
                                ),
                                TreeNode(
                                    2238,
                                    TreeNode(2199),
                                    nil
                                )
                            )
                        )
                    )
                )
            )
        ),
        TreeNode(
            3440,
            TreeNode(
                3241,
                TreeNode(
                    3075,
                    TreeNode(
                        2991,
                        TreeNode(
                            2891,
                            TreeNode(
                                2792,
                                TreeNode(
                                    2558,
                                    TreeNode(
                                        2364,
                                        nil,
                                        TreeNode(
                                            2444,
                                            TreeNode(2461),
                                            TreeNode(
                                                2393,
                                                nil,
                                                TreeNode(2537)
                                            )
                                        )
                                    ),
                                    TreeNode(
                                        2678,
                                        TreeNode(2642),
                                        TreeNode(2732)
                                    )
                                ),
                                TreeNode(2832)
                            ),
                            nil
                        ),
                        nil
                    ),
                    TreeNode(3175)
                ),
                TreeNode(
                    3392,
                    TreeNode(
                        3286,
                        nil,
                        TreeNode(3296)
                    ),
                    nil
                )
            ),
            TreeNode(
                4731,
                TreeNode(
                    4725,
                    TreeNode(
                        164,
                        TreeNode(
                            3670,
                            TreeNode(
                                3493,
                                nil,
                                TreeNode(
                                    3519,
                                    nil,
                                    TreeNode(3618)
                                )
                            ),
                            TreeNode(
                                3933,
                                TreeNode(
                                    3848,
                                    TreeNode(3751),
                                    nil
                                ),
                                TreeNode(
                                    4090,
                                    TreeNode(4006),
                                    nil
                                )
                            )
                        ),
                        TreeNode(
                            4381,
                            TreeNode(
                                4302,
                                TreeNode(
                                    4165,
                                    nil,
                                    TreeNode(
                                        4246,
                                        nil,
                                        TreeNode(
                                            4253,
                                            TreeNode(4250),
                                            nil
                                        )
                                    )
                                ),
                                nil
                            ),
                            TreeNode(
                                4488,
                                TreeNode(4404),
                                TreeNode(
                                    4630,
                                    TreeNode(4554),
                                    nil
                                )
                            )
                        )
                    ),
                    nil
                ),
                TreeNode(
                    4817,
                    nil,
                    TreeNode(
                        4864,
                        nil,
                        TreeNode(4905)
                    )
                )
            )
        )
    )
)



result = s.isSameTree(p, q)
print("result is \(result)")
