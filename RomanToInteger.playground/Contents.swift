//: Playground - noun: a place where people can play

import UIKit

/*
 Given a roman numeral, convert it to an integer.
 Input is guaranteed to be within the range from 1 to 3999.
 */

enum RomanNumeral: String {
    case I, V, X, L, C, D, M
    var intValue: Int {
        switch self {
            case .I: return 1
            case .V: return 5
            case .X: return 10
            case .L: return 50
            case .C: return 100
            case .D: return 500
            case .M: return 1000
        }
    }
}

class Solution {
    func romanToInt(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        guard s.count > 1 else {
            return RomanNumeral(rawValue: s)?.intValue ?? 0
        }
        var result = 0
        
        for i in 0..<s.count {
            if let currNumeral = RomanNumeral(rawValue: String(Array(s)[i])) {
                
                let nextIndex = i + 1
                
                if nextIndex < s.count,
                    let nextNumeral = RomanNumeral(rawValue: String(Array(s)[nextIndex])) {
            
                    if nextNumeral.intValue > currNumeral.intValue {
                        result -= currNumeral.intValue
                        
                    } else {
                        result += currNumeral.intValue
                    }
                    
                } else {
                    result += currNumeral.intValue
                }
            }
        }
        return result
    }
}

// Tests:
Solution().romanToInt("I")
Solution().romanToInt("II")
Solution().romanToInt("VI")
Solution().romanToInt("VIII")
Solution().romanToInt("IIV")
Solution().romanToInt("XX")
Solution().romanToInt("XL")
Solution().romanToInt("CXX")
Solution().romanToInt("DCXXI")
Solution().romanToInt("MXXXIV")


