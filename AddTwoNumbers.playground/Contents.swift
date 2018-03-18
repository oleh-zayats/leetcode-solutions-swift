
import Foundation

/*
 
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order and each of their nodes contain a single digit.
 Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        let nullNode = ListNode(0)
        var node = nullNode
        
        var tempNode1 = l1
        var tempNode2 = l2
        
        var sum = 0
        var carry = 0
        
        while tempNode1 != nil || tempNode2 != nil || carry != 0 {
            
            sum = carry
            
            sum += tempNode1?.val ?? 0
            sum += tempNode2?.val ?? 0
            
            if let node = tempNode1 { tempNode1 = node.next }
            if let node = tempNode2 { tempNode2 = node.next }
            
            carry = sum / 10
            sum = sum % 10
            
            node.next = ListNode(sum)
            node = node.next!
        }
        
        return nullNode.next
    }
}


// Tests:
let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

if let result = Solution().addTwoNumbers(l1, l2) {
    let output = "\(result.val) -> \(result.next?.val ?? 0) -> \(result.next?.next?.val ?? 0)"
    print(output)
}
