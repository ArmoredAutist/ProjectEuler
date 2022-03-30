import Foundation

/**
 Finds the *n*th fibonacci number.

 - Author: The Armored Autist
 - Version: 0.2
            - Renamed `num` parameter to `n`.

 - Parameters:
    - n: The *n*th value corresponding to the fibonacci number to retrieve.

 - Returns: The *n*th fibonacci number.
 */
public func fib(n: Int) -> Int {
    guard n > 1 else { return n }
    var a: Int = 0
    var b: Int = 1
    var c: Int = 0
    for _ in 2..<n {
        c = a + b
        a = b
        b = c
    }
    return a + b
}

/**
 Finds the largest palindrome created by multiplying the input parameters.

 - Throws:  `EulerError.noPalindrome` if there is no palindrome.
 - Author:  The Armored Autist
 - Version: 0.1

 - Parameters:
    - floor: The lesser of the two factors to multiply.
    - ceil:  The greater of the two factors to multiply.

 - Returns: The largest palindrome produced by multiplying the input values.
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

 Adapted from [this Python version](https://www.geeksforgeeks.org/find-largest-prime-factor-number/).

 - Author:  The Armored Autist
 - Version: 0.1

 - Parameters:
    - num: The value to find the largest prime factor for.

 - Returns: The greatest prime factor of the number `num` as an `Int`.
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

/**
 Calculates the power by raising `base` to the power of `exponent`.

 - Author:  The Armored Autist
 - Version: 0.1

 - Parameters:
    - base:     The mathematical base of the operation. The left-hand operand.
    - exponent: The mathematical exponent of the operation. The right-hand
                operand.

 - Returns: The power of `base` raised to `exponent`.
 */
public func pow(_ base: Int, _ exponent: Int) -> Int {
    return Int(pow(Float(base), Float(exponent)))
}

/**
 Calculates the summation of values of the range from `from` through `through`,
 inclusive.

 The range of values is inclusive, so the summation will include both `from` and
 `through`. The caller may also optionally provide a `by` value to specify how
 far to step over each iteration. This is assumed to be 1 by default.

 - Attention: See also `sumOfPowers` in Math.swift.
 - Attention: A future version may take a parameter describing more complex
              series to sum, rather than a single step value.
 - Author:    The Armored Autist
 - Version:   0.1

 - Parameters:
    - from:    The value to begin the summation at.
    - through: The value to end the summation on. This is included in the
               summation.
    - by:      The ammount to step by each iteration. Set to 1 by default.

 - Returns: The summation of values of the range `from...through`.
 */
public func summation(from: Int, through: Int, by: Int = 1) -> Int {
    var ans = 0
    for n in stride(from: from, through: through, by: by) {
        ans += n
    }
    return ans
}

/**
 Performs the summation of the range `from...through`, inclusive, by first
 raising each addend to `power`.

 The range of values is inclusive, so the summation will include both `from` and
 `through`. The caller may also optionally provide a `by` value to specify how
 far to step over each iteration. This is assumed to be 1 by default.

 - Attention: See also `summation` in Math.swift.
 - Attention: A future version may take a parameter describing more complex
              series to sum, rather than a single step value.
 - Attention: `power` could be made optional instead of default so this could
              be rolled in with `summation`.

 - Author:  The Armored Autist
 - Version: 0.1

 - Parameters:
    - from:    The value to begin the summation at.
    - through: The value to end the summation on. This is included in the
               summation.
    - by:      The ammount to step by each iteration. Set to 1 by default.
    - power:   The exponent to raise each addend in the summation by.

 - Returns: The summation of the exponents of the range `from...through`.
 */
public func sumOfPowers(from: Int, through: Int, by: Int = 1, power: Int = 2) -> Int {
    var sum = 0
    for n in stride(from: from, through: through, by: by) {
        sum += Int(pow(n, power))
    }
    return sum
}
