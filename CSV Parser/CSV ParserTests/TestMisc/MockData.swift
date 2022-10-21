//
//  MockData.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 5/10/22.
//

import XCTest
@testable import CSV_Parser

let correctFilePath = "/Users/user/user/CSV Parser.app/users.csv"
let emptyFilePath = ""

let validRowComponents = ["Nick", "Thomas", "12", "1988-11-21T00:00:00"]
let invalidRowComponentsIssues = ["Nick", "Thomas", "WROOOONG", "1988-11-21T00:00:00"]

let validRow = "\"Nick\",\"Thomas\",12,\"1988-11-21T00:00:00\"\r"
let validNonBackslashRow = "Nick,Thomas,12,1988-11-21T00:00:00"
let validSomeBackslashRow = "\"Nick\",Thomas,12,1988-11-21T00:00:00"
let quotedTextRow = "\"Fiona \"Phin\"\",\"de Vries\",7,\"1950-11-12T00:00:00\"\r"
let noIssuesRow = "\"Nick\",\"Thomas\",,\"1988-11-21T00:00:00\"\r"

func aUser() -> User {
    User(firstName: "Nick", lastName: "Thomas", stars: 12, dob: "1988-11-21T00:00:00")
}
