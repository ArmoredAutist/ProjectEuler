import Foundation

public extension Int {
    var isPrime: Bool {
        guard self >= 2 else { return false }
        guard self != 2 else { return true }
        guard self % 2 != 0 else { return false }
        return !stride(
            from: 3,
            through: Int(
                sqrt(Double(self))
            ),
            by: 2
        ).contains { self % $0 == 0 }
    }

    var maxPrimeFactor: Int {
        var n = self
        var maxPrime = -1
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

        return maxPrime
    }
}
