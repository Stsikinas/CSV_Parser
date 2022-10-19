//
//  UsersTableViewModel+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation


extension UsersTableViewModel: CSVParserProtocol {
    
    func openCSV(file: String) throws -> String {
        if let fileURL = fileImporter.getFileUrl(from: file) {
            do {
                return try String.init(contentsOf: fileURL, encoding: .utf8)
            } catch {
                throw(CSVError.StringInitError)
            }
        } else {
            throw(CSVError.FileNotFound)
        }
    }
    
    func getHeaders(row: String) -> [String] {
        
        return []
    }
    
    func convert(row: String) -> [String] {
        
        return []
    }
    
    func parse<User>(for file: String, completion: @escaping (Result<[User], CSVError>) -> ()) throws {
        
        
    }
}
