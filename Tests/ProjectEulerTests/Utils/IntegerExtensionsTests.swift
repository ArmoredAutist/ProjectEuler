import XCTest
@testable import ProjectEuler

class IntegerExtensionsTests: XCTestCase {
    func testFirst100kPrimes() throws {
        /*
         Initial runtime is 82 seconds to evaluate 1-100,000 against the hard-
         coded list of the first 100k primes.
         */
        for num in 1...100000 {
            XCTAssertEqual(num.isPrime, Primes.contains(num))
        }
    }
}
