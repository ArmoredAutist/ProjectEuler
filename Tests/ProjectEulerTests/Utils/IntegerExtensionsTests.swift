import XCTest
@testable import ProjectEuler

class IntegerExtensionsTests: XCTestCase {
    func testFirst100kPrimes() throws {
        /*
         Running a sequential 1...100000 loop takes upwards of 80 seconds to
         evaluate. `DispatchQueue` reduces run time reliably to around 1 second.
         */
        DispatchQueue.concurrentPerform(iterations: NumberFixtures.primes.count) { (num) in
            XCTAssertEqual(num.isPrime, NumberFixtures.primes.contains(num))
        }
    }
}
