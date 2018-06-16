//**************************************************************
//
//  ReferenceValetTest
//
//  Created by Harish Kataria
//  Copyright © 2018 Harish Kataria. All rights reserved.
//
//**************************************************************

import XCTest
import ReferenceValet

final class ReferenceValetTest: XCTestCase {
    func testAsync() {
        let saved = self
        let exp = expectation(description: "Async")
        async { ref in
            XCTAssert(saved === ref)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 60)
    }

    func testEnclose() {
        let saved = self
        let exp = expectation(description: "Enclose")
        enclose { ref in
            XCTAssert(saved === ref)
            exp.fulfill()
        }()
        wait(for: [exp], timeout: 60)
    }

    func testEncloseWithArgs() {
        let saved = self
        let exp = expectation(description: "Call")
        run(ops: enclose { ref, num in
            XCTAssert(saved === ref)
            XCTAssert(num == 0)
            exp.fulfill()
        })
        wait(for: [exp], timeout: 60)
    }

    func testCall() {
        let saved = self
        let exp = expectation(description: "Call")
        call(print) { ref in
            XCTAssert(saved === ref)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 60)
    }

    private func print(operation: @escaping () -> Void) {
        DispatchQueue.main.async {
            Swift.print("Running operation...")
            operation()
        }
    }

    private func run(ops: @escaping (Int) -> Void) {
        DispatchQueue.main.async {
            ops(0)
        }
    }
}
