import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LineCheckMarkTests.allTests),
    ]
}
#endif
