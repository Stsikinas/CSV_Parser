//
//  TestFileImportProtocol.swift
//  CSV ParserTests
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import XCTest
@testable import CSV_Parser

class TestFileImportProtocol: XCTestCase {
    
    private var sut: FileImporter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FileImporter(fileExtension: "csv")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCSVFileExists() {
        do {
            let exists = try sut.fileExists(for: "users")
            XCTAssertTrue(exists, "issues.csv file exists in File System")
        } catch {
            XCTFail("issues.csv file exists in File System")
        }
    }
    
    func testCSVFileNotExistsError() {
        
        XCTAssertThrowsError(try sut.fileExists(for: "user")) { error in
            XCTAssertEqual(error as! FileImporter.FileError, .FileNotFound)
        }
        
    }
    
    /// To run this you have to adjust the file extension of the SUT
    func testFolderIsEmpty() {
        sut = FileImporter(fileExtension: "txt")
        XCTAssertThrowsError(try sut.getFiles()) { error in
            XCTAssertEqual(error as! FileImporter.FileError, .NoFilesFound)
        }
    }
    
    /// The file system contains 2 csv files, so assert count = 2
    func testFiles() {
        do {
            let files = try sut.getFiles()
            XCTAssertEqual(2, files.count)
        } catch {
            XCTFail("The file system contains 2 csv files")
        }
    }
    
}
