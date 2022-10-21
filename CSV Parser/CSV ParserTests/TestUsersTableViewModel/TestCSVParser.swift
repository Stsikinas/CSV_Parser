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
    
    // MARK: - Tests for opening the CSV File
    func testOpenCSVFile() {
        XCTAssertNoThrow(try sut.openCSV(file: "users"), "Unable to read existing file")
    }
    
    func testUnableToFindFile() {
        XCTAssertThrowsError(try sut.openCSV(file: "invalidFile"), "File doesn't exist to assets") { error in
            XCTAssertEqual(error as! CSVError, .FileNotFound)
        }
    }
    
    // MARK: - Tests for Modifying parsed row
    func testHasBackslash() {
        XCTAssertTrue(sut.isBackslash(field: validRow))
    }
    
    func testNoBackslashField() {
        XCTAssertFalse(sut.isBackslash(field: validNonBackslashRow))
    }
    
    // MARK: - Tests for converting row to Data
    func testNonBackslashRow() {
        do {
            let mockUser = aUser()
            let user = try sut.convert(row: validNonBackslashRow)
            XCTAssertEqual(user[0], mockUser.firstName, "First name should be equal")
            XCTAssertEqual(user[1], mockUser.lastName, "Last name should be equal")
            XCTAssertEqual(user[2].toInt, mockUser.stars, "Star count should be equal")
            XCTAssertEqual(user[3], mockUser.dob, "DOB should be equal")
        } catch {
            XCTFail("The CSV parser should've parsed the row")
        }
    }
    
    func testSomeBackslashRow() {
        do {
            let mockUser = aUser()
            let user = try sut.convert(row: validSomeBackslashRow)
            XCTAssertEqual(user[0], mockUser.firstName, "First name should be equal")
            XCTAssertEqual(user[1], mockUser.lastName, "Last name should be equal")
            XCTAssertEqual(user[2].toInt, mockUser.stars, "Star count should be equal")
            XCTAssertEqual(user[3], mockUser.dob, "DOB should be equal")
        } catch {
            XCTFail("The CSV parser should've parsed the row")
        }
    }
    
    func testBackslashRow() {
        do {
            let mockUser = aUser()
            let user = try sut.convert(row: validRow)
            XCTAssertEqual(user[0], mockUser.firstName, "First name should be equal")
            XCTAssertEqual(user[1], mockUser.lastName, "Last name should be equal")
            XCTAssertEqual(user[2].toInt, mockUser.stars, "Star count should be equal")
            XCTAssertEqual(user[3], mockUser.dob, "DOB should be equal")
        } catch {
            XCTFail("The CSV parser should've parsed the row with error: \(error.localizedDescription)")
        }
    }

}
