import XCTest

final class SimpleTest: XCTestCase {
    func testRunningSimpleTest() {
        XCTAssertEqual("Hello world", "Hello world")
    }
}
