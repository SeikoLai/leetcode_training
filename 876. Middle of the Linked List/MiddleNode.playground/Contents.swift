import UIKit

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
    return nil
}

let head1 = createHeadNode([1, 2, 3, 4, 5])
let head2 = createHeadNode([1, 2, 3, 4, 5, 6])
