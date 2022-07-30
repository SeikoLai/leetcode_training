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
    
    public func node(at index: Int) -> ListNode? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func insert(_ value: Int, after node: ListNode) -> ListNode {
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = ListNode(value, node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Int? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.val
    }
    
    @discardableResult
    public mutating func removeLast() -> Int? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        
        return current.val
    }
    
    @discardableResult
    public mutating func remove(after node: ListNode) -> Int? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.val
    }
    
    // COW
    private mutating func copyNodes() {
        
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = ListNode(oldNode.val)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = ListNode(nextOldNode.val)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: ListNode?) -> ListNode? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }
        head = ListNode(oldNode.val)
        var newNode = head
        var nodeCopy: ListNode?
        
        while let nextOleNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = ListNode(nextOleNode.val)
            newNode = newNode!.next
            oldNode = nextOleNode
        }
        return nodeCopy
    }
}

extension LinkedList: Collection {
    public struct Index: Comparable {
        
        public var node: ListNode?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Int {
        position.node!.val
    }
}
