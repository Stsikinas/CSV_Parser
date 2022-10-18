//
//  UserCSVService.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 18/10/22.
//

import Foundation


protocol CSVParserProtocol {
    func getHeaders(row: String) -> [String]
    func convert(row: String) -> [String]
    func parse<T>(for file: String, completion: @escaping(Result<[T], CSVError>) -> ()) throws
}

enum CSVError: Error {
    case FileNotFound
    case StringInitError
    case NoHeadersFound
    case EmptyRow
    case MismatchRowCount
}

struct UserCSVService {
    // MARK: - Variables
    let parsingThread = DispatchQueue(label: "parseUsers")
    var headers = [String]()
    private let separator = ","
    private let lineSeparator = "\n"
}
