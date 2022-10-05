//
//  TestFileNaming.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 5/10/22.
//

import XCTest
@testable import CSV_Parser

class TestFileNaming: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testCorrectFilename() {
        let lastPath = correctFilePath.getLastPath()
        XCTAssertEqual("users.csv", lastPath, "The name of file is users.csv")
    }
    
    func testIncorrectFilename() {
        let lastPath = emptyFilePath.getLastPath()
        XCTAssertTrue(lastPath.isEmpty, "The file is corrupt, so empty string")
    }

}
