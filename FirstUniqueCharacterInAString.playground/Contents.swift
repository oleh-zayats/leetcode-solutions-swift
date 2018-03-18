
import Foundation

/*
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else {
            return -1
        }
        var duplicatesMap = [Character: Bool]()
        
        for element in s {
            duplicatesMap[element] = (duplicatesMap[element] != nil)
        }
        for (index, element) in Array(s).enumerated() {
            if let duplicated = duplicatesMap[element], duplicated == false {
                return index
            }
        }
        return -1
    }
}

// Tests:
Solution().firstUniqChar("leetcode")        // 0
Solution().firstUniqChar("loveleetcode")    // 2
Solution().firstUniqChar("aadadaad")        // -1
