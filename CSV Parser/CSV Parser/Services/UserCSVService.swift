//
//  UserCSVService.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 18/10/22.
//

import Foundation


protocol CSVParserProtocol {
    func openCSV(file: String) throws -> String
    func getHeaders(row: String) -> [String]
    func convert(row: String) throws -> [String]
    func splitComponents(rawData: String) throws -> [String]
    func parse(for file: String, completion: @escaping(Result<[User], CSVError>) -> ())
    func isBackslash(field: String) -> Bool
}

protocol UserConverter {
    func convert(rowData: [String]) -> User
    func applyRules(for row: [String]) -> [String]
}

enum CSVError: Error {
    case FileNotFound
    case StringInitError
    case NonCompleteFile
    case EmptyRow
    case MismatchRowCount
    case DefaultError
}
