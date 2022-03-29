//
//  Math.swift
//  
//
//  Created by The Armored Autist on 3/28/22.
//

import Foundation

public func fib(num: Int) -> Int {
    guard num > 1 else { return num }
    var a: Int = 0
    var b: Int = 1
    var c: Int = 0
    for _ in 2..<num {
        c = a + b
        a = b
        b = c
    }
    return a + b
}

/**
 Finds the largest palindrome created by multiplying the input parameters.

 - Returns:
 The largest palindrome produced by multiplying the input values.

 - Throws:
 `EulerError.noPalindrome` if there is no palindrome.

 - Parameters:
    - floor: The lesser of the two factors to multiply.
    - ceil: The greater of the two factors to multiply.

 - Version:
 0.1
 */
public func largestPalindromicProduct(floor:Int, ceil:Int) throws -> Int {
    var max:Int = 0
    for i in (floor...ceil) {
        for j in (i...ceil) {
            let test = String(i * j)

            if test.isPalindrome() {
                let ans:Int = Int(test)!

                if (ans > max) {
                    max = ans
                }
            }
        }
    }

    if max == 0 {
        throw StringError.noPalindrome
    }
    else {
        return max
    }
}

/**
 Finds the greatest prime factor for a number.

 - returns:
 The greatest prime factor of the number `num` as an `Int`.

 - parameters:
    - num: The value to find the largest prime factor for.

 - Version:
 0.1

 I adapted this function from [this Python version](https://www.geeksforgeeks.org/find-largest-prime-factor-number/).
 */
public func maxPrimeFactor(num: Int) -> Int {
    var n = num
    var maxPrime:Int = -1
    while n % 2 == 0 {
        maxPrime = 2
        n = n / 2
    }

    while n % 3 == 0 {
        maxPrime = 3
        n = n / 3
    }

    for i in stride(from: 5, to: Int(sqrt(Float(n))) + 1, by: 6) {
        while n % i == 0 {
            maxPrime = i
            n = n / i
        }
        while n % (i + 2) == 0 {
            maxPrime = i + 2
            n = n / (i + 2)
        }
    }

    if n > 4 {
        maxPrime = n
    }

    return Int(maxPrime)
}
