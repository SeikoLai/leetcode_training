/// https://leetcode.com/problems/remove-duplicates-from-sorted-list/


//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public struct LinkedList {
    public var head: ListNode?
    public var tail: ListNode?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Int) {
        head = ListNode(value, head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Int) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = ListNode(value)
        tail = tail!.next
    }
}

class Solution {
    func createHead(_ head: [Int]) -> ListNode {
        var list = LinkedList()
        for (_, number) in head.enumerated() {
            list.append(number)
        }
        return list.head!
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var current = head
        var nodes: [ListNode] = []
        while current?.next != nil {
            if !nodes.contains(where: {$0.val == current!.val}) {
                nodes.append(ListNode(current!.val))
            }
            current = current?.next
        }
        if current?.next == nil && !nodes.contains(where: {$0.val == current!.val}) {
            nodes.append(ListNode(current!.val))
        }
        
        var index = nodes.count - 1
        while index > 0 {
            nodes[index-1].next = nodes[index]
            index -= 1
        }

        return nodes.first
    }
}

let solution = Solution()

let head1 = solution.createHead([1,1,2])
let head2 = solution.createHead([1,1,2,3,3])

let result1 = solution.deleteDuplicates(head1)
let result2 = solution.deleteDuplicates(head2)
