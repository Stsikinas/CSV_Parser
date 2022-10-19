//
//  TestUserConverter.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import XCTest
@testable import CSV_Parser

class TestUserConverter: XCTestCase {

    var sut: UserConverter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UsersTableViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testGetUserFromValidRow() {
        let user = sut.convert(rowData: validRowComponents)
        XCTAssertEqual(user.firstName, "Nick", "First name is Nick")
        XCTAssertEqual(user.lastName, "Thomas", "Last name is Thomas")
        XCTAssertEqual(user.stars, 12, "Stars are 12")
        XCTAssertEqual(user.dob, "1988-11-21T00:00:00", "DOB is 1988-11-21T00:00:00")
    }
    
    func testGetUserFromInvalidCount() {
        let malUser = sut.convert(rowData: invalidRowComponentsIssues)
        XCTAssertEqual(malUser.stars, 0, "Invalid Stars count. Value is 0.")
    }

}
