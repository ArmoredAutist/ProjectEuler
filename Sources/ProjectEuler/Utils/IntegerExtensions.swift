import Foundation

public extension Int64 {
    var isPrime: Bool {
        guard self >= 2 else { return false }
        guard self != 2 else { return true }
        guard self % 2 != 0 else { return false }
        return !stride(
            from: 3,
            through: Int64(
                sqrt(Double(self))
            ),
            by: 2
        ).contains { self % $0 == 0 }
    }

    var maxPrimeFactor: Int64 {
        var n = self
        var maxPrime:Int64 = -1
        while n % 2 == 0 {
            maxPrime = 2
            n = n / 2
        }

        while n % 3 == 0 {
            maxPrime = 3
            n = n / 3
        }

        for i in stride(from: 5, to: Int64(sqrt(Float(n))) + 1, by: 6) {
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

        return Int64(maxPrime)
    }
}

public extension Int {
    var isPrime: Bool {
        return Int64(self).isPrime
    }

    var maxPrimeFactor: Int64 {
        return Int64(self).maxPrimeFactor
    }
}
