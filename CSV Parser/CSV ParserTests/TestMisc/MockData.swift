//
//  MockData.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 5/10/22.
//

import XCTest

let correctFilePath = "/Users/user/user/CSV Parser.app/users.csv"
let emptyFilePath = ""

let validRowComponents = ["Nick", "Thomas", "12", "1988-11-21T00:00:00"]
let invalidRowComponentsIssues = ["Nick", "Thomas", "WROOOONG", "1988-11-21T00:00:00"]
