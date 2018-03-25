//: Playground - noun: a place where people can play

import UIKit

/*
 Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example:
 
 Given nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
 It doesn't matter what you leave beyond the new length.
 
 */


class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var removed = 0
        
        for element in 0..<nums.count {
            
            let i = element - removed
            
            if i > 0, i < nums.count {
                
                if nums[i] == nums[i - 1] {
                    nums.remove(at: i)
                    removed += 1
                }
            }
        }
        return nums.count
    }
}

/* Tests: */

var nums = [1, 2, 2, 2, 3, 3, 3, 3, 8, 8, 8, 8, 12, 12, 12, 20, 21, 21, 40, 41, 50, 50, 59]
let filtered = Solution().removeDuplicates(&nums)

var nums2 = [1, 1]
let filtered2 = Solution().removeDuplicates(&nums2)

var nums3 = [1, 1, 1]
let filtered3 = Solution().removeDuplicates(&nums3)

var nums4 = [1, 2, 2]
let filtered4 = Solution().removeDuplicates(&nums4)

