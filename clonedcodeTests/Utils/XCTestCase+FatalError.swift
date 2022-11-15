//
//  XCTestCase+FatalError.swift
//  clonedcodeTests
//
//  Created by iamchiwon on 2022/11/15.
//

import XCTest
@testable import clonedcode

extension XCTestCase {
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {

        let expectation = self.expectation(description: "expectingFatalError")
        var assertionMessage: String? = nil

        FatalErrorUtil.replaceFatalError { message, _, _ in
            assertionMessage = message
            expectation.fulfill()
            self.unreachable()
        }

        DispatchQueue.global(qos: .userInitiated).async(execute: testcase)

        waitForExpectations(timeout: 2) { _ in
            XCTAssertEqual(assertionMessage, expectedMessage)

            FatalErrorUtil.restoreFatalError()
        }
    }

    private func unreachable() -> Never {
        repeat {
            RunLoop.current.run()
        } while (true)
    }
}
