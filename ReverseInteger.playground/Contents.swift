
import Foundation

/*
 Given a 32-bit signed integer, reverse digits of an integer.
 Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range.
 For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        let string = String(x).replacingOccurrences(of: "-", with: "")
        var result = Int(String(string.reversed())) ?? 0
        result = x < 0 ? -result : result
        
        if (result < 0 && Int(Int32.min) > result) {
            return 0
        }
        if (result > 0 && Int(Int32.max) < result) {
            return 0
        }
        return result
    }
}

let integer = 1534236469
Solution().reverse(integer)

let integer2 = -2147483412
Solution().reverse(integer2)

let integer3 = -2147483648
Solution().reverse(integer3)
