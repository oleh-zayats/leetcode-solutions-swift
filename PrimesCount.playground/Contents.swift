//: Playground - noun: a place where people can play

import UIKit

/* Count the number of prime numbers less than a non-negative number, n. */

/*
 A prime number is a natural number greater than 1 that cannot be formed by multiplying two smaller natural numbers.
 A natural number greater than 1 that is not prime is called a composite number.
 
 To use the sieve of Eratosthenes to find the prime numbers up to 100, make a chart of the first one hundred positive integers (1-100):
 
 1   2   3   4   5   6   7   8   9  10
 11  12  13  14  15  16  17  18  19  20
 21  22  23  24  25  26  27  28  29  30
 31  32  33  34  35  36  37  38  39  40
 41  42  43  44  45  46  47  48  49  50
 51  52  53  54  55  56  57  58  59  60
 61  62  63  64  65  66  67  68  69  70
 71  72  73  74  75  76  77  78  79  80
 81  82  83  84  85  86  87  88  89  90
 91  92  93  94  95  96  97  98  99 100
 
 Cross out 1, because it is not prime.
 
 Circle 2, because it is the smallest positive even prime. Now cross out every multiple of 2; in other words, cross out every second number.
 
 Circle 3, the next prime. Then cross out all of the multiples of 3; in other words, every third number. Some, like 6, may have already been crossed out because they are multiples of 2.
 
 Circle the next open number, 5. Now cross out all of the multiples of 5, or every 5th number.
 Continue doing this until all the numbers through 100 have either been circled or crossed out. You have just circled all the prime numbers from 1 to 100!
 
 */



class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        
        var result = 0
        var nonPrime = Array<Bool>(repeating: false, count: n)
        
        for i in 2..<n {
            if nonPrime[i] == false {
                result += 1
                
                var j = 2
                while (i * j) < n {
                    nonPrime[i * j] = true
                    j += 1
                }
            }
        }
        return result
    }
}

Solution().countPrimes(1)
Solution().countPrimes(2)
Solution().countPrimes(5)
Solution().countPrimes(100)
Solution().countPrimes(107)
