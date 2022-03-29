import XCTest
@testable import ProjectEuler

class IntegerExtensionsTests: XCTestCase {
    func testSevenIsPrime() throws {
        XCTAssertTrue(Int64(7).isPrime)
    }
}
