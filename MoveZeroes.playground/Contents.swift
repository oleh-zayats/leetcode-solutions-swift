
import Foundation

/*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        var tailZeroes = 0
        for i in stride(from: nums.count - 1, to: -1, by: -1) {
            if nums[i] == 0 {
                for j in i..<nums.count - tailZeroes {
                    if (j + 1) < nums.count {
                        nums.swapAt(j, j+1)
                    }
                }
                tailZeroes += 1
            }
        }
    }
}


/* Tests: */

var n0 = [Int]()
var n1 = [0, 1, 0, 3, 12]
var n2 = [0, 1, 0, 3, 12, 5, 0, 7, 0, 8, 8, 0, 100]
var n3 = [0, 0, 0, 0, 0]
var n4 = [1, 2, 3, 4, 5]

Solution().moveZeroes(&n0) // []
Solution().moveZeroes(&n1) // [1, 3, 12, 0, 0]
Solution().moveZeroes(&n2) // [1, 3, 12, 5, 7, 8, 8, 100, 0, 0, 0, 0, 0]
Solution().moveZeroes(&n3) // [0, 0, 0]
Solution().moveZeroes(&n4) // [1, 2, 3, 4, 5]
