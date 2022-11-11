//
//  Color+Hex_Tests.swift
//  clonedcodeTests
//
//  Created by iamchiwon on 2022/11/11.
//

import XCTest
import SwiftUI
@testable import clonedcode

final class Color_Hex_Tests: XCTestCase {

    func testHexValueColor() throws {
        let white = Color(hex: 0xFFFFFF)
        let black = Color(hex: 0x000000)
        
        XCTAssertEqual(Color.white, white)
        XCTAssertEqual(Color.black, black)
    }
    
    func testHexStringColor() {
        let white = Color(hexString: "0xFFFFFF")
        let black = Color(hexString: "0x000000")
        
        XCTAssertEqual(Color.white, white)
        XCTAssertEqual(Color.black, black)
    }
    
    func testHexStringColor2() {
        let white = Color(hexString: "FFFFFF")
        let black = Color(hexString: "000000")
        
        XCTAssertEqual(Color.white, white)
        XCTAssertEqual(Color.black, black)
    }

}
