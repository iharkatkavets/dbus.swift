import XCTest
import DBusSwift

final class ConnectionBuilderTests: XCTestCase {
    func testMakeSessionBusConnection() {
        XCTAssertNotNil(try! ConnectionBuilder().makeSessionBusConnection())
    }
}
