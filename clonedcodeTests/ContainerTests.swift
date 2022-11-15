//
//  ContainerTests.swift
//  clonedcodeTests
//
//  Created by iamchiwon on 2022/11/15.
//

@testable import clonedcode
import XCTest

protocol PP {
    func sum(_ a: Int, _ b: Int) -> Int
}

class AA: PP {
    init() {
        print("AA created")
    }

    func sum(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

class SS: PP {
    private var pp: PP

    init(pp: PP) {
        self.pp = pp
        print("SS created")
    }

    func sum(_ a: Int, _ b: Int) -> Int {
        return pp.sum(a, b)
    }
}

final class ContainerTests: XCTestCase {
    override func setUpWithError() throws {
        Container.shared.regist(PP.self) { _ in
            AA()
        }

        Container.shared.regist { con in
            SS(pp: con.resolve(PP.self)!)
        }
    }

    func testResolve() throws {
        let ss = Container.shared.resolve(SS.self)!
        XCTAssertNotNil(ss)
        XCTAssertEqual(ss.sum(20, 22), 42)

        let pp = Container.shared.resolve(PP.self)!
        XCTAssertNotNil(pp)
        XCTAssertEqual(pp.sum(21, 21), 42)

        let aa = Container.shared.resolve(AA.self)!
        XCTAssertNotNil(aa)
        XCTAssertEqual(aa.sum(22, 20), 42)

        let ss2: PP = Container.shared.resolve(SS.self)!
        XCTAssertNotNil(ss2)
        XCTAssertEqual(ss2.sum(22, 20), 42)
    }

    func testInjected() throws {
        @Injected var ss: SS
        XCTAssertNotNil(ss)
        XCTAssertEqual(ss.sum(20, 22), 42)

        @Injected var pp: PP
        XCTAssertNotNil(pp)
        XCTAssertEqual(pp.sum(21, 21), 42)

        @Injected var aa: AA
        XCTAssertNotNil(aa)
        XCTAssertEqual(aa.sum(22, 20), 42)

        @Injected(SS.self) var ss2: PP
        XCTAssertNotNil(ss2)
        XCTAssertEqual(ss2.sum(22, 20), 42)
    }

    class NoShow {
    }

    func testResolveNotRegistered() throws {
        expectFatalError(expectedMessage: "regist NoShow instance first") {
            _ = Container.shared.resolve(NoShow.self)
        }
    }

    func testInjectNotRegistered() throws {
        expectFatalError(expectedMessage: "regist NoShow instance first") {
            @Injected var noShow: NoShow
        }
    }
}
