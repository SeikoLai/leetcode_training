public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createHeadNode(_ nums: [Int]) -> ListNode? {
    var index = 0
    var nodes: [ListNode] = []
    guard nums.count > 0 else {
        return nil
    }
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

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    // Constraints:
    //
    // The number of nodes in both lists is in the range [0, 50].
    // -100 <= Node.val <= 100
    // Both list1 and list2 are sorted in non-decreasing order.
    
    guard list1 != nil || list2 != nil else {
        return nil
    }
    
    // When some one is empty return another one
    if list1 != nil && list2 == nil { return list1 }
    if list1 == nil && list2 != nil { return list2 }
    
    var node = list1
    var deep = 0
    var value = list1?.val
    var nodeList:[ListNode]?
    if list1 != nil {
        nodeList = [node!]
        while ((node?.next) != nil) {
            node = node?.next
            if node != nil { nodeList!.append(node!) }
            value = node?.val
            deep = deep + 1
        }
        guard let val = value, val >= -100 && val <= 100 && deep >= 0 && deep <= 50 else {
            return nil
        }
    }
    node = list2
    deep = 0
    value = list2?.val
    if nodeList == nil {
        nodeList = [node!]
    }
    else {
        nodeList!.append(node!)
    }
    
    while node?.next != nil {
        node = node?.next
        if node != nil { nodeList!.append(node!) }
        value = node?.val
        deep = deep + 1
    }
    guard let val = value, val >= -100 && val <= 100 && deep >= 0 && deep <= 50 else {
        return nil
    }
    
    let sortedNodeList = nodeList!.sorted { node1, node2 in
        return node1.val < node2.val
    }
    let result = sortedNodeList.first
    var index = 1
    while index < sortedNodeList.count {
        sortedNodeList[index - 1].next = sortedNodeList[index]
        index = index + 1
    }
    return result
}

let list1 = createHeadNode([1,2,4]), list2 = createHeadNode([1,3,4])
let list3 = createHeadNode([]), list4 = createHeadNode([])
let list5 = createHeadNode([])
let list6 = createHeadNode([0])
//
//let result1 = mergeTwoLists(list1, list2) // [1,1,2,3,4,4]
//let result2 = mergeTwoLists(list3, list4) // []
//let result3 = mergeTwoLists(list5, list6) // [0]

func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    // Constraints:
    //
    // The number of nodes in both lists is in the range [0, 50].
    // -100 <= Node.val <= 100
    // Both list1 and list2 are sorted in non-decreasing order.
    
    guard list1 != nil || list2 != nil else {
        return nil
    }
    
    // When some one is empty return another one
    if list1 != nil && list2 == nil { return list1 }
    if list1 == nil && list2 != nil { return list2 }
    
    // Both list1 and list2 are not empty
    var result: [ListNode] = []
    var node = list1
    while (node?.next != nil) {
        result.append(node!)
        node = node?.next
    }
    
    if node?.next == nil { result.append(node!) }
    node = list2
    
    while (node?.next != nil) {
        result.append(node!)
        node = node?.next
    }
    
    if node?.next == nil { result.append(node!) }
    result = result.sorted(by: { $0.val < $1.val })
    var index = 1
    
    while (index < result.count) {
        result[index-1].next = result[index]
        index = index + 1
    }
    
    return result.first
}

let result4 = mergeTwoLists2(list1, list2) // [1,1,2,3,4,4]
let result5 = mergeTwoLists2(list3, list4) // []
let result6 = mergeTwoLists2(list5, list6) // [0]
