import XCTest
@testable import SPMSettingsInDependenciesTester

final class SPMSettingsInDependenciesTesterTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(SPMSettingsInDependenciesTester.sqliteHasCodec(), true, "shouldn't this return true as cSettings were set in Package.swift")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
