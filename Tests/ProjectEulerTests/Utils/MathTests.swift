import XCTest
@testable import ProjectEuler

class MathTests: XCTestCase {
    func testStaticFibonnaccis() throws {
        for (idx, ans) in NumberFixtures.fibonaccis {
            XCTAssertEqual(fib(n: idx), ans)
        }
    }
}
