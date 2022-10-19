//
//  TestFoundation.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import XCTest
@testable import CSV_Parser

class TestFoundation: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testConvertToIntFails() {
        XCTAssertEqual(0, "Bla".toInt)
    }
    
    func testConvertToIntSucceeds() {
        XCTAssertEqual(16, "16".toInt)
    }

}
