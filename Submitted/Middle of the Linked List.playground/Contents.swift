/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createNode(_ val: Int, _ next: ListNode?) -> ListNode {
    return next != nil ? ListNode(val, next) : ListNode(val)
}

func createHeadNode(_ nums: [Int]) -> ListNode {
    var index = 0
    var nodes: [ListNode] = []
    while index < nums.count {
        let node = ListNode(nums[index])
        if case let next = index + 1, next < nums.count {
            node.next = ListNode(nums[next])
        }
        if !nodes.isEmpty {
            nodes[index-1].next = node
        }
        nodes.append(node)
        index = index + 1
    }
    
    return nodes.first!
}

func middleNode(_ head: ListNode?) -> ListNode? {
    /// Constraints:
    /// The number of nodes in the list is in the range [1, 100].
    /// 1 <= Node.val <= 100
    var deep = 0
    var node = head
    var value: Int = head!.val
    if node?.next == nil {
        return node
    }
    while ((node?.next) != nil) {
        value = node!.val
        node = node?.next
        deep = deep + 1
    }
    guard deep >= 1 && deep <= 100 || value >= 1 && value <= 100 else {
        return nil
    }
    let middle: Int = deep % 2 != 0 ? (deep/2)+1 : deep/2
    var middleNode: ListNode?
    var index = 0
    var currentNode = head
    while index < middle {
        currentNode = currentNode?.next
        middleNode = currentNode
        index = index + 1
    }
    return middleNode
}

let head1 = createHeadNode([1, 2, 3, 4, 5])
let head2 = createHeadNode([1, 2, 3, 4, 5, 6])
let head3 = createHeadNode([2, 3, 4, 5, 6, 7])
let head4 = createHeadNode([1])

let result1 = middleNode(head1)
let result2 = middleNode(head2)
let result3 = middleNode(head3)
let result4 = middleNode(head4)
