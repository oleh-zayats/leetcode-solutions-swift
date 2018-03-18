//: Playground - noun: a place where people can play

import UIKit

/*
Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
*/

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [Int]()
        for index in 0..<n { result.append(index + 1) }
        return result.map { num in
            if (num % 3 == 0) && (num % 5 == 0) {
                return "FizzBuzz"
            } else if (num % 3 == 0) {
                return "Fizz"
            } else if (num % 5 == 0) {
                return "Buzz"
            } else {
                return String(num)
            }
        }
    }
}

Solution().fizzBuzz(15)
