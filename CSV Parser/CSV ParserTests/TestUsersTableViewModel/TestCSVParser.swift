//
//  TestCSVParser.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import XCTest
@testable import CSV_Parser

class TestCSVParser: XCTestCase {
    
    private var sut: CSVParserProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = UsersTableViewModel()
    }
        

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testOpenCSVFile() {
        XCTAssertNoThrow(try sut.openCSV(file: "users"), "Unable to read existing file")
    }
    
    func testUnableToFindFile() {
        XCTAssertThrowsError(try sut.openCSV(file: "invalidFile"), "File doesn't exist to assets") { error in
            XCTAssertEqual(error as! CSVError, .FileNotFound)
        }
    }

}
